 	


<cfcomponent name="imchatBean" output="false" alias="imchatBean" extends="IMChatDAO">

	<cfproperty name="RecordID" type="numeric" default="0" />
	<cfproperty name="UsersIDFrom" type="numeric" default="" />
	<cfproperty name="FromActive" type="string" default="" />
	<cfproperty name="UsersIDTo" type="numeric" default="" />
	<cfproperty name="ToActive" type="string" default="" />
	<cfproperty name="UsersIDJoined1" type="numeric" default="" />
	<cfproperty name="Joined1Active" type="string" default="" />
	<cfproperty name="UsersIDJoined2" type="numeric" default="" />
	<cfproperty name="Joined2Active" type="string" default="" />
	<cfproperty name="UsersIDJoined3" type="numeric" default="" />
	<cfproperty name="Joined3Active" type="string" default="" />
	<cfproperty name="IMChatXML" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.RecordID = 0;
		variables.UsersIDFrom = "";
		variables.FromActive = "";
		variables.UsersIDTo = "";
		variables.ToActive = "";
		variables.UsersIDJoined1 = "";
		variables.Joined1Active = "";
		variables.UsersIDJoined2 = "";
		variables.Joined2Active = "";
		variables.UsersIDJoined3 = "";
		variables.Joined3Active = "";
		variables.IMChatXML = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="imchatBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RecordID") AND stValues.RecordID NEQ 0>
				<cfquery name="qGetIMChat" datasource="#trim(arguments.ds)#">
			  		SELECT RecordID,UsersIDFrom,FromActive,UsersIDTo,ToActive,UsersIDJoined1,Joined1Active,UsersIDJoined2,Joined2Active,UsersIDJoined3,Joined3Active,IMChatXML,Active,InactiveCode,DateCreated,DateModified
					FROM IMChat  
					WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RecordID#" /> 
				</cfquery>		
				<cfif qGetIMChat.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.UsersIDFrom = qGetIMChat.UsersIDFrom;
					variables.FromActive = qGetIMChat.FromActive;
					variables.UsersIDTo = qGetIMChat.UsersIDTo;
					variables.ToActive = qGetIMChat.ToActive;
					variables.UsersIDJoined1 = qGetIMChat.UsersIDJoined1;
					variables.Joined1Active = qGetIMChat.Joined1Active;
					variables.UsersIDJoined2 = qGetIMChat.UsersIDJoined2;
					variables.Joined2Active = qGetIMChat.Joined2Active;
					variables.UsersIDJoined3 = qGetIMChat.UsersIDJoined3;
					variables.Joined3Active = qGetIMChat.Joined3Active;
					variables.IMChatXML = qGetIMChat.IMChatXML;
					variables.Active = qGetIMChat.Active;
					variables.InactiveCode = qGetIMChat.InactiveCode;
					variables.DateModified = qGetIMChat.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RecordID")><cfset variables.RecordID = stValues.RecordID /></cfif>
			<cfif StructKeyExists(stValues, "UsersIDFrom")><cfset variables.UsersIDFrom = stValues.UsersIDFrom /></cfif>
			<cfif StructKeyExists(stValues, "FromActive")><cfset variables.FromActive = stValues.FromActive /></cfif>
			<cfif StructKeyExists(stValues, "UsersIDTo")><cfset variables.UsersIDTo = stValues.UsersIDTo /></cfif>
			<cfif StructKeyExists(stValues, "ToActive")><cfset variables.ToActive = stValues.ToActive /></cfif>
			<cfif StructKeyExists(stValues, "UsersIDJoined1")><cfset variables.UsersIDJoined1 = stValues.UsersIDJoined1 /></cfif>
			<cfif StructKeyExists(stValues, "Joined1Active")><cfset variables.Joined1Active = stValues.Joined1Active /></cfif>
			<cfif StructKeyExists(stValues, "UsersIDJoined2")><cfset variables.UsersIDJoined2 = stValues.UsersIDJoined2 /></cfif>
			<cfif StructKeyExists(stValues, "Joined2Active")><cfset variables.Joined2Active = stValues.Joined2Active /></cfif>
			<cfif StructKeyExists(stValues, "UsersIDJoined3")><cfset variables.UsersIDJoined3 = stValues.UsersIDJoined3 /></cfif>
			<cfif StructKeyExists(stValues, "Joined3Active")><cfset variables.Joined3Active = stValues.Joined3Active /></cfif>
			<cfif StructKeyExists(stValues, "IMChatXML")><cfset variables.IMChatXML = stValues.IMChatXML /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RecordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.RecordID>
	</cffunction>
	
	<cffunction name="setRecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RecordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RecordID)) OR trim(arguments.RecordID) EQ "">
			<cfset variables.RecordID = arguments.RecordID />
		<cfelse>
			<cfthrow message="RecordID (#arguments.RecordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RecordID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersIDFrom.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersIDFrom" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersIDFrom>
	</cffunction>
	
	<cffunction name="setUsersIDFrom" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersIDFrom" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersIDFrom)) OR trim(arguments.UsersIDFrom) EQ "">
			<cfset variables.UsersIDFrom = arguments.UsersIDFrom />
		<cfelse>
			<cfthrow message="UsersIDFrom (#arguments.UsersIDFrom#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersIDFrom") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FromActive.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFromActive" acess="public" output="false" returntype="any">
		<cfreturn variables.FromActive>
	</cffunction>
	
	<cffunction name="setFromActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FromActive" required="true" type="any" />
			
		<cfset variables.FromActive = arguments.FromActive />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FromActive") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersIDTo.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersIDTo" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersIDTo>
	</cffunction>
	
	<cffunction name="setUsersIDTo" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersIDTo" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersIDTo)) OR trim(arguments.UsersIDTo) EQ "">
			<cfset variables.UsersIDTo = arguments.UsersIDTo />
		<cfelse>
			<cfthrow message="UsersIDTo (#arguments.UsersIDTo#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersIDTo") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ToActive.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getToActive" acess="public" output="false" returntype="any">
		<cfreturn variables.ToActive>
	</cffunction>
	
	<cffunction name="setToActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ToActive" required="true" type="any" />
			
		<cfset variables.ToActive = arguments.ToActive />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ToActive") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersIDJoined1.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersIDJoined1" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersIDJoined1>
	</cffunction>
	
	<cffunction name="setUsersIDJoined1" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersIDJoined1" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersIDJoined1)) OR trim(arguments.UsersIDJoined1) EQ "">
			<cfset variables.UsersIDJoined1 = arguments.UsersIDJoined1 />
		<cfelse>
			<cfthrow message="UsersIDJoined1 (#arguments.UsersIDJoined1#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersIDJoined1") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Joined1Active.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getJoined1Active" acess="public" output="false" returntype="any">
		<cfreturn variables.Joined1Active>
	</cffunction>
	
	<cffunction name="setJoined1Active" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Joined1Active" required="true" type="any" />
			
		<cfset variables.Joined1Active = arguments.Joined1Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Joined1Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersIDJoined2.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersIDJoined2" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersIDJoined2>
	</cffunction>
	
	<cffunction name="setUsersIDJoined2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersIDJoined2" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersIDJoined2)) OR trim(arguments.UsersIDJoined2) EQ "">
			<cfset variables.UsersIDJoined2 = arguments.UsersIDJoined2 />
		<cfelse>
			<cfthrow message="UsersIDJoined2 (#arguments.UsersIDJoined2#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersIDJoined2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Joined2Active.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getJoined2Active" acess="public" output="false" returntype="any">
		<cfreturn variables.Joined2Active>
	</cffunction>
	
	<cffunction name="setJoined2Active" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Joined2Active" required="true" type="any" />
			
		<cfset variables.Joined2Active = arguments.Joined2Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Joined2Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersIDJoined3.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersIDJoined3" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersIDJoined3>
	</cffunction>
	
	<cffunction name="setUsersIDJoined3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersIDJoined3" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersIDJoined3)) OR trim(arguments.UsersIDJoined3) EQ "">
			<cfset variables.UsersIDJoined3 = arguments.UsersIDJoined3 />
		<cfelse>
			<cfthrow message="UsersIDJoined3 (#arguments.UsersIDJoined3#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersIDJoined3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Joined3Active.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getJoined3Active" acess="public" output="false" returntype="any">
		<cfreturn variables.Joined3Active>
	</cffunction>
	
	<cffunction name="setJoined3Active" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Joined3Active" required="true" type="any" />
			
		<cfset variables.Joined3Active = arguments.Joined3Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Joined3Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IMChatXML.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIMChatXML" acess="public" output="false" returntype="any">
		<cfreturn variables.IMChatXML>
	</cffunction>
	
	<cffunction name="setIMChatXML" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IMChatXML" required="true" type="any" />
			
		<cfset variables.IMChatXML = arguments.IMChatXML />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IMChatXML") />		
		
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


