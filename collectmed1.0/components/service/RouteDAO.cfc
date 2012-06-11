 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Route DAO Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a Route, either by creating a new entry or updating an existing one.">
		<cfargument name="Route" required="true" type="cmComponents.com.common.model.Route" hint="I am the Route bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.Route)>
			<cfset success = update(arguments.Route) />
		<cfelse>
			<cfset success = create(arguments.Route) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific Route exists within the database, using the ID as a check.">
		<cfargument name="Route" required="true" type="cmComponents.com.common.model.Route" hint="I am the Route bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.datasource.getDSName()#" maxrows="1">
			SELECT count(1) as idexists
			FROM route
			WHERE RouteID = <cfqueryparam value="#arguments.Route.getRouteID()#" CFSQLType="cf_sql_integer" />
		</cfquery>
		
		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
		
	</cffunction>


										
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="private">
				
		<cfargument name="Route" required="true" type="cmComponents.com.common.model.Route" />
		
		<cfset var qCreateRoute = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateRoute" datasource="#variables.instance.datasource.getDSName()#">
				INSERT INTO route (UserID,Name,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(arguments.Route.getUserID()))>						
						<cfqueryparam value="#trim(arguments.Route.getUserID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.Route.getName()) NEQ "" AND trim(arguments.Route.getName()) NEQ "@@" AND trim(arguments.Route.getName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Route.getName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.Route.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.Route.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.Route.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				)
				SELECT LAST_INSERT_ID() AS RouteID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.Route.setRouteID(qCreateRoute.RouteID);
		</cfscript>
		
		<cfreturn arguments.Route />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="Route" type="cmComponents.com.common.model.Route" required="true" />
				
		<cfset var qGetRoute = "" />
				
		<cfset qGetRoute = getRouteByID(trim(arguments.Route.getRouteID())) />
				
		<cfif qGetRoute.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetRoute.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetRoute, 1)>
				<cfset arguments.Route.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="Route" required="true" type="cmComponents.com.common.model.Route" />
		<cfset var qUpdateRoute = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdateRoute" datasource="#variables.instance.datasource.getDSName()#">
				UPDATE route  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					UserID =				
					<cfif IsNumeric(trim(arguments.Route.getUserID()))>						
						<cfqueryparam value="#trim(arguments.Route.getUserID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Name =	
					<cfif trim(arguments.Route.getName()) NEQ "" AND trim(arguments.Route.getName()) NEQ "@@" AND trim(arguments.Route.getName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Route.getName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.Route.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.Route.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.Route.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE RouteID = <cfqueryparam value="#trim(arguments.Route.getRouteID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="RouteID" required="true" type="String" />
		
		<cfset var qDeleteRoute = "">

		<cfquery name="qDeleteRoute" datasource="#variables.instance.datasource.getDSName()#" result="status">
			DELETE
			FROM route
			WHERE RouteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RouteID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRouteByID" output="false" access="public" returntype="query">
		
		<cfargument name="RouteID" required="yes" type="numeric" />		
		
		<cfset var qGetRoute = "" />		
	
		<cfquery name="qGetRoute" datasource="#variables.instance.datasource.getDSName()#">
	  		SELECT RouteID,UserID,Name,Active,InactiveCode,DateCreated,DateModified
			FROM route  
			WHERE RouteID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RouteID)#" /> 
		</cfquery>
		
		<cfreturn qGetRoute>
		
	</cffunction>	
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="QueryToStruct" access="public" returntype="any" output="false" hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">
	
		<!--- Define arguments. --->
		<cfargument name="Query" type="query" required="true" />
		<cfargument name="Row" type="numeric" required="false" default="0" />
	
		<cfscript>
			
			// Define the local scope.
			var LOCAL = StructNew();
	
			// Determine the indexes that we will need to loop over. To do so, check to see if we are working with a given row, or the whole record set.
			if (ARGUMENTS.Row){				
				// We are only looping over one row.
				LOCAL.FromIndex = ARGUMENTS.Row;
				LOCAL.ToIndex = ARGUMENTS.Row;
			} 
			else{				
				// We are looping over the entire query.
				LOCAL.FromIndex = 1;
				LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;
			}
	
			// Get the list of columns as an array and the column count.
			LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
			LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );
			
			// Create an array to keep all the objects.
			LOCAL.DataArray = ArrayNew( 1 );
	
			// Loop over the rows to create a structure for each row.
			for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
	
				// Create a new structure for this row.
				ArrayAppend( LOCAL.DataArray, StructNew() );
		
				// Get the index of the current data array object.
				LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );
		
				// Loop over the columns to set the structure values.
				for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
		
					// Get the column value.
					LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
			
					// Set column value into the structure.
					LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
				}
		
			}
	
			// At this point, we have an array of structure objects that represent the rows in the query over the indexes that we wanted to convert. 
			// If we did not want to convert a specific record, return the array. If we wanted to convert a single row, then return the just that STRUCTURE, not the array.
			if (ARGUMENTS.Row){			
				// Return the first array item.
				return( LOCAL.DataArray[ 1 ] );			
			} 
			else{			
				// Return the entire array.
				return( LOCAL.DataArray );
			}
	
		</cfscript>
	
	</cffunction>	
	
	
	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





