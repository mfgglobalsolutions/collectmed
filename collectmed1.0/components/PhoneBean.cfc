 	


<cfcomponent name="phoneBean" output="false" alias="phoneBean" extends="PhoneDAO">

	<cfproperty name="PhoneID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="PhoneTypeID" type="string" default="" />
	<cfproperty name="PhoneNumber" type="string" default="" />
	<cfproperty name="PhoneExtension" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.PhoneID = 0;
		variables.SiteID = "";
		variables.PhoneTypeID = "";
		variables.PhoneNumber = "";
		variables.PhoneExtension = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="phoneBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "PhoneID") AND stValues.PhoneID NEQ 0>
				<cfquery name="qGetPhone" datasource="#trim(arguments.ds)#">
			  		SELECT PhoneID,SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode,DateCreated,DateModified
					FROM phone  
					WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.PhoneID#" /> 
				</cfquery>		
				<cfif qGetPhone.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetPhone.SiteID;
					variables.PhoneTypeID = qGetPhone.PhoneTypeID;
					variables.PhoneNumber = qGetPhone.PhoneNumber;
					variables.PhoneExtension = qGetPhone.PhoneExtension;
					variables.Active = qGetPhone.Active;
					variables.InactiveCode = qGetPhone.InactiveCode;
					variables.DateModified = qGetPhone.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "PhoneID")><cfset variables.PhoneID = stValues.PhoneID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "PhoneTypeID")><cfset variables.PhoneTypeID = stValues.PhoneTypeID /></cfif>
			<cfif StructKeyExists(stValues, "PhoneNumber")><cfset variables.PhoneNumber = stValues.PhoneNumber /></cfif>
			<cfif StructKeyExists(stValues, "PhoneExtension")><cfset variables.PhoneExtension = stValues.PhoneExtension /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PhoneID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneID" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneID>
	</cffunction>
	
	<cffunction name="setPhoneID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PhoneID)) OR trim(arguments.PhoneID) EQ "">
			<cfset variables.PhoneID = arguments.PhoneID />
		<cfelse>
			<cfthrow message="PhoneID (#arguments.PhoneID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneID") />		
		
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
	<!--- GET and SET methods for PhoneTypeID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneTypeID" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneTypeID>
	</cffunction>
	
	<cffunction name="setPhoneTypeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneTypeID" required="true" type="any" />
			
		<cfset variables.PhoneTypeID = arguments.PhoneTypeID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneTypeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PhoneNumber.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneNumber>
	</cffunction>
	
	<cffunction name="setPhoneNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneNumber" required="true" type="any" />
			
		<cfset variables.PhoneNumber = arguments.PhoneNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PhoneExtension.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPhoneExtension" acess="public" output="false" returntype="any">
		<cfreturn variables.PhoneExtension>
	</cffunction>
	
	<cffunction name="setPhoneExtension" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PhoneExtension" required="true" type="any" />
			
		<cfset variables.PhoneExtension = arguments.PhoneExtension />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PhoneExtension") />		
		
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


