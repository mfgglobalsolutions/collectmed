 	


<cfcomponent name="entityksActive" output="false" alias="entityksActive">

	<cfproperty name="EntityKSID" type="numeric" default="0" />
	<cfproperty name="ColM" type="string" default="" />
	<cfproperty name="ColE" type="string" default="" />
	<cfproperty name="ColL" type="string" default="" />
	<cfproperty name="ColI" type="string" default="" />
	<cfproperty name="ColA" type="string" default="" />
	<cfproperty name="ColC" type="string" default="" />
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
		variables.EntityKSID = 0;
		variables.ColM = "";
		variables.ColE = "";
		variables.ColL = "";
		variables.ColI = "";
		variables.ColA = "";
		variables.ColC = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="entityksActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "EntityKSID") AND stValues.EntityKSID NEQ 0>
				<cfquery name="qGetEntityKS" datasource="#trim(variables.ds)#">
			  		SELECT EntityKSID,ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode,DateCreated,DateModified
					FROM EntityKS  
					WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.EntityKSID#" /> 
				</cfquery>		
				<cfif qGetEntityKS.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ColM = qGetEntityKS.ColM;
					variables.ColE = qGetEntityKS.ColE;
					variables.ColL = qGetEntityKS.ColL;
					variables.ColI = qGetEntityKS.ColI;
					variables.ColA = qGetEntityKS.ColA;
					variables.ColC = qGetEntityKS.ColC;
					variables.Active = qGetEntityKS.Active;
					variables.InactiveCode = qGetEntityKS.InactiveCode;
					variables.DateModified = qGetEntityKS.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "EntityKSID")><cfset variables.EntityKSID = stValues.EntityKSID /></cfif>
			<cfif StructKeyExists(stValues, "ColM")><cfset variables.ColM = stValues.ColM /></cfif>
			<cfif StructKeyExists(stValues, "ColE")><cfset variables.ColE = stValues.ColE /></cfif>
			<cfif StructKeyExists(stValues, "ColL")><cfset variables.ColL = stValues.ColL /></cfif>
			<cfif StructKeyExists(stValues, "ColI")><cfset variables.ColI = stValues.ColI /></cfif>
			<cfif StructKeyExists(stValues, "ColA")><cfset variables.ColA = stValues.ColA /></cfif>
			<cfif StructKeyExists(stValues, "ColC")><cfset variables.ColC = stValues.ColC /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityKSID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityKSID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityKSID>
	</cffunction>
	
	<cffunction name="setEntityKSID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityKSID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityKSID)) OR trim(arguments.EntityKSID) EQ "">
			<cfset variables.EntityKSID = arguments.EntityKSID />
		<cfelse>
			<cfthrow message="EntityKSID (#arguments.EntityKSID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityKSID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColM.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColM" acess="public" output="false" returntype="any">
		<cfreturn variables.ColM>
	</cffunction>
	
	<cffunction name="setColM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColM" required="true" type="any" />
			
		<cfset variables.ColM = arguments.ColM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColE.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColE" acess="public" output="false" returntype="any">
		<cfreturn variables.ColE>
	</cffunction>
	
	<cffunction name="setColE" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColE" required="true" type="any" />
			
		<cfset variables.ColE = arguments.ColE />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColE") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColL.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColL" acess="public" output="false" returntype="any">
		<cfreturn variables.ColL>
	</cffunction>
	
	<cffunction name="setColL" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColL" required="true" type="any" />
			
		<cfset variables.ColL = arguments.ColL />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColL") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColI.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColI" acess="public" output="false" returntype="any">
		<cfreturn variables.ColI>
	</cffunction>
	
	<cffunction name="setColI" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColI" required="true" type="any" />
			
		<cfset variables.ColI = arguments.ColI />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColI") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColA.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColA" acess="public" output="false" returntype="any">
		<cfreturn variables.ColA>
	</cffunction>
	
	<cffunction name="setColA" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColA" required="true" type="any" />
			
		<cfset variables.ColA = arguments.ColA />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColA") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColC.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColC" acess="public" output="false" returntype="any">
		<cfreturn variables.ColC>
	</cffunction>
	
	<cffunction name="setColC" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColC" required="true" type="any" />
			
		<cfset variables.ColC = arguments.ColC />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColC") />		
		
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
				 		
		<cfif this.getEntityKSID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getEntityKSID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityKS" output="false" access="public" returntype="query">
				
		<cfargument name="EntityKSID" required="yes" type="numeric" />		
		<cfset var qGetEntityKS = "" />		
	
		<cfquery name="qGetEntityKS" datasource="#trim(variables.ds)#">
	  		SELECT EntityKSID,ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode,DateCreated,DateModified
			FROM EntityKS  
			WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntityKSID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityKS>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EntityKSActive" />
		
		<cfset var qCreateEntityKS = "" />		
		
		<cfset var localColM = arguments.obj.getColM() />
		<cfset var localColE = arguments.obj.getColE() />
		<cfset var localColL = arguments.obj.getColL() />
		<cfset var localColI = arguments.obj.getColI() />
		<cfset var localColA = arguments.obj.getColA() />
		<cfset var localColC = arguments.obj.getColC() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityKS" datasource="#trim(variables.ds)#">
				INSERT INTO EntityKS (ColM,ColE,ColL,ColI,ColA,ColC,InactiveCode)
				VALUES (	
					<cfif trim(localColM) NEQ "" AND trim(localColM) NEQ "@@" AND trim(localColM) NEQ "NULL">						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColE) NEQ "" AND trim(localColE) NEQ "@@" AND trim(localColE) NEQ "NULL">						
						<cfqueryparam value="#trim(localColE)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColL) NEQ "" AND trim(localColL) NEQ "@@" AND trim(localColL) NEQ "NULL">						
						<cfqueryparam value="#trim(localColL)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColI) NEQ "" AND trim(localColI) NEQ "@@" AND trim(localColI) NEQ "NULL">						
						<cfqueryparam value="#trim(localColI)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColA) NEQ "" AND trim(localColA) NEQ "@@" AND trim(localColA) NEQ "NULL">						
						<cfqueryparam value="#trim(localColA)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localColC) NEQ "" AND trim(localColC) NEQ "@@" AND trim(localColC) NEQ "NULL">						
						<cfqueryparam value="#trim(localColC)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS EntityKSID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateEntityKS.EntityKSID);
			arguments.obj.setEntityKSID(qCreateEntityKS.EntityKSID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityKSActive">
				
		<cfargument name="EntityKSID" required="yes" type="numeric" />		
		<cfset var qGetEntityKS = "" />		
		
		<cfset qGetEntityKS = getEntityKS(trim(EntityKSID)) />
				
		<cfif qGetEntityKS.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setEntityKSID(qGetEntityKS.EntityKSID);
			this.setColM(qGetEntityKS.ColM);
			this.setColE(qGetEntityKS.ColE);
			this.setColL(qGetEntityKS.ColL);
			this.setColI(qGetEntityKS.ColI);
			this.setColA(qGetEntityKS.ColA);
			this.setColC(qGetEntityKS.ColC);
			this.setActive(qGetEntityKS.Active);
			this.setInactiveCode(qGetEntityKS.InactiveCode);
			this.setDateCreated(qGetEntityKS.DateCreated);
			this.setDateModified(qGetEntityKS.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EntityKSActive" />
		<cfset var qUpdateEntityKS = "" />
		<cfset var localColM = arguments.obj.getColM() />
		<cfset var localColE = arguments.obj.getColE() />
		<cfset var localColL = arguments.obj.getColL() />
		<cfset var localColI = arguments.obj.getColI() />
		<cfset var localColA = arguments.obj.getColA() />
		<cfset var localColC = arguments.obj.getColC() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntityKS" datasource="#trim(variables.ds)#">
				UPDATE EntityKS  SET
					
					ColM =	
					<cfif trim(localColM) NEQ "" AND trim(localColM) NEQ "@@" AND trim(localColM) NEQ "NULL">						
						<cfqueryparam value="#trim(localColM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColE =	
					<cfif trim(localColE) NEQ "" AND trim(localColE) NEQ "@@" AND trim(localColE) NEQ "NULL">						
						<cfqueryparam value="#trim(localColE)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColL =	
					<cfif trim(localColL) NEQ "" AND trim(localColL) NEQ "@@" AND trim(localColL) NEQ "NULL">						
						<cfqueryparam value="#trim(localColL)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColI =	
					<cfif trim(localColI) NEQ "" AND trim(localColI) NEQ "@@" AND trim(localColI) NEQ "NULL">						
						<cfqueryparam value="#trim(localColI)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColA =	
					<cfif trim(localColA) NEQ "" AND trim(localColA) NEQ "@@" AND trim(localColA) NEQ "NULL">						
						<cfqueryparam value="#trim(localColA)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColC =	
					<cfif trim(localColC) NEQ "" AND trim(localColC) NEQ "@@" AND trim(localColC) NEQ "NULL">						
						<cfqueryparam value="#trim(localColC)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE EntityKSID = <cfqueryparam value="#trim(arguments.obj.getEntityKSID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EntityKSActive" />
		<cfset var qDeleteEntityKS = "">

		<cfquery name="qDeleteEntityKS" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM EntityKS
			WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getEntityKSID())#" /> 
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


