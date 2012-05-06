 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="RandomWordBean" />
		
		<cfset var qCreateRandomWord = "" />		
		
		<cfset var localWord = arguments.bean.getWord() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateRandomWord" datasource="#trim(arguments.ds)#">
				INSERT INTO RandomWord (Word,Active,InactiveCode)
				VALUES (	
					<cfif trim(localWord) NEQ "" AND trim(localWord) NEQ "@@" AND trim(localWord) NEQ "NULL">						
						<cfqueryparam value="#trim(localWord)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
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
			arguments.bean.setRandomWordID(qCreateRandomWord.RandomWordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="RandomWordBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RandomWordID" required="yes" type="numeric" />		
		<cfset var qGetRandomWord = "" />		
		
		<cfset qGetRandomWord = getRandomWord(trim(arguments.ds), trim(RandomWordID)) />
				
		<cfif qGetRandomWord.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objRandomWord = createObject("component", "RandomWordBean").init(arguments.ds);
			objRandomWord.setRandomWordID(qGetRandomWord.RandomWordID);
			objRandomWord.setWord(qGetRandomWord.Word);
			objRandomWord.setActive(qGetRandomWord.Active);
			objRandomWord.setInactiveCode(qGetRandomWord.InactiveCode);
			objRandomWord.setDateCreated(qGetRandomWord.DateCreated);
			objRandomWord.setDateModified(qGetRandomWord.DateModified);				
			return objRandomWord;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="RandomWordBean" />
		<cfset var qUpdateRandomWord = "" />
		<cfset var localWord = arguments.bean.getWord() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateRandomWord" datasource="#trim(arguments.ds)#">
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
				WHERE RandomWordID = <cfqueryparam value="#trim(arguments.bean.getRandomWordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="RandomWordBean" />
		<cfset var qDeleteRandomWord = "">

		<cfquery name="qDeleteRandomWord" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM RandomWord
			WHERE RandomWordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRandomWordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRandomWord" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RandomWordID" required="yes" type="numeric" />		
		<cfset var qGetRandomWord = "" />		
	
		<cfquery name="qGetRandomWord" datasource="#trim(arguments.ds)#">
	  		SELECT RandomWordID,Word,Active,InactiveCode,DateCreated,DateModified
			FROM RandomWord  
			WHERE RandomWordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RandomWordID)#" /> 
		</cfquery>
		
		<cfreturn qGetRandomWord>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


