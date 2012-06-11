 	


<cfcomponent name="procedureeobcodeActive" output="false" alias="procedureeobcodeActive">

	<cfproperty name="ClaimEOBCodeID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="EOBCode" type="numeric" default="" />
	<cfproperty name="Status" type="string" default="" />
	<cfproperty name="ClosingUserID" type="numeric" default="" />
	<cfproperty name="CloseDate" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.ClaimEOBCodeID = 0;
		variables.ProcedureID = "";
		variables.EOBCode = "";
		variables.Status = "";
		variables.ClosingUserID = "";
		variables.CloseDate = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedureeobcodeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClaimEOBCodeID") AND stValues.ClaimEOBCodeID NEQ 0>
				<cfquery name="qGetProcedureEOBcode" datasource="#trim(variables.ds)#">
			  		SELECT ClaimEOBCodeID,ProcedureID,EOBCode,Status,ClosingUserID,CloseDate
					FROM procedureeobcode  
					WHERE ClaimEOBCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClaimEOBCodeID#" /> 
				</cfquery>		
				<cfif qGetProcedureEOBcode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedureEOBcode.ProcedureID;
					variables.EOBCode = qGetProcedureEOBcode.EOBCode;
					variables.Status = qGetProcedureEOBcode.Status;
					variables.ClosingUserID = qGetProcedureEOBcode.ClosingUserID;
					variables.CloseDate = qGetProcedureEOBcode.CloseDate;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClaimEOBCodeID")><cfset variables.ClaimEOBCodeID = stValues.ClaimEOBCodeID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "EOBCode")><cfset variables.EOBCode = stValues.EOBCode /></cfif>
			<cfif StructKeyExists(stValues, "Status")><cfset variables.Status = stValues.Status /></cfif>
			<cfif StructKeyExists(stValues, "ClosingUserID")><cfset variables.ClosingUserID = stValues.ClosingUserID /></cfif>
			<cfif StructKeyExists(stValues, "CloseDate")><cfset variables.CloseDate = stValues.CloseDate /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimEOBCodeID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimEOBCodeID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimEOBCodeID>
	</cffunction>
	
	<cffunction name="setClaimEOBCodeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimEOBCodeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimEOBCodeID)) OR trim(arguments.ClaimEOBCodeID) EQ "">
			<cfset variables.ClaimEOBCodeID = arguments.ClaimEOBCodeID />
		<cfelse>
			<cfthrow message="ClaimEOBCodeID (#arguments.ClaimEOBCodeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimEOBCodeID") />		
		
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
	<!--- GET and SET methods for EOBCode.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEOBCode" acess="public" output="false" returntype="any">
		<cfreturn variables.EOBCode>
	</cffunction>
	
	<cffunction name="setEOBCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EOBCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EOBCode)) OR trim(arguments.EOBCode) EQ "">
			<cfset variables.EOBCode = arguments.EOBCode />
		<cfelse>
			<cfthrow message="EOBCode (#arguments.EOBCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EOBCode") />		
		
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
				 		
		<cfif this.getClaimEOBCodeID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getClaimEOBCodeID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureEOBcode" output="false" access="public" returntype="query">
				
		<cfargument name="ClaimEOBCodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOBcode = "" />		
	
		<cfquery name="qGetProcedureEOBcode" datasource="#trim(variables.ds)#">
	  		SELECT ClaimEOBCodeID,ProcedureID,EOBCode,Status,ClosingUserID,CloseDate
			FROM procedureeobcode  
			WHERE ClaimEOBCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimEOBCodeID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedureEOBcode>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ProcedureEOBcodeActive" />
		
		<cfset var qCreateProcedureEOBcode = "" />		
		
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localEOBCode = arguments.obj.getEOBCode() />
		<cfset var localStatus = arguments.obj.getStatus() />
		<cfset var localClosingUserID = arguments.obj.getClosingUserID() />
		<cfset var localCloseDate = arguments.obj.getCloseDate() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedureEOBcode" datasource="#trim(variables.ds)#">
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
			read(qCreateProcedureEOBcode.ClaimEOBCodeID);
			arguments.obj.setClaimEOBCodeID(qCreateProcedureEOBcode.ClaimEOBCodeID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ProcedureEOBcodeActive">
				
		<cfargument name="ClaimEOBCodeID" required="yes" type="numeric" />		
		<cfset var qGetProcedureEOBcode = "" />		
		
		<cfset qGetProcedureEOBcode = getProcedureEOBcode(trim(ClaimEOBCodeID)) />
				
		<cfif qGetProcedureEOBcode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setClaimEOBCodeID(qGetProcedureEOBcode.ClaimEOBCodeID);
			this.setProcedureID(qGetProcedureEOBcode.ProcedureID);
			this.setEOBCode(qGetProcedureEOBcode.EOBCode);
			this.setStatus(qGetProcedureEOBcode.Status);
			this.setClosingUserID(qGetProcedureEOBcode.ClosingUserID);
			this.setCloseDate(qGetProcedureEOBcode.CloseDate);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ProcedureEOBcodeActive" />
		<cfset var qUpdateProcedureEOBcode = "" />
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localEOBCode = arguments.obj.getEOBCode() />
		<cfset var localStatus = arguments.obj.getStatus() />
		<cfset var localClosingUserID = arguments.obj.getClosingUserID() />
		<cfset var localCloseDate = arguments.obj.getCloseDate() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedureEOBcode" datasource="#trim(variables.ds)#">
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
				WHERE ClaimEOBCodeID = <cfqueryparam value="#trim(arguments.obj.getClaimEOBCodeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="ProcedureEOBcodeActive" />
		<cfset var qDeleteProcedureEOBcode = "">

		<cfquery name="qDeleteProcedureEOBcode" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM procedureeobcode
			WHERE ClaimEOBCodeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getClaimEOBCodeID())#" /> 
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





