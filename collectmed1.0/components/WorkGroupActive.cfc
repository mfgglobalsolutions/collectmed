 	


<cfcomponent name="workgroupActive" output="false" alias="workgroupActive">

	<cfproperty name="WorkGroupID" type="numeric" default="0" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="WorkGroupName" type="string" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" />
	<cfproperty name="Description" type="string" default="" />
	<cfproperty name="MondayStart" type="datetime" default="" />
	<cfproperty name="MondayEnd" type="datetime" default="" />
	<cfproperty name="TuesdayStart" type="datetime" default="" />
	<cfproperty name="TuesdayEnd" type="datetime" default="" />
	<cfproperty name="WednesdayStart" type="datetime" default="" />
	<cfproperty name="WednesdayEnd" type="datetime" default="" />
	<cfproperty name="ThursdayStart" type="datetime" default="" />
	<cfproperty name="ThursdayEnd" type="datetime" default="" />
	<cfproperty name="FridayStart" type="datetime" default="" />
	<cfproperty name="FridayEnd" type="datetime" default="" />
	<cfproperty name="SaturdayStart" type="datetime" default="" />
	<cfproperty name="SaturdayEnd" type="datetime" default="" />
	<cfproperty name="SundayStart" type="datetime" default="" />
	<cfproperty name="SundayEnd" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.WorkGroupID = 0;
		variables.ClientID = "";
		variables.WorkGroupName = "";
		variables.DateCreated = "";
		variables.DateModified = "";
		variables.Description = "";
		variables.MondayStart = "";
		variables.MondayEnd = "";
		variables.TuesdayStart = "";
		variables.TuesdayEnd = "";
		variables.WednesdayStart = "";
		variables.WednesdayEnd = "";
		variables.ThursdayStart = "";
		variables.ThursdayEnd = "";
		variables.FridayStart = "";
		variables.FridayEnd = "";
		variables.SaturdayStart = "";
		variables.SaturdayEnd = "";
		variables.SundayStart = "";
		variables.SundayEnd = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="workgroupActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "WorkGroupID") AND stValues.WorkGroupID NEQ 0>
				<cfquery name="qGetWorkGroup" datasource="#trim(variables.ds)#">
			  		SELECT WorkGroupID,ClientID,WorkGroupName,DateCreated,DateModified,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd
					FROM workgroup  
					WHERE WorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.WorkGroupID#" /> 
				</cfquery>		
				<cfif qGetWorkGroup.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClientID = qGetWorkGroup.ClientID;
					variables.WorkGroupName = qGetWorkGroup.WorkGroupName;
					variables.DateModified = qGetWorkGroup.DateModified;
					variables.Description = qGetWorkGroup.Description;
					variables.MondayStart = qGetWorkGroup.MondayStart;
					variables.MondayEnd = qGetWorkGroup.MondayEnd;
					variables.TuesdayStart = qGetWorkGroup.TuesdayStart;
					variables.TuesdayEnd = qGetWorkGroup.TuesdayEnd;
					variables.WednesdayStart = qGetWorkGroup.WednesdayStart;
					variables.WednesdayEnd = qGetWorkGroup.WednesdayEnd;
					variables.ThursdayStart = qGetWorkGroup.ThursdayStart;
					variables.ThursdayEnd = qGetWorkGroup.ThursdayEnd;
					variables.FridayStart = qGetWorkGroup.FridayStart;
					variables.FridayEnd = qGetWorkGroup.FridayEnd;
					variables.SaturdayStart = qGetWorkGroup.SaturdayStart;
					variables.SaturdayEnd = qGetWorkGroup.SaturdayEnd;
					variables.SundayStart = qGetWorkGroup.SundayStart;
					variables.SundayEnd = qGetWorkGroup.SundayEnd;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "WorkGroupID")><cfset variables.WorkGroupID = stValues.WorkGroupID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "WorkGroupName")><cfset variables.WorkGroupName = stValues.WorkGroupName /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>
			<cfif StructKeyExists(stValues, "Description")><cfset variables.Description = stValues.Description /></cfif>
			<cfif StructKeyExists(stValues, "MondayStart")><cfset variables.MondayStart = stValues.MondayStart /></cfif>
			<cfif StructKeyExists(stValues, "MondayEnd")><cfset variables.MondayEnd = stValues.MondayEnd /></cfif>
			<cfif StructKeyExists(stValues, "TuesdayStart")><cfset variables.TuesdayStart = stValues.TuesdayStart /></cfif>
			<cfif StructKeyExists(stValues, "TuesdayEnd")><cfset variables.TuesdayEnd = stValues.TuesdayEnd /></cfif>
			<cfif StructKeyExists(stValues, "WednesdayStart")><cfset variables.WednesdayStart = stValues.WednesdayStart /></cfif>
			<cfif StructKeyExists(stValues, "WednesdayEnd")><cfset variables.WednesdayEnd = stValues.WednesdayEnd /></cfif>
			<cfif StructKeyExists(stValues, "ThursdayStart")><cfset variables.ThursdayStart = stValues.ThursdayStart /></cfif>
			<cfif StructKeyExists(stValues, "ThursdayEnd")><cfset variables.ThursdayEnd = stValues.ThursdayEnd /></cfif>
			<cfif StructKeyExists(stValues, "FridayStart")><cfset variables.FridayStart = stValues.FridayStart /></cfif>
			<cfif StructKeyExists(stValues, "FridayEnd")><cfset variables.FridayEnd = stValues.FridayEnd /></cfif>
			<cfif StructKeyExists(stValues, "SaturdayStart")><cfset variables.SaturdayStart = stValues.SaturdayStart /></cfif>
			<cfif StructKeyExists(stValues, "SaturdayEnd")><cfset variables.SaturdayEnd = stValues.SaturdayEnd /></cfif>
			<cfif StructKeyExists(stValues, "SundayStart")><cfset variables.SundayStart = stValues.SundayStart /></cfif>
			<cfif StructKeyExists(stValues, "SundayEnd")><cfset variables.SundayEnd = stValues.SundayEnd /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for WorkGroupID.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getWorkGroupID" acess="public" output="false" returntype="any">
		<cfreturn variables.WorkGroupID>
	</cffunction>
	
	<cffunction name="setWorkGroupID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="WorkGroupID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.WorkGroupID)) OR trim(arguments.WorkGroupID) EQ "">
			<cfset variables.WorkGroupID = arguments.WorkGroupID />
		<cfelse>
			<cfthrow message="WorkGroupID (#arguments.WorkGroupID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "WorkGroupID") />		
		
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
	<!--- GET and SET methods for WorkGroupName.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getWorkGroupName" acess="public" output="false" returntype="any">
		<cfreturn variables.WorkGroupName>
	</cffunction>
	
	<cffunction name="setWorkGroupName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="WorkGroupName" required="true" type="any" />
			
		<cfset variables.WorkGroupName = arguments.WorkGroupName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "WorkGroupName") />		
		
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
	<!--- GET and SET methods for Description.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.Description>
	</cffunction>
	
	<cffunction name="setDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Description" required="true" type="any" />
			
		<cfset variables.Description = arguments.Description />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Description") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MondayStart.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMondayStart" acess="public" output="false" returntype="any">
		<cfreturn variables.MondayStart>
	</cffunction>
	
	<cffunction name="setMondayStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MondayStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.MondayStart)) OR trim(arguments.MondayStart) EQ "">
			<cfset variables.MondayStart = arguments.MondayStart />
		<cfelse>
			<cfthrow message="MondayStart (#arguments.MondayStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MondayStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MondayEnd.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMondayEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.MondayEnd>
	</cffunction>
	
	<cffunction name="setMondayEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MondayEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.MondayEnd)) OR trim(arguments.MondayEnd) EQ "">
			<cfset variables.MondayEnd = arguments.MondayEnd />
		<cfelse>
			<cfthrow message="MondayEnd (#arguments.MondayEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MondayEnd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TuesdayStart.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTuesdayStart" acess="public" output="false" returntype="any">
		<cfreturn variables.TuesdayStart>
	</cffunction>
	
	<cffunction name="setTuesdayStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TuesdayStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.TuesdayStart)) OR trim(arguments.TuesdayStart) EQ "">
			<cfset variables.TuesdayStart = arguments.TuesdayStart />
		<cfelse>
			<cfthrow message="TuesdayStart (#arguments.TuesdayStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TuesdayStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for TuesdayEnd.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTuesdayEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.TuesdayEnd>
	</cffunction>
	
	<cffunction name="setTuesdayEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="TuesdayEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.TuesdayEnd)) OR trim(arguments.TuesdayEnd) EQ "">
			<cfset variables.TuesdayEnd = arguments.TuesdayEnd />
		<cfelse>
			<cfthrow message="TuesdayEnd (#arguments.TuesdayEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "TuesdayEnd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for WednesdayStart.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getWednesdayStart" acess="public" output="false" returntype="any">
		<cfreturn variables.WednesdayStart>
	</cffunction>
	
	<cffunction name="setWednesdayStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="WednesdayStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.WednesdayStart)) OR trim(arguments.WednesdayStart) EQ "">
			<cfset variables.WednesdayStart = arguments.WednesdayStart />
		<cfelse>
			<cfthrow message="WednesdayStart (#arguments.WednesdayStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "WednesdayStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for WednesdayEnd.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getWednesdayEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.WednesdayEnd>
	</cffunction>
	
	<cffunction name="setWednesdayEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="WednesdayEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.WednesdayEnd)) OR trim(arguments.WednesdayEnd) EQ "">
			<cfset variables.WednesdayEnd = arguments.WednesdayEnd />
		<cfelse>
			<cfthrow message="WednesdayEnd (#arguments.WednesdayEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "WednesdayEnd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ThursdayStart.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getThursdayStart" acess="public" output="false" returntype="any">
		<cfreturn variables.ThursdayStart>
	</cffunction>
	
	<cffunction name="setThursdayStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ThursdayStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.ThursdayStart)) OR trim(arguments.ThursdayStart) EQ "">
			<cfset variables.ThursdayStart = arguments.ThursdayStart />
		<cfelse>
			<cfthrow message="ThursdayStart (#arguments.ThursdayStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ThursdayStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ThursdayEnd.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getThursdayEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.ThursdayEnd>
	</cffunction>
	
	<cffunction name="setThursdayEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ThursdayEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.ThursdayEnd)) OR trim(arguments.ThursdayEnd) EQ "">
			<cfset variables.ThursdayEnd = arguments.ThursdayEnd />
		<cfelse>
			<cfthrow message="ThursdayEnd (#arguments.ThursdayEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ThursdayEnd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FridayStart.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFridayStart" acess="public" output="false" returntype="any">
		<cfreturn variables.FridayStart>
	</cffunction>
	
	<cffunction name="setFridayStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FridayStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.FridayStart)) OR trim(arguments.FridayStart) EQ "">
			<cfset variables.FridayStart = arguments.FridayStart />
		<cfelse>
			<cfthrow message="FridayStart (#arguments.FridayStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FridayStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for FridayEnd.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFridayEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.FridayEnd>
	</cffunction>
	
	<cffunction name="setFridayEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="FridayEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.FridayEnd)) OR trim(arguments.FridayEnd) EQ "">
			<cfset variables.FridayEnd = arguments.FridayEnd />
		<cfelse>
			<cfthrow message="FridayEnd (#arguments.FridayEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "FridayEnd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SaturdayStart.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSaturdayStart" acess="public" output="false" returntype="any">
		<cfreturn variables.SaturdayStart>
	</cffunction>
	
	<cffunction name="setSaturdayStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SaturdayStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.SaturdayStart)) OR trim(arguments.SaturdayStart) EQ "">
			<cfset variables.SaturdayStart = arguments.SaturdayStart />
		<cfelse>
			<cfthrow message="SaturdayStart (#arguments.SaturdayStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SaturdayStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SaturdayEnd.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSaturdayEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.SaturdayEnd>
	</cffunction>
	
	<cffunction name="setSaturdayEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SaturdayEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.SaturdayEnd)) OR trim(arguments.SaturdayEnd) EQ "">
			<cfset variables.SaturdayEnd = arguments.SaturdayEnd />
		<cfelse>
			<cfthrow message="SaturdayEnd (#arguments.SaturdayEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SaturdayEnd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SundayStart.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSundayStart" acess="public" output="false" returntype="any">
		<cfreturn variables.SundayStart>
	</cffunction>
	
	<cffunction name="setSundayStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SundayStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.SundayStart)) OR trim(arguments.SundayStart) EQ "">
			<cfset variables.SundayStart = arguments.SundayStart />
		<cfelse>
			<cfthrow message="SundayStart (#arguments.SundayStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SundayStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SundayEnd.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSundayEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.SundayEnd>
	</cffunction>
	
	<cffunction name="setSundayEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SundayEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.SundayEnd)) OR trim(arguments.SundayEnd) EQ "">
			<cfset variables.SundayEnd = arguments.SundayEnd />
		<cfelse>
			<cfthrow message="SundayEnd (#arguments.SundayEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SundayEnd") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getWorkGroupID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getWorkGroupID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getWorkGroup" output="false" access="public" returntype="query">
				
		<cfargument name="WorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetWorkGroup = "" />		
	
		<cfquery name="qGetWorkGroup" datasource="#trim(variables.ds)#">
	  		SELECT WorkGroupID,ClientID,WorkGroupName,DateCreated,DateModified,Description,MondayStart,MondayEnd,TuesdayStart,TuesdayEnd,WednesdayStart,WednesdayEnd,ThursdayStart,ThursdayEnd,FridayStart,FridayEnd,SaturdayStart,SaturdayEnd,SundayStart,SundayEnd
			FROM workgroup  
			WHERE WorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.WorkGroupID)#" /> 
		</cfquery>
		
		<cfreturn qGetWorkGroup>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="WorkGroupActive" />
		
		<cfset var qCreateWorkGroup = "" />		
		
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localWorkGroupName = arguments.obj.getWorkGroupName() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
		<cfset var localDescription = arguments.obj.getDescription() />
		<cfset var localMondayStart = arguments.obj.getMondayStart() />
		<cfset var localMondayEnd = arguments.obj.getMondayEnd() />
		<cfset var localTuesdayStart = arguments.obj.getTuesdayStart() />
		<cfset var localTuesdayEnd = arguments.obj.getTuesdayEnd() />
		<cfset var localWednesdayStart = arguments.obj.getWednesdayStart() />
		<cfset var localWednesdayEnd = arguments.obj.getWednesdayEnd() />
		<cfset var localThursdayStart = arguments.obj.getThursdayStart() />
		<cfset var localThursdayEnd = arguments.obj.getThursdayEnd() />
		<cfset var localFridayStart = arguments.obj.getFridayStart() />
		<cfset var localFridayEnd = arguments.obj.getFridayEnd() />
		<cfset var localSaturdayStart = arguments.obj.getSaturdayStart() />
		<cfset var localSaturdayEnd = arguments.obj.getSaturdayEnd() />
		<cfset var localSundayStart = arguments.obj.getSundayStart() />
		<cfset var localSundayEnd = arguments.obj.getSundayEnd() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateWorkGroup" datasource="#trim(variables.ds)#">
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
			read(qCreateWorkGroup.WorkGroupID);
			arguments.obj.setWorkGroupID(qCreateWorkGroup.WorkGroupID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="WorkGroupActive">
				
		<cfargument name="WorkGroupID" required="yes" type="numeric" />		
		<cfset var qGetWorkGroup = "" />		
		
		<cfset qGetWorkGroup = getWorkGroup(trim(WorkGroupID)) />
				
		<cfif qGetWorkGroup.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setWorkGroupID(qGetWorkGroup.WorkGroupID);
			this.setClientID(qGetWorkGroup.ClientID);
			this.setWorkGroupName(qGetWorkGroup.WorkGroupName);
			this.setDateCreated(qGetWorkGroup.DateCreated);
			this.setDateModified(qGetWorkGroup.DateModified);
			this.setDescription(qGetWorkGroup.Description);
			this.setMondayStart(qGetWorkGroup.MondayStart);
			this.setMondayEnd(qGetWorkGroup.MondayEnd);
			this.setTuesdayStart(qGetWorkGroup.TuesdayStart);
			this.setTuesdayEnd(qGetWorkGroup.TuesdayEnd);
			this.setWednesdayStart(qGetWorkGroup.WednesdayStart);
			this.setWednesdayEnd(qGetWorkGroup.WednesdayEnd);
			this.setThursdayStart(qGetWorkGroup.ThursdayStart);
			this.setThursdayEnd(qGetWorkGroup.ThursdayEnd);
			this.setFridayStart(qGetWorkGroup.FridayStart);
			this.setFridayEnd(qGetWorkGroup.FridayEnd);
			this.setSaturdayStart(qGetWorkGroup.SaturdayStart);
			this.setSaturdayEnd(qGetWorkGroup.SaturdayEnd);
			this.setSundayStart(qGetWorkGroup.SundayStart);
			this.setSundayEnd(qGetWorkGroup.SundayEnd);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="WorkGroupActive" />
		<cfset var qUpdateWorkGroup = "" />
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localWorkGroupName = arguments.obj.getWorkGroupName() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
		<cfset var localDescription = arguments.obj.getDescription() />
		<cfset var localMondayStart = arguments.obj.getMondayStart() />
		<cfset var localMondayEnd = arguments.obj.getMondayEnd() />
		<cfset var localTuesdayStart = arguments.obj.getTuesdayStart() />
		<cfset var localTuesdayEnd = arguments.obj.getTuesdayEnd() />
		<cfset var localWednesdayStart = arguments.obj.getWednesdayStart() />
		<cfset var localWednesdayEnd = arguments.obj.getWednesdayEnd() />
		<cfset var localThursdayStart = arguments.obj.getThursdayStart() />
		<cfset var localThursdayEnd = arguments.obj.getThursdayEnd() />
		<cfset var localFridayStart = arguments.obj.getFridayStart() />
		<cfset var localFridayEnd = arguments.obj.getFridayEnd() />
		<cfset var localSaturdayStart = arguments.obj.getSaturdayStart() />
		<cfset var localSaturdayEnd = arguments.obj.getSaturdayEnd() />
		<cfset var localSundayStart = arguments.obj.getSundayStart() />
		<cfset var localSundayEnd = arguments.obj.getSundayEnd() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateWorkGroup" datasource="#trim(variables.ds)#">
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
				WHERE WorkGroupID = <cfqueryparam value="#trim(arguments.obj.getWorkGroupID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="WorkGroupActive" />
		<cfset var qDeleteWorkGroup = "">

		<cfquery name="qDeleteWorkGroup" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM workgroup
			WHERE WorkGroupID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getWorkGroupID())#" /> 
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





