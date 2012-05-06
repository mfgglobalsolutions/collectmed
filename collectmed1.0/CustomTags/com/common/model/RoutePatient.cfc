 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.RoutePatientID = "";				
		variables.instance.RouteID = "";				
		variables.instance.SubRoute = "";				
		variables.instance.PatientID = "";				
		variables.instance.FName = "";				
		variables.instance.LName = "";				
		variables.instance.City = "";				
		variables.instance.IDtext = "";				
		variables.instance.SuppliesText = "";				
		variables.instance.Checked = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="RoutePatient" output="false">				
		<cfargument name="RoutePatientID" type="string" required="false" default="" hint="RoutePatientID" />				
		<cfargument name="RouteID" type="string" required="false" default="" hint="RouteID" />				
		<cfargument name="SubRoute" type="string" required="false" default="" hint="SubRoute" />				
		<cfargument name="PatientID" type="string" required="false" default="" hint="PatientID" />				
		<cfargument name="FName" type="string" required="false" default="" hint="FName" />				
		<cfargument name="LName" type="string" required="false" default="" hint="LName" />				
		<cfargument name="City" type="string" required="false" default="" hint="City" />				
		<cfargument name="IDtext" type="string" required="false" default="" hint="IDtext" />				
		<cfargument name="SuppliesText" type="string" required="false" default="" hint="SuppliesText" />				
		<cfargument name="Checked" type="string" required="false" default="" hint="Checked" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setRoutePatientID(arguments.RoutePatientID);				
			setRouteID(arguments.RouteID);				
			setSubRoute(arguments.SubRoute);				
			setPatientID(arguments.PatientID);				
			setFName(arguments.FName);				
			setLName(arguments.LName);				
			setCity(arguments.City);				
			setIDtext(arguments.IDtext);				
			setSuppliesText(arguments.SuppliesText);				
			setChecked(arguments.Checked);				
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
	<cffunction name="getRoutePatientID" access="public" hint="Getter for RoutePatientID" output="false" returnType="any">
		<cfreturn variables.instance.RoutePatientID />
	</cffunction>
	
	<cffunction name="setRoutePatientID" access="public" hint="Setter for RoutePatientID" output="false" returnType="void">
		<cfargument name="RoutePatientID" hint="" required="yes" type="any" />
		<cfset variables.instance.RoutePatientID = arguments.RoutePatientID />
	</cffunction>				
	
	<cffunction name="getRouteID" access="public" hint="Getter for RouteID" output="false" returnType="any">
		<cfreturn variables.instance.RouteID />
	</cffunction>
	
	<cffunction name="setRouteID" access="public" hint="Setter for RouteID" output="false" returnType="void">
		<cfargument name="RouteID" hint="" required="yes" type="any" />
		<cfset variables.instance.RouteID = arguments.RouteID />
	</cffunction>				
	
	<cffunction name="getSubRoute" access="public" hint="Getter for SubRoute" output="false" returnType="any">
		<cfreturn variables.instance.SubRoute />
	</cffunction>
	
	<cffunction name="setSubRoute" access="public" hint="Setter for SubRoute" output="false" returnType="void">
		<cfargument name="SubRoute" hint="" required="yes" type="any" />
		<cfset variables.instance.SubRoute = arguments.SubRoute />
	</cffunction>				
	
	<cffunction name="getPatientID" access="public" hint="Getter for PatientID" output="false" returnType="any">
		<cfreturn variables.instance.PatientID />
	</cffunction>
	
	<cffunction name="setPatientID" access="public" hint="Setter for PatientID" output="false" returnType="void">
		<cfargument name="PatientID" hint="" required="yes" type="any" />
		<cfset variables.instance.PatientID = arguments.PatientID />
	</cffunction>				
	
	<cffunction name="getFName" access="public" hint="Getter for FName" output="false" returnType="any">
		<cfreturn variables.instance.FName />
	</cffunction>
	
	<cffunction name="setFName" access="public" hint="Setter for FName" output="false" returnType="void">
		<cfargument name="FName" hint="" required="yes" type="any" />
		<cfset variables.instance.FName = arguments.FName />
	</cffunction>				
	
	<cffunction name="getLName" access="public" hint="Getter for LName" output="false" returnType="any">
		<cfreturn variables.instance.LName />
	</cffunction>
	
	<cffunction name="setLName" access="public" hint="Setter for LName" output="false" returnType="void">
		<cfargument name="LName" hint="" required="yes" type="any" />
		<cfset variables.instance.LName = arguments.LName />
	</cffunction>				
	
	<cffunction name="getCity" access="public" hint="Getter for City" output="false" returnType="any">
		<cfreturn variables.instance.City />
	</cffunction>
	
	<cffunction name="setCity" access="public" hint="Setter for City" output="false" returnType="void">
		<cfargument name="City" hint="" required="yes" type="any" />
		<cfset variables.instance.City = arguments.City />
	</cffunction>				
	
	<cffunction name="getIDtext" access="public" hint="Getter for IDtext" output="false" returnType="any">
		<cfreturn variables.instance.IDtext />
	</cffunction>
	
	<cffunction name="setIDtext" access="public" hint="Setter for IDtext" output="false" returnType="void">
		<cfargument name="IDtext" hint="" required="yes" type="any" />
		<cfset variables.instance.IDtext = arguments.IDtext />
	</cffunction>				
	
	<cffunction name="getSuppliesText" access="public" hint="Getter for SuppliesText" output="false" returnType="any">
		<cfreturn variables.instance.SuppliesText />
	</cffunction>
	
	<cffunction name="setSuppliesText" access="public" hint="Setter for SuppliesText" output="false" returnType="void">
		<cfargument name="SuppliesText" hint="" required="yes" type="any" />
		<cfset variables.instance.SuppliesText = arguments.SuppliesText />
	</cffunction>				
	
	<cffunction name="getChecked" access="public" hint="Getter for Checked" output="false" returnType="any">
		<cfreturn variables.instance.Checked />
	</cffunction>
	
	<cffunction name="setChecked" access="public" hint="Setter for Checked" output="false" returnType="void">
		<cfargument name="Checked" hint="" required="yes" type="any" />
		<cfset variables.instance.Checked = arguments.Checked />
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


