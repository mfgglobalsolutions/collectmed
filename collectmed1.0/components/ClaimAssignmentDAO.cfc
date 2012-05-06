 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimAssignmentBean" />
		
		<cfset var qCreateClaimAssignment = "" />		
		
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localUserID = arguments.bean.getUserID() />
		<cfset var localAssignorID = arguments.bean.getAssignorID() />
		<cfset var localNote = arguments.bean.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaimAssignment" datasource="#trim(arguments.ds)#">
				INSERT INTO ClaimAssignment (ClaimID,UserID,AssignorID,Note)
				VALUES (						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localUserID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localAssignorID))>						
						<cfqueryparam value="#trim(localAssignorID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ClaimAssignmentID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setClaimAssignmentID(qCreateClaimAssignment.ClaimAssignmentID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ClaimAssignmentBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetClaimAssignment = "" />		
		
		<cfset qGetClaimAssignment = getClaimAssignment(trim(arguments.ds), trim(ClaimAssignmentID)) />
				
		<cfif qGetClaimAssignment.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClaimAssignment = createObject("component", "ClaimAssignmentBean").init(arguments.ds);
			objClaimAssignment.setClaimAssignmentID(qGetClaimAssignment.ClaimAssignmentID);
			objClaimAssignment.setClaimID(qGetClaimAssignment.ClaimID);
			objClaimAssignment.setUserID(qGetClaimAssignment.UserID);
			objClaimAssignment.setDateCreated(qGetClaimAssignment.DateCreated);
			objClaimAssignment.setAssignorID(qGetClaimAssignment.AssignorID);
			objClaimAssignment.setNote(qGetClaimAssignment.Note);				
			return objClaimAssignment;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimAssignmentBean" />
		<cfset var qUpdateClaimAssignment = "" />
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localUserID = arguments.bean.getUserID() />
		<cfset var localAssignorID = arguments.bean.getAssignorID() />
		<cfset var localNote = arguments.bean.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaimAssignment" datasource="#trim(arguments.ds)#">
				UPDATE ClaimAssignment  SET
					
					ClaimID =						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					UserID =						
						<cfqueryparam value="#trim(localUserID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					AssignorID =				
					<cfif IsNumeric(trim(localAssignorID))>						
						<cfqueryparam value="#trim(localAssignorID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Note =	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>					
				WHERE ClaimAssignmentID = <cfqueryparam value="#trim(arguments.bean.getClaimAssignmentID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimAssignmentBean" />
		<cfset var qDeleteClaimAssignment = "">

		<cfquery name="qDeleteClaimAssignment" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM ClaimAssignment
			WHERE ClaimAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaimAssignmentID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAssignment" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetClaimAssignment = "" />		
	
		<cfquery name="qGetClaimAssignment" datasource="#trim(arguments.ds)#">
	  		SELECT ClaimAssignmentID,ClaimID,UserID,DateCreated,AssignorID,Note
			FROM ClaimAssignment  
			WHERE ClaimAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimAssignmentID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaimAssignment>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


