 	


<cfcomponent name="entityksBean" output="false" alias="entityksBean" extends="EntityKSDAO">

	<cfproperty name="EntityKSID" type="numeric" default="0" />
	<cfproperty name="ColM" type="string" default="" />
	<cfproperty name="ColE" type="string" default="" />
	<cfproperty name="ColL" type="string" default="" />
	<cfproperty name="ColI" type="string" default="" />
	<cfproperty name="ColA" type="string" default="" />
	<cfproperty name="ColC" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.EntityKSID = 0;
		variables.ColM = "";
		variables.ColE = "";
		variables.ColL = "";
		variables.ColI = "";
		variables.ColA = "";
		variables.ColC = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="entityksBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "EntityKSID") AND stValues.EntityKSID NEQ 0>
				<cfquery name="qGetEntityKS" datasource="#trim(arguments.ds)#">
			  		SELECT EntityKSID,ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode,DateCreated,DateModified
					FROM EntityKS  
					WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.EntityKSID#" /> 
				</cfquery>		
				<cfif qGetEntityKS.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ColM = qGetEntityKS.ColM;
					variables.ColE = qGetEntityKS.ColE;
					variables.ColL = qGetEntityKS.ColL;
					variables.ColI = qGetEntityKS.ColI;
					variables.ColA = qGetEntityKS.ColA;
					variables.ColC = qGetEntityKS.ColC;
					variables.Active = qGetEntityKS.Active;
					variables.InactiveCode = qGetEntityKS.InactiveCode;
					variables.DateModified = qGetEntityKS.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "EntityKSID")><cfset variables.EntityKSID = stValues.EntityKSID /></cfif>
			<cfif StructKeyExists(stValues, "ColM")><cfset variables.ColM = stValues.ColM /></cfif>
			<cfif StructKeyExists(stValues, "ColE")><cfset variables.ColE = stValues.ColE /></cfif>
			<cfif StructKeyExists(stValues, "ColL")><cfset variables.ColL = stValues.ColL /></cfif>
			<cfif StructKeyExists(stValues, "ColI")><cfset variables.ColI = stValues.ColI /></cfif>
			<cfif StructKeyExists(stValues, "ColA")><cfset variables.ColA = stValues.ColA /></cfif>
			<cfif StructKeyExists(stValues, "ColC")><cfset variables.ColC = stValues.ColC /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityKSID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityKSID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityKSID>
	</cffunction>
	
	<cffunction name="setEntityKSID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityKSID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityKSID)) OR trim(arguments.EntityKSID) EQ "">
			<cfset variables.EntityKSID = arguments.EntityKSID />
		<cfelse>
			<cfthrow message="EntityKSID (#arguments.EntityKSID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityKSID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColM.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColM" acess="public" output="false" returntype="any">
		<cfreturn variables.ColM>
	</cffunction>
	
	<cffunction name="setColM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColM" required="true" type="any" />
			
		<cfset variables.ColM = arguments.ColM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColE.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColE" acess="public" output="false" returntype="any">
		<cfreturn variables.ColE>
	</cffunction>
	
	<cffunction name="setColE" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColE" required="true" type="any" />
			
		<cfset variables.ColE = arguments.ColE />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColE") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColL.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColL" acess="public" output="false" returntype="any">
		<cfreturn variables.ColL>
	</cffunction>
	
	<cffunction name="setColL" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColL" required="true" type="any" />
			
		<cfset variables.ColL = arguments.ColL />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColL") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColI.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColI" acess="public" output="false" returntype="any">
		<cfreturn variables.ColI>
	</cffunction>
	
	<cffunction name="setColI" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColI" required="true" type="any" />
			
		<cfset variables.ColI = arguments.ColI />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColI") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColA.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColA" acess="public" output="false" returntype="any">
		<cfreturn variables.ColA>
	</cffunction>
	
	<cffunction name="setColA" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColA" required="true" type="any" />
			
		<cfset variables.ColA = arguments.ColA />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColA") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColC.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColC" acess="public" output="false" returntype="any">
		<cfreturn variables.ColC>
	</cffunction>
	
	<cffunction name="setColC" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColC" required="true" type="any" />
			
		<cfset variables.ColC = arguments.ColC />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColC") />		
		
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


