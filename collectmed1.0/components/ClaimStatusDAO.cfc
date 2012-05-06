 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimStatusBean" />
		
		<cfset var qCreateClaimStatus = "" />		
		
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localNote = arguments.bean.getNote() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaimStatus" datasource="#trim(arguments.ds)#">
				INSERT INTO ClaimStatus (ClaimID,StatusID,UsersID,Note)
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
			arguments.bean.setClaimStatusID(qCreateClaimStatus.ClaimStatusID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ClaimStatusBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimStatusID" required="yes" type="numeric" />		
		<cfset var qGetClaimStatus = "" />		
		
		<cfset qGetClaimStatus = getClaimStatus(trim(arguments.ds), trim(ClaimStatusID)) />
				
		<cfif qGetClaimStatus.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objClaimStatus = createObject("component", "ClaimStatusBean").init(arguments.ds);
			objClaimStatus.setClaimStatusID(qGetClaimStatus.ClaimStatusID);
			objClaimStatus.setClaimID(qGetClaimStatus.ClaimID);
			objClaimStatus.setStatusID(qGetClaimStatus.StatusID);
			objClaimStatus.setUsersID(qGetClaimStatus.UsersID);
			objClaimStatus.setDateCreated(qGetClaimStatus.DateCreated);
			objClaimStatus.setNote(qGetClaimStatus.Note);				
			return objClaimStatus;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimStatusBean" />
		<cfset var qUpdateClaimStatus = "" />
		<cfset var localClaimID = arguments.bean.getClaimID() />
		<cfset var localStatusID = arguments.bean.getStatusID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localNote = arguments.bean.getNote() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaimStatus" datasource="#trim(arguments.ds)#">
				UPDATE ClaimStatus  SET
					
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
				WHERE ClaimStatusID = <cfqueryparam value="#trim(arguments.bean.getClaimStatusID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="ClaimStatusBean" />
		<cfset var qDeleteClaimStatus = "">

		<cfquery name="qDeleteClaimStatus" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM ClaimStatus
			WHERE ClaimStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getClaimStatusID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimStatus" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="ClaimStatusID" required="yes" type="numeric" />		
		<cfset var qGetClaimStatus = "" />		
	
		<cfquery name="qGetClaimStatus" datasource="#trim(arguments.ds)#">
	  		SELECT ClaimStatusID,ClaimID,StatusID,UsersID,DateCreated,Note
			FROM ClaimStatus  
			WHERE ClaimStatusID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ClaimStatusID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaimStatus>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


