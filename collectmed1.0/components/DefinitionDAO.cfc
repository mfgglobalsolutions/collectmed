 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DefinitionBean" />
		
		<cfset var qCreateDefinition = "" />		
		
		<cfset var localTitle = arguments.bean.getTitle() />
		<cfset var localDefinition = arguments.bean.getDefinition() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateDefinition" datasource="#trim(arguments.ds)#">
				INSERT INTO Definition (Title,Definition,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localTitle)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localDefinition) NEQ "" AND trim(localDefinition) NEQ "@@" AND trim(localDefinition) NEQ "NULL">						
						<cfqueryparam value="#trim(localDefinition)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS DefinitionID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setDefinitionID(qCreateDefinition.DefinitionID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="DefinitionBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="DefinitionID" required="yes" type="numeric" />		
		<cfset var qGetDefinition = "" />		
		
		<cfset qGetDefinition = getDefinition(trim(arguments.ds), trim(DefinitionID)) />
				
		<cfif qGetDefinition.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objDefinition = createObject("component", "DefinitionBean").init(arguments.ds);
			objDefinition.setDefinitionID(qGetDefinition.DefinitionID);
			objDefinition.setTitle(qGetDefinition.Title);
			objDefinition.setDefinition(qGetDefinition.Definition);
			objDefinition.setActive(qGetDefinition.Active);
			objDefinition.setInactiveCode(qGetDefinition.InactiveCode);
			objDefinition.setDateCreated(qGetDefinition.DateCreated);
			objDefinition.setDateModified(qGetDefinition.DateModified);				
			return objDefinition;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DefinitionBean" />
		<cfset var qUpdateDefinition = "" />
		<cfset var localTitle = arguments.bean.getTitle() />
		<cfset var localDefinition = arguments.bean.getDefinition() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateDefinition" datasource="#trim(arguments.ds)#">
				UPDATE Definition  SET
					
					Title =						
						<cfqueryparam value="#trim(localTitle)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Definition =	
					<cfif trim(localDefinition) NEQ "" AND trim(localDefinition) NEQ "@@" AND trim(localDefinition) NEQ "NULL">						
						<cfqueryparam value="#trim(localDefinition)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE DefinitionID = <cfqueryparam value="#trim(arguments.bean.getDefinitionID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DefinitionBean" />
		<cfset var qDeleteDefinition = "">

		<cfquery name="qDeleteDefinition" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Definition
			WHERE DefinitionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getDefinitionID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDefinition" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="DefinitionID" required="yes" type="numeric" />		
		<cfset var qGetDefinition = "" />		
	
		<cfquery name="qGetDefinition" datasource="#trim(arguments.ds)#">
	  		SELECT DefinitionID,Title,Definition,Active,InactiveCode,DateCreated,DateModified
			FROM Definition  
			WHERE DefinitionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.DefinitionID)#" /> 
		</cfquery>
		
		<cfreturn qGetDefinition>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


