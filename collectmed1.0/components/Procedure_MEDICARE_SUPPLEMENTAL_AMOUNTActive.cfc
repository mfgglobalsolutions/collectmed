 	


<cfcomponent name="procedure_medicare_supplemental_amountActive" output="false" alias="procedure_medicare_supplemental_amountActive">

	<cfproperty name="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" type="numeric" default="0" />
	<cfproperty name="ProcedureID" type="numeric" default="" />
	<cfproperty name="QualifierCode" type="numeric" default="" />
	<cfproperty name="MonetaryAmount2" type="numeric" default="" />
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
		variables.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = 0;
		variables.ProcedureID = "";
		variables.QualifierCode = "";
		variables.MonetaryAmount2 = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="procedure_medicare_supplemental_amountActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID") AND stValues.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID NEQ 0>
				<cfquery name="qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(variables.ds)#">
			  		SELECT Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID,ProcedureID,QualifierCode,MonetaryAmount2,Active,InactiveCode,DateCreated,DateModified
					FROM procedure_medicare_supplemental_amount  
					WHERE Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID#" /> 
				</cfquery>		
				<cfif qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ProcedureID = qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.ProcedureID;
					variables.QualifierCode = qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.QualifierCode;
					variables.MonetaryAmount2 = qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.MonetaryAmount2;
					variables.Active = qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Active;
					variables.InactiveCode = qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.InactiveCode;
					variables.DateModified = qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID")><cfset variables.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = stValues.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID /></cfif>
			<cfif StructKeyExists(stValues, "ProcedureID")><cfset variables.ProcedureID = stValues.ProcedureID /></cfif>
			<cfif StructKeyExists(stValues, "QualifierCode")><cfset variables.QualifierCode = stValues.QualifierCode /></cfif>
			<cfif StructKeyExists(stValues, "MonetaryAmount2")><cfset variables.MonetaryAmount2 = stValues.MonetaryAmount2 /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" acess="public" output="false" returntype="any">
		<cfreturn variables.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID>
	</cffunction>
	
	<cffunction name="setProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID)) OR trim(arguments.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID) EQ "">
			<cfset variables.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = arguments.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID />
		<cfelse>
			<cfthrow message="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID (#arguments.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID") />		
		
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
			
		<cfif IsNumeric(trim(arguments.QualifierCode)) OR trim(arguments.QualifierCode) EQ "">
			<cfset variables.QualifierCode = arguments.QualifierCode />
		<cfelse>
			<cfthrow message="QualifierCode (#arguments.QualifierCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "QualifierCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MonetaryAmount2.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMonetaryAmount2" acess="public" output="false" returntype="any">
		<cfreturn variables.MonetaryAmount2>
	</cffunction>
	
	<cffunction name="setMonetaryAmount2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MonetaryAmount2" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MonetaryAmount2)) OR trim(arguments.MonetaryAmount2) EQ "">
			<cfset variables.MonetaryAmount2 = arguments.MonetaryAmount2 />
		<cfelse>
			<cfthrow message="MonetaryAmount2 (#arguments.MonetaryAmount2#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MonetaryAmount2") />		
		
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
				 		
		<cfif this.getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" output="false" access="public" returntype="query">
				
		<cfargument name="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
	
		<cfquery name="qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(variables.ds)#">
	  		SELECT Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID,ProcedureID,QualifierCode,MonetaryAmount2,Active,InactiveCode,DateCreated,DateModified
			FROM procedure_medicare_supplemental_amount  
			WHERE Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID)#" /> 
		</cfquery>
		
		<cfreturn qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTActive" />
		
		<cfset var qCreateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
		
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localQualifierCode = arguments.obj.getQualifierCode() />
		<cfset var localMonetaryAmount2 = arguments.obj.getMonetaryAmount2() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(variables.ds)#">
				INSERT INTO procedure_medicare_supplemental_amount (ProcedureID,QualifierCode,MonetaryAmount2,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localMonetaryAmount2)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID);
			arguments.obj.setProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID(qCreateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTActive">
				
		<cfargument name="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="yes" type="numeric" />		
		<cfset var qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />		
		
		<cfset qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT(trim(Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID)) />
				
		<cfif qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID);
			this.setProcedureID(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.ProcedureID);
			this.setQualifierCode(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.QualifierCode);
			this.setMonetaryAmount2(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.MonetaryAmount2);
			this.setActive(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.Active);
			this.setInactiveCode(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.InactiveCode);
			this.setDateCreated(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.DateCreated);
			this.setDateModified(qGetProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTActive" />
		<cfset var qUpdateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "" />
		<cfset var localProcedureID = arguments.obj.getProcedureID() />
		<cfset var localQualifierCode = arguments.obj.getQualifierCode() />
		<cfset var localMonetaryAmount2 = arguments.obj.getMonetaryAmount2() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(variables.ds)#">
				UPDATE procedure_medicare_supplemental_amount  SET
					
					ProcedureID =						
						<cfqueryparam value="#trim(localProcedureID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					QualifierCode =						
						<cfqueryparam value="#trim(localQualifierCode)#" cfsqltype="CF_SQL_INTEGER" />,
					
					MonetaryAmount2 =						
						<cfqueryparam value="#trim(localMonetaryAmount2)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam value="#trim(arguments.obj.getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTActive" />
		<cfset var qDeleteProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT = "">

		<cfquery name="qDeleteProcedure_MEDICARE_SUPPLEMENTAL_AMOUNT" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM procedure_medicare_supplemental_amount
			WHERE Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getProcedure_MEDICARE_SUPPLEMENTAL_AMOUNTID())#" /> 
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





