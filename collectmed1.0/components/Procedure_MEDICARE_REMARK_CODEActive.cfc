 	


<cfcomponent name="procedure_medicare_remark_codeActive" output="false" alias="procedure_medicare_remark_codeActive">

	<cfproperty name="Procedure_MEDICARE_REMARK_CODEID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="QualifierCode" type="string" default="" />
	<cfproperty name="IndustryCode" type="string" default="" />
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
		variables.Procedure_MEDICARE_REMARK_CODEID = 0;
		variables.ProcedureID = "";
		variables.QualifierCode = "";
		variables.IndustryCode = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedure_medicare_remark_codeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_REMARK_CODEID") AND stValues.Procedure_MEDICARE_REMARK_CODEID NEQ 0>
				<cfquery name="qGetProcedure_MEDICARE_REMARK_CODE" datasource="#trim(variables.ds)#">
			  		SELECT Procedure_MEDICARE_REMARK_CODEID,ProcedureID,QualifierCode,IndustryCode,Active,InactiveCode,DateCreated,DateModified
					FROM procedure_medicare_remark_code  
					WHERE Procedure_MEDICARE_REMARK_CODEID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.Procedure_MEDICARE_REMARK_CODEID#" /> 
				</cfquery>		
				<cfif qGetProcedure_MEDICARE_REMARK_CODE.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedure_MEDICARE_REMARK_CODE.ProcedureID;
					variables.QualifierCode = qGetProcedure_MEDICARE_REMARK_CODE.QualifierCode;
					variables.IndustryCode = qGetProcedure_MEDICARE_REMARK_CODE.IndustryCode;
					variables.Active = qGetProcedure_MEDICARE_REMARK_CODE.Active;
					variables.InactiveCode = qGetProcedure_MEDICARE_REMARK_CODE.InactiveCode;
					variables.DateModified = qGetProcedure_MEDICARE_REMARK_CODE.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_REMARK_CODEID")><cfset variables.Procedure_MEDICARE_REMARK_CODEID = stValues.Procedure_MEDICARE_REMARK_CODEID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "QualifierCode")><cfset variables.QualifierCode = stValues.QualifierCode /></cfif>
			<cfif StructKeyExists(stValues, "IndustryCode")><cfset variables.IndustryCode = stValues.IndustryCode /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Procedure_MEDICARE_REMARK_CODEID.                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedure_MEDICARE_REMARK_CODEID" acess="public" output="false" returntype="any">
		<cfreturn variables.Procedure_MEDICARE_REMARK_CODEID>
	</cffunction>
	
	<cffunction name="setProcedure_MEDICARE_REMARK_CODEID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Procedure_MEDICARE_REMARK_CODEID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Procedure_MEDICARE_REMARK_CODEID)) OR trim(arguments.Procedure_MEDICARE_REMARK_CODEID) EQ "">
			<cfset variables.Procedure_MEDICARE_REMARK_CODEID = arguments.Procedure_MEDICARE_REMARK_CODEID />
		<cfelse>
			<cfthrow message="Procedure_MEDICARE_REMARK_CODEID (#arguments.Procedure_MEDICARE_REMARK_CODEID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Procedure_MEDICARE_REMARK_CODEID") />		
		
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
	<!--- GET and SET methods for QualifierCode.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getQualifierCode" acess="public" output="false" returntype="any">
		<cfreturn variables.QualifierCode>
	</cffunction>
	
	<cffunction name="setQualifierCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="QualifierCode" required="true" type="any" />
			
		<cfset variables.QualifierCode = arguments.QualifierCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "QualifierCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IndustryCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIndustryCode" acess="public" output="false" returntype="any">
		<cfreturn variables.IndustryCode>
	</cffunction>
	
	<cffunction name="setIndustryCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IndustryCode" required="true" type="any" />
			
		<cfset variables.IndustryCode = arguments.IndustryCode />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IndustryCode") />		
		
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
				 		
		<cfif this.getProcedure_MEDICARE_REMARK_CODEID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getProcedure_MEDICARE_REMARK_CODEID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_REMARK_CODE" output="false" access="public" returntype="query">
				
		<cfargument name="Procedure_MEDICARE_REMARK_CODEID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_REMARK_CODE = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_REMARK_CODE" datasource="#trim(variables.ds)#">
	  		SELECT Procedure_MEDICARE_REMARK_CODEID,ProcedureID,QualifierCode,IndustryCode,Active,InactiveCode,DateCreated,DateModified
			FROM procedure_medicare_remark_code  
			WHERE Procedure_MEDICARE_REMARK_CODEID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_REMARK_CODEID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_REMARK_CODE>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_REMARK_CODEActive" />
		
		<cfset var qCreateProcedure_MEDICARE_REMARK_CODE = "" />		
		
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localQualifierCode = arguments.obj.getQualifierCode() />
		<cfset var localIndustryCode = arguments.obj.getIndustryCode() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_REMARK_CODE" datasource="#trim(variables.ds)#">
				INSERT INTO procedure_medicare_remark_code (ProcedureID,QualifierCode,IndustryCode,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localIndustryCode)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_REMARK_CODEID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateProcedure_MEDICARE_REMARK_CODE.Procedure_MEDICARE_REMARK_CODEID);
			arguments.obj.setProcedure_MEDICARE_REMARK_CODEID(qCreateProcedure_MEDICARE_REMARK_CODE.Procedure_MEDICARE_REMARK_CODEID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_REMARK_CODEActive">
				
		<cfargument name="Procedure_MEDICARE_REMARK_CODEID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_REMARK_CODE = "" />		
		
		<cfset qGetProcedure_MEDICARE_REMARK_CODE = getProcedure_MEDICARE_REMARK_CODE(trim(Procedure_MEDICARE_REMARK_CODEID)) />
				
		<cfif qGetProcedure_MEDICARE_REMARK_CODE.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setProcedure_MEDICARE_REMARK_CODEID(qGetProcedure_MEDICARE_REMARK_CODE.Procedure_MEDICARE_REMARK_CODEID);
			this.setProcedureID(qGetProcedure_MEDICARE_REMARK_CODE.ProcedureID);
			this.setQualifierCode(qGetProcedure_MEDICARE_REMARK_CODE.QualifierCode);
			this.setIndustryCode(qGetProcedure_MEDICARE_REMARK_CODE.IndustryCode);
			this.setActive(qGetProcedure_MEDICARE_REMARK_CODE.Active);
			this.setInactiveCode(qGetProcedure_MEDICARE_REMARK_CODE.InactiveCode);
			this.setDateCreated(qGetProcedure_MEDICARE_REMARK_CODE.DateCreated);
			this.setDateModified(qGetProcedure_MEDICARE_REMARK_CODE.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_REMARK_CODEActive" />
		<cfset var qUpdateProcedure_MEDICARE_REMARK_CODE = "" />
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localQualifierCode = arguments.obj.getQualifierCode() />
		<cfset var localIndustryCode = arguments.obj.getIndustryCode() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure_MEDICARE_REMARK_CODE" datasource="#trim(variables.ds)#">
				UPDATE procedure_medicare_remark_code  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					QualifierCode =						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					IndustryCode =						
						<cfqueryparam value="#trim(localIndustryCode)#" cfsqltype="CF_SQL_VARCHAR" />,
					
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
				WHERE Procedure_MEDICARE_REMARK_CODEID = <cfqueryparam value="#trim(arguments.obj.getProcedure_MEDICARE_REMARK_CODEID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_REMARK_CODEActive" />
		<cfset var qDeleteProcedure_MEDICARE_REMARK_CODE = "">

		<cfquery name="qDeleteProcedure_MEDICARE_REMARK_CODE" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM procedure_medicare_remark_code
			WHERE Procedure_MEDICARE_REMARK_CODEID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getProcedure_MEDICARE_REMARK_CODEID())#" /> 
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





