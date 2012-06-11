 	


<cfcomponent name="claimstatusActive" output="false" alias="claimstatusActive">

	<cfproperty name="ClaimStatusID" type="numeric" default="0" />
	<cfproperty name="ClaimID" type="numeric" default="" />
	<cfproperty name="StatusID" type="numeric" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="Note" type="string" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.ClaimStatusID = 0;
		variables.ClaimID = "";
		variables.StatusID = "";
		variables.UsersID = "";
		variables.DateCreated = "";
		variables.Note = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="claimstatusActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ClaimStatusID") AND stValues.ClaimStatusID NEQ 0>
				<cfquery name="qGetClaimStatus" datasource="#trim(variables.ds)#">
			  		SELECT ClaimStatusID,ClaimID,StatusID,UsersID,DateCreated,Note
					FROM claimstatus  
					WHERE ClaimStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ClaimStatusID#" /> 
				</cfquery>		
				<cfif qGetClaimStatus.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClaimID = qGetClaimStatus.ClaimID;
					variables.StatusID = qGetClaimStatus.StatusID;
					variables.UsersID = qGetClaimStatus.UsersID;
					variables.Note = qGetClaimStatus.Note;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ClaimStatusID")><cfset variables.ClaimStatusID = stValues.ClaimStatusID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimID")><cfset variables.ClaimID = stValues.ClaimID /></cfif>
			<cfif StructKeyExists(stValues, "StatusID")><cfset variables.StatusID = stValues.StatusID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimStatusID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimStatusID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimStatusID>
	</cffunction>
	
	<cffunction name="setClaimStatusID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimStatusID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClaimStatusID)) OR trim(arguments.ClaimStatusID) EQ "">
			<cfset variables.ClaimStatusID = arguments.ClaimStatusID />
		<cfelse>
			<cfthrow message="ClaimStatusID (#arguments.ClaimStatusID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimStatusID") />		
		
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
	<!--- GET and SET methods for StatusID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStatusID" acess="public" output="false" returntype="any">
		<cfreturn variables.StatusID>
	</cffunction>
	
	<cffunction name="setStatusID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="StatusID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.StatusID)) OR trim(arguments.StatusID) EQ "">
			<cfset variables.StatusID = arguments.StatusID />
		<cfelse>
			<cfthrow message="StatusID (#arguments.StatusID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "StatusID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersID>
	</cffunction>
	
	<cffunction name="setUsersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersID)) OR trim(arguments.UsersID) EQ "">
			<cfset variables.UsersID = arguments.UsersID />
		<cfelse>
			<cfthrow message="UsersID (#arguments.UsersID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersID") />		
		
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
				 		
		<cfif this.getClaimStatusID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getClaimStatusID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimStatus" output="false" access="public" returntype="query">
				
		<cfargument name="ClaimStatusID" required="yes" type="numeric" />		
		<cfset var qGetClaimStatus = "" />		
	
		<cfquery name="qGetClaimStatus" datasource="#trim(variables.ds)#">
	  		SELECT ClaimStatusID,ClaimID,StatusID,UsersID,DateCreated,Note
			FROM claimstatus  
			WHERE ClaimStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimStatusID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaimStatus>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ClaimStatusActive" />
		
		<cfset var qCreateClaimStatus = "" />		
		
		<cfset var localClaimID = arguments.obj.getClaimID() />
		<cfset var localStatusID = arguments.obj.getStatusID() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localNote = arguments.obj.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaimStatus" datasource="#trim(variables.ds)#">
				INSERT INTO claimstatus (ClaimID,StatusID,UsersID,Note)
				VALUES (						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ClaimStatusID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateClaimStatus.ClaimStatusID);
			arguments.obj.setClaimStatusID(qCreateClaimStatus.ClaimStatusID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ClaimStatusActive">
				
		<cfargument name="ClaimStatusID" required="yes" type="numeric" />		
		<cfset var qGetClaimStatus = "" />		
		
		<cfset qGetClaimStatus = getClaimStatus(trim(ClaimStatusID)) />
				
		<cfif qGetClaimStatus.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setClaimStatusID(qGetClaimStatus.ClaimStatusID);
			this.setClaimID(qGetClaimStatus.ClaimID);
			this.setStatusID(qGetClaimStatus.StatusID);
			this.setUsersID(qGetClaimStatus.UsersID);
			this.setDateCreated(qGetClaimStatus.DateCreated);
			this.setNote(qGetClaimStatus.Note);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ClaimStatusActive" />
		<cfset var qUpdateClaimStatus = "" />
		<cfset var localClaimID = arguments.obj.getClaimID() />
		<cfset var localStatusID = arguments.obj.getStatusID() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localNote = arguments.obj.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaimStatus" datasource="#trim(variables.ds)#">
				UPDATE claimstatus  SET
					
					ClaimID =						
						<cfqueryparam value="#trim(localClaimID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					StatusID =						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Note =	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>					
				WHERE ClaimStatusID = <cfqueryparam value="#trim(arguments.obj.getClaimStatusID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="ClaimStatusActive" />
		<cfset var qDeleteClaimStatus = "">

		<cfquery name="qDeleteClaimStatus" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM claimstatus
			WHERE ClaimStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getClaimStatusID())#" /> 
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





