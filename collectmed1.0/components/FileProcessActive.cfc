 	


<cfcomponent name="fileprocessActive" output="false" alias="fileprocessActive">

	<cfproperty name="FileProcessID" type="numeric" default="0" />
	<cfproperty name="FileID" type="numeric" default="" />
	<cfproperty name="StatusID" type="numeric" default="" />
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
		variables.FileProcessID = 0;
		variables.FileID = "";
		variables.StatusID = "";
		variables.Note = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="fileprocessActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "FileProcessID") AND stValues.FileProcessID NEQ 0>
				<cfquery name="qGetFileProcess" datasource="#trim(variables.ds)#">
			  		SELECT FileProcessID,FileID,StatusID,Note,Active,InactiveCode,DateCreated,DateModified
					FROM fileprocess  
					WHERE FileProcessID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.FileProcessID#" /> 
				</cfquery>		
				<cfif qGetFileProcess.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.FileID = qGetFileProcess.FileID;
					variables.StatusID = qGetFileProcess.StatusID;
					variables.Note = qGetFileProcess.Note;
					variables.Active = qGetFileProcess.Active;
					variables.InactiveCode = qGetFileProcess.InactiveCode;
					variables.DateModified = qGetFileProcess.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "FileProcessID")><cfset variables.FileProcessID = stValues.FileProcessID /></cfif>
			<cfif StructKeyExists(stValues, "FileID")><cfset variables.FileID = stValues.FileID /></cfif>
			<cfif StructKeyExists(stValues, "StatusID")><cfset variables.StatusID = stValues.StatusID /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileProcessID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileProcessID" acess="public" output="false" returntype="any">
		<cfreturn variables.FileProcessID>
	</cffunction>
	
	<cffunction name="setFileProcessID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileProcessID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.FileProcessID)) OR trim(arguments.FileProcessID) EQ "">
			<cfset variables.FileProcessID = arguments.FileProcessID />
		<cfelse>
			<cfthrow message="FileProcessID (#arguments.FileProcessID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileProcessID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FileID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFileID" acess="public" output="false" returntype="any">
		<cfreturn variables.FileID>
	</cffunction>
	
	<cffunction name="setFileID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FileID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.FileID)) OR trim(arguments.FileID) EQ "">
			<cfset variables.FileID = arguments.FileID />
		<cfelse>
			<cfthrow message="FileID (#arguments.FileID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FileID") />		
		
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
				 		
		<cfif this.getFileProcessID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getFileProcessID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileProcess" output="false" access="public" returntype="query">
				
		<cfargument name="FileProcessID" required="yes" type="numeric" />		
		<cfset var qGetFileProcess = "" />		
	
		<cfquery name="qGetFileProcess" datasource="#trim(variables.ds)#">
	  		SELECT FileProcessID,FileID,StatusID,Note,Active,InactiveCode,DateCreated,DateModified
			FROM fileprocess  
			WHERE FileProcessID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.FileProcessID)#" /> 
		</cfquery>
		
		<cfreturn qGetFileProcess>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="FileProcessActive" />
		
		<cfset var qCreateFileProcess = "" />		
		
		<cfset var localFileID = arguments.obj.getFileID() />
		<cfset var localStatusID = arguments.obj.getStatusID() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateFileProcess" datasource="#trim(variables.ds)#">
				INSERT INTO fileprocess (FileID,Note,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localFileID)#" cfsqltype="CF_SQL_INTEGER" />,	
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
				SELECT LAST_INSERT_ID() AS FileProcessID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateFileProcess.FileProcessID);
			arguments.obj.setFileProcessID(qCreateFileProcess.FileProcessID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="FileProcessActive">
				
		<cfargument name="FileProcessID" required="yes" type="numeric" />		
		<cfset var qGetFileProcess = "" />		
		
		<cfset qGetFileProcess = getFileProcess(trim(FileProcessID)) />
				
		<cfif qGetFileProcess.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setFileProcessID(qGetFileProcess.FileProcessID);
			this.setFileID(qGetFileProcess.FileID);
			this.setStatusID(qGetFileProcess.StatusID);
			this.setNote(qGetFileProcess.Note);
			this.setActive(qGetFileProcess.Active);
			this.setInactiveCode(qGetFileProcess.InactiveCode);
			this.setDateCreated(qGetFileProcess.DateCreated);
			this.setDateModified(qGetFileProcess.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="FileProcessActive" />
		<cfset var qUpdateFileProcess = "" />
		<cfset var localFileID = arguments.obj.getFileID() />
		<cfset var localStatusID = arguments.obj.getStatusID() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateFileProcess" datasource="#trim(variables.ds)#">
				UPDATE fileprocess  SET
					
					FileID =						
						<cfqueryparam value="#trim(localFileID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					StatusID =						
						<cfqueryparam value="#trim(localStatusID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE FileProcessID = <cfqueryparam value="#trim(arguments.obj.getFileProcessID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="FileProcessActive" />
		<cfset var qDeleteFileProcess = "">

		<cfquery name="qDeleteFileProcess" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM fileprocess
			WHERE FileProcessID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getFileProcessID())#" /> 
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





