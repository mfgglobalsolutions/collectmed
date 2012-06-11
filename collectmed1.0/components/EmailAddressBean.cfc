 	


<cfcomponent name="emailaddressBean" output="false" alias="emailaddressBean" extends="EmailAddressDAO">

	<cfproperty name="EmailAddressID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="EmailTypeID" type="numeric" default="" />
	<cfproperty name="Email" type="string" default="" />
	<cfproperty name="IsDefault" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.EmailAddressID = 0;
		variables.SiteID = "";
		variables.EntityID = "";
		variables.EmailTypeID = "";
		variables.Email = "";
		variables.IsDefault = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="emailaddressBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "EmailAddressID") AND stValues.EmailAddressID NEQ 0>
				<cfquery name="qGetEmailAddress" datasource="#trim(arguments.ds)#">
			  		SELECT EmailAddressID,SiteID,EntityID,EmailTypeID,Email,IsDefault,Active,InactiveCode,DateCreated,DateModified
					FROM emailaddress  
					WHERE EmailAddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.EmailAddressID#" /> 
				</cfquery>		
				<cfif qGetEmailAddress.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetEmailAddress.SiteID;
					variables.EntityID = qGetEmailAddress.EntityID;
					variables.EmailTypeID = qGetEmailAddress.EmailTypeID;
					variables.Email = qGetEmailAddress.Email;
					variables.IsDefault = qGetEmailAddress.IsDefault;
					variables.Active = qGetEmailAddress.Active;
					variables.InactiveCode = qGetEmailAddress.InactiveCode;
					variables.DateModified = qGetEmailAddress.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "EmailAddressID")><cfset variables.EmailAddressID = stValues.EmailAddressID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "EmailTypeID")><cfset variables.EmailTypeID = stValues.EmailTypeID /></cfif>
			<cfif StructKeyExists(stValues, "Email")><cfset variables.Email = stValues.Email /></cfif>
			<cfif StructKeyExists(stValues, "IsDefault")><cfset variables.IsDefault = stValues.IsDefault /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EmailAddressID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmailAddressID" acess="public" output="false" returntype="any">
		<cfreturn variables.EmailAddressID>
	</cffunction>
	
	<cffunction name="setEmailAddressID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EmailAddressID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EmailAddressID)) OR trim(arguments.EmailAddressID) EQ "">
			<cfset variables.EmailAddressID = arguments.EmailAddressID />
		<cfelse>
			<cfthrow message="EmailAddressID (#arguments.EmailAddressID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EmailAddressID") />		
		
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
	<!--- GET and SET methods for EmailTypeID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmailTypeID" acess="public" output="false" returntype="any">
		<cfreturn variables.EmailTypeID>
	</cffunction>
	
	<cffunction name="setEmailTypeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EmailTypeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EmailTypeID)) OR trim(arguments.EmailTypeID) EQ "">
			<cfset variables.EmailTypeID = arguments.EmailTypeID />
		<cfelse>
			<cfthrow message="EmailTypeID (#arguments.EmailTypeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EmailTypeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Email.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmail" acess="public" output="false" returntype="any">
		<cfreturn variables.Email>
	</cffunction>
	
	<cffunction name="setEmail" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Email" required="true" type="any" />
			
		<cfset variables.Email = arguments.Email />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Email") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IsDefault.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIsDefault" acess="public" output="false" returntype="any">
		<cfreturn variables.IsDefault>
	</cffunction>
	
	<cffunction name="setIsDefault" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IsDefault" required="true" type="any" />
			
		<cfset variables.IsDefault = arguments.IsDefault />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IsDefault") />		
		
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

		<cffunction name="emailExists" retruntype="numeric" output="no">
		
		<cfargument name="ds" required="true" type="string" />		
				
		<cftry>
					
			<cfquery name="getEmail" datasource="#trim(arguments.ds)#">
				SELECT EmailAddressID
				FROM emailaddress  
				WHERE Email = '#trim(variables.email)#'
			</cfquery>
									
			<cfif IsDefined("getEmail.EmailAddressID") AND IsNumeric(getEmail.EmailAddressID)>
				<cfreturn getEmail.EmailAddressID>
			<cfelse>
				<cfreturn 0>	
			</cfif>
			
		
			<cfcatch type="Any">
				
				<cfthrow message="Caught an exception, type = #CFCATCH.TYPE# message = #cfcatch.message# detail = #cfcatch.detail#"> 
									
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>



