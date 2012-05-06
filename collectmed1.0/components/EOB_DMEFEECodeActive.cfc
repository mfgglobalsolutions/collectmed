 	


<cfcomponent name="eob_dmefeecodeActive" output="false" alias="eob_dmefeecodeActive">

	<cfproperty name="RecordID" type="numeric" default="0" />
	<cfproperty name="TOSCode" type="string" default="" />
	<cfproperty name="Code" type="string" default="" />
	<cfproperty name="Description" type="string" default="" />
	<cfproperty name="TMRMpayable" type="numeric" default="" />
	<cfproperty name="TotalRVUs" type="numeric" default="" />
	<cfproperty name="ConversionFactor" type="numeric" default="" />
	<cfproperty name="AccessBasedMaxFee" type="numeric" default="" />
	<cfproperty name="NoteCode" type="string" default="" />
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
		variables.RecordID = 0;
		variables.TOSCode = "";
		variables.Code = "";
		variables.Description = "";
		variables.TMRMpayable = "";
		variables.TotalRVUs = "";
		variables.ConversionFactor = "";
		variables.AccessBasedMaxFee = "";
		variables.NoteCode = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="eob_dmefeecodeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RecordID") AND stValues.RecordID NEQ 0>
				<cfquery name="qGetEOB_DMEFEECode" datasource="#trim(variables.ds)#">
			  		SELECT RecordID,TOSCode,Code,Description,TMRMpayable,TotalRVUs,ConversionFactor,AccessBasedMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified
					FROM EOB_DMEFEECode  
					WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RecordID#" /> 
				</cfquery>		
				<cfif qGetEOB_DMEFEECode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.TOSCode = qGetEOB_DMEFEECode.TOSCode;
					variables.Code = qGetEOB_DMEFEECode.Code;
					variables.Description = qGetEOB_DMEFEECode.Description;
					variables.TMRMpayable = qGetEOB_DMEFEECode.TMRMpayable;
					variables.TotalRVUs = qGetEOB_DMEFEECode.TotalRVUs;
					variables.ConversionFactor = qGetEOB_DMEFEECode.ConversionFactor;
					variables.AccessBasedMaxFee = qGetEOB_DMEFEECode.AccessBasedMaxFee;
					variables.NoteCode = qGetEOB_DMEFEECode.NoteCode;
					variables.Active = qGetEOB_DMEFEECode.Active;
					variables.InactiveCode = qGetEOB_DMEFEECode.InactiveCode;
					variables.DateModified = qGetEOB_DMEFEECode.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RecordID")><cfset variables.RecordID = stValues.RecordID /></cfif>
			<cfif StructKeyExists(stValues, "TOSCode")><cfset variables.TOSCode = stValues.TOSCode /></cfif>
			<cfif StructKeyExists(stValues, "Code")><cfset variables.Code = stValues.Code /></cfif>
			<cfif StructKeyExists(stValues, "Description")><cfset variables.Description = stValues.Description /></cfif>
			<cfif StructKeyExists(stValues, "TMRMpayable")><cfset variables.TMRMpayable = stValues.TMRMpayable /></cfif>
			<cfif StructKeyExists(stValues, "TotalRVUs")><cfset variables.TotalRVUs = stValues.TotalRVUs /></cfif>
			<cfif StructKeyExists(stValues, "ConversionFactor")><cfset variables.ConversionFactor = stValues.ConversionFactor /></cfif>
			<cfif StructKeyExists(stValues, "AccessBasedMaxFee")><cfset variables.AccessBasedMaxFee = stValues.AccessBasedMaxFee /></cfif>
			<cfif StructKeyExists(stValues, "NoteCode")><cfset variables.NoteCode = stValues.NoteCode /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RecordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.RecordID>
	</cffunction>
	
	<cffunction name="setRecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RecordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RecordID)) OR trim(arguments.RecordID) EQ "">
			<cfset variables.RecordID = arguments.RecordID />
		<cfelse>
			<cfthrow message="RecordID (#arguments.RecordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RecordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TOSCode.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTOSCode" acess="public" output="false" returntype="any">
		<cfreturn variables.TOSCode>
	</cffunction>
	
	<cffunction name="setTOSCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TOSCode" required="true" type="any" />
			
		<cfset variables.TOSCode = arguments.TOSCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TOSCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Code.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCode" acess="public" output="false" returntype="any">
		<cfreturn variables.Code>
	</cffunction>
	
	<cffunction name="setCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Code" required="true" type="any" />
			
		<cfset variables.Code = arguments.Code />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Code") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Description.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.Description>
	</cffunction>
	
	<cffunction name="setDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Description" required="true" type="any" />
			
		<cfset variables.Description = arguments.Description />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Description") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TMRMpayable.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTMRMpayable" acess="public" output="false" returntype="any">
		<cfreturn variables.TMRMpayable>
	</cffunction>
	
	<cffunction name="setTMRMpayable" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TMRMpayable" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.TMRMpayable)) OR trim(arguments.TMRMpayable) EQ "">
			<cfset variables.TMRMpayable = arguments.TMRMpayable />
		<cfelse>
			<cfthrow message="TMRMpayable (#arguments.TMRMpayable#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TMRMpayable") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TotalRVUs.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTotalRVUs" acess="public" output="false" returntype="any">
		<cfreturn variables.TotalRVUs>
	</cffunction>
	
	<cffunction name="setTotalRVUs" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TotalRVUs" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.TotalRVUs)) OR trim(arguments.TotalRVUs) EQ "">
			<cfset variables.TotalRVUs = arguments.TotalRVUs />
		<cfelse>
			<cfthrow message="TotalRVUs (#arguments.TotalRVUs#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TotalRVUs") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ConversionFactor.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getConversionFactor" acess="public" output="false" returntype="any">
		<cfreturn variables.ConversionFactor>
	</cffunction>
	
	<cffunction name="setConversionFactor" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ConversionFactor" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ConversionFactor)) OR trim(arguments.ConversionFactor) EQ "">
			<cfset variables.ConversionFactor = arguments.ConversionFactor />
		<cfelse>
			<cfthrow message="ConversionFactor (#arguments.ConversionFactor#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ConversionFactor") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AccessBasedMaxFee.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAccessBasedMaxFee" acess="public" output="false" returntype="any">
		<cfreturn variables.AccessBasedMaxFee>
	</cffunction>
	
	<cffunction name="setAccessBasedMaxFee" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AccessBasedMaxFee" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AccessBasedMaxFee)) OR trim(arguments.AccessBasedMaxFee) EQ "">
			<cfset variables.AccessBasedMaxFee = arguments.AccessBasedMaxFee />
		<cfelse>
			<cfthrow message="AccessBasedMaxFee (#arguments.AccessBasedMaxFee#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AccessBasedMaxFee") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for NoteCode.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getNoteCode" acess="public" output="false" returntype="any">
		<cfreturn variables.NoteCode>
	</cffunction>
	
	<cffunction name="setNoteCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="NoteCode" required="true" type="any" />
			
		<cfset variables.NoteCode = arguments.NoteCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "NoteCode") />		
		
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
				 		
		<cfif this.getRecordID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getRecordID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_DMEFEECode" output="false" access="public" returntype="query">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_DMEFEECode = "" />		
	
		<cfquery name="qGetEOB_DMEFEECode" datasource="#trim(variables.ds)#">
	  		SELECT RecordID,TOSCode,Code,Description,TMRMpayable,TotalRVUs,ConversionFactor,AccessBasedMaxFee,NoteCode,Active,InactiveCode,DateCreated,DateModified
			FROM EOB_DMEFEECode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_DMEFEECode>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_DMEFEECodeActive" />
		
		<cfset var qCreateEOB_DMEFEECode = "" />		
		
		<cfset var localTOSCode = arguments.obj.getTOSCode() />
		<cfset var localCode = arguments.obj.getCode() />
		<cfset var localDescription = arguments.obj.getDescription() />
		<cfset var localTMRMpayable = arguments.obj.getTMRMpayable() />
		<cfset var localTotalRVUs = arguments.obj.getTotalRVUs() />
		<cfset var localConversionFactor = arguments.obj.getConversionFactor() />
		<cfset var localAccessBasedMaxFee = arguments.obj.getAccessBasedMaxFee() />
		<cfset var localNoteCode = arguments.obj.getNoteCode() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_DMEFEECode" datasource="#trim(variables.ds)#">
				INSERT INTO EOB_DMEFEECode (TOSCode,Code,Description,TMRMpayable,TotalRVUs,ConversionFactor,AccessBasedMaxFee,NoteCode,InactiveCode)
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
			read(qCreateEOB_DMEFEECode.RecordID);
			arguments.obj.setRecordID(qCreateEOB_DMEFEECode.RecordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_DMEFEECodeActive">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_DMEFEECode = "" />		
		
		<cfset qGetEOB_DMEFEECode = getEOB_DMEFEECode(trim(RecordID)) />
				
		<cfif qGetEOB_DMEFEECode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setRecordID(qGetEOB_DMEFEECode.RecordID);
			this.setTOSCode(qGetEOB_DMEFEECode.TOSCode);
			this.setCode(qGetEOB_DMEFEECode.Code);
			this.setDescription(qGetEOB_DMEFEECode.Description);
			this.setTMRMpayable(qGetEOB_DMEFEECode.TMRMpayable);
			this.setTotalRVUs(qGetEOB_DMEFEECode.TotalRVUs);
			this.setConversionFactor(qGetEOB_DMEFEECode.ConversionFactor);
			this.setAccessBasedMaxFee(qGetEOB_DMEFEECode.AccessBasedMaxFee);
			this.setNoteCode(qGetEOB_DMEFEECode.NoteCode);
			this.setActive(qGetEOB_DMEFEECode.Active);
			this.setInactiveCode(qGetEOB_DMEFEECode.InactiveCode);
			this.setDateCreated(qGetEOB_DMEFEECode.DateCreated);
			this.setDateModified(qGetEOB_DMEFEECode.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_DMEFEECodeActive" />
		<cfset var qUpdateEOB_DMEFEECode = "" />
		<cfset var localTOSCode = arguments.obj.getTOSCode() />
		<cfset var localCode = arguments.obj.getCode() />
		<cfset var localDescription = arguments.obj.getDescription() />
		<cfset var localTMRMpayable = arguments.obj.getTMRMpayable() />
		<cfset var localTotalRVUs = arguments.obj.getTotalRVUs() />
		<cfset var localConversionFactor = arguments.obj.getConversionFactor() />
		<cfset var localAccessBasedMaxFee = arguments.obj.getAccessBasedMaxFee() />
		<cfset var localNoteCode = arguments.obj.getNoteCode() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_DMEFEECode" datasource="#trim(variables.ds)#">
				UPDATE EOB_DMEFEECode  SET
					
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.obj.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EOB_DMEFEECodeActive" />
		<cfset var qDeleteEOB_DMEFEECode = "">

		<cfquery name="qDeleteEOB_DMEFEECode" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM EOB_DMEFEECode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getRecordID())#" /> 
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


