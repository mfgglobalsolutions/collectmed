 	


<cfcomponent name="claim_processxmltodbActive" output="false" alias="claim_processxmltodbActive">

	<cfproperty name="Claim_ProcessXMLToDBID" type="numeric" default="0" />
	<cfproperty name="InterchangeID" type="numeric" default="" />
	<cfproperty name="ClaimXML" type="string" default="" />
	<cfproperty name="ProviderID" type="string" default="" />
	<cfproperty name="PatientID" type="numeric" default="" />
	<cfproperty name="interchangeClaimID" type="string" default="" />
	<cfproperty name="PossiblePatientID" type="string" default="" />
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
		variables.Claim_ProcessXMLToDBID = 0;
		variables.InterchangeID = "";
		variables.ClaimXML = "";
		variables.ProviderID = "";
		variables.PatientID = "";
		variables.interchangeClaimID = "";
		variables.PossiblePatientID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="claim_processxmltodbActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "Claim_ProcessXMLToDBID") AND stValues.Claim_ProcessXMLToDBID NEQ 0>
				<cfquery name="qGetClaim_ProcessXMLToDB" datasource="#trim(variables.ds)#">
			  		SELECT Claim_ProcessXMLToDBID,InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode,DateCreated,DateModified
					FROM Claim_ProcessXMLToDB  
					WHERE Claim_ProcessXMLToDBID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.Claim_ProcessXMLToDBID#" /> 
				</cfquery>		
				<cfif qGetClaim_ProcessXMLToDB.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.InterchangeID = qGetClaim_ProcessXMLToDB.InterchangeID;
					variables.ClaimXML = qGetClaim_ProcessXMLToDB.ClaimXML;
					variables.ProviderID = qGetClaim_ProcessXMLToDB.ProviderID;
					variables.PatientID = qGetClaim_ProcessXMLToDB.PatientID;
					variables.interchangeClaimID = qGetClaim_ProcessXMLToDB.interchangeClaimID;
					variables.PossiblePatientID = qGetClaim_ProcessXMLToDB.PossiblePatientID;
					variables.Active = qGetClaim_ProcessXMLToDB.Active;
					variables.InactiveCode = qGetClaim_ProcessXMLToDB.InactiveCode;
					variables.DateModified = qGetClaim_ProcessXMLToDB.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "Claim_ProcessXMLToDBID")><cfset variables.Claim_ProcessXMLToDBID = stValues.Claim_ProcessXMLToDBID /></cfif>
			<cfif StructKeyExists(stValues, "InterchangeID")><cfset variables.InterchangeID = stValues.InterchangeID /></cfif>
			<cfif StructKeyExists(stValues, "ClaimXML")><cfset variables.ClaimXML = stValues.ClaimXML /></cfif>
			<cfif StructKeyExists(stValues, "ProviderID")><cfset variables.ProviderID = stValues.ProviderID /></cfif>
			<cfif StructKeyExists(stValues, "PatientID")><cfset variables.PatientID = stValues.PatientID /></cfif>
			<cfif StructKeyExists(stValues, "interchangeClaimID")><cfset variables.interchangeClaimID = stValues.interchangeClaimID /></cfif>
			<cfif StructKeyExists(stValues, "PossiblePatientID")><cfset variables.PossiblePatientID = stValues.PossiblePatientID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Claim_ProcessXMLToDBID.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaim_ProcessXMLToDBID" acess="public" output="false" returntype="any">
		<cfreturn variables.Claim_ProcessXMLToDBID>
	</cffunction>
	
	<cffunction name="setClaim_ProcessXMLToDBID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Claim_ProcessXMLToDBID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Claim_ProcessXMLToDBID)) OR trim(arguments.Claim_ProcessXMLToDBID) EQ "">
			<cfset variables.Claim_ProcessXMLToDBID = arguments.Claim_ProcessXMLToDBID />
		<cfelse>
			<cfthrow message="Claim_ProcessXMLToDBID (#arguments.Claim_ProcessXMLToDBID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Claim_ProcessXMLToDBID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InterchangeID.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInterchangeID" acess="public" output="false" returntype="any">
		<cfreturn variables.InterchangeID>
	</cffunction>
	
	<cffunction name="setInterchangeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InterchangeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InterchangeID)) OR trim(arguments.InterchangeID) EQ "">
			<cfset variables.InterchangeID = arguments.InterchangeID />
		<cfelse>
			<cfthrow message="InterchangeID (#arguments.InterchangeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InterchangeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClaimXML.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClaimXML" acess="public" output="false" returntype="any">
		<cfreturn variables.ClaimXML>
	</cffunction>
	
	<cffunction name="setClaimXML" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClaimXML" required="true" type="any" />
			
		<cfset variables.ClaimXML = arguments.ClaimXML />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClaimXML") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ProviderID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProviderID" acess="public" output="false" returntype="any">
		<cfreturn variables.ProviderID>
	</cffunction>
	
	<cffunction name="setProviderID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ProviderID" required="true" type="any" />
			
		<cfset variables.ProviderID = arguments.ProviderID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ProviderID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PatientID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPatientID" acess="public" output="false" returntype="any">
		<cfreturn variables.PatientID>
	</cffunction>
	
	<cffunction name="setPatientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PatientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PatientID)) OR trim(arguments.PatientID) EQ "">
			<cfset variables.PatientID = arguments.PatientID />
		<cfelse>
			<cfthrow message="PatientID (#arguments.PatientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PatientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for interchangeClaimID.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getinterchangeClaimID" acess="public" output="false" returntype="any">
		<cfreturn variables.interchangeClaimID>
	</cffunction>
	
	<cffunction name="setinterchangeClaimID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="interchangeClaimID" required="true" type="any" />
			
		<cfset variables.interchangeClaimID = arguments.interchangeClaimID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "interchangeClaimID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PossiblePatientID.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPossiblePatientID" acess="public" output="false" returntype="any">
		<cfreturn variables.PossiblePatientID>
	</cffunction>
	
	<cffunction name="setPossiblePatientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PossiblePatientID" required="true" type="any" />
			
		<cfset variables.PossiblePatientID = arguments.PossiblePatientID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PossiblePatientID") />		
		
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
				 		
		<cfif this.getClaim_ProcessXMLToDBID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getClaim_ProcessXMLToDBID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaim_ProcessXMLToDB" output="false" access="public" returntype="query">
				
		<cfargument name="Claim_ProcessXMLToDBID" required="yes" type="numeric" />		
		<cfset var qGetClaim_ProcessXMLToDB = "" />		
	
		<cfquery name="qGetClaim_ProcessXMLToDB" datasource="#trim(variables.ds)#">
	  		SELECT Claim_ProcessXMLToDBID,InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,Active,InactiveCode,DateCreated,DateModified
			FROM Claim_ProcessXMLToDB  
			WHERE Claim_ProcessXMLToDBID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.Claim_ProcessXMLToDBID)#" /> 
		</cfquery>
		
		<cfreturn qGetClaim_ProcessXMLToDB>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Claim_ProcessXMLToDBActive" />
		
		<cfset var qCreateClaim_ProcessXMLToDB = "" />		
		
		<cfset var localInterchangeID = arguments.obj.getInterchangeID() />
		<cfset var localClaimXML = arguments.obj.getClaimXML() />
		<cfset var localProviderID = arguments.obj.getProviderID() />
		<cfset var localPatientID = arguments.obj.getPatientID() />
		<cfset var localinterchangeClaimID = arguments.obj.getinterchangeClaimID() />
		<cfset var localPossiblePatientID = arguments.obj.getPossiblePatientID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateClaim_ProcessXMLToDB" datasource="#trim(variables.ds)#">
				INSERT INTO Claim_ProcessXMLToDB (InterchangeID,ClaimXML,ProviderID,PatientID,interchangeClaimID,PossiblePatientID,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localInterchangeID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localClaimXML)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localPatientID))>						
						<cfqueryparam value="#trim(localPatientID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localinterchangeClaimID) NEQ "" AND trim(localinterchangeClaimID) NEQ "@@" AND trim(localinterchangeClaimID) NEQ "NULL">						
						<cfqueryparam value="#trim(localinterchangeClaimID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPossiblePatientID) NEQ "" AND trim(localPossiblePatientID) NEQ "@@" AND trim(localPossiblePatientID) NEQ "NULL">						
						<cfqueryparam value="#trim(localPossiblePatientID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS Claim_ProcessXMLToDBID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID);
			arguments.obj.setClaim_ProcessXMLToDBID(qCreateClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="Claim_ProcessXMLToDBActive">
				
		<cfargument name="Claim_ProcessXMLToDBID" required="yes" type="numeric" />		
		<cfset var qGetClaim_ProcessXMLToDB = "" />		
		
		<cfset qGetClaim_ProcessXMLToDB = getClaim_ProcessXMLToDB(trim(Claim_ProcessXMLToDBID)) />
				
		<cfif qGetClaim_ProcessXMLToDB.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setClaim_ProcessXMLToDBID(qGetClaim_ProcessXMLToDB.Claim_ProcessXMLToDBID);
			this.setInterchangeID(qGetClaim_ProcessXMLToDB.InterchangeID);
			this.setClaimXML(qGetClaim_ProcessXMLToDB.ClaimXML);
			this.setProviderID(qGetClaim_ProcessXMLToDB.ProviderID);
			this.setPatientID(qGetClaim_ProcessXMLToDB.PatientID);
			this.setinterchangeClaimID(qGetClaim_ProcessXMLToDB.interchangeClaimID);
			this.setPossiblePatientID(qGetClaim_ProcessXMLToDB.PossiblePatientID);
			this.setActive(qGetClaim_ProcessXMLToDB.Active);
			this.setInactiveCode(qGetClaim_ProcessXMLToDB.InactiveCode);
			this.setDateCreated(qGetClaim_ProcessXMLToDB.DateCreated);
			this.setDateModified(qGetClaim_ProcessXMLToDB.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="Claim_ProcessXMLToDBActive" />
		<cfset var qUpdateClaim_ProcessXMLToDB = "" />
		<cfset var localInterchangeID = arguments.obj.getInterchangeID() />
		<cfset var localClaimXML = arguments.obj.getClaimXML() />
		<cfset var localProviderID = arguments.obj.getProviderID() />
		<cfset var localPatientID = arguments.obj.getPatientID() />
		<cfset var localinterchangeClaimID = arguments.obj.getinterchangeClaimID() />
		<cfset var localPossiblePatientID = arguments.obj.getPossiblePatientID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateClaim_ProcessXMLToDB" datasource="#trim(variables.ds)#">
				UPDATE Claim_ProcessXMLToDB  SET
					
					InterchangeID =						
						<cfqueryparam value="#trim(localInterchangeID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ClaimXML =						
						<cfqueryparam value="#trim(localClaimXML)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ProviderID =	
					<cfif trim(localProviderID) NEQ "" AND trim(localProviderID) NEQ "@@" AND trim(localProviderID) NEQ "NULL">						
						<cfqueryparam value="#trim(localProviderID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PatientID =				
					<cfif IsNumeric(trim(localPatientID))>						
						<cfqueryparam value="#trim(localPatientID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					interchangeClaimID =	
					<cfif trim(localinterchangeClaimID) NEQ "" AND trim(localinterchangeClaimID) NEQ "@@" AND trim(localinterchangeClaimID) NEQ "NULL">						
						<cfqueryparam value="#trim(localinterchangeClaimID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PossiblePatientID =	
					<cfif trim(localPossiblePatientID) NEQ "" AND trim(localPossiblePatientID) NEQ "@@" AND trim(localPossiblePatientID) NEQ "NULL">						
						<cfqueryparam value="#trim(localPossiblePatientID)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE Claim_ProcessXMLToDBID = <cfqueryparam value="#trim(arguments.obj.getClaim_ProcessXMLToDBID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="Claim_ProcessXMLToDBActive" />
		<cfset var qDeleteClaim_ProcessXMLToDB = "">

		<cfquery name="qDeleteClaim_ProcessXMLToDB" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Claim_ProcessXMLToDB
			WHERE Claim_ProcessXMLToDBID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getClaim_ProcessXMLToDBID())#" /> 
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


