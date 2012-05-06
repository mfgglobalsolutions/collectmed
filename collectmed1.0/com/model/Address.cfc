 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.AddressID = "";				
		variables.instance.SiteID = "";				
		variables.instance.AddressTypeID = "";				
		variables.instance.Attention = "";				
		variables.instance.AddressLine1 = "";				
		variables.instance.AddressLine2 = "";				
		variables.instance.City = "";				
		variables.instance.StateID = "";				
		variables.instance.ZipCode = "";				
		variables.instance.CountryID = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="Address" output="false">				
		<cfargument name="AddressID" type="string" required="false" default="" hint="AddressID" />				
		<cfargument name="SiteID" type="string" required="false" default="" hint="SiteID" />				
		<cfargument name="AddressTypeID" type="string" required="false" default="" hint="AddressTypeID" />				
		<cfargument name="Attention" type="string" required="false" default="" hint="Attention" />				
		<cfargument name="AddressLine1" type="string" required="false" default="" hint="AddressLine1" />				
		<cfargument name="AddressLine2" type="string" required="false" default="" hint="AddressLine2" />				
		<cfargument name="City" type="string" required="false" default="" hint="City" />				
		<cfargument name="StateID" type="string" required="false" default="" hint="StateID" />				
		<cfargument name="ZipCode" type="string" required="false" default="" hint="ZipCode" />				
		<cfargument name="CountryID" type="string" required="false" default="" hint="CountryID" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setAddressID(arguments.AddressID);				
			setSiteID(arguments.SiteID);				
			setAddressTypeID(arguments.AddressTypeID);				
			setAttention(arguments.Attention);				
			setAddressLine1(arguments.AddressLine1);				
			setAddressLine2(arguments.AddressLine2);				
			setCity(arguments.City);				
			setStateID(arguments.StateID);				
			setZipCode(arguments.ZipCode);				
			setCountryID(arguments.CountryID);				
			setActive(arguments.Active);				
			setInactiveCode(arguments.InactiveCode);				
			setDateCreated(arguments.DateCreated);				
			setDateModified(arguments.DateModified);							
		</cfscript>							
		
		<cfreturn this />
			
	</cffunction>

	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!--- getters/setters --->	
	<cffunction name="getAddressID" access="public" hint="Getter for AddressID" output="false" returnType="any">
		<cfreturn variables.instance.AddressID />
	</cffunction>
	
	<cffunction name="setAddressID" access="public" hint="Setter for AddressID" output="false" returnType="void">
		<cfargument name="AddressID" hint="" required="yes" type="any" />
		<cfset variables.instance.AddressID = arguments.AddressID />
	</cffunction>				
	
	<cffunction name="getSiteID" access="public" hint="Getter for SiteID" output="false" returnType="any">
		<cfreturn variables.instance.SiteID />
	</cffunction>
	
	<cffunction name="setSiteID" access="public" hint="Setter for SiteID" output="false" returnType="void">
		<cfargument name="SiteID" hint="" required="yes" type="any" />
		<cfset variables.instance.SiteID = arguments.SiteID />
	</cffunction>				
	
	<cffunction name="getAddressTypeID" access="public" hint="Getter for AddressTypeID" output="false" returnType="any">
		<cfreturn variables.instance.AddressTypeID />
	</cffunction>
	
	<cffunction name="setAddressTypeID" access="public" hint="Setter for AddressTypeID" output="false" returnType="void">
		<cfargument name="AddressTypeID" hint="" required="yes" type="any" />
		<cfset variables.instance.AddressTypeID = arguments.AddressTypeID />
	</cffunction>				
	
	<cffunction name="getAttention" access="public" hint="Getter for Attention" output="false" returnType="any">
		<cfreturn variables.instance.Attention />
	</cffunction>
	
	<cffunction name="setAttention" access="public" hint="Setter for Attention" output="false" returnType="void">
		<cfargument name="Attention" hint="" required="yes" type="any" />
		<cfset variables.instance.Attention = arguments.Attention />
	</cffunction>				
	
	<cffunction name="getAddressLine1" access="public" hint="Getter for AddressLine1" output="false" returnType="any">
		<cfreturn variables.instance.AddressLine1 />
	</cffunction>
	
	<cffunction name="setAddressLine1" access="public" hint="Setter for AddressLine1" output="false" returnType="void">
		<cfargument name="AddressLine1" hint="" required="yes" type="any" />
		<cfset variables.instance.AddressLine1 = arguments.AddressLine1 />
	</cffunction>				
	
	<cffunction name="getAddressLine2" access="public" hint="Getter for AddressLine2" output="false" returnType="any">
		<cfreturn variables.instance.AddressLine2 />
	</cffunction>
	
	<cffunction name="setAddressLine2" access="public" hint="Setter for AddressLine2" output="false" returnType="void">
		<cfargument name="AddressLine2" hint="" required="yes" type="any" />
		<cfset variables.instance.AddressLine2 = arguments.AddressLine2 />
	</cffunction>				
	
	<cffunction name="getCity" access="public" hint="Getter for City" output="false" returnType="any">
		<cfreturn variables.instance.City />
	</cffunction>
	
	<cffunction name="setCity" access="public" hint="Setter for City" output="false" returnType="void">
		<cfargument name="City" hint="" required="yes" type="any" />
		<cfset variables.instance.City = arguments.City />
	</cffunction>				
	
	<cffunction name="getStateID" access="public" hint="Getter for StateID" output="false" returnType="any">
		<cfreturn variables.instance.StateID />
	</cffunction>
	
	<cffunction name="setStateID" access="public" hint="Setter for StateID" output="false" returnType="void">
		<cfargument name="StateID" hint="" required="yes" type="any" />
		<cfset variables.instance.StateID = arguments.StateID />
	</cffunction>				
	
	<cffunction name="getZipCode" access="public" hint="Getter for ZipCode" output="false" returnType="any">
		<cfreturn variables.instance.ZipCode />
	</cffunction>
	
	<cffunction name="setZipCode" access="public" hint="Setter for ZipCode" output="false" returnType="void">
		<cfargument name="ZipCode" hint="" required="yes" type="any" />
		<cfset variables.instance.ZipCode = arguments.ZipCode />
	</cffunction>				
	
	<cffunction name="getCountryID" access="public" hint="Getter for CountryID" output="false" returnType="any">
		<cfreturn variables.instance.CountryID />
	</cffunction>
	
	<cffunction name="setCountryID" access="public" hint="Setter for CountryID" output="false" returnType="void">
		<cfargument name="CountryID" hint="" required="yes" type="any" />
		<cfset variables.instance.CountryID = arguments.CountryID />
	</cffunction>				
	
	<cffunction name="getActive" access="public" hint="Getter for Active" output="false" returnType="any">
		<cfreturn variables.instance.Active />
	</cffunction>
	
	<cffunction name="setActive" access="public" hint="Setter for Active" output="false" returnType="void">
		<cfargument name="Active" hint="" required="yes" type="any" />
		<cfset variables.instance.Active = arguments.Active />
	</cffunction>				
	
	<cffunction name="getInactiveCode" access="public" hint="Getter for InactiveCode" output="false" returnType="any">
		<cfreturn variables.instance.InactiveCode />
	</cffunction>
	
	<cffunction name="setInactiveCode" access="public" hint="Setter for InactiveCode" output="false" returnType="void">
		<cfargument name="InactiveCode" hint="" required="yes" type="any" />
		<cfset variables.instance.InactiveCode = arguments.InactiveCode />
	</cffunction>				
	
	<cffunction name="getDateCreated" access="public" hint="Getter for DateCreated" output="false" returnType="any">
		<cfreturn variables.instance.DateCreated />
	</cffunction>
	
	<cffunction name="setDateCreated" access="public" hint="Setter for DateCreated" output="false" returnType="void">
		<cfargument name="DateCreated" hint="" required="yes" type="any" />
		<cfset variables.instance.DateCreated = arguments.DateCreated />
	</cffunction>				
	
	<cffunction name="getDateModified" access="public" hint="Getter for DateModified" output="false" returnType="any">
		<cfreturn variables.instance.DateModified />
	</cffunction>
	
	<cffunction name="setDateModified" access="public" hint="Setter for DateModified" output="false" returnType="void">
		<cfargument name="DateModified" hint="" required="yes" type="any" />
		<cfset variables.instance.DateModified = arguments.DateModified />
	</cffunction>				
	


<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


