 	


<cfcomponent name="doctorBean" output="false" alias="doctorBean" extends="DoctorDAO">

	<cfproperty name="DoctorID" type="numeric" default="0" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="ClientDoctorID" type="string" default="" />
	<cfproperty name="DoctorCategory" type="string" default="" />
	<cfproperty name="UPIN" type="string" default="" />
	<cfproperty name="MedicareNumber" type="string" default="" />
	<cfproperty name="MedicaidNumber" type="string" default="" />
	<cfproperty name="GroupName" type="string" default="" />
	<cfproperty name="SpecialInstructions" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.DoctorID = 0;
		variables.EntityID = "";
		variables.ClientDoctorID = "";
		variables.DoctorCategory = "";
		variables.UPIN = "";
		variables.MedicareNumber = "";
		variables.MedicaidNumber = "";
		variables.GroupName = "";
		variables.SpecialInstructions = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="doctorBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "DoctorID") AND stValues.DoctorID NEQ 0>
				<cfquery name="qGetDoctor" datasource="#trim(arguments.ds)#">
			  		SELECT DoctorID,EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified
					FROM Doctor  
					WHERE DoctorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.DoctorID#" /> 
				</cfquery>		
				<cfif qGetDoctor.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.EntityID = qGetDoctor.EntityID;
					variables.ClientDoctorID = qGetDoctor.ClientDoctorID;
					variables.DoctorCategory = qGetDoctor.DoctorCategory;
					variables.UPIN = qGetDoctor.UPIN;
					variables.MedicareNumber = qGetDoctor.MedicareNumber;
					variables.MedicaidNumber = qGetDoctor.MedicaidNumber;
					variables.GroupName = qGetDoctor.GroupName;
					variables.SpecialInstructions = qGetDoctor.SpecialInstructions;
					variables.Active = qGetDoctor.Active;
					variables.InactiveCode = qGetDoctor.InactiveCode;
					variables.DateModified = qGetDoctor.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "DoctorID")><cfset variables.DoctorID = stValues.DoctorID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "ClientDoctorID")><cfset variables.ClientDoctorID = stValues.ClientDoctorID /></cfif>
			<cfif StructKeyExists(stValues, "DoctorCategory")><cfset variables.DoctorCategory = stValues.DoctorCategory /></cfif>
			<cfif StructKeyExists(stValues, "UPIN")><cfset variables.UPIN = stValues.UPIN /></cfif>
			<cfif StructKeyExists(stValues, "MedicareNumber")><cfset variables.MedicareNumber = stValues.MedicareNumber /></cfif>
			<cfif StructKeyExists(stValues, "MedicaidNumber")><cfset variables.MedicaidNumber = stValues.MedicaidNumber /></cfif>
			<cfif StructKeyExists(stValues, "GroupName")><cfset variables.GroupName = stValues.GroupName /></cfif>
			<cfif StructKeyExists(stValues, "SpecialInstructions")><cfset variables.SpecialInstructions = stValues.SpecialInstructions /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DoctorID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDoctorID" acess="public" output="false" returntype="any">
		<cfreturn variables.DoctorID>
	</cffunction>
	
	<cffunction name="setDoctorID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DoctorID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.DoctorID)) OR trim(arguments.DoctorID) EQ "">
			<cfset variables.DoctorID = arguments.DoctorID />
		<cfelse>
			<cfthrow message="DoctorID (#arguments.DoctorID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DoctorID") />		
		
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
	<!--- GET and SET methods for ClientDoctorID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientDoctorID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientDoctorID>
	</cffunction>
	
	<cffunction name="setClientDoctorID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientDoctorID" required="true" type="any" />
			
		<cfset variables.ClientDoctorID = arguments.ClientDoctorID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientDoctorID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DoctorCategory.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDoctorCategory" acess="public" output="false" returntype="any">
		<cfreturn variables.DoctorCategory>
	</cffunction>
	
	<cffunction name="setDoctorCategory" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DoctorCategory" required="true" type="any" />
			
		<cfset variables.DoctorCategory = arguments.DoctorCategory />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DoctorCategory") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UPIN.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUPIN" acess="public" output="false" returntype="any">
		<cfreturn variables.UPIN>
	</cffunction>
	
	<cffunction name="setUPIN" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UPIN" required="true" type="any" />
			
		<cfset variables.UPIN = arguments.UPIN />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UPIN") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MedicareNumber.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMedicareNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.MedicareNumber>
	</cffunction>
	
	<cffunction name="setMedicareNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MedicareNumber" required="true" type="any" />
			
		<cfset variables.MedicareNumber = arguments.MedicareNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MedicareNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MedicaidNumber.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMedicaidNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.MedicaidNumber>
	</cffunction>
	
	<cffunction name="setMedicaidNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MedicaidNumber" required="true" type="any" />
			
		<cfset variables.MedicaidNumber = arguments.MedicaidNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MedicaidNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for GroupName.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getGroupName" acess="public" output="false" returntype="any">
		<cfreturn variables.GroupName>
	</cffunction>
	
	<cffunction name="setGroupName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="GroupName" required="true" type="any" />
			
		<cfset variables.GroupName = arguments.GroupName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "GroupName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SpecialInstructions.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSpecialInstructions" acess="public" output="false" returntype="any">
		<cfreturn variables.SpecialInstructions>
	</cffunction>
	
	<cffunction name="setSpecialInstructions" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SpecialInstructions" required="true" type="any" />
			
		<cfset variables.SpecialInstructions = arguments.SpecialInstructions />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SpecialInstructions") />		
		
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


