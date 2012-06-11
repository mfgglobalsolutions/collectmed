 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityBean" />
		
		<cfset var qCreateEntity = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localObjectTypeID = arguments.bean.getObjectTypeID() />
		<cfset var localPrefixName = arguments.bean.getPrefixName() />
		<cfset var localFname = arguments.bean.getFname() />
		<cfset var localMname = arguments.bean.getMname() />
		<cfset var localLname = arguments.bean.getLname() />
		<cfset var localSuffixName = arguments.bean.getSuffixName() />
		<cfset var localDOB = arguments.bean.getDOB() />
		<cfset var localSex = arguments.bean.getSex() />
		<cfset var localSSN = arguments.bean.getSSN() />
		<cfset var localMaritalStatus = arguments.bean.getMaritalStatus() />
		<cfset var localEmployerID = arguments.bean.getEmployerID() />
		<cfset var localLanguages = arguments.bean.getLanguages() />
		<cfset var localWeight = arguments.bean.getWeight() />
		<cfset var localHeightInInches = arguments.bean.getHeightInInches() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntity" datasource="#trim(arguments.ds)#">
				INSERT INTO entity (SiteID,ClientID,ObjectTypeID,PrefixName,Fname,Mname,Lname,SuffixName,DOB,Sex,SSN,MaritalStatus,EmployerID,Languages,Weight,HeightInInches,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localObjectTypeID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localPrefixName) NEQ "" AND trim(localPrefixName) NEQ "@@" AND trim(localPrefixName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPrefixName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localFname) NEQ "" AND trim(localFname) NEQ "@@" AND trim(localFname) NEQ "NULL">						
						<cfqueryparam value="#trim(localFname)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localMname) NEQ "" AND trim(localMname) NEQ "@@" AND trim(localMname) NEQ "NULL">						
						<cfqueryparam value="#trim(localMname)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLname) NEQ "" AND trim(localLname) NEQ "@@" AND trim(localLname) NEQ "NULL">						
						<cfqueryparam value="#trim(localLname)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localSuffixName) NEQ "" AND trim(localSuffixName) NEQ "@@" AND trim(localSuffixName) NEQ "NULL">						
						<cfqueryparam value="#trim(localSuffixName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localDOB))>						
						<cfqueryparam value="#trim(localDOB)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,				
					<cfif IsNumeric(trim(localSex))>						
						<cfqueryparam value="#trim(localSex)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localSSN) NEQ "" AND trim(localSSN) NEQ "@@" AND trim(localSSN) NEQ "NULL">						
						<cfqueryparam value="#trim(localSSN)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localMaritalStatus))>						
						<cfqueryparam value="#trim(localMaritalStatus)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localEmployerID))>						
						<cfqueryparam value="#trim(localEmployerID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localLanguages) NEQ "" AND trim(localLanguages) NEQ "@@" AND trim(localLanguages) NEQ "NULL">						
						<cfqueryparam value="#trim(localLanguages)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localWeight))>						
						<cfqueryparam value="#trim(localWeight)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localHeightInInches))>						
						<cfqueryparam value="#trim(localHeightInInches)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS EntityID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setEntityID(qCreateEntity.EntityID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EntityBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityID" required="yes" type="numeric" />		
		<cfset var qGetEntity = "" />		
		
		<cfset qGetEntity = getEntity(trim(arguments.ds), trim(EntityID)) />
				
		<cfif qGetEntity.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objEntity = createObject("component", "EntityBean").init(arguments.ds);
			objEntity.setEntityID(qGetEntity.EntityID);
			objEntity.setSiteID(qGetEntity.SiteID);
			objEntity.setClientID(qGetEntity.ClientID);
			objEntity.setObjectTypeID(qGetEntity.ObjectTypeID);
			objEntity.setPrefixName(qGetEntity.PrefixName);
			objEntity.setFname(qGetEntity.Fname);
			objEntity.setMname(qGetEntity.Mname);
			objEntity.setLname(qGetEntity.Lname);
			objEntity.setSuffixName(qGetEntity.SuffixName);
			objEntity.setDOB(qGetEntity.DOB);
			objEntity.setSex(qGetEntity.Sex);
			objEntity.setSSN(qGetEntity.SSN);
			objEntity.setMaritalStatus(qGetEntity.MaritalStatus);
			objEntity.setEmployerID(qGetEntity.EmployerID);
			objEntity.setLanguages(qGetEntity.Languages);
			objEntity.setWeight(qGetEntity.Weight);
			objEntity.setHeightInInches(qGetEntity.HeightInInches);
			objEntity.setActive(qGetEntity.Active);
			objEntity.setInactiveCode(qGetEntity.InactiveCode);
			objEntity.setDateCreated(qGetEntity.DateCreated);
			objEntity.setDateModified(qGetEntity.DateModified);				
			return objEntity;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityBean" />
		<cfset var qUpdateEntity = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localObjectTypeID = arguments.bean.getObjectTypeID() />
		<cfset var localPrefixName = arguments.bean.getPrefixName() />
		<cfset var localFname = arguments.bean.getFname() />
		<cfset var localMname = arguments.bean.getMname() />
		<cfset var localLname = arguments.bean.getLname() />
		<cfset var localSuffixName = arguments.bean.getSuffixName() />
		<cfset var localDOB = arguments.bean.getDOB() />
		<cfset var localSex = arguments.bean.getSex() />
		<cfset var localSSN = arguments.bean.getSSN() />
		<cfset var localMaritalStatus = arguments.bean.getMaritalStatus() />
		<cfset var localEmployerID = arguments.bean.getEmployerID() />
		<cfset var localLanguages = arguments.bean.getLanguages() />
		<cfset var localWeight = arguments.bean.getWeight() />
		<cfset var localHeightInInches = arguments.bean.getHeightInInches() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEntity" datasource="#trim(arguments.ds)#">
				UPDATE entity  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClientID =				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ObjectTypeID =						
						<cfqueryparam value="#trim(localObjectTypeID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					PrefixName =	
					<cfif trim(localPrefixName) NEQ "" AND trim(localPrefixName) NEQ "@@" AND trim(localPrefixName) NEQ "NULL">						
						<cfqueryparam value="#trim(localPrefixName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Fname =	
					<cfif trim(localFname) NEQ "" AND trim(localFname) NEQ "@@" AND trim(localFname) NEQ "NULL">						
						<cfqueryparam value="#trim(localFname)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Mname =	
					<cfif trim(localMname) NEQ "" AND trim(localMname) NEQ "@@" AND trim(localMname) NEQ "NULL">						
						<cfqueryparam value="#trim(localMname)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Lname =	
					<cfif trim(localLname) NEQ "" AND trim(localLname) NEQ "@@" AND trim(localLname) NEQ "NULL">						
						<cfqueryparam value="#trim(localLname)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SuffixName =	
					<cfif trim(localSuffixName) NEQ "" AND trim(localSuffixName) NEQ "@@" AND trim(localSuffixName) NEQ "NULL">						
						<cfqueryparam value="#trim(localSuffixName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					DOB =	
					<cfif IsDate(trim(localDOB))>						
						<cfqueryparam value="#trim(localDOB)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					Sex =				
					<cfif IsNumeric(trim(localSex))>						
						<cfqueryparam value="#trim(localSex)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					SSN =	
					<cfif trim(localSSN) NEQ "" AND trim(localSSN) NEQ "@@" AND trim(localSSN) NEQ "NULL">						
						<cfqueryparam value="#trim(localSSN)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MaritalStatus =				
					<cfif IsNumeric(trim(localMaritalStatus))>						
						<cfqueryparam value="#trim(localMaritalStatus)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					EmployerID =				
					<cfif IsNumeric(trim(localEmployerID))>						
						<cfqueryparam value="#trim(localEmployerID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Languages =	
					<cfif trim(localLanguages) NEQ "" AND trim(localLanguages) NEQ "@@" AND trim(localLanguages) NEQ "NULL">						
						<cfqueryparam value="#trim(localLanguages)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Weight =				
					<cfif IsNumeric(trim(localWeight))>						
						<cfqueryparam value="#trim(localWeight)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					HeightInInches =				
					<cfif IsNumeric(trim(localHeightInInches))>						
						<cfqueryparam value="#trim(localHeightInInches)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
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
				WHERE EntityID = <cfqueryparam value="#trim(arguments.bean.getEntityID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="EntityBean" />
		<cfset var qDeleteEntity = "">

		<cfquery name="qDeleteEntity" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM entity
			WHERE EntityID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getEntityID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntity" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="EntityID" required="yes" type="numeric" />		
		<cfset var qGetEntity = "" />		
	
		<cfquery name="qGetEntity" datasource="#trim(arguments.ds)#">
	  		SELECT EntityID,SiteID,ClientID,ObjectTypeID,PrefixName,Fname,Mname,Lname,SuffixName,DOB,Sex,SSN,MaritalStatus,EmployerID,Languages,Weight,HeightInInches,Active,InactiveCode,DateCreated,DateModified
			FROM entity  
			WHERE EntityID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntityID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntity>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





