 	
<cfcomponent output="false" extends="com.persistence.BaseDAO">

	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.ConfigBean = '' />
	<cfset variables.instance.AddressDAO = '' />
	<cfset variables.instance.InsuranceCompanyDAO = '' />
	<cfset variables.instance.PhoneDAO = '' /> 		
		
	<cffunction name="init" access="public" output="false" returntype="systemDAO" hint="I am the constructor method for the SystemDAO Class.">
		<cfargument name="ConfigBean" required="true" type="com.utility.configBean" hint="I am the ConfigBean object." />
		<cfargument name="AddressDAO" required="true" type="com.persistence.daos.AddressDAO" hint="I am the AddressDAO object." />
		<cfargument name="InsuranceCompanyDAO" required="true" type="com.persistence.daos.InsuranceCompanyDAO" hint="I am the InsuranceCompanyDAO object." />
		<cfargument name="PhoneDAO" required="true" type="com.persistence.daos.PhoneDAO" hint="I am the PhoneDAO object." /> 	
				
		<cfscript>			
			structAppend(variables.instance, arguments);
		</cfscript>
		
		<cfreturn this />
	</cffunction>

	<cffunction name="getAddressDAO" access="public" output="false" returntype="com.persistence.daos.AddressDAO" hint="return com.persistence.daos.AddressDAO Class.">
		<cfreturn variables.instance.AddressDAO />
	</cffunction>	

	<cffunction name="getInsuranceCompanyDAO" access="public" output="false" returntype="com.persistence.daos.InsuranceCompanyDAO" hint="return com.persistence.daos.InsuranceCompanyDAO Class.">
		<cfreturn variables.instance.InsuranceCompanyDAO />
	</cffunction>	

	<cffunction name="getPhoneDAO" access="public" output="false" returntype="com.persistence.daos.PhoneDAO" hint="return com.persistence.daos.PhoneDAO Class.">
		<cfreturn variables.instance.PhoneDAO />
	</cffunction>	
	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


