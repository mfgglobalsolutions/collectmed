 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureEOBcodeBean" />
		
		<cfset var qCreateProcedureEOBcode = "" />		
		
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localEOBCode = arguments.bean.getEOBCode() />
		<cfset var localStatus = arguments.bean.getStatus() />
		<cfset var localClosingUserID = arguments.bean.getClosingUserID() />
		<cfset var localCloseDate = arguments.bean.getCloseDate() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedureEOBcode" datasource="#trim(arguments.ds)#">
				INSERT INTO procedureeobcode (ProcedureID,EOBCode,Status,ClosingUserID,CloseDate)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localEOBCode)#" cfsqltype="CF_SQL_INTEGER" />,	
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
				SELECT LAST_INSERT_ID() AS ClaimEOBCodeID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClaimEOBCodeID(qCreateProcedureEOBcode.ClaimEOBCodeID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ProcedureEOBcodeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimEOBCodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOBcode = "" />		
		
		<cfset qGetProcedureEOBcode = getProcedureEOBcode(trim(arguments.ds), trim(ProcedureEOBcodeID)) />
				
		<cfif qGetProcedureEOBcode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedureEOBcode = createObject("component", "ProcedureEOBcodeBean").init(arguments.ds);
			objProcedureEOBcode.setClaimEOBCodeID(qGetProcedureEOBcode.ClaimEOBCodeID);
			objProcedureEOBcode.setProcedureID(qGetProcedureEOBcode.ProcedureID);
			objProcedureEOBcode.setEOBCode(qGetProcedureEOBcode.EOBCode);
			objProcedureEOBcode.setStatus(qGetProcedureEOBcode.Status);
			objProcedureEOBcode.setClosingUserID(qGetProcedureEOBcode.ClosingUserID);
			objProcedureEOBcode.setCloseDate(qGetProcedureEOBcode.CloseDate);				
			return objProcedureEOBcode;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureEOBcodeBean" />
		<cfset var qUpdateProcedureEOBcode = "" />
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localEOBCode = arguments.bean.getEOBCode() />
		<cfset var localStatus = arguments.bean.getStatus() />
		<cfset var localClosingUserID = arguments.bean.getClosingUserID() />
		<cfset var localCloseDate = arguments.bean.getCloseDate() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedureEOBcode" datasource="#trim(arguments.ds)#">
				UPDATE procedureeobcode  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					EOBCode =						
						<cfqueryparam value="#trim(localEOBCode)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE ClaimEOBCodeID = <cfqueryparam value="#trim(arguments.bean.getClaimEOBCodeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ProcedureEOBcodeBean" />
		<cfset var qDeleteProcedureEOBcode = "">

		<cfquery name="qDeleteProcedureEOBcode" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM procedureeobcode
			WHERE ClaimEOBCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaimEOBCodeID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureEOBcode" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ProcedureEOBcodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOBcode = "" />		
	
		<cfquery name="qGetProcedureEOBcode" datasource="#trim(arguments.ds)#">
	  		SELECT ClaimEOBCodeID,ProcedureID,EOBCode,Status,ClosingUserID,CloseDate
			FROM procedureeobcode  
			WHERE ClaimEOBCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimEOBCodeID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedureEOBcode>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





