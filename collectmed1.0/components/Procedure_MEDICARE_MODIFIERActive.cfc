 	


<cfcomponent name="procedure_medicare_modifierActive" output="false" alias="procedure_medicare_modifierActive">

	<cfproperty name="Procedure_MEDICARE_MODIFIERID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="ModifierCode" type="numeric" default="" />
	<cfproperty name="Description" type="string" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.Procedure_MEDICARE_MODIFIERID = 0;
		variables.ProcedureID = "";
		variables.ModifierCode = "";
		variables.Description = "";
		variables.DateCreated = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedure_medicare_modifierActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_MODIFIERID") AND stValues.Procedure_MEDICARE_MODIFIERID NEQ 0>
				<cfquery name="qGetProcedure_MEDICARE_MODIFIER" datasource="#trim(variables.ds)#">
			  		SELECT Procedure_MEDICARE_MODIFIERID,ProcedureID,ModifierCode,Description,DateCreated
					FROM Procedure_MEDICARE_MODIFIER  
					WHERE Procedure_MEDICARE_MODIFIERID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.Procedure_MEDICARE_MODIFIERID#" /> 
				</cfquery>		
				<cfif qGetProcedure_MEDICARE_MODIFIER.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedure_MEDICARE_MODIFIER.ProcedureID;
					variables.ModifierCode = qGetProcedure_MEDICARE_MODIFIER.ModifierCode;
					variables.Description = qGetProcedure_MEDICARE_MODIFIER.Description;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_MODIFIERID")><cfset variables.Procedure_MEDICARE_MODIFIERID = stValues.Procedure_MEDICARE_MODIFIERID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "ModifierCode")><cfset variables.ModifierCode = stValues.ModifierCode /></cfif>
			<cfif StructKeyExists(stValues, "Description")><cfset variables.Description = stValues.Description /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Procedure_MEDICARE_MODIFIERID.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedure_MEDICARE_MODIFIERID" acess="public" output="false" returntype="any">
		<cfreturn variables.Procedure_MEDICARE_MODIFIERID>
	</cffunction>
	
	<cffunction name="setProcedure_MEDICARE_MODIFIERID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Procedure_MEDICARE_MODIFIERID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Procedure_MEDICARE_MODIFIERID)) OR trim(arguments.Procedure_MEDICARE_MODIFIERID) EQ "">
			<cfset variables.Procedure_MEDICARE_MODIFIERID = arguments.Procedure_MEDICARE_MODIFIERID />
		<cfelse>
			<cfthrow message="Procedure_MEDICARE_MODIFIERID (#arguments.Procedure_MEDICARE_MODIFIERID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Procedure_MEDICARE_MODIFIERID") />		
		
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
	<!--- GET and SET methods for ModifierCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getModifierCode" acess="public" output="false" returntype="any">
		<cfreturn variables.ModifierCode>
	</cffunction>
	
	<cffunction name="setModifierCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ModifierCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ModifierCode)) OR trim(arguments.ModifierCode) EQ "">
			<cfset variables.ModifierCode = arguments.ModifierCode />
		<cfelse>
			<cfthrow message="ModifierCode (#arguments.ModifierCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ModifierCode") />		
		
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
				 		
		<cfif this.getProcedure_MEDICARE_MODIFIERID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getProcedure_MEDICARE_MODIFIERID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_MODIFIER" output="false" access="public" returntype="query">
				
		<cfargument name="Procedure_MEDICARE_MODIFIERID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_MODIFIER = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_MODIFIER" datasource="#trim(variables.ds)#">
	  		SELECT Procedure_MEDICARE_MODIFIERID,ProcedureID,ModifierCode,Description,DateCreated
			FROM Procedure_MEDICARE_MODIFIER  
			WHERE Procedure_MEDICARE_MODIFIERID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_MODIFIERID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_MODIFIER>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_MODIFIERActive" />
		
		<cfset var qCreateProcedure_MEDICARE_MODIFIER = "" />		
		
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localModifierCode = arguments.obj.getModifierCode() />
		<cfset var localDescription = arguments.obj.getDescription() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_MODIFIER" datasource="#trim(variables.ds)#">
				INSERT INTO Procedure_MEDICARE_MODIFIER (ProcedureID,ModifierCode,Description)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localModifierCode))>						
						<cfqueryparam value="#trim(localModifierCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_MODIFIERID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateProcedure_MEDICARE_MODIFIER.Procedure_MEDICARE_MODIFIERID);
			arguments.obj.setProcedure_MEDICARE_MODIFIERID(qCreateProcedure_MEDICARE_MODIFIER.Procedure_MEDICARE_MODIFIERID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_MODIFIERActive">
				
		<cfargument name="Procedure_MEDICARE_MODIFIERID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_MODIFIER = "" />		
		
		<cfset qGetProcedure_MEDICARE_MODIFIER = getProcedure_MEDICARE_MODIFIER(trim(Procedure_MEDICARE_MODIFIERID)) />
				
		<cfif qGetProcedure_MEDICARE_MODIFIER.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setProcedure_MEDICARE_MODIFIERID(qGetProcedure_MEDICARE_MODIFIER.Procedure_MEDICARE_MODIFIERID);
			this.setProcedureID(qGetProcedure_MEDICARE_MODIFIER.ProcedureID);
			this.setModifierCode(qGetProcedure_MEDICARE_MODIFIER.ModifierCode);
			this.setDescription(qGetProcedure_MEDICARE_MODIFIER.Description);
			this.setDateCreated(qGetProcedure_MEDICARE_MODIFIER.DateCreated);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_MODIFIERActive" />
		<cfset var qUpdateProcedure_MEDICARE_MODIFIER = "" />
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localModifierCode = arguments.obj.getModifierCode() />
		<cfset var localDescription = arguments.obj.getDescription() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure_MEDICARE_MODIFIER" datasource="#trim(variables.ds)#">
				UPDATE Procedure_MEDICARE_MODIFIER  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ModifierCode =				
					<cfif IsNumeric(trim(localModifierCode))>						
						<cfqueryparam value="#trim(localModifierCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Description =	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>					
				WHERE Procedure_MEDICARE_MODIFIERID = <cfqueryparam value="#trim(arguments.obj.getProcedure_MEDICARE_MODIFIERID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_MODIFIERActive" />
		<cfset var qDeleteProcedure_MEDICARE_MODIFIER = "">

		<cfquery name="qDeleteProcedure_MEDICARE_MODIFIER" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Procedure_MEDICARE_MODIFIER
			WHERE Procedure_MEDICARE_MODIFIERID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getProcedure_MEDICARE_MODIFIERID())#" /> 
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


