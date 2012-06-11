 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IMChatBean" />
		
		<cfset var qCreateIMChat = "" />		
		
		<cfset var localUsersIDFrom = arguments.bean.getUsersIDFrom() />
		<cfset var localFromActive = arguments.bean.getFromActive() />
		<cfset var localUsersIDTo = arguments.bean.getUsersIDTo() />
		<cfset var localToActive = arguments.bean.getToActive() />
		<cfset var localUsersIDJoined1 = arguments.bean.getUsersIDJoined1() />
		<cfset var localJoined1Active = arguments.bean.getJoined1Active() />
		<cfset var localUsersIDJoined2 = arguments.bean.getUsersIDJoined2() />
		<cfset var localJoined2Active = arguments.bean.getJoined2Active() />
		<cfset var localUsersIDJoined3 = arguments.bean.getUsersIDJoined3() />
		<cfset var localJoined3Active = arguments.bean.getJoined3Active() />
		<cfset var localIMChatXML = arguments.bean.getIMChatXML() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateIMChat" datasource="#trim(arguments.ds)#">
				INSERT INTO imchat (UsersIDFrom,FromActive,UsersIDTo,ToActive,UsersIDJoined1,Joined1Active,UsersIDJoined2,Joined2Active,UsersIDJoined3,Joined3Active,IMChatXML,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localUsersIDFrom)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localFromActive)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localUsersIDTo)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localToActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localUsersIDJoined1))>						
						<cfqueryparam value="#trim(localUsersIDJoined1)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localJoined1Active) NEQ "" AND trim(localJoined1Active) NEQ "@@" AND trim(localJoined1Active) NEQ "NULL">						
						<cfqueryparam value="#trim(localJoined1Active)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localUsersIDJoined2))>						
						<cfqueryparam value="#trim(localUsersIDJoined2)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localJoined2Active) NEQ "" AND trim(localJoined2Active) NEQ "@@" AND trim(localJoined2Active) NEQ "NULL">						
						<cfqueryparam value="#trim(localJoined2Active)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localUsersIDJoined3))>						
						<cfqueryparam value="#trim(localUsersIDJoined3)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localJoined3Active) NEQ "" AND trim(localJoined3Active) NEQ "@@" AND trim(localJoined3Active) NEQ "NULL">						
						<cfqueryparam value="#trim(localJoined3Active)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localIMChatXML) NEQ "" AND trim(localIMChatXML) NEQ "@@" AND trim(localIMChatXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localIMChatXML)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS RecordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setRecordID(qCreateIMChat.RecordID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IMChatBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetIMChat = "" />		
		
		<cfset qGetIMChat = getIMChat(trim(arguments.ds), trim(IMChatID)) />
				
		<cfif qGetIMChat.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objIMChat = createObject("component", "IMChatBean").init(arguments.ds);
			objIMChat.setRecordID(qGetIMChat.RecordID);
			objIMChat.setUsersIDFrom(qGetIMChat.UsersIDFrom);
			objIMChat.setFromActive(qGetIMChat.FromActive);
			objIMChat.setUsersIDTo(qGetIMChat.UsersIDTo);
			objIMChat.setToActive(qGetIMChat.ToActive);
			objIMChat.setUsersIDJoined1(qGetIMChat.UsersIDJoined1);
			objIMChat.setJoined1Active(qGetIMChat.Joined1Active);
			objIMChat.setUsersIDJoined2(qGetIMChat.UsersIDJoined2);
			objIMChat.setJoined2Active(qGetIMChat.Joined2Active);
			objIMChat.setUsersIDJoined3(qGetIMChat.UsersIDJoined3);
			objIMChat.setJoined3Active(qGetIMChat.Joined3Active);
			objIMChat.setIMChatXML(qGetIMChat.IMChatXML);
			objIMChat.setActive(qGetIMChat.Active);
			objIMChat.setInactiveCode(qGetIMChat.InactiveCode);
			objIMChat.setDateCreated(qGetIMChat.DateCreated);
			objIMChat.setDateModified(qGetIMChat.DateModified);				
			return objIMChat;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IMChatBean" />
		<cfset var qUpdateIMChat = "" />
		<cfset var localUsersIDFrom = arguments.bean.getUsersIDFrom() />
		<cfset var localFromActive = arguments.bean.getFromActive() />
		<cfset var localUsersIDTo = arguments.bean.getUsersIDTo() />
		<cfset var localToActive = arguments.bean.getToActive() />
		<cfset var localUsersIDJoined1 = arguments.bean.getUsersIDJoined1() />
		<cfset var localJoined1Active = arguments.bean.getJoined1Active() />
		<cfset var localUsersIDJoined2 = arguments.bean.getUsersIDJoined2() />
		<cfset var localJoined2Active = arguments.bean.getJoined2Active() />
		<cfset var localUsersIDJoined3 = arguments.bean.getUsersIDJoined3() />
		<cfset var localJoined3Active = arguments.bean.getJoined3Active() />
		<cfset var localIMChatXML = arguments.bean.getIMChatXML() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateIMChat" datasource="#trim(arguments.ds)#">
				UPDATE imchat  SET
					
					UsersIDFrom =						
						<cfqueryparam value="#trim(localUsersIDFrom)#" cfsqltype="CF_SQL_INTEGER" />,
					
					FromActive =						
						<cfqueryparam value="#trim(localFromActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					UsersIDTo =						
						<cfqueryparam value="#trim(localUsersIDTo)#" cfsqltype="CF_SQL_INTEGER" />,
					
					ToActive =						
						<cfqueryparam value="#trim(localToActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					UsersIDJoined1 =				
					<cfif IsNumeric(trim(localUsersIDJoined1))>						
						<cfqueryparam value="#trim(localUsersIDJoined1)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Joined1Active =	
					<cfif trim(localJoined1Active) NEQ "" AND trim(localJoined1Active) NEQ "@@" AND trim(localJoined1Active) NEQ "NULL">						
						<cfqueryparam value="#trim(localJoined1Active)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					UsersIDJoined2 =				
					<cfif IsNumeric(trim(localUsersIDJoined2))>						
						<cfqueryparam value="#trim(localUsersIDJoined2)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Joined2Active =	
					<cfif trim(localJoined2Active) NEQ "" AND trim(localJoined2Active) NEQ "@@" AND trim(localJoined2Active) NEQ "NULL">						
						<cfqueryparam value="#trim(localJoined2Active)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					UsersIDJoined3 =				
					<cfif IsNumeric(trim(localUsersIDJoined3))>						
						<cfqueryparam value="#trim(localUsersIDJoined3)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Joined3Active =	
					<cfif trim(localJoined3Active) NEQ "" AND trim(localJoined3Active) NEQ "@@" AND trim(localJoined3Active) NEQ "NULL">						
						<cfqueryparam value="#trim(localJoined3Active)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					IMChatXML =	
					<cfif trim(localIMChatXML) NEQ "" AND trim(localIMChatXML) NEQ "@@" AND trim(localIMChatXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localIMChatXML)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.bean.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IMChatBean" />
		<cfset var qDeleteIMChat = "">

		<cfquery name="qDeleteIMChat" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM imchat
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getRecordID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIMChat" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="IMChatID" required="yes" type="numeric" />		
		<cfset var qGetIMChat = "" />		
	
		<cfquery name="qGetIMChat" datasource="#trim(arguments.ds)#">
	  		SELECT RecordID,UsersIDFrom,FromActive,UsersIDTo,ToActive,UsersIDJoined1,Joined1Active,UsersIDJoined2,Joined2Active,UsersIDJoined3,Joined3Active,IMChatXML,Active,InactiveCode,DateCreated,DateModified
			FROM imchat  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetIMChat>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





