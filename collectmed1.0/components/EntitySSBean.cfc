 	


<cfcomponent name="entityssBean" output="false" alias="entityssBean" extends="EntitySSDAO">

	<cfproperty name="EntitySSID" type="numeric" default="0" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="ColM" type="string" default="" />
	<cfproperty name="ColE" type="string" default="" />
	<cfproperty name="ColR" type="string" default="" />
	<cfproperty name="IsDefault" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.EntitySSID = 0;
		variables.EntityID = "";
		variables.ColM = "";
		variables.ColE = "";
		variables.ColR = "";
		variables.IsDefault = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="entityssBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "EntitySSID") AND stValues.EntitySSID NEQ 0>
				<cfquery name="qGetEntitySS" datasource="#trim(arguments.ds)#">
			  		SELECT EntitySSID,EntityID,ColM,ColE,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified
					FROM EntitySS  
					WHERE EntitySSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.EntitySSID#" /> 
				</cfquery>		
				<cfif qGetEntitySS.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.EntityID = qGetEntitySS.EntityID;
					variables.ColM = qGetEntitySS.ColM;
					variables.ColE = qGetEntitySS.ColE;
					variables.ColR = qGetEntitySS.ColR;
					variables.IsDefault = qGetEntitySS.IsDefault;
					variables.Active = qGetEntitySS.Active;
					variables.InactiveCode = qGetEntitySS.InactiveCode;
					variables.DateModified = qGetEntitySS.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "EntitySSID")><cfset variables.EntitySSID = stValues.EntitySSID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "ColM")><cfset variables.ColM = stValues.ColM /></cfif>
			<cfif StructKeyExists(stValues, "ColE")><cfset variables.ColE = stValues.ColE /></cfif>
			<cfif StructKeyExists(stValues, "ColR")><cfset variables.ColR = stValues.ColR /></cfif>
			<cfif StructKeyExists(stValues, "IsDefault")><cfset variables.IsDefault = stValues.IsDefault /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntitySSID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntitySSID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntitySSID>
	</cffunction>
	
	<cffunction name="setEntitySSID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntitySSID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntitySSID)) OR trim(arguments.EntitySSID) EQ "">
			<cfset variables.EntitySSID = arguments.EntitySSID />
		<cfelse>
			<cfthrow message="EntitySSID (#arguments.EntitySSID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntitySSID") />		
		
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
	<!--- GET and SET methods for ColR.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColR" acess="public" output="false" returntype="any">
		<cfreturn variables.ColR>
	</cffunction>
	
	<cffunction name="setColR" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColR" required="true" type="any" />
			
		<cfset variables.ColR = arguments.ColR />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColR") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IsDefault.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIsDefault" acess="public" output="false" returntype="any">
		<cfreturn variables.IsDefault>
	</cffunction>
	
	<cffunction name="setIsDefault" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IsDefault" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.IsDefault)) OR trim(arguments.IsDefault) EQ "">
			<cfset variables.IsDefault = arguments.IsDefault />
		<cfelse>
			<cfthrow message="IsDefault (#arguments.IsDefault#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IsDefault") />		
		
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


