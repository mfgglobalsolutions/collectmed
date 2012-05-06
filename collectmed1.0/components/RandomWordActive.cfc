 	


<cfcomponent name="randomwordActive" output="false" alias="randomwordActive">

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
		variables.ds = "";
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
	<cffunction name="init" output="false" returntype="randomwordActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RandomWordID") AND stValues.RandomWordID NEQ 0>
				<cfquery name="qGetRandomWord" datasource="#trim(variables.ds)#">
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
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getRandomWordID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getRandomWordID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRandomWord" output="false" access="public" returntype="query">
				
		<cfargument name="RandomWordID" required="yes" type="numeric" />		
		<cfset var qGetRandomWord = "" />		
	
		<cfquery name="qGetRandomWord" datasource="#trim(variables.ds)#">
	  		SELECT RandomWordID,Word,Active,InactiveCode,DateCreated,DateModified
			FROM RandomWord  
			WHERE RandomWordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RandomWordID)#" /> 
		</cfquery>
		
		<cfreturn qGetRandomWord>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="RandomWordActive" />
		
		<cfset var qCreateRandomWord = "" />		
		
		<cfset var localWord = arguments.obj.getWord() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateRandomWord" datasource="#trim(variables.ds)#">
				INSERT INTO RandomWord (Word,InactiveCode)
				VALUES (	
					<cfif trim(localWord) NEQ "" AND trim(localWord) NEQ "@@" AND trim(localWord) NEQ "NULL">						
						<cfqueryparam value="#trim(localWord)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS RandomWordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateRandomWord.RandomWordID);
			arguments.obj.setRandomWordID(qCreateRandomWord.RandomWordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="RandomWordActive">
				
		<cfargument name="RandomWordID" required="yes" type="numeric" />		
		<cfset var qGetRandomWord = "" />		
		
		<cfset qGetRandomWord = getRandomWord(trim(RandomWordID)) />
				
		<cfif qGetRandomWord.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setRandomWordID(qGetRandomWord.RandomWordID);
			this.setWord(qGetRandomWord.Word);
			this.setActive(qGetRandomWord.Active);
			this.setInactiveCode(qGetRandomWord.InactiveCode);
			this.setDateCreated(qGetRandomWord.DateCreated);
			this.setDateModified(qGetRandomWord.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="RandomWordActive" />
		<cfset var qUpdateRandomWord = "" />
		<cfset var localWord = arguments.obj.getWord() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateRandomWord" datasource="#trim(variables.ds)#">
				UPDATE RandomWord  SET
					
					Word =	
					<cfif trim(localWord) NEQ "" AND trim(localWord) NEQ "@@" AND trim(localWord) NEQ "NULL">						
						<cfqueryparam value="#trim(localWord)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE RandomWordID = <cfqueryparam value="#trim(arguments.obj.getRandomWordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="RandomWordActive" />
		<cfset var qDeleteRandomWord = "">

		<cfquery name="qDeleteRandomWord" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM RandomWord
			WHERE RandomWordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getRandomWordID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!---<!-------------------------------------------------------------------------------------->
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
		
	</cffunction>--->
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


