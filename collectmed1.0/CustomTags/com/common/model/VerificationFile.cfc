


<cfcomponent displayName="VerificationFile">		
	
	<cfscript>
		variables.instance = StructNew();
		variables.instance.VerificationFileID = 0;
		variables.instance.InsuranceCompanyID = "";
		variables.instance.UsersID = "";
		variables.instance.xmlFileID = "";
		variables.instance.Active = 1;
		variables.instance.InActiveCode = "";
	</cfscript>
	
	
	<cffunction name="init" access="public" returntype="VerificationFile" output="false">
						
		<cfargument name="VerificationFileID" type="string" required="false" default="" hint="Verification File ID" />
		<cfargument name="InsuranceCompanyID" type="string" required="false" default="" hint="Insurance Company ID" />
		<cfargument name="UsersID" type="string" required="false" default="" hint="Users ID" />
		<cfargument name="xmlFileID" type="string" required="false" default="" hint="XML File ID" />
		<cfargument name="active" type="string" required="false" default="" hint="Active ID" />
		<cfargument name="inactiveCode" type="string" required="false" default="" hint="Inactive Code" />		
			
		<cfscript>
			setVerificationFileID(arguments.VerificationFileID);
			setInsuranceCompanyID(arguments.InsuranceCompanyID);
			setUsersID(arguments.UsersID);
			setXmlFileID(arguments.xmlFileID);
			setActive(arguments.active);
			setInactiveCode(arguments.inactiveCode);				
		</cfscript>
		
		<cfreturn this />
		
	</cffunction>

	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!--- getters/setters --->	
	<cffunction name="getVerificationFileID" access="public" hint="Getter for Verification File ID" output="false" returnType="numeric">
		<cfreturn variables.instance.VerificationFileID />
	</cffunction>
	
	<cffunction name="setVerificationFileID" access="public" hint="Setter for Verification File ID" output="false" returnType="void">
		<cfargument name="VerificationFileID" hint="" required="yes" type="string" />
		<cfset variables.instance.VerificationFileID = arguments.VerificationFileID />
	</cffunction>
	
	<cffunction name="getInsuranceCompanyID" access="public" hint="Getter for Insurance Company ID" output="false" returnType="string">
		<cfreturn variables.instance.InsuranceCompanyID />
	</cffunction>
	
	<cffunction name="setInsuranceCompanyID" access="public" hint="Setter for Insurance Company ID" output="false" returnType="void">
		<cfargument name="InsuranceCompanyID" hint="" required="yes" type="string" />
		<cfset variables.instance.InsuranceCompanyID = arguments.InsuranceCompanyID />
	</cffunction>

	<cffunction name="getUsersID" access="public" hint="Getter for Users ID" output="false" returnType="string">
		<cfreturn variables.instance.UsersID />
	</cffunction>
	
	<cffunction name="setUsersID" access="public" hint="Setter for Users ID" output="false" returnType="void">
		<cfargument name="UsersID" hint="" required="yes" type="string" />
		<cfset variables.instance.UsersID = arguments.UsersID />
	</cffunction>

	<cffunction name="getXmlFileID" access="public" hint="Getter for XML File ID" output="false" returnType="string">
		<cfreturn variables.instance.XmlFileID />
	</cffunction>
	
	<cffunction name="setXmlFileID" access="public" hint="Setter for XML File ID" output="false" returnType="void">
		<cfargument name="XmlFileID" hint="" required="yes" type="string" />
		<cfset variables.instance.XmlFileID = arguments.XmlFileID />
	</cffunction>
	
	<cffunction name="getActive" access="public" hint="Getter for Active" output="false" returnType="string">
		<cfreturn variables.instance.Active />
	</cffunction>
	
	<cffunction name="setActive" access="public" hint="Setter for Active" output="false" returnType="void">
		<cfargument name="Active" hint="" required="yes" type="string" />
		<cfset variables.instance.Active = arguments.Active />
	</cffunction>	
	
	<cffunction name="getInActiveCode" access="public" hint="Getter for InactiveCode" output="false" returnType="string">
		<cfreturn variables.instance.InActiveCode />
	</cffunction>
	
	<cffunction name="setInActiveCode" access="public" hint="Setter for InactiveCode" output="false" returnType="void">
		<cfargument name="InActiveCode" hint="" required="yes" type="string" />
		<cfset variables.instance.InActiveCode = arguments.InActiveCode />
	</cffunction>
			
</cfcomponent>

	
    