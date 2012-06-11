 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_DMEFEECodeBean" />
		
		<cfset var qCreateEOB_DMEFEECode = "" />		
		
		<cfset var localTOSCode = arguments.bean.getTOSCode() />
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localTMRMpayable = arguments.bean.getTMRMpayable() />
		<cfset var localTotalRVUs = arguments.bean.getTotalRVUs() />
		<cfset var localConversionFactor = arguments.bean.getConversionFactor() />
		<cfset var localAccessBasedMaxFee = arguments.bean.getAccessBasedMaxFee() />
		<cfset var localNoteCode = arguments.bean.getNoteCode() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_DMEFEECode" datasource="#trim(arguments.ds)#">
				INSERT INTO eob_dmefeecode (TOSCode,Code,Description,TMRMpayable,TotalRVUs,ConversionFactor,AccessBasedMaxFee,NoteCode,Active,InactiveCode)
				VALUES (	
					<cfif trim(localTOSCode) NEQ "" AND trim(localTOSCode) NEQ "@@" AND trim(localTOSCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOSCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localTMRMpayable))>						
						<cfqueryparam value="#trim(localTMRMpayable)#" cfsqltype="CF_SQL_INTEGER" />							
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
					<cfif IsNumeric(trim(localAccessBasedMaxFee))>						
						<cfqueryparam value="#trim(localAccessBasedMaxFee)#" cfsqltype="CF_SQL_INTEGER" />							
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
			arguments.bean.setRecordID(qCreateEOB_DMEFEECode.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_DMEFEECodeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_DMEFEECode = "" />		
		
		<cfset qGetEOB_DMEFEECode = getEOB_DMEFEECode(trim(arguments.ds), trim(EOB_DMEFEECodeID)) />
				
		<cfif qGetEOB_DMEFEECode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEOB_DMEFEECode = createObject("component", "EOB_DMEFEECodeBean").init(arguments.ds);
			objEOB_DMEFEECode.setRecordID(qGetEOB_DMEFEECode.RecordID);
			objEOB_DMEFEECode.setTOSCode(qGetEOB_DMEFEECode.TOSCode);
			objEOB_DMEFEECode.setCode(qGetEOB_DMEFEECode.Code);
			objEOB_DMEFEECode.setDescription(qGetEOB_DMEFEECode.Description);
			objEOB_DMEFEECode.setTMRMpayable(qGetEOB_DMEFEECode.TMRMpayable);
			objEOB_DMEFEECode.setTotalRVUs(qGetEOB_DMEFEECode.TotalRVUs);
			objEOB_DMEFEECode.setConversionFactor(qGetEOB_DMEFEECode.ConversionFactor);
			objEOB_DMEFEECode.setAccessBasedMaxFee(qGetEOB_DMEFEECode.AccessBasedMaxFee);
			objEOB_DMEFEECode.setNoteCode(qGetEOB_DMEFEECode.NoteCode);
			objEOB_DMEFEECode.setActive(qGetEOB_DMEFEECode.Active);
			objEOB_DMEFEECode.setInactiveCode(qGetEOB_DMEFEECode.InactiveCode);
			objEOB_DMEFEECode.setDateCreated(qGetEOB_DMEFEECode.DateCreated);
			objEOB_DMEFEECode.setDateModified(qGetEOB_DMEFEECode.DateModified);				
			return objEOB_DMEFEECode;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EOB_DMEFEECodeBean" />
		<cfset var qUpdateEOB_DMEFEECode = "" />
		<cfset var localTOSCode = arguments.bean.getTOSCode() />
		<cfset var localCode = arguments.bean.getCode() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localTMRMpayable = arguments.bean.getTMRMpayable() />
		<cfset var localTotalRVUs = arguments.bean.getTotalRVUs() />
		<cfset var localConversionFactor = arguments.bean.getConversionFactor() />
		<cfset var localAccessBasedMaxFee = arguments.bean.getAccessBasedMaxFee() />
		<cfset var localNoteCode = arguments.bean.getNoteCode() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_DMEFEECode" datasource="#trim(arguments.ds)#">
				UPDATE eob_dmefeecode  SET
					
					TOSCode =	
					<cfif trim(localTOSCode) NEQ "" AND trim(localTOSCode) NEQ "@@" AND trim(localTOSCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localTOSCode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Code =						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Description =	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					TMRMpayable =				
					<cfif IsNumeric(trim(localTMRMpayable))>						
						<cfqueryparam value="#trim(localTMRMpayable)#" cfsqltype="CF_SQL_INTEGER" />	
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
					
					AccessBasedMaxFee =				
					<cfif IsNumeric(trim(localAccessBasedMaxFee))>						
						<cfqueryparam value="#trim(localAccessBasedMaxFee)#" cfsqltype="CF_SQL_INTEGER" />	
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
		<cfargument name="bean" required="true" type="EOB_DMEFEECodeBean" />
		<cfset var qDeleteEOB_DMEFEECode = "">

		<cfquery name="qDeleteEOB_DMEFEECode" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM eob_dmefeecode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_DMEFEECode" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EOB_DMEFEECodeID" required="yes" type="numeric" />		
		<cfset var qGetEOB_DMEFEECode = "" />		
	
		<cfquery name="qGetEOB_DMEFEECode" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,TOSCode,Code,Description,TMRMpayable,TotalRVUs,ConversionFactor,AccessBasedMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified
			FROM eob_dmefeecode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_DMEFEECode>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





