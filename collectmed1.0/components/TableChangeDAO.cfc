 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TableChangeBean" />
		
		<cfset var qCreateTableChange = "" />		
		
		<cfset var localDatasource = arguments.bean.getDatasource() />
		<cfset var localTablename = arguments.bean.getTablename() />
		<cfset var localColumnName = arguments.bean.getColumnName() />
		<cfset var localChangeScript = arguments.bean.getChangeScript() />
		<cfset var localError = arguments.bean.getError() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateTableChange" datasource="#trim(arguments.ds)#">
				INSERT INTO tablechange (Datasource,Tablename,ColumnName,ChangeScript,Error,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localDatasource)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localTablename)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localColumnName)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localChangeScript)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localError) NEQ "" AND trim(localError) NEQ "@@" AND trim(localError) NEQ "NULL">						
						<cfqueryparam value="#trim(localError)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS ChangeID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setChangeID(qCreateTableChange.ChangeID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="TableChangeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ChangeID" required="yes" type="numeric" />		
		<cfset var qGetTableChange = "" />		
		
		<cfset qGetTableChange = getTableChange(trim(arguments.ds), trim(TableChangeID)) />
				
		<cfif qGetTableChange.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objTableChange = createObject("component", "TableChangeBean").init(arguments.ds);
			objTableChange.setChangeID(qGetTableChange.ChangeID);
			objTableChange.setDatasource(qGetTableChange.Datasource);
			objTableChange.setTablename(qGetTableChange.Tablename);
			objTableChange.setColumnName(qGetTableChange.ColumnName);
			objTableChange.setChangeScript(qGetTableChange.ChangeScript);
			objTableChange.setError(qGetTableChange.Error);
			objTableChange.setActive(qGetTableChange.Active);
			objTableChange.setInactiveCode(qGetTableChange.InactiveCode);
			objTableChange.setDateCreated(qGetTableChange.DateCreated);
			objTableChange.setDateModified(qGetTableChange.DateModified);				
			return objTableChange;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TableChangeBean" />
		<cfset var qUpdateTableChange = "" />
		<cfset var localDatasource = arguments.bean.getDatasource() />
		<cfset var localTablename = arguments.bean.getTablename() />
		<cfset var localColumnName = arguments.bean.getColumnName() />
		<cfset var localChangeScript = arguments.bean.getChangeScript() />
		<cfset var localError = arguments.bean.getError() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateTableChange" datasource="#trim(arguments.ds)#">
				UPDATE tablechange  SET
					
					Datasource =						
						<cfqueryparam value="#trim(localDatasource)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Tablename =						
						<cfqueryparam value="#trim(localTablename)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ColumnName =						
						<cfqueryparam value="#trim(localColumnName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ChangeScript =						
						<cfqueryparam value="#trim(localChangeScript)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Error =	
					<cfif trim(localError) NEQ "" AND trim(localError) NEQ "@@" AND trim(localError) NEQ "NULL">						
						<cfqueryparam value="#trim(localError)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE ChangeID = <cfqueryparam value="#trim(arguments.bean.getChangeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="TableChangeBean" />
		<cfset var qDeleteTableChange = "">

		<cfquery name="qDeleteTableChange" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM tablechange
			WHERE ChangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getChangeID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTableChange" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="TableChangeID" required="yes" type="numeric" />		
		<cfset var qGetTableChange = "" />		
	
		<cfquery name="qGetTableChange" datasource="#trim(arguments.ds)#">
	  		SELECT ChangeID,Datasource,Tablename,ColumnName,ChangeScript,Error,Active,InactiveCode,DateCreated,DateModified
			FROM tablechange  
			WHERE ChangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ChangeID)#" /> 
		</cfquery>
		
		<cfreturn qGetTableChange>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





