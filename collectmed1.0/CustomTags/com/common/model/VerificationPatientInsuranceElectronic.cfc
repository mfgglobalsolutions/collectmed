 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.VerificationPatientInsuranceElectronicID = "";				
		variables.instance.vpicID = "";				
		variables.instance.mashFileID = "";				
		variables.instance.indexInFile = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="VerificationPatientInsuranceElectronic" output="false">				
		<cfargument name="VerificationPatientInsuranceElectronicID" type="string" required="false" default="" hint="VerificationPatientInsuranceElectronicID" />				
		<cfargument name="vpicID" type="string" required="false" default="" hint="vpicID" />				
		<cfargument name="mashFileID" type="string" required="false" default="" hint="mashFileID" />				
		<cfargument name="indexInFile" type="string" required="false" default="" hint="indexInFile" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setVerificationPatientInsuranceElectronicID(arguments.VerificationPatientInsuranceElectronicID);				
			setvpicID(arguments.vpicID);				
			setmashFileID(arguments.mashFileID);				
			setindexInFile(arguments.indexInFile);				
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
	<cffunction name="getVerificationPatientInsuranceElectronicID" access="public" hint="Getter for VerificationPatientInsuranceElectronicID" output="false" returnType="any">
		<cfreturn variables.instance.VerificationPatientInsuranceElectronicID />
	</cffunction>
	
	<cffunction name="setVerificationPatientInsuranceElectronicID" access="public" hint="Setter for VerificationPatientInsuranceElectronicID" output="false" returnType="void">
		<cfargument name="VerificationPatientInsuranceElectronicID" hint="" required="yes" type="any" />
		<cfset variables.instance.VerificationPatientInsuranceElectronicID = arguments.VerificationPatientInsuranceElectronicID />
	</cffunction>				
	
	<cffunction name="getvpicID" access="public" hint="Getter for vpicID" output="false" returnType="any">
		<cfreturn variables.instance.vpicID />
	</cffunction>
	
	<cffunction name="setvpicID" access="public" hint="Setter for vpicID" output="false" returnType="void">
		<cfargument name="vpicID" hint="" required="yes" type="any" />
		<cfset variables.instance.vpicID = arguments.vpicID />
	</cffunction>				
	
	<cffunction name="getmashFileID" access="public" hint="Getter for mashFileID" output="false" returnType="any">
		<cfreturn variables.instance.mashFileID />
	</cffunction>
	
	<cffunction name="setmashFileID" access="public" hint="Setter for mashFileID" output="false" returnType="void">
		<cfargument name="mashFileID" hint="" required="yes" type="any" />
		<cfset variables.instance.mashFileID = arguments.mashFileID />
	</cffunction>				
	
	<cffunction name="getindexInFile" access="public" hint="Getter for indexInFile" output="false" returnType="any">
		<cfreturn variables.instance.indexInFile />
	</cffunction>
	
	<cffunction name="setindexInFile" access="public" hint="Setter for indexInFile" output="false" returnType="void">
		<cfargument name="indexInFile" hint="" required="yes" type="any" />
		<cfset variables.instance.indexInFile = arguments.indexInFile />
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


