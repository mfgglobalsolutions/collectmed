 	


<cfcomponent name="doctorActive" output="false" alias="doctorActive">

	<cfproperty name="DoctorID" type="numeric" default="0" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="ClientDoctorID" type="string" default="" />
	<cfproperty name="DoctorCategory" type="string" default="" />
	<cfproperty name="UPIN" type="string" default="" />
	<cfproperty name="MedicareNumber" type="string" default="" />
	<cfproperty name="MedicaidNumber" type="string" default="" />
	<cfproperty name="GroupName" type="string" default="" />
	<cfproperty name="SpecialInstructions" type="string" default="" />
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
		variables.DoctorID = 0;
		variables.EntityID = "";
		variables.ClientDoctorID = "";
		variables.DoctorCategory = "";
		variables.UPIN = "";
		variables.MedicareNumber = "";
		variables.MedicaidNumber = "";
		variables.GroupName = "";
		variables.SpecialInstructions = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="doctorActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "DoctorID") AND stValues.DoctorID NEQ 0>
				<cfquery name="qGetDoctor" datasource="#trim(variables.ds)#">
			  		SELECT DoctorID,EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified
					FROM Doctor  
					WHERE DoctorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.DoctorID#" /> 
				</cfquery>		
				<cfif qGetDoctor.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.EntityID = qGetDoctor.EntityID;
					variables.ClientDoctorID = qGetDoctor.ClientDoctorID;
					variables.DoctorCategory = qGetDoctor.DoctorCategory;
					variables.UPIN = qGetDoctor.UPIN;
					variables.MedicareNumber = qGetDoctor.MedicareNumber;
					variables.MedicaidNumber = qGetDoctor.MedicaidNumber;
					variables.GroupName = qGetDoctor.GroupName;
					variables.SpecialInstructions = qGetDoctor.SpecialInstructions;
					variables.Active = qGetDoctor.Active;
					variables.InactiveCode = qGetDoctor.InactiveCode;
					variables.DateModified = qGetDoctor.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "DoctorID")><cfset variables.DoctorID = stValues.DoctorID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "ClientDoctorID")><cfset variables.ClientDoctorID = stValues.ClientDoctorID /></cfif>
			<cfif StructKeyExists(stValues, "DoctorCategory")><cfset variables.DoctorCategory = stValues.DoctorCategory /></cfif>
			<cfif StructKeyExists(stValues, "UPIN")><cfset variables.UPIN = stValues.UPIN /></cfif>
			<cfif StructKeyExists(stValues, "MedicareNumber")><cfset variables.MedicareNumber = stValues.MedicareNumber /></cfif>
			<cfif StructKeyExists(stValues, "MedicaidNumber")><cfset variables.MedicaidNumber = stValues.MedicaidNumber /></cfif>
			<cfif StructKeyExists(stValues, "GroupName")><cfset variables.GroupName = stValues.GroupName /></cfif>
			<cfif StructKeyExists(stValues, "SpecialInstructions")><cfset variables.SpecialInstructions = stValues.SpecialInstructions /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DoctorID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDoctorID" acess="public" output="false" returntype="any">
		<cfreturn variables.DoctorID>
	</cffunction>
	
	<cffunction name="setDoctorID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DoctorID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.DoctorID)) OR trim(arguments.DoctorID) EQ "">
			<cfset variables.DoctorID = arguments.DoctorID />
		<cfelse>
			<cfthrow message="DoctorID (#arguments.DoctorID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DoctorID") />		
		
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
	<!--- GET and SET methods for ClientDoctorID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientDoctorID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientDoctorID>
	</cffunction>
	
	<cffunction name="setClientDoctorID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientDoctorID" required="true" type="any" />
			
		<cfset variables.ClientDoctorID = arguments.ClientDoctorID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientDoctorID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DoctorCategory.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDoctorCategory" acess="public" output="false" returntype="any">
		<cfreturn variables.DoctorCategory>
	</cffunction>
	
	<cffunction name="setDoctorCategory" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DoctorCategory" required="true" type="any" />
			
		<cfset variables.DoctorCategory = arguments.DoctorCategory />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DoctorCategory") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UPIN.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUPIN" acess="public" output="false" returntype="any">
		<cfreturn variables.UPIN>
	</cffunction>
	
	<cffunction name="setUPIN" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UPIN" required="true" type="any" />
			
		<cfset variables.UPIN = arguments.UPIN />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UPIN") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MedicareNumber.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMedicareNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.MedicareNumber>
	</cffunction>
	
	<cffunction name="setMedicareNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MedicareNumber" required="true" type="any" />
			
		<cfset variables.MedicareNumber = arguments.MedicareNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MedicareNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MedicaidNumber.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMedicaidNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.MedicaidNumber>
	</cffunction>
	
	<cffunction name="setMedicaidNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MedicaidNumber" required="true" type="any" />
			
		<cfset variables.MedicaidNumber = arguments.MedicaidNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MedicaidNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for GroupName.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getGroupName" acess="public" output="false" returntype="any">
		<cfreturn variables.GroupName>
	</cffunction>
	
	<cffunction name="setGroupName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="GroupName" required="true" type="any" />
			
		<cfset variables.GroupName = arguments.GroupName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "GroupName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SpecialInstructions.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSpecialInstructions" acess="public" output="false" returntype="any">
		<cfreturn variables.SpecialInstructions>
	</cffunction>
	
	<cffunction name="setSpecialInstructions" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SpecialInstructions" required="true" type="any" />
			
		<cfset variables.SpecialInstructions = arguments.SpecialInstructions />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SpecialInstructions") />		
		
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
				 		
		<cfif this.getDoctorID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getDoctorID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDoctor" output="false" access="public" returntype="query">
				
		<cfargument name="DoctorID" required="yes" type="numeric" />		
		<cfset var qGetDoctor = "" />		
	
		<cfquery name="qGetDoctor" datasource="#trim(variables.ds)#">
	  		SELECT DoctorID,EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified
			FROM Doctor  
			WHERE DoctorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.DoctorID)#" /> 
		</cfquery>
		
		<cfreturn qGetDoctor>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="DoctorActive" />
		
		<cfset var qCreateDoctor = "" />		
		
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localClientDoctorID = arguments.obj.getClientDoctorID() />
		<cfset var localDoctorCategory = arguments.obj.getDoctorCategory() />
		<cfset var localUPIN = arguments.obj.getUPIN() />
		<cfset var localMedicareNumber = arguments.obj.getMedicareNumber() />
		<cfset var localMedicaidNumber = arguments.obj.getMedicaidNumber() />
		<cfset var localGroupName = arguments.obj.getGroupName() />
		<cfset var localSpecialInstructions = arguments.obj.getSpecialInstructions() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateDoctor" datasource="#trim(variables.ds)#">
				INSERT INTO Doctor (EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localClientDoctorID) NEQ "" AND trim(localClientDoctorID) NEQ "@@" AND trim(localClientDoctorID) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientDoctorID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localDoctorCategory) NEQ "" AND trim(localDoctorCategory) NEQ "@@" AND trim(localDoctorCategory) NEQ "NULL">						
						<cfqueryparam value="#trim(localDoctorCategory)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localUPIN) NEQ "" AND trim(localUPIN) NEQ "@@" AND trim(localUPIN) NEQ "NULL">						
						<cfqueryparam value="#trim(localUPIN)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMedicareNumber) NEQ "" AND trim(localMedicareNumber) NEQ "@@" AND trim(localMedicareNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localMedicareNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMedicaidNumber) NEQ "" AND trim(localMedicaidNumber) NEQ "@@" AND trim(localMedicaidNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localMedicaidNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localGroupName) NEQ "" AND trim(localGroupName) NEQ "@@" AND trim(localGroupName) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localSpecialInstructions) NEQ "" AND trim(localSpecialInstructions) NEQ "@@" AND trim(localSpecialInstructions) NEQ "NULL">						
						<cfqueryparam value="#trim(localSpecialInstructions)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS DoctorID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateDoctor.DoctorID);
			arguments.obj.setDoctorID(qCreateDoctor.DoctorID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="DoctorActive">
				
		<cfargument name="DoctorID" required="yes" type="numeric" />		
		<cfset var qGetDoctor = "" />		
		
		<cfset qGetDoctor = getDoctor(trim(DoctorID)) />
				
		<cfif qGetDoctor.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setDoctorID(qGetDoctor.DoctorID);
			this.setEntityID(qGetDoctor.EntityID);
			this.setClientDoctorID(qGetDoctor.ClientDoctorID);
			this.setDoctorCategory(qGetDoctor.DoctorCategory);
			this.setUPIN(qGetDoctor.UPIN);
			this.setMedicareNumber(qGetDoctor.MedicareNumber);
			this.setMedicaidNumber(qGetDoctor.MedicaidNumber);
			this.setGroupName(qGetDoctor.GroupName);
			this.setSpecialInstructions(qGetDoctor.SpecialInstructions);
			this.setActive(qGetDoctor.Active);
			this.setInactiveCode(qGetDoctor.InactiveCode);
			this.setDateCreated(qGetDoctor.DateCreated);
			this.setDateModified(qGetDoctor.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="DoctorActive" />
		<cfset var qUpdateDoctor = "" />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localClientDoctorID = arguments.obj.getClientDoctorID() />
		<cfset var localDoctorCategory = arguments.obj.getDoctorCategory() />
		<cfset var localUPIN = arguments.obj.getUPIN() />
		<cfset var localMedicareNumber = arguments.obj.getMedicareNumber() />
		<cfset var localMedicaidNumber = arguments.obj.getMedicaidNumber() />
		<cfset var localGroupName = arguments.obj.getGroupName() />
		<cfset var localSpecialInstructions = arguments.obj.getSpecialInstructions() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateDoctor" datasource="#trim(variables.ds)#">
				UPDATE Doctor  SET
					
					EntityID =				
					<cfif IsNumeric(trim(localEntityID))>						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClientDoctorID =	
					<cfif trim(localClientDoctorID) NEQ "" AND trim(localClientDoctorID) NEQ "@@" AND trim(localClientDoctorID) NEQ "NULL">						
						<cfqueryparam value="#trim(localClientDoctorID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					DoctorCategory =	
					<cfif trim(localDoctorCategory) NEQ "" AND trim(localDoctorCategory) NEQ "@@" AND trim(localDoctorCategory) NEQ "NULL">						
						<cfqueryparam value="#trim(localDoctorCategory)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					UPIN =	
					<cfif trim(localUPIN) NEQ "" AND trim(localUPIN) NEQ "@@" AND trim(localUPIN) NEQ "NULL">						
						<cfqueryparam value="#trim(localUPIN)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MedicareNumber =	
					<cfif trim(localMedicareNumber) NEQ "" AND trim(localMedicareNumber) NEQ "@@" AND trim(localMedicareNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localMedicareNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MedicaidNumber =	
					<cfif trim(localMedicaidNumber) NEQ "" AND trim(localMedicaidNumber) NEQ "@@" AND trim(localMedicaidNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localMedicaidNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					GroupName =	
					<cfif trim(localGroupName) NEQ "" AND trim(localGroupName) NEQ "@@" AND trim(localGroupName) NEQ "NULL">						
						<cfqueryparam value="#trim(localGroupName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SpecialInstructions =	
					<cfif trim(localSpecialInstructions) NEQ "" AND trim(localSpecialInstructions) NEQ "@@" AND trim(localSpecialInstructions) NEQ "NULL">						
						<cfqueryparam value="#trim(localSpecialInstructions)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE DoctorID = <cfqueryparam value="#trim(arguments.obj.getDoctorID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="DoctorActive" />
		<cfset var qDeleteDoctor = "">

		<cfquery name="qDeleteDoctor" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Doctor
			WHERE DoctorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getDoctorID())#" /> 
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


