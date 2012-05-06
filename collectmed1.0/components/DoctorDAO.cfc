 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DoctorBean" />
		
		<cfset var qCreateDoctor = "" />		
		
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localClientDoctorID = arguments.bean.getClientDoctorID() />
		<cfset var localDoctorCategory = arguments.bean.getDoctorCategory() />
		<cfset var localUPIN = arguments.bean.getUPIN() />
		<cfset var localMedicareNumber = arguments.bean.getMedicareNumber() />
		<cfset var localMedicaidNumber = arguments.bean.getMedicaidNumber() />
		<cfset var localGroupName = arguments.bean.getGroupName() />
		<cfset var localSpecialInstructions = arguments.bean.getSpecialInstructions() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateDoctor" datasource="#trim(arguments.ds)#">
				INSERT INTO Doctor (EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode)
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
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
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
			arguments.bean.setDoctorID(qCreateDoctor.DoctorID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="DoctorBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="DoctorID" required="yes" type="numeric" />		
		<cfset var qGetDoctor = "" />		
		
		<cfset qGetDoctor = getDoctor(trim(arguments.ds), trim(DoctorID)) />
				
		<cfif qGetDoctor.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objDoctor = createObject("component", "DoctorBean").init(arguments.ds);
			objDoctor.setDoctorID(qGetDoctor.DoctorID);
			objDoctor.setEntityID(qGetDoctor.EntityID);
			objDoctor.setClientDoctorID(qGetDoctor.ClientDoctorID);
			objDoctor.setDoctorCategory(qGetDoctor.DoctorCategory);
			objDoctor.setUPIN(qGetDoctor.UPIN);
			objDoctor.setMedicareNumber(qGetDoctor.MedicareNumber);
			objDoctor.setMedicaidNumber(qGetDoctor.MedicaidNumber);
			objDoctor.setGroupName(qGetDoctor.GroupName);
			objDoctor.setSpecialInstructions(qGetDoctor.SpecialInstructions);
			objDoctor.setActive(qGetDoctor.Active);
			objDoctor.setInactiveCode(qGetDoctor.InactiveCode);
			objDoctor.setDateCreated(qGetDoctor.DateCreated);
			objDoctor.setDateModified(qGetDoctor.DateModified);				
			return objDoctor;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DoctorBean" />
		<cfset var qUpdateDoctor = "" />
		<cfset var localEntityID = arguments.bean.getEntityID() />
		<cfset var localClientDoctorID = arguments.bean.getClientDoctorID() />
		<cfset var localDoctorCategory = arguments.bean.getDoctorCategory() />
		<cfset var localUPIN = arguments.bean.getUPIN() />
		<cfset var localMedicareNumber = arguments.bean.getMedicareNumber() />
		<cfset var localMedicaidNumber = arguments.bean.getMedicaidNumber() />
		<cfset var localGroupName = arguments.bean.getGroupName() />
		<cfset var localSpecialInstructions = arguments.bean.getSpecialInstructions() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateDoctor" datasource="#trim(arguments.ds)#">
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
				WHERE DoctorID = <cfqueryparam value="#trim(arguments.bean.getDoctorID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="DoctorBean" />
		<cfset var qDeleteDoctor = "">

		<cfquery name="qDeleteDoctor" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Doctor
			WHERE DoctorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getDoctorID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDoctor" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="DoctorID" required="yes" type="numeric" />		
		<cfset var qGetDoctor = "" />		
	
		<cfquery name="qGetDoctor" datasource="#trim(arguments.ds)#">
	  		SELECT DoctorID,EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified
			FROM Doctor  
			WHERE DoctorID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.DoctorID)#" /> 
		</cfquery>
		
		<cfreturn qGetDoctor>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


