 	


<cfcomponent name="usersworkgroupActive" output="false" alias="usersworkgroupActive">

	<cfproperty name="UsersWorkGroupID" type="numeric" default="0" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="WorkGroupID" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.UsersWorkGroupID = 0;
		variables.UsersID = "";
		variables.WorkGroupID = "";
		variables.DateCreated = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="usersworkgroupActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "UsersWorkGroupID") AND stValues.UsersWorkGroupID NEQ 0>
				<cfquery name="qGetUsersWorkGroup" datasource="#trim(variables.ds)#">
			  		SELECT UsersWorkGroupID,UsersID,WorkGroupID,DateCreated
					FROM UsersWorkGroup  
					WHERE UsersWorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.UsersWorkGroupID#" /> 
				</cfquery>		
				<cfif qGetUsersWorkGroup.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.UsersID = qGetUsersWorkGroup.UsersID;
					variables.WorkGroupID = qGetUsersWorkGroup.WorkGroupID;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "UsersWorkGroupID")><cfset variables.UsersWorkGroupID = stValues.UsersWorkGroupID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "WorkGroupID")><cfset variables.WorkGroupID = stValues.WorkGroupID /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersWorkGroupID.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersWorkGroupID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersWorkGroupID>
	</cffunction>
	
	<cffunction name="setUsersWorkGroupID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersWorkGroupID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersWorkGroupID)) OR trim(arguments.UsersWorkGroupID) EQ "">
			<cfset variables.UsersWorkGroupID = arguments.UsersWorkGroupID />
		<cfelse>
			<cfthrow message="UsersWorkGroupID (#arguments.UsersWorkGroupID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersWorkGroupID") />		
		
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
	<!--- GET and SET methods for WorkGroupID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getWorkGroupID" acess="public" output="false" returntype="any">
		<cfreturn variables.WorkGroupID>
	</cffunction>
	
	<cffunction name="setWorkGroupID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="WorkGroupID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.WorkGroupID)) OR trim(arguments.WorkGroupID) EQ "">
			<cfset variables.WorkGroupID = arguments.WorkGroupID />
		<cfelse>
			<cfthrow message="WorkGroupID (#arguments.WorkGroupID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "WorkGroupID") />		
		
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
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getUsersWorkGroupID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getUsersWorkGroupID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersWorkGroup" output="false" access="public" returntype="query">
				
		<cfargument name="UsersWorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetUsersWorkGroup = "" />		
	
		<cfquery name="qGetUsersWorkGroup" datasource="#trim(variables.ds)#">
	  		SELECT UsersWorkGroupID,UsersID,WorkGroupID,DateCreated
			FROM UsersWorkGroup  
			WHERE UsersWorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.UsersWorkGroupID)#" /> 
		</cfquery>
		
		<cfreturn qGetUsersWorkGroup>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="UsersWorkGroupActive" />
		
		<cfset var qCreateUsersWorkGroup = "" />		
		
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localWorkGroupID = arguments.obj.getWorkGroupID() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateUsersWorkGroup" datasource="#trim(variables.ds)#">
				INSERT INTO UsersWorkGroup (UsersID,WorkGroupID)
				VALUES (						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localWorkGroupID)#" cfsqltype="CF_SQL_INTEGER" />	
				);
				SELECT LAST_INSERT_ID() AS UsersWorkGroupID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateUsersWorkGroup.UsersWorkGroupID);
			arguments.obj.setUsersWorkGroupID(qCreateUsersWorkGroup.UsersWorkGroupID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="UsersWorkGroupActive">
				
		<cfargument name="UsersWorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetUsersWorkGroup = "" />		
		
		<cfset qGetUsersWorkGroup = getUsersWorkGroup(trim(UsersWorkGroupID)) />
				
		<cfif qGetUsersWorkGroup.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setUsersWorkGroupID(qGetUsersWorkGroup.UsersWorkGroupID);
			this.setUsersID(qGetUsersWorkGroup.UsersID);
			this.setWorkGroupID(qGetUsersWorkGroup.WorkGroupID);
			this.setDateCreated(qGetUsersWorkGroup.DateCreated);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="UsersWorkGroupActive" />
		<cfset var qUpdateUsersWorkGroup = "" />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localWorkGroupID = arguments.obj.getWorkGroupID() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateUsersWorkGroup" datasource="#trim(variables.ds)#">
				UPDATE UsersWorkGroup  SET
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					WorkGroupID =						
						<cfqueryparam value="#trim(localWorkGroupID)#" cfsqltype="CF_SQL_INTEGER" />					
				WHERE UsersWorkGroupID = <cfqueryparam value="#trim(arguments.obj.getUsersWorkGroupID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="UsersWorkGroupActive" />
		<cfset var qDeleteUsersWorkGroup = "">

		<cfquery name="qDeleteUsersWorkGroup" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM UsersWorkGroup
			WHERE UsersWorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getUsersWorkGroupID())#" /> 
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


