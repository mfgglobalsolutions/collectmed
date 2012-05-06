 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.InsuranceCompanyID = "";				
		variables.instance.ClientID = "";				
		variables.instance.OCNANumber = "";				
		variables.instance.InsuranceCompanyName = "";				
		variables.instance.InsuranceCompanyDBA = "";				
		variables.instance.EntityID = "";				
		variables.instance.InsuranceCompanyURL = "";				
		variables.instance.LoginInstructionsXML = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="InsuranceCompany" output="false">				
		<cfargument name="InsuranceCompanyID" type="string" required="false" default="" hint="InsuranceCompanyID" />				
		<cfargument name="ClientID" type="string" required="false" default="" hint="ClientID" />				
		<cfargument name="OCNANumber" type="string" required="false" default="" hint="OCNANumber" />				
		<cfargument name="InsuranceCompanyName" type="string" required="false" default="" hint="InsuranceCompanyName" />				
		<cfargument name="InsuranceCompanyDBA" type="string" required="false" default="" hint="InsuranceCompanyDBA" />				
		<cfargument name="EntityID" type="string" required="false" default="" hint="EntityID" />				
		<cfargument name="InsuranceCompanyURL" type="string" required="false" default="" hint="InsuranceCompanyURL" />				
		<cfargument name="LoginInstructionsXML" type="string" required="false" default="" hint="LoginInstructionsXML" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setInsuranceCompanyID(arguments.InsuranceCompanyID);				
			setClientID(arguments.ClientID);				
			setOCNANumber(arguments.OCNANumber);				
			setInsuranceCompanyName(arguments.InsuranceCompanyName);				
			setInsuranceCompanyDBA(arguments.InsuranceCompanyDBA);				
			setEntityID(arguments.EntityID);				
			setInsuranceCompanyURL(arguments.InsuranceCompanyURL);				
			setLoginInstructionsXML(arguments.LoginInstructionsXML);				
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
	<cffunction name="getInsuranceCompanyID" access="public" hint="Getter for InsuranceCompanyID" output="false" returnType="any">
		<cfreturn variables.instance.InsuranceCompanyID />
	</cffunction>
	
	<cffunction name="setInsuranceCompanyID" access="public" hint="Setter for InsuranceCompanyID" output="false" returnType="void">
		<cfargument name="InsuranceCompanyID" hint="" required="yes" type="any" />
		<cfset variables.instance.InsuranceCompanyID = arguments.InsuranceCompanyID />
	</cffunction>				
	
	<cffunction name="getClientID" access="public" hint="Getter for ClientID" output="false" returnType="any">
		<cfreturn variables.instance.ClientID />
	</cffunction>
	
	<cffunction name="setClientID" access="public" hint="Setter for ClientID" output="false" returnType="void">
		<cfargument name="ClientID" hint="" required="yes" type="any" />
		<cfset variables.instance.ClientID = arguments.ClientID />
	</cffunction>				
	
	<cffunction name="getOCNANumber" access="public" hint="Getter for OCNANumber" output="false" returnType="any">
		<cfreturn variables.instance.OCNANumber />
	</cffunction>
	
	<cffunction name="setOCNANumber" access="public" hint="Setter for OCNANumber" output="false" returnType="void">
		<cfargument name="OCNANumber" hint="" required="yes" type="any" />
		<cfset variables.instance.OCNANumber = arguments.OCNANumber />
	</cffunction>				
	
	<cffunction name="getInsuranceCompanyName" access="public" hint="Getter for InsuranceCompanyName" output="false" returnType="any">
		<cfreturn variables.instance.InsuranceCompanyName />
	</cffunction>
	
	<cffunction name="setInsuranceCompanyName" access="public" hint="Setter for InsuranceCompanyName" output="false" returnType="void">
		<cfargument name="InsuranceCompanyName" hint="" required="yes" type="any" />
		<cfset variables.instance.InsuranceCompanyName = arguments.InsuranceCompanyName />
	</cffunction>				
	
	<cffunction name="getInsuranceCompanyDBA" access="public" hint="Getter for InsuranceCompanyDBA" output="false" returnType="any">
		<cfreturn variables.instance.InsuranceCompanyDBA />
	</cffunction>
	
	<cffunction name="setInsuranceCompanyDBA" access="public" hint="Setter for InsuranceCompanyDBA" output="false" returnType="void">
		<cfargument name="InsuranceCompanyDBA" hint="" required="yes" type="any" />
		<cfset variables.instance.InsuranceCompanyDBA = arguments.InsuranceCompanyDBA />
	</cffunction>				
	
	<cffunction name="getEntityID" access="public" hint="Getter for EntityID" output="false" returnType="any">
		<cfreturn variables.instance.EntityID />
	</cffunction>
	
	<cffunction name="setEntityID" access="public" hint="Setter for EntityID" output="false" returnType="void">
		<cfargument name="EntityID" hint="" required="yes" type="any" />
		<cfset variables.instance.EntityID = arguments.EntityID />
	</cffunction>				
	
	<cffunction name="getInsuranceCompanyURL" access="public" hint="Getter for InsuranceCompanyURL" output="false" returnType="any">
		<cfreturn variables.instance.InsuranceCompanyURL />
	</cffunction>
	
	<cffunction name="setInsuranceCompanyURL" access="public" hint="Setter for InsuranceCompanyURL" output="false" returnType="void">
		<cfargument name="InsuranceCompanyURL" hint="" required="yes" type="any" />
		<cfset variables.instance.InsuranceCompanyURL = arguments.InsuranceCompanyURL />
	</cffunction>				
	
	<cffunction name="getLoginInstructionsXML" access="public" hint="Getter for LoginInstructionsXML" output="false" returnType="any">
		<cfreturn variables.instance.LoginInstructionsXML />
	</cffunction>
	
	<cffunction name="setLoginInstructionsXML" access="public" hint="Setter for LoginInstructionsXML" output="false" returnType="void">
		<cfargument name="LoginInstructionsXML" hint="" required="yes" type="any" />
		<cfset variables.instance.LoginInstructionsXML = arguments.LoginInstructionsXML />
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


