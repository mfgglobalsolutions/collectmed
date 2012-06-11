 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeAssignmentBean" />
		
		<cfset var qCreateIntakeAssignment = "" />		
		
		<cfset var localIntakeID = arguments.bean.getIntakeID() />
		<cfset var localUserID = arguments.bean.getUserID() />
		<cfset var localAssignorID = arguments.bean.getAssignorID() />
		<cfset var localNote = arguments.bean.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateIntakeAssignment" datasource="#trim(arguments.ds)#">
				INSERT INTO intakeassignment (IntakeID,UserID,AssignorID,Note)
				VALUES (						
						<cfqueryparam value="#trim(localIntakeID)#" cfsqltype="CF_SQL_INTEGER" />,						
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
				SELECT LAST_INSERT_ID() AS INTAKE_AssignmentID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setINTAKE_AssignmentID(qCreateIntakeAssignment.INTAKE_AssignmentID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IntakeAssignmentBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="INTAKE_AssignmentID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAssignment = "" />		
		
		<cfset qGetIntakeAssignment = getIntakeAssignment(trim(arguments.ds), trim(IntakeAssignmentID)) />
				
		<cfif qGetIntakeAssignment.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objIntakeAssignment = createObject("component", "IntakeAssignmentBean").init(arguments.ds);
			objIntakeAssignment.setINTAKE_AssignmentID(qGetIntakeAssignment.INTAKE_AssignmentID);
			objIntakeAssignment.setIntakeID(qGetIntakeAssignment.IntakeID);
			objIntakeAssignment.setUserID(qGetIntakeAssignment.UserID);
			objIntakeAssignment.setDateCreated(qGetIntakeAssignment.DateCreated);
			objIntakeAssignment.setAssignorID(qGetIntakeAssignment.AssignorID);
			objIntakeAssignment.setNote(qGetIntakeAssignment.Note);				
			return objIntakeAssignment;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeAssignmentBean" />
		<cfset var qUpdateIntakeAssignment = "" />
		<cfset var localIntakeID = arguments.bean.getIntakeID() />
		<cfset var localUserID = arguments.bean.getUserID() />
		<cfset var localAssignorID = arguments.bean.getAssignorID() />
		<cfset var localNote = arguments.bean.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateIntakeAssignment" datasource="#trim(arguments.ds)#">
				UPDATE intakeassignment  SET
					
					IntakeID =						
						<cfqueryparam value="#trim(localIntakeID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE INTAKE_AssignmentID = <cfqueryparam value="#trim(arguments.bean.getINTAKE_AssignmentID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeAssignmentBean" />
		<cfset var qDeleteIntakeAssignment = "">

		<cfquery name="qDeleteIntakeAssignment" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM intakeassignment
			WHERE INTAKE_AssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getINTAKE_AssignmentID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeAssignment" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="IntakeAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAssignment = "" />		
	
		<cfquery name="qGetIntakeAssignment" datasource="#trim(arguments.ds)#">
	  		SELECT INTAKE_AssignmentID,IntakeID,UserID,DateCreated,AssignorID,Note
			FROM intakeassignment  
			WHERE INTAKE_AssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.INTAKE_AssignmentID)#" /> 
		</cfquery>
		
		<cfreturn qGetIntakeAssignment>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





