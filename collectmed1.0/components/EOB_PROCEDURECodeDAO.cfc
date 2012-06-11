 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_PROCEDURECodeBean" />
		
		<cfset var qCreateEOB_PROCEDURECode = "" />		
		
		<cfset var localTOSCode = arguments.bean.getTOSCode() />
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localTMRMPayable = arguments.bean.getTMRMPayable() />
		<cfset var localTotalRVUs = arguments.bean.getTotalRVUs() />
		<cfset var localConversionFactor = arguments.bean.getConversionFactor() />
		<cfset var localAccessBasedOrMaxFee = arguments.bean.getAccessBasedOrMaxFee() />
		<cfset var localNoteCode = arguments.bean.getNoteCode() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_PROCEDURECode" datasource="#trim(arguments.ds)#">
				INSERT INTO eob_procedurecode (TOSCode,Code,Description,TMRMPayable,TotalRVUs,ConversionFactor,AccessBasedOrMaxFee,NoteCode,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localTOSCode)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localTMRMPayable))>						
						<cfqueryparam value="#trim(localTMRMPayable)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localTotalRVUs))>						
						<cfqueryparam value="#trim(localTotalRVUs)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localConversionFactor))>						
						<cfqueryparam value="#trim(localConversionFactor)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localAccessBasedOrMaxFee))>						
						<cfqueryparam value="#trim(localAccessBasedOrMaxFee)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localNoteCode) NEQ "" AND trim(localNoteCode) NEQ "@@" AND trim(localNoteCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localNoteCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS RecordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setRecordID(qCreateEOB_PROCEDURECode.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_PROCEDURECodeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_PROCEDURECode = "" />		
		
		<cfset qGetEOB_PROCEDURECode = getEOB_PROCEDURECode(trim(arguments.ds), trim(EOB_PROCEDURECodeID)) />
				
		<cfif qGetEOB_PROCEDURECode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEOB_PROCEDURECode = createObject("component", "EOB_PROCEDURECodeBean").init(arguments.ds);
			objEOB_PROCEDURECode.setRecordID(qGetEOB_PROCEDURECode.RecordID);
			objEOB_PROCEDURECode.setTOSCode(qGetEOB_PROCEDURECode.TOSCode);
			objEOB_PROCEDURECode.setCode(qGetEOB_PROCEDURECode.Code);
			objEOB_PROCEDURECode.setDescription(qGetEOB_PROCEDURECode.Description);
			objEOB_PROCEDURECode.setTMRMPayable(qGetEOB_PROCEDURECode.TMRMPayable);
			objEOB_PROCEDURECode.setTotalRVUs(qGetEOB_PROCEDURECode.TotalRVUs);
			objEOB_PROCEDURECode.setConversionFactor(qGetEOB_PROCEDURECode.ConversionFactor);
			objEOB_PROCEDURECode.setAccessBasedOrMaxFee(qGetEOB_PROCEDURECode.AccessBasedOrMaxFee);
			objEOB_PROCEDURECode.setNoteCode(qGetEOB_PROCEDURECode.NoteCode);
			objEOB_PROCEDURECode.setActive(qGetEOB_PROCEDURECode.Active);
			objEOB_PROCEDURECode.setInactiveCode(qGetEOB_PROCEDURECode.InactiveCode);
			objEOB_PROCEDURECode.setDateCreated(qGetEOB_PROCEDURECode.DateCreated);
			objEOB_PROCEDURECode.setDateModified(qGetEOB_PROCEDURECode.DateModified);				
			return objEOB_PROCEDURECode;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_PROCEDURECodeBean" />
		<cfset var qUpdateEOB_PROCEDURECode = "" />
		<cfset var localTOSCode = arguments.bean.getTOSCode() />
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localTMRMPayable = arguments.bean.getTMRMPayable() />
		<cfset var localTotalRVUs = arguments.bean.getTotalRVUs() />
		<cfset var localConversionFactor = arguments.bean.getConversionFactor() />
		<cfset var localAccessBasedOrMaxFee = arguments.bean.getAccessBasedOrMaxFee() />
		<cfset var localNoteCode = arguments.bean.getNoteCode() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_PROCEDURECode" datasource="#trim(arguments.ds)#">
				UPDATE eob_procedurecode  SET
					
					TOSCode =						
						<cfqueryparam value="#trim(localTOSCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Code =						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Description =	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TMRMPayable =				
					<cfif IsNumeric(trim(localTMRMPayable))>						
						<cfqueryparam value="#trim(localTMRMPayable)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					TotalRVUs =				
					<cfif IsNumeric(trim(localTotalRVUs))>						
						<cfqueryparam value="#trim(localTotalRVUs)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ConversionFactor =				
					<cfif IsNumeric(trim(localConversionFactor))>						
						<cfqueryparam value="#trim(localConversionFactor)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AccessBasedOrMaxFee =				
					<cfif IsNumeric(trim(localAccessBasedOrMaxFee))>						
						<cfqueryparam value="#trim(localAccessBasedOrMaxFee)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					NoteCode =	
					<cfif trim(localNoteCode) NEQ "" AND trim(localNoteCode) NEQ "@@" AND trim(localNoteCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localNoteCode)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.bean.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_PROCEDURECodeBean" />
		<cfset var qDeleteEOB_PROCEDURECode = "">

		<cfquery name="qDeleteEOB_PROCEDURECode" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM eob_procedurecode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_PROCEDURECode" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EOB_PROCEDURECodeID" required="yes" type="numeric" />		
		<cfset var qGetEOB_PROCEDURECode = "" />		
	
		<cfquery name="qGetEOB_PROCEDURECode" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,TOSCode,Code,Description,TMRMPayable,TotalRVUs,ConversionFactor,AccessBasedOrMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified
			FROM eob_procedurecode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_PROCEDURECode>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





