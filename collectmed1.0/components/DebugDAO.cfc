 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DebugBean" />
		
		<cfset var qCreateDebug = "" />		
		
		<cfset var localreferenceID = arguments.bean.getreferenceID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localTS = arguments.bean.getTS() />
		<cfset var localtesst = arguments.bean.gettesst() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateDebug" datasource="#trim(arguments.ds)#">
				INSERT INTO Debug (referenceID,Note,TS,tesst)
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
						<cfqueryparam value="#trim(localTS)#" cfsqltype="CF_SQL_TIMESTAMP" />,				
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
			arguments.bean.setDebugID(qCreateDebug.DebugID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="DebugBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="DebugID" required="yes" type="numeric" />		
		<cfset var qGetDebug = "" />		
		
		<cfset qGetDebug = getDebug(trim(arguments.ds), trim(DebugID)) />
				
		<cfif qGetDebug.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objDebug = createObject("component", "DebugBean").init(arguments.ds);
			objDebug.setDebugID(qGetDebug.DebugID);
			objDebug.setreferenceID(qGetDebug.referenceID);
			objDebug.setNote(qGetDebug.Note);
			objDebug.setTS(qGetDebug.TS);
			objDebug.settesst(qGetDebug.tesst);				
			return objDebug;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DebugBean" />
		<cfset var qUpdateDebug = "" />
		<cfset var localreferenceID = arguments.bean.getreferenceID() />
		<cfset var localNote = arguments.bean.getNote() />
		<cfset var localTS = arguments.bean.getTS() />
		<cfset var localtesst = arguments.bean.gettesst() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateDebug" datasource="#trim(arguments.ds)#">
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
				WHERE DebugID = <cfqueryparam value="#trim(arguments.bean.getDebugID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DebugBean" />
		<cfset var qDeleteDebug = "">

		<cfquery name="qDeleteDebug" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Debug
			WHERE DebugID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getDebugID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDebug" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="DebugID" required="yes" type="numeric" />		
		<cfset var qGetDebug = "" />		
	
		<cfquery name="qGetDebug" datasource="#trim(arguments.ds)#">
	  		SELECT DebugID,referenceID,Note,TS,tesst
			FROM Debug  
			WHERE DebugID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.DebugID)#" /> 
		</cfquery>
		
		<cfreturn qGetDebug>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


