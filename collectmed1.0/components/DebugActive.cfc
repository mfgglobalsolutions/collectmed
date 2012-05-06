 	


<cfcomponent name="debugActive" output="false" alias="debugActive">

	<cfproperty name="DebugID" type="numeric" default="0" />
	<cfproperty name="referenceID" type="string" default="" />
	<cfproperty name="Note" type="string" default="" />
	<cfproperty name="TS" type="datetime" default="" />
	<cfproperty name="tesst" type="numeric" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.DebugID = 0;
		variables.referenceID = "";
		variables.Note = "";
		variables.TS = "";
		variables.tesst = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="debugActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "DebugID") AND stValues.DebugID NEQ 0>
				<cfquery name="qGetDebug" datasource="#trim(variables.ds)#">
			  		SELECT DebugID,referenceID,Note,TS,tesst
					FROM Debug  
					WHERE DebugID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.DebugID#" /> 
				</cfquery>		
				<cfif qGetDebug.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.referenceID = qGetDebug.referenceID;
					variables.Note = qGetDebug.Note;
					variables.TS = qGetDebug.TS;
					variables.tesst = qGetDebug.tesst;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "DebugID")><cfset variables.DebugID = stValues.DebugID /></cfif>
			<cfif StructKeyExists(stValues, "referenceID")><cfset variables.referenceID = stValues.referenceID /></cfif>
			<cfif StructKeyExists(stValues, "Note")><cfset variables.Note = stValues.Note /></cfif>
			<cfif StructKeyExists(stValues, "TS")><cfset variables.TS = stValues.TS /></cfif>
			<cfif StructKeyExists(stValues, "tesst")><cfset variables.tesst = stValues.tesst /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DebugID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDebugID" acess="public" output="false" returntype="any">
		<cfreturn variables.DebugID>
	</cffunction>
	
	<cffunction name="setDebugID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DebugID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.DebugID)) OR trim(arguments.DebugID) EQ "">
			<cfset variables.DebugID = arguments.DebugID />
		<cfelse>
			<cfthrow message="DebugID (#arguments.DebugID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DebugID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for referenceID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getreferenceID" acess="public" output="false" returntype="any">
		<cfreturn variables.referenceID>
	</cffunction>
	
	<cffunction name="setreferenceID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="referenceID" required="true" type="any" />
			
		<cfset variables.referenceID = arguments.referenceID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "referenceID") />		
		
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
	<!--- GET and SET methods for TS.                                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTS" acess="public" output="false" returntype="any">
		<cfreturn variables.TS>
	</cffunction>
	
	<cffunction name="setTS" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TS" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.TS)) OR trim(arguments.TS) EQ "">
			<cfset variables.TS = arguments.TS />
		<cfelse>
			<cfthrow message="TS (#arguments.TS#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TS") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for tesst.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gettesst" acess="public" output="false" returntype="any">
		<cfreturn variables.tesst>
	</cffunction>
	
	<cffunction name="settesst" acess="public" output="false" returntype="boolean">
		
		<cfargument name="tesst" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.tesst)) OR trim(arguments.tesst) EQ "">
			<cfset variables.tesst = arguments.tesst />
		<cfelse>
			<cfthrow message="tesst (#arguments.tesst#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "tesst") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getDebugID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getDebugID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDebug" output="false" access="public" returntype="query">
				
		<cfargument name="DebugID" required="yes" type="numeric" />		
		<cfset var qGetDebug = "" />		
	
		<cfquery name="qGetDebug" datasource="#trim(variables.ds)#">
	  		SELECT DebugID,referenceID,Note,TS,tesst
			FROM Debug  
			WHERE DebugID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.DebugID)#" /> 
		</cfquery>
		
		<cfreturn qGetDebug>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="DebugActive" />
		
		<cfset var qCreateDebug = "" />		
		
		<cfset var localreferenceID = arguments.obj.getreferenceID() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localTS = arguments.obj.getTS() />
		<cfset var localtesst = arguments.obj.gettesst() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateDebug" datasource="#trim(variables.ds)#">
				INSERT INTO Debug (referenceID,Note,tesst)
				VALUES (	
					<cfif trim(localreferenceID) NEQ "" AND trim(localreferenceID) NEQ "@@" AND trim(localreferenceID) NEQ "NULL">						
						<cfqueryparam value="#trim(localreferenceID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localtesst))>						
						<cfqueryparam value="#trim(localtesst)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS DebugID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateDebug.DebugID);
			arguments.obj.setDebugID(qCreateDebug.DebugID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="DebugActive">
				
		<cfargument name="DebugID" required="yes" type="numeric" />		
		<cfset var qGetDebug = "" />		
		
		<cfset qGetDebug = getDebug(trim(DebugID)) />
				
		<cfif qGetDebug.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setDebugID(qGetDebug.DebugID);
			this.setreferenceID(qGetDebug.referenceID);
			this.setNote(qGetDebug.Note);
			this.setTS(qGetDebug.TS);
			this.settesst(qGetDebug.tesst);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="DebugActive" />
		<cfset var qUpdateDebug = "" />
		<cfset var localreferenceID = arguments.obj.getreferenceID() />
		<cfset var localNote = arguments.obj.getNote() />
		<cfset var localTS = arguments.obj.getTS() />
		<cfset var localtesst = arguments.obj.gettesst() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateDebug" datasource="#trim(variables.ds)#">
				UPDATE Debug  SET
					
					referenceID =	
					<cfif trim(localreferenceID) NEQ "" AND trim(localreferenceID) NEQ "@@" AND trim(localreferenceID) NEQ "NULL">						
						<cfqueryparam value="#trim(localreferenceID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Note =	
					<cfif trim(localNote) NEQ "" AND trim(localNote) NEQ "@@" AND trim(localNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TS =						
						<cfqueryparam value="#trim(localTS)#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					tesst =				
					<cfif IsNumeric(trim(localtesst))>						
						<cfqueryparam value="#trim(localtesst)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE DebugID = <cfqueryparam value="#trim(arguments.obj.getDebugID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="DebugActive" />
		<cfset var qDeleteDebug = "">

		<cfquery name="qDeleteDebug" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Debug
			WHERE DebugID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getDebugID())#" /> 
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


