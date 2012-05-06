 	


<cfcomponent name="randomwordBean" output="false" alias="randomwordBean" extends="RandomWordDAO">

	<cfproperty name="RandomWordID" type="numeric" default="0" />
	<cfproperty name="Word" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.RandomWordID = 0;
		variables.Word = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="randomwordBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RandomWordID") AND stValues.RandomWordID NEQ 0>
				<cfquery name="qGetRandomWord" datasource="#trim(arguments.ds)#">
			  		SELECT RandomWordID,Word,Active,InactiveCode,DateCreated,DateModified
					FROM RandomWord  
					WHERE RandomWordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RandomWordID#" /> 
				</cfquery>		
				<cfif qGetRandomWord.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.Word = qGetRandomWord.Word;
					variables.Active = qGetRandomWord.Active;
					variables.InactiveCode = qGetRandomWord.InactiveCode;
					variables.DateModified = qGetRandomWord.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RandomWordID")><cfset variables.RandomWordID = stValues.RandomWordID /></cfif>
			<cfif StructKeyExists(stValues, "Word")><cfset variables.Word = stValues.Word /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RandomWordID.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRandomWordID" acess="public" output="false" returntype="any">
		<cfreturn variables.RandomWordID>
	</cffunction>
	
	<cffunction name="setRandomWordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RandomWordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RandomWordID)) OR trim(arguments.RandomWordID) EQ "">
			<cfset variables.RandomWordID = arguments.RandomWordID />
		<cfelse>
			<cfthrow message="RandomWordID (#arguments.RandomWordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RandomWordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Word.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getWord" acess="public" output="false" returntype="any">
		<cfreturn variables.Word>
	</cffunction>
	
	<cffunction name="setWord" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Word" required="true" type="any" />
			
		<cfset variables.Word = arguments.Word />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Word") />		
		
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

		<!-------------------------------------------------------------------------------------->
	<!--- This function will crete the new Client database                               --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getRandomWord" output="false" returntype="string">		
			
		<cfargument name="randRange" required="yes" type="string">	
															
		<cftry>		
							
			<cfquery name="getWord" datasource="PA_Master">
				SELECT word 
				FROM randomword  
				WHERE randomwordid = #trim(arguments.randRange)#
			</cfquery>		
			
			<cfreturn getWord.word>
			
			<cfcatch type="Any">
							
				<cfthrow message="Caught an exception, type = #CFCATCH.TYPE# message = #cfcatch.message# detail = #cfcatch.detail#"> 
				
			</cfcatch>
						
		</cftry>
		
	</cffunction>
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


