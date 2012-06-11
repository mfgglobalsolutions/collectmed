 	


<cfcomponent name="insurancecompanyActive" output="false" alias="insurancecompanyActive">

	<cfproperty name="InsuranceCompanyID" type="numeric" default="0" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="OCNANumber" type="string" default="" />
	<cfproperty name="InsuranceCompanyName" type="string" default="" />
	<cfproperty name="InsuranceCompanyDBA" type="string" default="" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="InsuranceCompanyURL" type="string" default="" />
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
		variables.InsuranceCompanyID = 0;
		variables.ClientID = "";
		variables.OCNANumber = "";
		variables.InsuranceCompanyName = "";
		variables.InsuranceCompanyDBA = "";
		variables.EntityID = "";
		variables.InsuranceCompanyURL = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="insurancecompanyActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "InsuranceCompanyID") AND stValues.InsuranceCompanyID NEQ 0>
				<cfquery name="qGetInsuranceCompany" datasource="#trim(variables.ds)#">
			  		SELECT InsuranceCompanyID,ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,Active,InactiveCode,DateCreated,DateModified
					FROM insurancecompany  
					WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.InsuranceCompanyID#" /> 
				</cfquery>		
				<cfif qGetInsuranceCompany.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClientID = qGetInsuranceCompany.ClientID;
					variables.OCNANumber = qGetInsuranceCompany.OCNANumber;
					variables.InsuranceCompanyName = qGetInsuranceCompany.InsuranceCompanyName;
					variables.InsuranceCompanyDBA = qGetInsuranceCompany.InsuranceCompanyDBA;
					variables.EntityID = qGetInsuranceCompany.EntityID;
					variables.InsuranceCompanyURL = qGetInsuranceCompany.InsuranceCompanyURL;
					variables.Active = qGetInsuranceCompany.Active;
					variables.InactiveCode = qGetInsuranceCompany.InactiveCode;
					variables.DateModified = qGetInsuranceCompany.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyID")><cfset variables.InsuranceCompanyID = stValues.InsuranceCompanyID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "OCNANumber")><cfset variables.OCNANumber = stValues.OCNANumber /></cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyName")><cfset variables.InsuranceCompanyName = stValues.InsuranceCompanyName /></cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyDBA")><cfset variables.InsuranceCompanyDBA = stValues.InsuranceCompanyDBA /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "InsuranceCompanyURL")><cfset variables.InsuranceCompanyURL = stValues.InsuranceCompanyURL /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InsuranceCompanyID.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyID" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyID>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InsuranceCompanyID)) OR trim(arguments.InsuranceCompanyID) EQ "">
			<cfset variables.InsuranceCompanyID = arguments.InsuranceCompanyID />
		<cfelse>
			<cfthrow message="InsuranceCompanyID (#arguments.InsuranceCompanyID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OCNANumber.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOCNANumber" acess="public" output="false" returntype="any">
		<cfreturn variables.OCNANumber>
	</cffunction>
	
	<cffunction name="setOCNANumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OCNANumber" required="true" type="any" />
			
		<cfset variables.OCNANumber = arguments.OCNANumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OCNANumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InsuranceCompanyName.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyName" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyName>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyName" required="true" type="any" />
			
		<cfset variables.InsuranceCompanyName = arguments.InsuranceCompanyName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InsuranceCompanyDBA.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyDBA" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyDBA>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyDBA" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyDBA" required="true" type="any" />
			
		<cfset variables.InsuranceCompanyDBA = arguments.InsuranceCompanyDBA />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyDBA") />		
		
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
	<!--- GET and SET methods for InsuranceCompanyURL.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInsuranceCompanyURL" acess="public" output="false" returntype="any">
		<cfreturn variables.InsuranceCompanyURL>
	</cffunction>
	
	<cffunction name="setInsuranceCompanyURL" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InsuranceCompanyURL" required="true" type="any" />
			
		<cfset variables.InsuranceCompanyURL = arguments.InsuranceCompanyURL />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InsuranceCompanyURL") />		
		
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
				 		
		<cfif this.getInsuranceCompanyID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getInsuranceCompanyID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInsuranceCompany" output="false" access="public" returntype="query">
				
		<cfargument name="InsuranceCompanyID" required="yes" type="numeric" />		
		<cfset var qGetInsuranceCompany = "" />		
	
		<cfquery name="qGetInsuranceCompany" datasource="#trim(variables.ds)#">
	  		SELECT InsuranceCompanyID,ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,Active,InactiveCode,DateCreated,DateModified
			FROM insurancecompany  
			WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.InsuranceCompanyID)#" /> 
		</cfquery>
		
		<cfreturn qGetInsuranceCompany>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="InsuranceCompanyActive" />
		
		<cfset var qCreateInsuranceCompany = "" />		
		
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localOCNANumber = arguments.obj.getOCNANumber() />
		<cfset var localInsuranceCompanyName = arguments.obj.getInsuranceCompanyName() />
		<cfset var localInsuranceCompanyDBA = arguments.obj.getInsuranceCompanyDBA() />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localInsuranceCompanyURL = arguments.obj.getInsuranceCompanyURL() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateInsuranceCompany" datasource="#trim(variables.ds)#">
				INSERT INTO insurancecompany (ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localOCNANumber) NEQ "" AND trim(localOCNANumber) NEQ "@@" AND trim(localOCNANumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localOCNANumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInsuranceCompanyName) NEQ "" AND trim(localInsuranceCompanyName) NEQ "@@" AND trim(localInsuranceCompanyName) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localInsuranceCompanyDBA) NEQ "" AND trim(localInsuranceCompanyDBA) NEQ "@@" AND trim(localInsuranceCompanyDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyDBA)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localInsuranceCompanyURL) NEQ "" AND trim(localInsuranceCompanyURL) NEQ "@@" AND trim(localInsuranceCompanyURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyURL)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS InsuranceCompanyID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateInsuranceCompany.InsuranceCompanyID);
			arguments.obj.setInsuranceCompanyID(qCreateInsuranceCompany.InsuranceCompanyID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="InsuranceCompanyActive">
				
		<cfargument name="InsuranceCompanyID" required="yes" type="numeric" />		
		<cfset var qGetInsuranceCompany = "" />		
		
		<cfset qGetInsuranceCompany = getInsuranceCompany(trim(InsuranceCompanyID)) />
				
		<cfif qGetInsuranceCompany.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setInsuranceCompanyID(qGetInsuranceCompany.InsuranceCompanyID);
			this.setClientID(qGetInsuranceCompany.ClientID);
			this.setOCNANumber(qGetInsuranceCompany.OCNANumber);
			this.setInsuranceCompanyName(qGetInsuranceCompany.InsuranceCompanyName);
			this.setInsuranceCompanyDBA(qGetInsuranceCompany.InsuranceCompanyDBA);
			this.setEntityID(qGetInsuranceCompany.EntityID);
			this.setInsuranceCompanyURL(qGetInsuranceCompany.InsuranceCompanyURL);
			this.setActive(qGetInsuranceCompany.Active);
			this.setInactiveCode(qGetInsuranceCompany.InactiveCode);
			this.setDateCreated(qGetInsuranceCompany.DateCreated);
			this.setDateModified(qGetInsuranceCompany.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="InsuranceCompanyActive" />
		<cfset var qUpdateInsuranceCompany = "" />
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localOCNANumber = arguments.obj.getOCNANumber() />
		<cfset var localInsuranceCompanyName = arguments.obj.getInsuranceCompanyName() />
		<cfset var localInsuranceCompanyDBA = arguments.obj.getInsuranceCompanyDBA() />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localInsuranceCompanyURL = arguments.obj.getInsuranceCompanyURL() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateInsuranceCompany" datasource="#trim(variables.ds)#">
				UPDATE insurancecompany  SET
					
					ClientID =				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					OCNANumber =	
					<cfif trim(localOCNANumber) NEQ "" AND trim(localOCNANumber) NEQ "@@" AND trim(localOCNANumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localOCNANumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InsuranceCompanyName =	
					<cfif trim(localInsuranceCompanyName) NEQ "" AND trim(localInsuranceCompanyName) NEQ "@@" AND trim(localInsuranceCompanyName) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InsuranceCompanyDBA =	
					<cfif trim(localInsuranceCompanyDBA) NEQ "" AND trim(localInsuranceCompanyDBA) NEQ "@@" AND trim(localInsuranceCompanyDBA) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyDBA)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntityID =				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					InsuranceCompanyURL =	
					<cfif trim(localInsuranceCompanyURL) NEQ "" AND trim(localInsuranceCompanyURL) NEQ "@@" AND trim(localInsuranceCompanyURL) NEQ "NULL">						
						<cfqueryparam value="#trim(localInsuranceCompanyURL)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE InsuranceCompanyID = <cfqueryparam value="#trim(arguments.obj.getInsuranceCompanyID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="InsuranceCompanyActive" />
		<cfset var qDeleteInsuranceCompany = "">

		<cfquery name="qDeleteInsuranceCompany" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM insurancecompany
			WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getInsuranceCompanyID())#" /> 
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





