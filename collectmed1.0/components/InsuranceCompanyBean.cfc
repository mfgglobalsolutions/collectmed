 	


<cfcomponent name="insurancecompanyBean" output="false" alias="insurancecompanyBean" extends="InsuranceCompanyDAO">

	<cfproperty name="InsuranceCompanyID" type="numeric" default="0" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="OCNANumber" type="string" default="" />
	<cfproperty name="InsuranceCompanyName" type="string" default="" />
	<cfproperty name="InsuranceCompanyDBA" type="string" default="" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="InsuranceCompanyURL" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.InsuranceCompanyID = 0;
		variables.ClientID = "";
		variables.OCNANumber = "";
		variables.InsuranceCompanyName = "";
		variables.InsuranceCompanyDBA = "";
		variables.EntityID = "";
		variables.InsuranceCompanyURL = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="insurancecompanyBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "InsuranceCompanyID") AND stValues.InsuranceCompanyID NEQ 0>
				<cfquery name="qGetInsuranceCompany" datasource="#trim(arguments.ds)#">
			  		SELECT InsuranceCompanyID,ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,Active,InactiveCode,DateCreated,DateModified
					FROM insurancecompany  
					WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.InsuranceCompanyID#" /> 
				</cfquery>		
				<cfif qGetInsuranceCompany.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClientID = qGetInsuranceCompany.ClientID;
					variables.OCNANumber = qGetInsuranceCompany.OCNANumber;
					variables.InsuranceCompanyName = qGetInsuranceCompany.InsuranceCompanyName;
					variables.InsuranceCompanyDBA = qGetInsuranceCompany.InsuranceCompanyDBA;
					variables.EntityID = qGetInsuranceCompany.EntityID;
					variables.InsuranceCompanyURL = qGetInsuranceCompany.InsuranceCompanyURL;
					variables.Active = qGetInsuranceCompany.Active;
					variables.InactiveCode = qGetInsuranceCompany.InactiveCode;
					variables.DateModified = qGetInsuranceCompany.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyID")><cfset variables.InsuranceCompanyID = stValues.InsuranceCompanyID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "OCNANumber")><cfset variables.OCNANumber = stValues.OCNANumber /></cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyName")><cfset variables.InsuranceCompanyName = stValues.InsuranceCompanyName /></cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyDBA")><cfset variables.InsuranceCompanyDBA = stValues.InsuranceCompanyDBA /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyURL")><cfset variables.InsuranceCompanyURL = stValues.InsuranceCompanyURL /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InsuranceCompanyID.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyID" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyID>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InsuranceCompanyID)) OR trim(arguments.InsuranceCompanyID) EQ "">
			<cfset variables.InsuranceCompanyID = arguments.InsuranceCompanyID />
		<cfelse>
			<cfthrow message="InsuranceCompanyID (#arguments.InsuranceCompanyID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OCNANumber.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOCNANumber" acess="public" output="false" returntype="any">
		<cfreturn variables.OCNANumber>
	</cffunction>
	
	<cffunction name="setOCNANumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OCNANumber" required="true" type="any" />
			
		<cfset variables.OCNANumber = arguments.OCNANumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OCNANumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InsuranceCompanyName.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyName" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyName>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyName" required="true" type="any" />
			
		<cfset variables.InsuranceCompanyName = arguments.InsuranceCompanyName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InsuranceCompanyDBA.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyDBA" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyDBA>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyDBA" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyDBA" required="true" type="any" />
			
		<cfset variables.InsuranceCompanyDBA = arguments.InsuranceCompanyDBA />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyDBA") />		
		
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
	<!--- GET and SET methods for InsuranceCompanyURL.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyURL" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyURL>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyURL" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyURL" required="true" type="any" />
			
		<cfset variables.InsuranceCompanyURL = arguments.InsuranceCompanyURL />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyURL") />		
		
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



