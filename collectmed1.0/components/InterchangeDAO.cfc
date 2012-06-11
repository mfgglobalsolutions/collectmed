 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="InterchangeBean" />
		
		<cfset var qCreateInterchange = "" />		
		
		<cfset var localFileID = arguments.bean.getFileID() />
		<cfset var localInterchangeFileID = arguments.bean.getInterchangeFileID() />
		<cfset var localInterchangeDate = arguments.bean.getInterchangeDate() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localInterchangeClientName = arguments.bean.getInterchangeClientName() />
		<cfset var localInterchangeClientAddressLine1 = arguments.bean.getInterchangeClientAddressLine1() />
		<cfset var localInterchangeClientAddressLine2 = arguments.bean.getInterchangeClientAddressLine2() />
		<cfset var localInterchangeClientCity = arguments.bean.getInterchangeClientCity() />
		<cfset var localInterchangeClientState = arguments.bean.getInterchangeClientState() />
		<cfset var localInterchangeClientZipcode = arguments.bean.getInterchangeClientZipcode() />
		<cfset var localLXAssignedNumber = arguments.bean.getLXAssignedNumber() />
		<cfset var localReassociationTraceNumber = arguments.bean.getReassociationTraceNumber() />
		<cfset var localInterchangeSenderIDQualifier = arguments.bean.getInterchangeSenderIDQualifier() />
		<cfset var localInterchangeSenderID = arguments.bean.getInterchangeSenderID() />
		<cfset var localInterchangeReceiverIDQualifier = arguments.bean.getInterchangeReceiverIDQualifier() />
		<cfset var localInterchangeReceiverID = arguments.bean.getInterchangeReceiverID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateInterchange" datasource="#trim(arguments.ds)#">
				INSERT INTO interchange (FileID,InterchangeFileID,InterchangeDate,ClientID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localFileID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localInterchangeFileID)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localInterchangeDate)#" cfsqltype="CF_SQL_TIMESTAMP" />,						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localInterchangeClientName) NEQ "" AND trim(localInterchangeClientName) NEQ "@@" AND trim(localInterchangeClientName) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeClientAddressLine1) NEQ "" AND trim(localInterchangeClientAddressLine1) NEQ "@@" AND trim(localInterchangeClientAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeClientAddressLine2) NEQ "" AND trim(localInterchangeClientAddressLine2) NEQ "@@" AND trim(localInterchangeClientAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeClientCity) NEQ "" AND trim(localInterchangeClientCity) NEQ "@@" AND trim(localInterchangeClientCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientCity)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeClientState) NEQ "" AND trim(localInterchangeClientState) NEQ "@@" AND trim(localInterchangeClientState) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientState)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeClientZipcode) NEQ "" AND trim(localInterchangeClientZipcode) NEQ "@@" AND trim(localInterchangeClientZipcode) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientZipcode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLXAssignedNumber) NEQ "" AND trim(localLXAssignedNumber) NEQ "@@" AND trim(localLXAssignedNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localLXAssignedNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localReassociationTraceNumber) NEQ "" AND trim(localReassociationTraceNumber) NEQ "@@" AND trim(localReassociationTraceNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localReassociationTraceNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeSenderIDQualifier) NEQ "" AND trim(localInterchangeSenderIDQualifier) NEQ "@@" AND trim(localInterchangeSenderIDQualifier) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeSenderIDQualifier)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeSenderID) NEQ "" AND trim(localInterchangeSenderID) NEQ "@@" AND trim(localInterchangeSenderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeSenderID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeReceiverIDQualifier) NEQ "" AND trim(localInterchangeReceiverIDQualifier) NEQ "@@" AND trim(localInterchangeReceiverIDQualifier) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeReceiverIDQualifier)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInterchangeReceiverID) NEQ "" AND trim(localInterchangeReceiverID) NEQ "@@" AND trim(localInterchangeReceiverID) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeReceiverID)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS InterchangeID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setInterchangeID(qCreateInterchange.InterchangeID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="InterchangeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="InterchangeID" required="yes" type="numeric" />		
		<cfset var qGetInterchange = "" />		
		
		<cfset qGetInterchange = getInterchange(trim(arguments.ds), trim(InterchangeID)) />
				
		<cfif qGetInterchange.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objInterchange = createObject("component", "InterchangeBean").init(arguments.ds);
			objInterchange.setInterchangeID(qGetInterchange.InterchangeID);
			objInterchange.setFileID(qGetInterchange.FileID);
			objInterchange.setInterchangeFileID(qGetInterchange.InterchangeFileID);
			objInterchange.setInterchangeDate(qGetInterchange.InterchangeDate);
			objInterchange.setClientID(qGetInterchange.ClientID);
			objInterchange.setInterchangeClientName(qGetInterchange.InterchangeClientName);
			objInterchange.setInterchangeClientAddressLine1(qGetInterchange.InterchangeClientAddressLine1);
			objInterchange.setInterchangeClientAddressLine2(qGetInterchange.InterchangeClientAddressLine2);
			objInterchange.setInterchangeClientCity(qGetInterchange.InterchangeClientCity);
			objInterchange.setInterchangeClientState(qGetInterchange.InterchangeClientState);
			objInterchange.setInterchangeClientZipcode(qGetInterchange.InterchangeClientZipcode);
			objInterchange.setLXAssignedNumber(qGetInterchange.LXAssignedNumber);
			objInterchange.setReassociationTraceNumber(qGetInterchange.ReassociationTraceNumber);
			objInterchange.setInterchangeSenderIDQualifier(qGetInterchange.InterchangeSenderIDQualifier);
			objInterchange.setInterchangeSenderID(qGetInterchange.InterchangeSenderID);
			objInterchange.setInterchangeReceiverIDQualifier(qGetInterchange.InterchangeReceiverIDQualifier);
			objInterchange.setInterchangeReceiverID(qGetInterchange.InterchangeReceiverID);
			objInterchange.setActive(qGetInterchange.Active);
			objInterchange.setInactiveCode(qGetInterchange.InactiveCode);
			objInterchange.setDateCreated(qGetInterchange.DateCreated);				
			return objInterchange;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="InterchangeBean" />
		<cfset var qUpdateInterchange = "" />
		<cfset var localFileID = arguments.bean.getFileID() />
		<cfset var localInterchangeFileID = arguments.bean.getInterchangeFileID() />
		<cfset var localInterchangeDate = arguments.bean.getInterchangeDate() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localInterchangeClientName = arguments.bean.getInterchangeClientName() />
		<cfset var localInterchangeClientAddressLine1 = arguments.bean.getInterchangeClientAddressLine1() />
		<cfset var localInterchangeClientAddressLine2 = arguments.bean.getInterchangeClientAddressLine2() />
		<cfset var localInterchangeClientCity = arguments.bean.getInterchangeClientCity() />
		<cfset var localInterchangeClientState = arguments.bean.getInterchangeClientState() />
		<cfset var localInterchangeClientZipcode = arguments.bean.getInterchangeClientZipcode() />
		<cfset var localLXAssignedNumber = arguments.bean.getLXAssignedNumber() />
		<cfset var localReassociationTraceNumber = arguments.bean.getReassociationTraceNumber() />
		<cfset var localInterchangeSenderIDQualifier = arguments.bean.getInterchangeSenderIDQualifier() />
		<cfset var localInterchangeSenderID = arguments.bean.getInterchangeSenderID() />
		<cfset var localInterchangeReceiverIDQualifier = arguments.bean.getInterchangeReceiverIDQualifier() />
		<cfset var localInterchangeReceiverID = arguments.bean.getInterchangeReceiverID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateInterchange" datasource="#trim(arguments.ds)#">
				UPDATE interchange  SET
					
					FileID =						
						<cfqueryparam value="#trim(localFileID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					InterchangeFileID =						
						<cfqueryparam value="#trim(localInterchangeFileID)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InterchangeDate =						
						<cfqueryparam value="#trim(localInterchangeDate)#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					InterchangeClientName =	
					<cfif trim(localInterchangeClientName) NEQ "" AND trim(localInterchangeClientName) NEQ "@@" AND trim(localInterchangeClientName) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeClientAddressLine1 =	
					<cfif trim(localInterchangeClientAddressLine1) NEQ "" AND trim(localInterchangeClientAddressLine1) NEQ "@@" AND trim(localInterchangeClientAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeClientAddressLine2 =	
					<cfif trim(localInterchangeClientAddressLine2) NEQ "" AND trim(localInterchangeClientAddressLine2) NEQ "@@" AND trim(localInterchangeClientAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeClientCity =	
					<cfif trim(localInterchangeClientCity) NEQ "" AND trim(localInterchangeClientCity) NEQ "@@" AND trim(localInterchangeClientCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientCity)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeClientState =	
					<cfif trim(localInterchangeClientState) NEQ "" AND trim(localInterchangeClientState) NEQ "@@" AND trim(localInterchangeClientState) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientState)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeClientZipcode =	
					<cfif trim(localInterchangeClientZipcode) NEQ "" AND trim(localInterchangeClientZipcode) NEQ "@@" AND trim(localInterchangeClientZipcode) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeClientZipcode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LXAssignedNumber =	
					<cfif trim(localLXAssignedNumber) NEQ "" AND trim(localLXAssignedNumber) NEQ "@@" AND trim(localLXAssignedNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localLXAssignedNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ReassociationTraceNumber =	
					<cfif trim(localReassociationTraceNumber) NEQ "" AND trim(localReassociationTraceNumber) NEQ "@@" AND trim(localReassociationTraceNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localReassociationTraceNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeSenderIDQualifier =	
					<cfif trim(localInterchangeSenderIDQualifier) NEQ "" AND trim(localInterchangeSenderIDQualifier) NEQ "@@" AND trim(localInterchangeSenderIDQualifier) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeSenderIDQualifier)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeSenderID =	
					<cfif trim(localInterchangeSenderID) NEQ "" AND trim(localInterchangeSenderID) NEQ "@@" AND trim(localInterchangeSenderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeSenderID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeReceiverIDQualifier =	
					<cfif trim(localInterchangeReceiverIDQualifier) NEQ "" AND trim(localInterchangeReceiverIDQualifier) NEQ "@@" AND trim(localInterchangeReceiverIDQualifier) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeReceiverIDQualifier)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InterchangeReceiverID =	
					<cfif trim(localInterchangeReceiverID) NEQ "" AND trim(localInterchangeReceiverID) NEQ "@@" AND trim(localInterchangeReceiverID) NEQ "NULL">						
						<cfqueryparam value="#trim(localInterchangeReceiverID)#" cfsqltype="CF_SQL_VARCHAR" />	
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
					</cfif>					
				WHERE InterchangeID = <cfqueryparam value="#trim(arguments.bean.getInterchangeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="InterchangeBean" />
		<cfset var qDeleteInterchange = "">

		<cfquery name="qDeleteInterchange" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM interchange
			WHERE InterchangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getInterchangeID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInterchange" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="InterchangeID" required="yes" type="numeric" />		
		<cfset var qGetInterchange = "" />		
	
		<cfquery name="qGetInterchange" datasource="#trim(arguments.ds)#">
	  		SELECT InterchangeID,FileID,InterchangeFileID,InterchangeDate,ClientID,InterchangeClientName,InterchangeClientAddressLine1,InterchangeClientAddressLine2,InterchangeClientCity,InterchangeClientState,InterchangeClientZipcode,LXAssignedNumber,ReassociationTraceNumber,InterchangeSenderIDQualifier,InterchangeSenderID,InterchangeReceiverIDQualifier,InterchangeReceiverID,Active,InactiveCode,DateCreated
			FROM interchange  
			WHERE InterchangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.InterchangeID)#" /> 
		</cfquery>
		
		<cfreturn qGetInterchange>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





