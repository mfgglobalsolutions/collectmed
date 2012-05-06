 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="LogBean" />
		
		<cfset var qCreateLog = "" />		
		
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localIPaddress = arguments.bean.getIPaddress() />
		<cfset var localLogText = arguments.bean.getLogText() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateLog" datasource="#trim(arguments.ds)#">
				INSERT INTO Log (Code,IPaddress,LogText,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localCode))>						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localIPaddress) NEQ "" AND trim(localIPaddress) NEQ "@@" AND trim(localIPaddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPaddress)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLogText) NEQ "" AND trim(localLogText) NEQ "@@" AND trim(localLogText) NEQ "NULL">						
						<cfqueryparam value="#trim(localLogText)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS LogID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setLogID(qCreateLog.LogID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="LogBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="LogID" required="yes" type="numeric" />		
		<cfset var qGetLog = "" />		
		
		<cfset qGetLog = getLog(trim(arguments.ds), trim(LogID)) />
				
		<cfif qGetLog.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objLog = createObject("component", "LogBean").init(arguments.ds);
			objLog.setLogID(qGetLog.LogID);
			objLog.setCode(qGetLog.Code);
			objLog.setIPaddress(qGetLog.IPaddress);
			objLog.setLogText(qGetLog.LogText);
			objLog.setActive(qGetLog.Active);
			objLog.setInactiveCode(qGetLog.InactiveCode);
			objLog.setDateCreated(qGetLog.DateCreated);
			objLog.setDateModified(qGetLog.DateModified);				
			return objLog;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="LogBean" />
		<cfset var qUpdateLog = "" />
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localIPaddress = arguments.bean.getIPaddress() />
		<cfset var localLogText = arguments.bean.getLogText() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateLog" datasource="#trim(arguments.ds)#">
				UPDATE Log  SET
					
					Code =				
					<cfif IsNumeric(trim(localCode))>						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					IPaddress =	
					<cfif trim(localIPaddress) NEQ "" AND trim(localIPaddress) NEQ "@@" AND trim(localIPaddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPaddress)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LogText =	
					<cfif trim(localLogText) NEQ "" AND trim(localLogText) NEQ "@@" AND trim(localLogText) NEQ "NULL">						
						<cfqueryparam value="#trim(localLogText)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE LogID = <cfqueryparam value="#trim(arguments.bean.getLogID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="LogBean" />
		<cfset var qDeleteLog = "">

		<cfquery name="qDeleteLog" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Log
			WHERE LogID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getLogID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLog" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="LogID" required="yes" type="numeric" />		
		<cfset var qGetLog = "" />		
	
		<cfquery name="qGetLog" datasource="#trim(arguments.ds)#">
	  		SELECT LogID,Code,IPaddress,LogText,Active,InactiveCode,DateCreated,DateModified
			FROM Log  
			WHERE LogID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.LogID)#" /> 
		</cfquery>
		
		<cfreturn qGetLog>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


