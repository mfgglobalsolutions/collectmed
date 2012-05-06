 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureEOPScodeBean" />
		
		<cfset var qCreateProcedureEOPScode = "" />		
		
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localEOPSCode = arguments.bean.getEOPSCode() />
		<cfset var localStatus = arguments.bean.getStatus() />
		<cfset var localClosingUserID = arguments.bean.getClosingUserID() />
		<cfset var localCloseDate = arguments.bean.getCloseDate() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedureEOPScode" datasource="#trim(arguments.ds)#">
				INSERT INTO ProcedureEOPScode (ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localEOPSCode)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localStatus) NEQ "" AND trim(localStatus) NEQ "@@" AND trim(localStatus) NEQ "NULL">						
						<cfqueryparam value="#trim(localStatus)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localClosingUserID))>						
						<cfqueryparam value="#trim(localClosingUserID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif IsDate(trim(localCloseDate))>						
						<cfqueryparam value="#trim(localCloseDate)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ClaimEOPSCodeID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClaimEOPSCodeID(qCreateProcedureEOPScode.ClaimEOPSCodeID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ProcedureEOPScodeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimEOPSCodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOPScode = "" />		
		
		<cfset qGetProcedureEOPScode = getProcedureEOPScode(trim(arguments.ds), trim(ProcedureEOPScodeID)) />
				
		<cfif qGetProcedureEOPScode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedureEOPScode = createObject("component", "ProcedureEOPScodeBean").init(arguments.ds);
			objProcedureEOPScode.setClaimEOPSCodeID(qGetProcedureEOPScode.ClaimEOPSCodeID);
			objProcedureEOPScode.setProcedureID(qGetProcedureEOPScode.ProcedureID);
			objProcedureEOPScode.setEOPSCode(qGetProcedureEOPScode.EOPSCode);
			objProcedureEOPScode.setStatus(qGetProcedureEOPScode.Status);
			objProcedureEOPScode.setClosingUserID(qGetProcedureEOPScode.ClosingUserID);
			objProcedureEOPScode.setCloseDate(qGetProcedureEOPScode.CloseDate);				
			return objProcedureEOPScode;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureEOPScodeBean" />
		<cfset var qUpdateProcedureEOPScode = "" />
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localEOPSCode = arguments.bean.getEOPSCode() />
		<cfset var localStatus = arguments.bean.getStatus() />
		<cfset var localClosingUserID = arguments.bean.getClosingUserID() />
		<cfset var localCloseDate = arguments.bean.getCloseDate() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedureEOPScode" datasource="#trim(arguments.ds)#">
				UPDATE ProcedureEOPScode  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					EOPSCode =						
						<cfqueryparam value="#trim(localEOPSCode)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Status =	
					<cfif trim(localStatus) NEQ "" AND trim(localStatus) NEQ "@@" AND trim(localStatus) NEQ "NULL">						
						<cfqueryparam value="#trim(localStatus)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClosingUserID =				
					<cfif IsNumeric(trim(localClosingUserID))>						
						<cfqueryparam value="#trim(localClosingUserID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					CloseDate =	
					<cfif IsDate(trim(localCloseDate))>						
						<cfqueryparam value="#trim(localCloseDate)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE ClaimEOPSCodeID = <cfqueryparam value="#trim(arguments.bean.getClaimEOPSCodeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureEOPScodeBean" />
		<cfset var qDeleteProcedureEOPScode = "">

		<cfquery name="qDeleteProcedureEOPScode" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM ProcedureEOPScode
			WHERE ClaimEOPSCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaimEOPSCodeID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureEOPScode" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ProcedureEOPScodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOPScode = "" />		
	
		<cfquery name="qGetProcedureEOPScode" datasource="#trim(arguments.ds)#">
	  		SELECT ClaimEOPSCodeID,ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate
			FROM ProcedureEOPScode  
			WHERE ClaimEOPSCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimEOPSCodeID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedureEOPScode>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


