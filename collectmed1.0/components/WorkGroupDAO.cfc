 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="WorkGroupBean" />
		
		<cfset var qCreateWorkGroup = "" />		
		
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localWorkGroupName = arguments.bean.getWorkGroupName() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localMondayStart = arguments.bean.getMondayStart() />
		<cfset var localMondayEnd = arguments.bean.getMondayEnd() />
		<cfset var localTuesdayStart = arguments.bean.getTuesdayStart() />
		<cfset var localTuesdayEnd = arguments.bean.getTuesdayEnd() />
		<cfset var localWednesdayStart = arguments.bean.getWednesdayStart() />
		<cfset var localWednesdayEnd = arguments.bean.getWednesdayEnd() />
		<cfset var localThursdayStart = arguments.bean.getThursdayStart() />
		<cfset var localThursdayEnd = arguments.bean.getThursdayEnd() />
		<cfset var localFridayStart = arguments.bean.getFridayStart() />
		<cfset var localFridayEnd = arguments.bean.getFridayEnd() />
		<cfset var localSaturdayStart = arguments.bean.getSaturdayStart() />
		<cfset var localSaturdayEnd = arguments.bean.getSaturdayEnd() />
		<cfset var localSundayStart = arguments.bean.getSundayStart() />
		<cfset var localSundayEnd = arguments.bean.getSundayEnd() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateWorkGroup" datasource="#trim(arguments.ds)#">
				INSERT INTO workgroup (ClientID,WorkGroupName,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd)
				VALUES (				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localWorkGroupName)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif IsDate(trim(localMondayStart))>						
						<cfqueryparam value="#trim(localMondayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localMondayEnd))>						
						<cfqueryparam value="#trim(localMondayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localTuesdayStart))>						
						<cfqueryparam value="#trim(localTuesdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localTuesdayEnd))>						
						<cfqueryparam value="#trim(localTuesdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localWednesdayStart))>						
						<cfqueryparam value="#trim(localWednesdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localWednesdayEnd))>						
						<cfqueryparam value="#trim(localWednesdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localThursdayStart))>						
						<cfqueryparam value="#trim(localThursdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localThursdayEnd))>						
						<cfqueryparam value="#trim(localThursdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localFridayStart))>						
						<cfqueryparam value="#trim(localFridayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localFridayEnd))>						
						<cfqueryparam value="#trim(localFridayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localSaturdayStart))>						
						<cfqueryparam value="#trim(localSaturdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localSaturdayEnd))>						
						<cfqueryparam value="#trim(localSaturdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localSundayStart))>						
						<cfqueryparam value="#trim(localSundayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localSundayEnd))>						
						<cfqueryparam value="#trim(localSundayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS WorkGroupID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setWorkGroupID(qCreateWorkGroup.WorkGroupID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="WorkGroupBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="WorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetWorkGroup = "" />		
		
		<cfset qGetWorkGroup = getWorkGroup(trim(arguments.ds), trim(WorkGroupID)) />
				
		<cfif qGetWorkGroup.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objWorkGroup = createObject("component", "WorkGroupBean").init(arguments.ds);
			objWorkGroup.setWorkGroupID(qGetWorkGroup.WorkGroupID);
			objWorkGroup.setClientID(qGetWorkGroup.ClientID);
			objWorkGroup.setWorkGroupName(qGetWorkGroup.WorkGroupName);
			objWorkGroup.setDateCreated(qGetWorkGroup.DateCreated);
			objWorkGroup.setDateModified(qGetWorkGroup.DateModified);
			objWorkGroup.setDescription(qGetWorkGroup.Description);
			objWorkGroup.setMondayStart(qGetWorkGroup.MondayStart);
			objWorkGroup.setMondayEnd(qGetWorkGroup.MondayEnd);
			objWorkGroup.setTuesdayStart(qGetWorkGroup.TuesdayStart);
			objWorkGroup.setTuesdayEnd(qGetWorkGroup.TuesdayEnd);
			objWorkGroup.setWednesdayStart(qGetWorkGroup.WednesdayStart);
			objWorkGroup.setWednesdayEnd(qGetWorkGroup.WednesdayEnd);
			objWorkGroup.setThursdayStart(qGetWorkGroup.ThursdayStart);
			objWorkGroup.setThursdayEnd(qGetWorkGroup.ThursdayEnd);
			objWorkGroup.setFridayStart(qGetWorkGroup.FridayStart);
			objWorkGroup.setFridayEnd(qGetWorkGroup.FridayEnd);
			objWorkGroup.setSaturdayStart(qGetWorkGroup.SaturdayStart);
			objWorkGroup.setSaturdayEnd(qGetWorkGroup.SaturdayEnd);
			objWorkGroup.setSundayStart(qGetWorkGroup.SundayStart);
			objWorkGroup.setSundayEnd(qGetWorkGroup.SundayEnd);				
			return objWorkGroup;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="WorkGroupBean" />
		<cfset var qUpdateWorkGroup = "" />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localWorkGroupName = arguments.bean.getWorkGroupName() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
		<cfset var localDescription = arguments.bean.getDescription() />
		<cfset var localMondayStart = arguments.bean.getMondayStart() />
		<cfset var localMondayEnd = arguments.bean.getMondayEnd() />
		<cfset var localTuesdayStart = arguments.bean.getTuesdayStart() />
		<cfset var localTuesdayEnd = arguments.bean.getTuesdayEnd() />
		<cfset var localWednesdayStart = arguments.bean.getWednesdayStart() />
		<cfset var localWednesdayEnd = arguments.bean.getWednesdayEnd() />
		<cfset var localThursdayStart = arguments.bean.getThursdayStart() />
		<cfset var localThursdayEnd = arguments.bean.getThursdayEnd() />
		<cfset var localFridayStart = arguments.bean.getFridayStart() />
		<cfset var localFridayEnd = arguments.bean.getFridayEnd() />
		<cfset var localSaturdayStart = arguments.bean.getSaturdayStart() />
		<cfset var localSaturdayEnd = arguments.bean.getSaturdayEnd() />
		<cfset var localSundayStart = arguments.bean.getSundayStart() />
		<cfset var localSundayEnd = arguments.bean.getSundayEnd() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateWorkGroup" datasource="#trim(arguments.ds)#">
				UPDATE workgroup  SET
					
					ClientID =				
					<cfif IsNumeric(trim(localClientID))>						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					WorkGroupName =						
						<cfqueryparam value="#trim(localWorkGroupName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					Description =	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					MondayStart =	
					<cfif IsDate(trim(localMondayStart))>						
						<cfqueryparam value="#trim(localMondayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					MondayEnd =	
					<cfif IsDate(trim(localMondayEnd))>						
						<cfqueryparam value="#trim(localMondayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					TuesdayStart =	
					<cfif IsDate(trim(localTuesdayStart))>						
						<cfqueryparam value="#trim(localTuesdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					TuesdayEnd =	
					<cfif IsDate(trim(localTuesdayEnd))>						
						<cfqueryparam value="#trim(localTuesdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					WednesdayStart =	
					<cfif IsDate(trim(localWednesdayStart))>						
						<cfqueryparam value="#trim(localWednesdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					WednesdayEnd =	
					<cfif IsDate(trim(localWednesdayEnd))>						
						<cfqueryparam value="#trim(localWednesdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					ThursdayStart =	
					<cfif IsDate(trim(localThursdayStart))>						
						<cfqueryparam value="#trim(localThursdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					ThursdayEnd =	
					<cfif IsDate(trim(localThursdayEnd))>						
						<cfqueryparam value="#trim(localThursdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					FridayStart =	
					<cfif IsDate(trim(localFridayStart))>						
						<cfqueryparam value="#trim(localFridayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					FridayEnd =	
					<cfif IsDate(trim(localFridayEnd))>						
						<cfqueryparam value="#trim(localFridayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					SaturdayStart =	
					<cfif IsDate(trim(localSaturdayStart))>						
						<cfqueryparam value="#trim(localSaturdayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					SaturdayEnd =	
					<cfif IsDate(trim(localSaturdayEnd))>						
						<cfqueryparam value="#trim(localSaturdayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					SundayStart =	
					<cfif IsDate(trim(localSundayStart))>						
						<cfqueryparam value="#trim(localSundayStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					SundayEnd =	
					<cfif IsDate(trim(localSundayEnd))>						
						<cfqueryparam value="#trim(localSundayEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE WorkGroupID = <cfqueryparam value="#trim(arguments.bean.getWorkGroupID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="WorkGroupBean" />
		<cfset var qDeleteWorkGroup = "">

		<cfquery name="qDeleteWorkGroup" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM workgroup
			WHERE WorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getWorkGroupID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getWorkGroup" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="WorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetWorkGroup = "" />		
	
		<cfquery name="qGetWorkGroup" datasource="#trim(arguments.ds)#">
	  		SELECT WorkGroupID,ClientID,WorkGroupName,DateCreated,DateModified,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd
			FROM workgroup  
			WHERE WorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.WorkGroupID)#" /> 
		</cfquery>
		
		<cfreturn qGetWorkGroup>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





