 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.PhoneID = "";				
		variables.instance.SiteID = "";				
		variables.instance.PhoneTypeID = "";				
		variables.instance.PhoneNumber = "";				
		variables.instance.PhoneExtension = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="Phone" output="false">				
		<cfargument name="PhoneID" type="string" required="false" default="" hint="PhoneID" />				
		<cfargument name="SiteID" type="string" required="false" default="" hint="SiteID" />				
		<cfargument name="PhoneTypeID" type="string" required="false" default="" hint="PhoneTypeID" />				
		<cfargument name="PhoneNumber" type="string" required="false" default="" hint="PhoneNumber" />				
		<cfargument name="PhoneExtension" type="string" required="false" default="" hint="PhoneExtension" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setPhoneID(arguments.PhoneID);				
			setSiteID(arguments.SiteID);				
			setPhoneTypeID(arguments.PhoneTypeID);				
			setPhoneNumber(arguments.PhoneNumber);				
			setPhoneExtension(arguments.PhoneExtension);				
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
	<cffunction name="getPhoneID" access="public" hint="Getter for PhoneID" output="false" returnType="any">
		<cfreturn variables.instance.PhoneID />
	</cffunction>
	
	<cffunction name="setPhoneID" access="public" hint="Setter for PhoneID" output="false" returnType="void">
		<cfargument name="PhoneID" hint="" required="yes" type="any" />
		<cfset variables.instance.PhoneID = arguments.PhoneID />
	</cffunction>				
	
	<cffunction name="getSiteID" access="public" hint="Getter for SiteID" output="false" returnType="any">
		<cfreturn variables.instance.SiteID />
	</cffunction>
	
	<cffunction name="setSiteID" access="public" hint="Setter for SiteID" output="false" returnType="void">
		<cfargument name="SiteID" hint="" required="yes" type="any" />
		<cfset variables.instance.SiteID = arguments.SiteID />
	</cffunction>				
	
	<cffunction name="getPhoneTypeID" access="public" hint="Getter for PhoneTypeID" output="false" returnType="any">
		<cfreturn variables.instance.PhoneTypeID />
	</cffunction>
	
	<cffunction name="setPhoneTypeID" access="public" hint="Setter for PhoneTypeID" output="false" returnType="void">
		<cfargument name="PhoneTypeID" hint="" required="yes" type="any" />
		<cfset variables.instance.PhoneTypeID = arguments.PhoneTypeID />
	</cffunction>				
	
	<cffunction name="getPhoneNumber" access="public" hint="Getter for PhoneNumber" output="false" returnType="any">
		<cfreturn variables.instance.PhoneNumber />
	</cffunction>
	
	<cffunction name="setPhoneNumber" access="public" hint="Setter for PhoneNumber" output="false" returnType="void">
		<cfargument name="PhoneNumber" hint="" required="yes" type="any" />
		<cfset variables.instance.PhoneNumber = arguments.PhoneNumber />
	</cffunction>				
	
	<cffunction name="getPhoneExtension" access="public" hint="Getter for PhoneExtension" output="false" returnType="any">
		<cfreturn variables.instance.PhoneExtension />
	</cffunction>
	
	<cffunction name="setPhoneExtension" access="public" hint="Setter for PhoneExtension" output="false" returnType="void">
		<cfargument name="PhoneExtension" hint="" required="yes" type="any" />
		<cfset variables.instance.PhoneExtension = arguments.PhoneExtension />
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


