 	


<cfcomponent name="procedureopencloseActive" output="false" alias="procedureopencloseActive">

	<cfproperty name="ProcedureOpenCloseID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="OpenOrClose" type="numeric" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="Note" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.ProcedureOpenCloseID = 0;
		variables.ProcedureID = "";
		variables.OpenOrClose = "";
		variables.UsersID = "";
		variables.Note = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedureopencloseActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ProcedureOpenCloseID") AND stValues.ProcedureOpenCloseID NEQ 0>
				<cfquery name="qGetProcedureOpenClose" datasource="#trim(variables.ds)#">
			  		SELECT ProcedureOpenCloseID,ProcedureID,OpenOrClose,UsersID,Note,Active,InactiveCode,DateCreated,DateModified
					FROM procedureopenclose  
					WHERE ProcedureOpenCloseID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ProcedureOpenCloseID#" /> 
				</cfquery>		
				<cfif qGetProcedureOpenClose.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedureOpenClose.ProcedureID;
					variables.OpenOrClose = qGetProcedureOpenClose.OpenOrClose;
					variables.UsersID = qGetProcedureOpenClose.UsersID;
					variables.Note = qGetProcedureOpenClose.Note;
					variables.Active = qGetProcedureOpenClose.Active;
					variables.InactiveCode = qGetProcedureOpenClose.InactiveCode;
					variables.DateModified = qGetProcedureOpenClose.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ProcedureOpenCloseID")><cfset variables.ProcedureOpenCloseID = stValues.ProcedureOpenCloseID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "OpenOrClose")><cfset variables.OpenOrClose = stValues.OpenOrClose /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProcedureOpenCloseID.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedureOpenCloseID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProcedureOpenCloseID>
	</cffunction>
	
	<cffunction name="setProcedureOpenCloseID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProcedureOpenCloseID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ProcedureOpenCloseID)) OR trim(arguments.ProcedureOpenCloseID) EQ "">
			<cfset variables.ProcedureOpenCloseID = arguments.ProcedureOpenCloseID />
		<cfelse>
			<cfthrow message="ProcedureOpenCloseID (#arguments.ProcedureOpenCloseID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProcedureOpenCloseID") />		
		
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
	<!--- GET and SET methods for OpenOrClose.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOpenOrClose" acess="public" output="false" returntype="any">
		<cfreturn variables.OpenOrClose>
	</cffunction>
	
	<cffunction name="setOpenOrClose" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OpenOrClose" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.OpenOrClose)) OR trim(arguments.OpenOrClose) EQ "">
			<cfset variables.OpenOrClose = arguments.OpenOrClose />
		<cfelse>
			<cfthrow message="OpenOrClose (#arguments.OpenOrClose#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OpenOrClose") />		
		
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
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
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
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getProcedureOpenCloseID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getProcedureOpenCloseID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureOpenClose" output="false" access="public" returntype="query">
				
		<cfargument name="ProcedureOpenCloseID" required="yes" type="numeric" />		
		<cfset var qGetProcedureOpenClose = "" />		
	
		<cfquery name="qGetProcedureOpenClose" datasource="#trim(variables.ds)#">
	  		SELECT ProcedureOpenCloseID,ProcedureID,OpenOrClose,UsersID,Note,Active,InactiveCode,DateCreated,DateModified
			FROM procedureopenclose  
			WHERE ProcedureOpenCloseID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ProcedureOpenCloseID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedureOpenClose>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ProcedureOpenCloseActive" />
		
		<cfset var qCreateProcedureOpenClose = "" />		
		
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localOpenOrClose = arguments.obj.getOpenOrClose() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedureOpenClose" datasource="#trim(variables.ds)#">
				INSERT INTO procedureopenclose (ProcedureID,OpenOrClose,UsersID,Note,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localProcedureID))>						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localOpenOrClose)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ProcedureOpenCloseID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateProcedureOpenClose.ProcedureOpenCloseID);
			arguments.obj.setProcedureOpenCloseID(qCreateProcedureOpenClose.ProcedureOpenCloseID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="ProcedureOpenCloseActive">
				
		<cfargument name="ProcedureOpenCloseID" required="yes" type="numeric" />		
		<cfset var qGetProcedureOpenClose = "" />		
		
		<cfset qGetProcedureOpenClose = getProcedureOpenClose(trim(ProcedureOpenCloseID)) />
				
		<cfif qGetProcedureOpenClose.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setProcedureOpenCloseID(qGetProcedureOpenClose.ProcedureOpenCloseID);
			this.setProcedureID(qGetProcedureOpenClose.ProcedureID);
			this.setOpenOrClose(qGetProcedureOpenClose.OpenOrClose);
			this.setUsersID(qGetProcedureOpenClose.UsersID);
			this.setNote(qGetProcedureOpenClose.Note);
			this.setActive(qGetProcedureOpenClose.Active);
			this.setInactiveCode(qGetProcedureOpenClose.InactiveCode);
			this.setDateCreated(qGetProcedureOpenClose.DateCreated);
			this.setDateModified(qGetProcedureOpenClose.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="ProcedureOpenCloseActive" />
		<cfset var qUpdateProcedureOpenClose = "" />
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localOpenOrClose = arguments.obj.getOpenOrClose() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedureOpenClose" datasource="#trim(variables.ds)#">
				UPDATE procedureopenclose  SET
					
					ProcedureID =				
					<cfif IsNumeric(trim(localProcedureID))>						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					OpenOrClose =						
						<cfqueryparam value="#trim(localOpenOrClose)#" cfsqltype="CF_SQL_INTEGER" />,
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Note =	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />	
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
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE ProcedureOpenCloseID = <cfqueryparam value="#trim(arguments.obj.getProcedureOpenCloseID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="ProcedureOpenCloseActive" />
		<cfset var qDeleteProcedureOpenClose = "">

		<cfquery name="qDeleteProcedureOpenClose" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM procedureopenclose
			WHERE ProcedureOpenCloseID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getProcedureOpenCloseID())#" /> 
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





