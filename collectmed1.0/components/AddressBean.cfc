 	


<cfcomponent name="addressBean" output="false" alias="addressBean" extends="AddressDAO">

	<cfproperty name="AddressID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="AddressTypeID" type="string" default="" />
	<cfproperty name="Attention" type="string" default="" />
	<cfproperty name="AddressLine1" type="string" default="" />
	<cfproperty name="AddressLine2" type="string" default="" />
	<cfproperty name="City" type="string" default="" />
	<cfproperty name="StateID" type="numeric" default="" />
	<cfproperty name="ZipCode" type="string" default="" />
	<cfproperty name="CountryID" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.AddressID = 0;
		variables.SiteID = "";
		variables.AddressTypeID = "";
		variables.Attention = "";
		variables.AddressLine1 = "";
		variables.AddressLine2 = "";
		variables.City = "";
		variables.StateID = "";
		variables.ZipCode = "";
		variables.CountryID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="addressBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "AddressID") AND stValues.AddressID NEQ 0>
				<cfquery name="qGetAddress" datasource="#trim(arguments.ds)#">
			  		SELECT AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified
					FROM Address  
					WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.AddressID#" /> 
				</cfquery>		
				<cfif qGetAddress.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetAddress.SiteID;
					variables.AddressTypeID = qGetAddress.AddressTypeID;
					variables.Attention = qGetAddress.Attention;
					variables.AddressLine1 = qGetAddress.AddressLine1;
					variables.AddressLine2 = qGetAddress.AddressLine2;
					variables.City = qGetAddress.City;
					variables.StateID = qGetAddress.StateID;
					variables.ZipCode = qGetAddress.ZipCode;
					variables.CountryID = qGetAddress.CountryID;
					variables.Active = qGetAddress.Active;
					variables.InactiveCode = qGetAddress.InactiveCode;
					variables.DateModified = qGetAddress.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "AddressID")><cfset variables.AddressID = stValues.AddressID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "AddressTypeID")><cfset variables.AddressTypeID = stValues.AddressTypeID /></cfif>
			<cfif StructKeyExists(stValues, "Attention")><cfset variables.Attention = stValues.Attention /></cfif>
			<cfif StructKeyExists(stValues, "AddressLine1")><cfset variables.AddressLine1 = stValues.AddressLine1 /></cfif>
			<cfif StructKeyExists(stValues, "AddressLine2")><cfset variables.AddressLine2 = stValues.AddressLine2 /></cfif>
			<cfif StructKeyExists(stValues, "City")><cfset variables.City = stValues.City /></cfif>
			<cfif StructKeyExists(stValues, "StateID")><cfset variables.StateID = stValues.StateID /></cfif>
			<cfif StructKeyExists(stValues, "ZipCode")><cfset variables.ZipCode = stValues.ZipCode /></cfif>
			<cfif StructKeyExists(stValues, "CountryID")><cfset variables.CountryID = stValues.CountryID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AddressID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressID" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressID>
	</cffunction>
	
	<cffunction name="setAddressID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AddressID)) OR trim(arguments.AddressID) EQ "">
			<cfset variables.AddressID = arguments.AddressID />
		<cfelse>
			<cfthrow message="AddressID (#arguments.AddressID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressID") />		
		
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
	<!--- GET and SET methods for AddressTypeID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressTypeID" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressTypeID>
	</cffunction>
	
	<cffunction name="setAddressTypeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressTypeID" required="true" type="any" />
			
		<cfset variables.AddressTypeID = arguments.AddressTypeID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressTypeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Attention.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAttention" acess="public" output="false" returntype="any">
		<cfreturn variables.Attention>
	</cffunction>
	
	<cffunction name="setAttention" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Attention" required="true" type="any" />
			
		<cfset variables.Attention = arguments.Attention />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Attention") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AddressLine1.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressLine1" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressLine1>
	</cffunction>
	
	<cffunction name="setAddressLine1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressLine1" required="true" type="any" />
			
		<cfset variables.AddressLine1 = arguments.AddressLine1 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressLine1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AddressLine2.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAddressLine2" acess="public" output="false" returntype="any">
		<cfreturn variables.AddressLine2>
	</cffunction>
	
	<cffunction name="setAddressLine2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AddressLine2" required="true" type="any" />
			
		<cfset variables.AddressLine2 = arguments.AddressLine2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AddressLine2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for City.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCity" acess="public" output="false" returntype="any">
		<cfreturn variables.City>
	</cffunction>
	
	<cffunction name="setCity" acess="public" output="false" returntype="boolean">
		
		<cfargument name="City" required="true" type="any" />
			
		<cfset variables.City = arguments.City />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "City") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for StateID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStateID" acess="public" output="false" returntype="any">
		<cfreturn variables.StateID>
	</cffunction>
	
	<cffunction name="setStateID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="StateID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.StateID)) OR trim(arguments.StateID) EQ "">
			<cfset variables.StateID = arguments.StateID />
		<cfelse>
			<cfthrow message="StateID (#arguments.StateID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "StateID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ZipCode.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getZipCode" acess="public" output="false" returntype="any">
		<cfreturn variables.ZipCode>
	</cffunction>
	
	<cffunction name="setZipCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ZipCode" required="true" type="any" />
			
		<cfset variables.ZipCode = arguments.ZipCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ZipCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CountryID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCountryID" acess="public" output="false" returntype="any">
		<cfreturn variables.CountryID>
	</cffunction>
	
	<cffunction name="setCountryID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CountryID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.CountryID)) OR trim(arguments.CountryID) EQ "">
			<cfset variables.CountryID = arguments.CountryID />
		<cfelse>
			<cfthrow message="CountryID (#arguments.CountryID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CountryID") />		
		
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


