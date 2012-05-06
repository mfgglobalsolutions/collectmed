 	


<cfcomponent name="procedureeopscodeActive" output="false" alias="procedureeopscodeActive">

	<cfproperty name="ClaimEOPSCodeID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="EOPSCode" type="numeric" default="" />
	<cfproperty name="Status" type="string" default="" />
	<cfproperty name="ClosingUserID" type="numeric" default="" />
	<cfproperty name="CloseDate" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.ClaimEOPSCodeID = 0;
		variables.ProcedureID = "";
		variables.EOPSCode = "";
		variables.Status = "";
		variables.ClosingUserID = "";
		variables.CloseDate = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedureeopscodeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClaimEOPSCodeID") AND stValues.ClaimEOPSCodeID NEQ 0>
				<cfquery name="qGetProcedureEOPScode" datasource="#trim(variables.ds)#">
			  		SELECT ClaimEOPSCodeID,ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate
					FROM ProcedureEOPScode  
					WHERE ClaimEOPSCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClaimEOPSCodeID#" /> 
				</cfquery>		
				<cfif qGetProcedureEOPScode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedureEOPScode.ProcedureID;
					variables.EOPSCode = qGetProcedureEOPScode.EOPSCode;
					variables.Status = qGetProcedureEOPScode.Status;
					variables.ClosingUserID = qGetProcedureEOPScode.ClosingUserID;
					variables.CloseDate = qGetProcedureEOPScode.CloseDate;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClaimEOPSCodeID")><cfset variables.ClaimEOPSCodeID = stValues.ClaimEOPSCodeID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "EOPSCode")><cfset variables.EOPSCode = stValues.EOPSCode /></cfif>
			<cfif StructKeyExists(stValues, "Status")><cfset variables.Status = stValues.Status /></cfif>
			<cfif StructKeyExists(stValues, "ClosingUserID")><cfset variables.ClosingUserID = stValues.ClosingUserID /></cfif>
			<cfif StructKeyExists(stValues, "CloseDate")><cfset variables.CloseDate = stValues.CloseDate /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimEOPSCodeID.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimEOPSCodeID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimEOPSCodeID>
	</cffunction>
	
	<cffunction name="setClaimEOPSCodeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimEOPSCodeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimEOPSCodeID)) OR trim(arguments.ClaimEOPSCodeID) EQ "">
			<cfset variables.ClaimEOPSCodeID = arguments.ClaimEOPSCodeID />
		<cfelse>
			<cfthrow message="ClaimEOPSCodeID (#arguments.ClaimEOPSCodeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimEOPSCodeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProcedureID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedureID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProcedureID>
	</cffunction>
	
	<cffunction name="setProcedureID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProcedureID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ProcedureID)) OR trim(arguments.ProcedureID) EQ "">
			<cfset variables.ProcedureID = arguments.ProcedureID />
		<cfelse>
			<cfthrow message="ProcedureID (#arguments.ProcedureID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProcedureID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EOPSCode.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEOPSCode" acess="public" output="false" returntype="any">
		<cfreturn variables.EOPSCode>
	</cffunction>
	
	<cffunction name="setEOPSCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EOPSCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EOPSCode)) OR trim(arguments.EOPSCode) EQ "">
			<cfset variables.EOPSCode = arguments.EOPSCode />
		<cfelse>
			<cfthrow message="EOPSCode (#arguments.EOPSCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EOPSCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Status.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStatus" acess="public" output="false" returntype="any">
		<cfreturn variables.Status>
	</cffunction>
	
	<cffunction name="setStatus" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Status" required="true" type="any" />
			
		<cfset variables.Status = arguments.Status />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Status") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClosingUserID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClosingUserID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClosingUserID>
	</cffunction>
	
	<cffunction name="setClosingUserID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClosingUserID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClosingUserID)) OR trim(arguments.ClosingUserID) EQ "">
			<cfset variables.ClosingUserID = arguments.ClosingUserID />
		<cfelse>
			<cfthrow message="ClosingUserID (#arguments.ClosingUserID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClosingUserID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CloseDate.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCloseDate" acess="public" output="false" returntype="any">
		<cfreturn variables.CloseDate>
	</cffunction>
	
	<cffunction name="setCloseDate" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CloseDate" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.CloseDate)) OR trim(arguments.CloseDate) EQ "">
			<cfset variables.CloseDate = arguments.CloseDate />
		<cfelse>
			<cfthrow message="CloseDate (#arguments.CloseDate#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CloseDate") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getClaimEOPSCodeID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getClaimEOPSCodeID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureEOPScode" output="false" access="public" returntype="query">
				
		<cfargument name="ClaimEOPSCodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOPScode = "" />		
	
		<cfquery name="qGetProcedureEOPScode" datasource="#trim(variables.ds)#">
	  		SELECT ClaimEOPSCodeID,ProcedureID,EOPSCode,Status,ClosingUserID,CloseDate
			FROM ProcedureEOPScode  
			WHERE ClaimEOPSCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimEOPSCodeID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedureEOPScode>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ProcedureEOPScodeActive" />
		
		<cfset var qCreateProcedureEOPScode = "" />		
		
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localEOPSCode = arguments.obj.getEOPSCode() />
		<cfset var localStatus = arguments.obj.getStatus() />
		<cfset var localClosingUserID = arguments.obj.getClosingUserID() />
		<cfset var localCloseDate = arguments.obj.getCloseDate() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedureEOPScode" datasource="#trim(variables.ds)#">
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
			read(qCreateProcedureEOPScode.ClaimEOPSCodeID);
			arguments.obj.setClaimEOPSCodeID(qCreateProcedureEOPScode.ClaimEOPSCodeID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ProcedureEOPScodeActive">
				
		<cfargument name="ClaimEOPSCodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOPScode = "" />		
		
		<cfset qGetProcedureEOPScode = getProcedureEOPScode(trim(ClaimEOPSCodeID)) />
				
		<cfif qGetProcedureEOPScode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setClaimEOPSCodeID(qGetProcedureEOPScode.ClaimEOPSCodeID);
			this.setProcedureID(qGetProcedureEOPScode.ProcedureID);
			this.setEOPSCode(qGetProcedureEOPScode.EOPSCode);
			this.setStatus(qGetProcedureEOPScode.Status);
			this.setClosingUserID(qGetProcedureEOPScode.ClosingUserID);
			this.setCloseDate(qGetProcedureEOPScode.CloseDate);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ProcedureEOPScodeActive" />
		<cfset var qUpdateProcedureEOPScode = "" />
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localEOPSCode = arguments.obj.getEOPSCode() />
		<cfset var localStatus = arguments.obj.getStatus() />
		<cfset var localClosingUserID = arguments.obj.getClosingUserID() />
		<cfset var localCloseDate = arguments.obj.getCloseDate() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedureEOPScode" datasource="#trim(variables.ds)#">
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
				WHERE ClaimEOPSCodeID = <cfqueryparam value="#trim(arguments.obj.getClaimEOPSCodeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="ProcedureEOPScodeActive" />
		<cfset var qDeleteProcedureEOPScode = "">

		<cfquery name="qDeleteProcedureEOPScode" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM ProcedureEOPScode
			WHERE ClaimEOPSCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getClaimEOPSCodeID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


