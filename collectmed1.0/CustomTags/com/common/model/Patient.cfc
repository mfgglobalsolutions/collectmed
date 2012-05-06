 	

<cfcomponent output="false">

			
	<cfscript>
		variables.instance = StructNew();				
		variables.instance.PatientID = "";				
		variables.instance.EntityID = "";				
		variables.instance.ClaimSubmitterIdentifier = "";				
		variables.instance.NM1IdentificationCode9 = "";				
		variables.instance.AccountNumber = "";				
		variables.instance.Active = "";				
		variables.instance.InactiveCode = "";				
		variables.instance.DateCreated = "";				
		variables.instance.DateModified = "";
	</cfscript>	
	
	
	<cffunction name="init" access="public" returntype="Patient" output="false">				
		<cfargument name="PatientID" type="string" required="false" default="" hint="PatientID" />				
		<cfargument name="EntityID" type="string" required="false" default="" hint="EntityID" />				
		<cfargument name="ClaimSubmitterIdentifier" type="string" required="false" default="" hint="ClaimSubmitterIdentifier" />				
		<cfargument name="NM1IdentificationCode9" type="string" required="false" default="" hint="NM1IdentificationCode9" />				
		<cfargument name="AccountNumber" type="string" required="false" default="" hint="AccountNumber" />				
		<cfargument name="Active" type="string" required="false" default="" hint="Active" />				
		<cfargument name="InactiveCode" type="string" required="false" default="" hint="InactiveCode" />				
		<cfargument name="DateCreated" type="string" required="false" default="" hint="DateCreated" />				
		<cfargument name="DateModified" type="string" required="false" default="" hint="DateModified" />		
							
		<cfscript>				
			setPatientID(arguments.PatientID);				
			setEntityID(arguments.EntityID);				
			setClaimSubmitterIdentifier(arguments.ClaimSubmitterIdentifier);				
			setNM1IdentificationCode9(arguments.NM1IdentificationCode9);				
			setAccountNumber(arguments.AccountNumber);				
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
	<cffunction name="getPatientID" access="public" hint="Getter for PatientID" output="false" returnType="any">
		<cfreturn variables.instance.PatientID />
	</cffunction>
	
	<cffunction name="setPatientID" access="public" hint="Setter for PatientID" output="false" returnType="void">
		<cfargument name="PatientID" hint="" required="yes" type="any" />
		<cfset variables.instance.PatientID = arguments.PatientID />
	</cffunction>				
	
	<cffunction name="getEntityID" access="public" hint="Getter for EntityID" output="false" returnType="any">
		<cfreturn variables.instance.EntityID />
	</cffunction>
	
	<cffunction name="setEntityID" access="public" hint="Setter for EntityID" output="false" returnType="void">
		<cfargument name="EntityID" hint="" required="yes" type="any" />
		<cfset variables.instance.EntityID = arguments.EntityID />
	</cffunction>				
	
	<cffunction name="getClaimSubmitterIdentifier" access="public" hint="Getter for ClaimSubmitterIdentifier" output="false" returnType="any">
		<cfreturn variables.instance.ClaimSubmitterIdentifier />
	</cffunction>
	
	<cffunction name="setClaimSubmitterIdentifier" access="public" hint="Setter for ClaimSubmitterIdentifier" output="false" returnType="void">
		<cfargument name="ClaimSubmitterIdentifier" hint="" required="yes" type="any" />
		<cfset variables.instance.ClaimSubmitterIdentifier = arguments.ClaimSubmitterIdentifier />
	</cffunction>				
	
	<cffunction name="getNM1IdentificationCode9" access="public" hint="Getter for NM1IdentificationCode9" output="false" returnType="any">
		<cfreturn variables.instance.NM1IdentificationCode9 />
	</cffunction>
	
	<cffunction name="setNM1IdentificationCode9" access="public" hint="Setter for NM1IdentificationCode9" output="false" returnType="void">
		<cfargument name="NM1IdentificationCode9" hint="" required="yes" type="any" />
		<cfset variables.instance.NM1IdentificationCode9 = arguments.NM1IdentificationCode9 />
	</cffunction>				
	
	<cffunction name="getAccountNumber" access="public" hint="Getter for AccountNumber" output="false" returnType="any">
		<cfreturn variables.instance.AccountNumber />
	</cffunction>
	
	<cffunction name="setAccountNumber" access="public" hint="Setter for AccountNumber" output="false" returnType="void">
		<cfargument name="AccountNumber" hint="" required="yes" type="any" />
		<cfset variables.instance.AccountNumber = arguments.AccountNumber />
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

	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get a patient.                                 --->
	<!--- IF YOU CHANGE THIS QUERY YOU NEED TO MAKE SURE YOU CHANGE IT IN THE WEB        --->
	<!--- SERVICE wsPatient.                                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatients" hint="This function will be called to get a Patients query.">		
		
		<cfargument name="clientID" required="Yes" type="numeric">
		<cfargument name="PatientIDs" required="Yes" type="string">
							
		<cftry>			
								
			<cfquery name="getPatients" datasource="PAClient_#trim(ClientID)#">								
				SELECT p.EntityID, p.PatientID, e.FName, e.Mname, e.LName, e.SSN, e.DOB, e.Sex, e.Weight, e.HeightInInches, e.MaritalStatus 				
				FROM Patient p
				INNER JOIN Entity e ON p.EntityID = e.EntityID						
				WHERE p.PatientID IN (#trim(arguments.PatientIDs)#)					
			</cfquery>
			
			<cfreturn getPatients>						
								
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


