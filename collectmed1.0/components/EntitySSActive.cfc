 	


<cfcomponent name="entityssActive" output="false" alias="entityssActive">

	<cfproperty name="EntitySSID" type="numeric" default="0" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="ColM" type="string" default="" />
	<cfproperty name="ColE" type="string" default="" />
	<cfproperty name="ColR" type="string" default="" />
	<cfproperty name="IsDefault" type="numeric" default="" />
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
		variables.EntitySSID = 0;
		variables.EntityID = "";
		variables.ColM = "";
		variables.ColE = "";
		variables.ColR = "";
		variables.IsDefault = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="entityssActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "EntitySSID") AND stValues.EntitySSID NEQ 0>
				<cfquery name="qGetEntitySS" datasource="#trim(variables.ds)#">
			  		SELECT EntitySSID,EntityID,ColM,ColE,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified
					FROM entityss  
					WHERE EntitySSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.EntitySSID#" /> 
				</cfquery>		
				<cfif qGetEntitySS.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.EntityID = qGetEntitySS.EntityID;
					variables.ColM = qGetEntitySS.ColM;
					variables.ColE = qGetEntitySS.ColE;
					variables.ColR = qGetEntitySS.ColR;
					variables.IsDefault = qGetEntitySS.IsDefault;
					variables.Active = qGetEntitySS.Active;
					variables.InactiveCode = qGetEntitySS.InactiveCode;
					variables.DateModified = qGetEntitySS.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "EntitySSID")><cfset variables.EntitySSID = stValues.EntitySSID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "ColM")><cfset variables.ColM = stValues.ColM /></cfif>
			<cfif StructKeyExists(stValues, "ColE")><cfset variables.ColE = stValues.ColE /></cfif>
			<cfif StructKeyExists(stValues, "ColR")><cfset variables.ColR = stValues.ColR /></cfif>
			<cfif StructKeyExists(stValues, "IsDefault")><cfset variables.IsDefault = stValues.IsDefault /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntitySSID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntitySSID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntitySSID>
	</cffunction>
	
	<cffunction name="setEntitySSID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntitySSID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntitySSID)) OR trim(arguments.EntitySSID) EQ "">
			<cfset variables.EntitySSID = arguments.EntitySSID />
		<cfelse>
			<cfthrow message="EntitySSID (#arguments.EntitySSID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntitySSID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
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
	<!--- GET and SET methods for ColR.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColR" acess="public" output="false" returntype="any">
		<cfreturn variables.ColR>
	</cffunction>
	
	<cffunction name="setColR" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColR" required="true" type="any" />
			
		<cfset variables.ColR = arguments.ColR />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColR") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IsDefault.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIsDefault" acess="public" output="false" returntype="any">
		<cfreturn variables.IsDefault>
	</cffunction>
	
	<cffunction name="setIsDefault" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IsDefault" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.IsDefault)) OR trim(arguments.IsDefault) EQ "">
			<cfset variables.IsDefault = arguments.IsDefault />
		<cfelse>
			<cfthrow message="IsDefault (#arguments.IsDefault#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IsDefault") />		
		
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
				 		
		<cfif this.getEntitySSID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getEntitySSID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntitySS" output="false" access="public" returntype="query">
				
		<cfargument name="EntitySSID" required="yes" type="numeric" />		
		<cfset var qGetEntitySS = "" />		
	
		<cfquery name="qGetEntitySS" datasource="#trim(variables.ds)#">
	  		SELECT EntitySSID,EntityID,ColM,ColE,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM entityss  
			WHERE EntitySSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntitySSID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntitySS>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EntitySSActive" />
		
		<cfset var qCreateEntitySS = "" />		
		
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localColM = arguments.obj.getColM() />
		<cfset var localColE = arguments.obj.getColE() />
		<cfset var localColR = arguments.obj.getColR() />
		<cfset var localIsDefault = arguments.obj.getIsDefault() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntitySS" datasource="#trim(variables.ds)#">
				INSERT INTO entityss (EntityID,ColM,ColE,ColR,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,	
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
					<cfif trim(localColR) NEQ "" AND trim(localColR) NEQ "@@" AND trim(localColR) NEQ "NULL">						
						<cfqueryparam value="#trim(localColR)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS EntitySSID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateEntitySS.EntitySSID);
			arguments.obj.setEntitySSID(qCreateEntitySS.EntitySSID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntitySSActive">
				
		<cfargument name="EntitySSID" required="yes" type="numeric" />		
		<cfset var qGetEntitySS = "" />		
		
		<cfset qGetEntitySS = getEntitySS(trim(EntitySSID)) />
				
		<cfif qGetEntitySS.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setEntitySSID(qGetEntitySS.EntitySSID);
			this.setEntityID(qGetEntitySS.EntityID);
			this.setColM(qGetEntitySS.ColM);
			this.setColE(qGetEntitySS.ColE);
			this.setColR(qGetEntitySS.ColR);
			this.setIsDefault(qGetEntitySS.IsDefault);
			this.setActive(qGetEntitySS.Active);
			this.setInactiveCode(qGetEntitySS.InactiveCode);
			this.setDateCreated(qGetEntitySS.DateCreated);
			this.setDateModified(qGetEntitySS.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EntitySSActive" />
		<cfset var qUpdateEntitySS = "" />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localColM = arguments.obj.getColM() />
		<cfset var localColE = arguments.obj.getColE() />
		<cfset var localColR = arguments.obj.getColR() />
		<cfset var localIsDefault = arguments.obj.getIsDefault() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntitySS" datasource="#trim(variables.ds)#">
				UPDATE entityss  SET
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
					
					ColR =	
					<cfif trim(localColR) NEQ "" AND trim(localColR) NEQ "@@" AND trim(localColR) NEQ "NULL">						
						<cfqueryparam value="#trim(localColR)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					IsDefault =						
						<cfqueryparam value="#trim(localIsDefault)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE EntitySSID = <cfqueryparam value="#trim(arguments.obj.getEntitySSID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EntitySSActive" />
		<cfset var qDeleteEntitySS = "">

		<cfquery name="qDeleteEntitySS" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM entityss
			WHERE EntitySSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getEntitySSID())#" /> 
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





