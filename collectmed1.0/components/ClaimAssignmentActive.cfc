 	


<cfcomponent name="claimassignmentActive" output="false" alias="claimassignmentActive">

	<cfproperty name="ClaimAssignmentID" type="numeric" default="0" />
	<cfproperty name="ClaimID" type="numeric" default="" />
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
		variables.ClaimAssignmentID = 0;
		variables.ClaimID = "";
		variables.UserID = "";
		variables.DateCreated = "";
		variables.AssignorID = "";
		variables.Note = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="claimassignmentActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClaimAssignmentID") AND stValues.ClaimAssignmentID NEQ 0>
				<cfquery name="qGetClaimAssignment" datasource="#trim(variables.ds)#">
			  		SELECT ClaimAssignmentID,ClaimID,UserID,DateCreated,AssignorID,Note
					FROM claimassignment  
					WHERE ClaimAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClaimAssignmentID#" /> 
				</cfquery>		
				<cfif qGetClaimAssignment.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClaimID = qGetClaimAssignment.ClaimID;
					variables.UserID = qGetClaimAssignment.UserID;
					variables.AssignorID = qGetClaimAssignment.AssignorID;
					variables.Note = qGetClaimAssignment.Note;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClaimAssignmentID")><cfset variables.ClaimAssignmentID = stValues.ClaimAssignmentID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimID")><cfset variables.ClaimID = stValues.ClaimID /></cfif>
			<cfif StructKeyExists(stValues, "UserID")><cfset variables.UserID = stValues.UserID /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "AssignorID")><cfset variables.AssignorID = stValues.AssignorID /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimAssignmentID.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimAssignmentID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimAssignmentID>
	</cffunction>
	
	<cffunction name="setClaimAssignmentID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimAssignmentID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimAssignmentID)) OR trim(arguments.ClaimAssignmentID) EQ "">
			<cfset variables.ClaimAssignmentID = arguments.ClaimAssignmentID />
		<cfelse>
			<cfthrow message="ClaimAssignmentID (#arguments.ClaimAssignmentID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimAssignmentID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimID>
	</cffunction>
	
	<cffunction name="setClaimID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimID)) OR trim(arguments.ClaimID) EQ "">
			<cfset variables.ClaimID = arguments.ClaimID />
		<cfelse>
			<cfthrow message="ClaimID (#arguments.ClaimID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimID") />		
		
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
				 		
		<cfif this.getClaimAssignmentID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getClaimAssignmentID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAssignment" output="false" access="public" returntype="query">
				
		<cfargument name="ClaimAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetClaimAssignment = "" />		
	
		<cfquery name="qGetClaimAssignment" datasource="#trim(variables.ds)#">
	  		SELECT ClaimAssignmentID,ClaimID,UserID,DateCreated,AssignorID,Note
			FROM claimassignment  
			WHERE ClaimAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimAssignmentID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaimAssignment>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ClaimAssignmentActive" />
		
		<cfset var qCreateClaimAssignment = "" />		
		
		<cfset var localClaimID = arguments.obj.getClaimID() />
		<cfset var localUserID = arguments.obj.getUserID() />
		<cfset var localAssignorID = arguments.obj.getAssignorID() />
		<cfset var localNote = arguments.obj.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaimAssignment" datasource="#trim(variables.ds)#">
				INSERT INTO claimassignment (ClaimID,UserID,AssignorID,Note)
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
			read(qCreateClaimAssignment.ClaimAssignmentID);
			arguments.obj.setClaimAssignmentID(qCreateClaimAssignment.ClaimAssignmentID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ClaimAssignmentActive">
				
		<cfargument name="ClaimAssignmentID" required="yes" type="numeric" />		
		<cfset var qGetClaimAssignment = "" />		
		
		<cfset qGetClaimAssignment = getClaimAssignment(trim(ClaimAssignmentID)) />
				
		<cfif qGetClaimAssignment.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setClaimAssignmentID(qGetClaimAssignment.ClaimAssignmentID);
			this.setClaimID(qGetClaimAssignment.ClaimID);
			this.setUserID(qGetClaimAssignment.UserID);
			this.setDateCreated(qGetClaimAssignment.DateCreated);
			this.setAssignorID(qGetClaimAssignment.AssignorID);
			this.setNote(qGetClaimAssignment.Note);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ClaimAssignmentActive" />
		<cfset var qUpdateClaimAssignment = "" />
		<cfset var localClaimID = arguments.obj.getClaimID() />
		<cfset var localUserID = arguments.obj.getUserID() />
		<cfset var localAssignorID = arguments.obj.getAssignorID() />
		<cfset var localNote = arguments.obj.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaimAssignment" datasource="#trim(variables.ds)#">
				UPDATE claimassignment  SET
					
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
				WHERE ClaimAssignmentID = <cfqueryparam value="#trim(arguments.obj.getClaimAssignmentID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="ClaimAssignmentActive" />
		<cfset var qDeleteClaimAssignment = "">

		<cfquery name="qDeleteClaimAssignment" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM claimassignment
			WHERE ClaimAssignmentID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getClaimAssignmentID())#" /> 
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


