 	


<cfcomponent name="intakeassignmentActive" output="false" alias="intakeassignmentActive">

	<cfproperty name="INTAKE_AssignmentID" type="numeric" default="0" />
	<cfproperty name="IntakeID" type="numeric" default="" />
	<cfproperty name="UserID" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="AssignorID" type="numeric" default="" />
	<cfproperty name="Note" type="string" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.INTAKE_AssignmentID = 0;
		variables.IntakeID = "";
		variables.UserID = "";
		variables.DateCreated = "";
		variables.AssignorID = "";
		variables.Note = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="intakeassignmentActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "INTAKE_AssignmentID") AND stValues.INTAKE_AssignmentID NEQ 0>
				<cfquery name="qGetIntakeAssignment" datasource="#trim(variables.ds)#">
			  		SELECT INTAKE_AssignmentID,IntakeID,UserID,DateCreated,AssignorID,Note
					FROM IntakeAssignment  
					WHERE INTAKE_AssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.INTAKE_AssignmentID#" /> 
				</cfquery>		
				<cfif qGetIntakeAssignment.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.IntakeID = qGetIntakeAssignment.IntakeID;
					variables.UserID = qGetIntakeAssignment.UserID;
					variables.AssignorID = qGetIntakeAssignment.AssignorID;
					variables.Note = qGetIntakeAssignment.Note;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "INTAKE_AssignmentID")><cfset variables.INTAKE_AssignmentID = stValues.INTAKE_AssignmentID /></cfif>
			<cfif StructKeyExists(stValues, "IntakeID")><cfset variables.IntakeID = stValues.IntakeID /></cfif>
			<cfif StructKeyExists(stValues, "UserID")><cfset variables.UserID = stValues.UserID /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "AssignorID")><cfset variables.AssignorID = stValues.AssignorID /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for INTAKE_AssignmentID.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getINTAKE_AssignmentID" acess="public" output="false" returntype="any">
		<cfreturn variables.INTAKE_AssignmentID>
	</cffunction>
	
	<cffunction name="setINTAKE_AssignmentID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="INTAKE_AssignmentID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.INTAKE_AssignmentID)) OR trim(arguments.INTAKE_AssignmentID) EQ "">
			<cfset variables.INTAKE_AssignmentID = arguments.INTAKE_AssignmentID />
		<cfelse>
			<cfthrow message="INTAKE_AssignmentID (#arguments.INTAKE_AssignmentID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "INTAKE_AssignmentID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IntakeID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIntakeID" acess="public" output="false" returntype="any">
		<cfreturn variables.IntakeID>
	</cffunction>
	
	<cffunction name="setIntakeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IntakeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.IntakeID)) OR trim(arguments.IntakeID) EQ "">
			<cfset variables.IntakeID = arguments.IntakeID />
		<cfelse>
			<cfthrow message="IntakeID (#arguments.IntakeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IntakeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UserID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUserID" acess="public" output="false" returntype="any">
		<cfreturn variables.UserID>
	</cffunction>
	
	<cffunction name="setUserID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UserID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UserID)) OR trim(arguments.UserID) EQ "">
			<cfset variables.UserID = arguments.UserID />
		<cfelse>
			<cfthrow message="UserID (#arguments.UserID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UserID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AssignorID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAssignorID" acess="public" output="false" returntype="any">
		<cfreturn variables.AssignorID>
	</cffunction>
	
	<cffunction name="setAssignorID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AssignorID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AssignorID)) OR trim(arguments.AssignorID) EQ "">
			<cfset variables.AssignorID = arguments.AssignorID />
		<cfelse>
			<cfthrow message="AssignorID (#arguments.AssignorID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AssignorID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Note.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getNote" acess="public" output="false" returntype="any">
		<cfreturn variables.Note>
	</cffunction>
	
	<cffunction name="setNote" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Note" required="true" type="any" />
			
		<cfset variables.Note = arguments.Note />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Note") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getINTAKE_AssignmentID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getINTAKE_AssignmentID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeAssignment" output="false" access="public" returntype="query">
				
		<cfargument name="INTAKE_AssignmentID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAssignment = "" />		
	
		<cfquery name="qGetIntakeAssignment" datasource="#trim(variables.ds)#">
	  		SELECT INTAKE_AssignmentID,IntakeID,UserID,DateCreated,AssignorID,Note
			FROM IntakeAssignment  
			WHERE INTAKE_AssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.INTAKE_AssignmentID)#" /> 
		</cfquery>
		
		<cfreturn qGetIntakeAssignment>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="IntakeAssignmentActive" />
		
		<cfset var qCreateIntakeAssignment = "" />		
		
		<cfset var localIntakeID = arguments.obj.getIntakeID() />
		<cfset var localUserID = arguments.obj.getUserID() />
		<cfset var localAssignorID = arguments.obj.getAssignorID() />
		<cfset var localNote = arguments.obj.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateIntakeAssignment" datasource="#trim(variables.ds)#">
				INSERT INTO IntakeAssignment (IntakeID,UserID,AssignorID,Note)
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
			read(qCreateIntakeAssignment.INTAKE_AssignmentID);
			arguments.obj.setINTAKE_AssignmentID(qCreateIntakeAssignment.INTAKE_AssignmentID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IntakeAssignmentActive">
				
		<cfargument name="INTAKE_AssignmentID" required="yes" type="numeric" />		
		<cfset var qGetIntakeAssignment = "" />		
		
		<cfset qGetIntakeAssignment = getIntakeAssignment(trim(INTAKE_AssignmentID)) />
				
		<cfif qGetIntakeAssignment.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setINTAKE_AssignmentID(qGetIntakeAssignment.INTAKE_AssignmentID);
			this.setIntakeID(qGetIntakeAssignment.IntakeID);
			this.setUserID(qGetIntakeAssignment.UserID);
			this.setDateCreated(qGetIntakeAssignment.DateCreated);
			this.setAssignorID(qGetIntakeAssignment.AssignorID);
			this.setNote(qGetIntakeAssignment.Note);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="IntakeAssignmentActive" />
		<cfset var qUpdateIntakeAssignment = "" />
		<cfset var localIntakeID = arguments.obj.getIntakeID() />
		<cfset var localUserID = arguments.obj.getUserID() />
		<cfset var localAssignorID = arguments.obj.getAssignorID() />
		<cfset var localNote = arguments.obj.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateIntakeAssignment" datasource="#trim(variables.ds)#">
				UPDATE IntakeAssignment  SET
					
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
				WHERE INTAKE_AssignmentID = <cfqueryparam value="#trim(arguments.obj.getINTAKE_AssignmentID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="IntakeAssignmentActive" />
		<cfset var qDeleteIntakeAssignment = "">

		<cfquery name="qDeleteIntakeAssignment" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM IntakeAssignment
			WHERE INTAKE_AssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getINTAKE_AssignmentID())#" /> 
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


