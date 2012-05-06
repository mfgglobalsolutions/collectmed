 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_MODIFIERBean" />
		
		<cfset var qCreateProcedure_MEDICARE_MODIFIER = "" />		
		
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localModifierCode = arguments.bean.getModifierCode() />
		<cfset var localDescription = arguments.bean.getDescription() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_MODIFIER" datasource="#trim(arguments.ds)#">
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
			arguments.bean.setProcedure_MEDICARE_MODIFIERID(qCreateProcedure_MEDICARE_MODIFIER.Procedure_MEDICARE_MODIFIERID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_MODIFIERBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_MODIFIERID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_MODIFIER = "" />		
		
		<cfset qGetProcedure_MEDICARE_MODIFIER = getProcedure_MEDICARE_MODIFIER(trim(arguments.ds), trim(Procedure_MEDICARE_MODIFIERID)) />
				
		<cfif qGetProcedure_MEDICARE_MODIFIER.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objProcedure_MEDICARE_MODIFIER = createObject("component", "Procedure_MEDICARE_MODIFIERBean").init(arguments.ds);
			objProcedure_MEDICARE_MODIFIER.setProcedure_MEDICARE_MODIFIERID(qGetProcedure_MEDICARE_MODIFIER.Procedure_MEDICARE_MODIFIERID);
			objProcedure_MEDICARE_MODIFIER.setProcedureID(qGetProcedure_MEDICARE_MODIFIER.ProcedureID);
			objProcedure_MEDICARE_MODIFIER.setModifierCode(qGetProcedure_MEDICARE_MODIFIER.ModifierCode);
			objProcedure_MEDICARE_MODIFIER.setDescription(qGetProcedure_MEDICARE_MODIFIER.Description);
			objProcedure_MEDICARE_MODIFIER.setDateCreated(qGetProcedure_MEDICARE_MODIFIER.DateCreated);				
			return objProcedure_MEDICARE_MODIFIER;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_MODIFIERBean" />
		<cfset var qUpdateProcedure_MEDICARE_MODIFIER = "" />
		<cfset var localProcedureID = arguments.bean.getProcedureID() />
		<cfset var localModifierCode = arguments.bean.getModifierCode() />
		<cfset var localDescription = arguments.bean.getDescription() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure_MEDICARE_MODIFIER" datasource="#trim(arguments.ds)#">
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
				WHERE Procedure_MEDICARE_MODIFIERID = <cfqueryparam value="#trim(arguments.bean.getProcedure_MEDICARE_MODIFIERID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="Procedure_MEDICARE_MODIFIERBean" />
		<cfset var qDeleteProcedure_MEDICARE_MODIFIER = "">

		<cfquery name="qDeleteProcedure_MEDICARE_MODIFIER" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Procedure_MEDICARE_MODIFIER
			WHERE Procedure_MEDICARE_MODIFIERID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getProcedure_MEDICARE_MODIFIERID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_MODIFIER" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Procedure_MEDICARE_MODIFIERID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_MODIFIER = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_MODIFIER" datasource="#trim(arguments.ds)#">
	  		SELECT Procedure_MEDICARE_MODIFIERID,ProcedureID,ModifierCode,Description,DateCreated
			FROM Procedure_MEDICARE_MODIFIER  
			WHERE Procedure_MEDICARE_MODIFIERID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_MODIFIERID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_MODIFIER>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


