 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the RoutePatient DAO Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a RoutePatient, either by creating a new entry or updating an existing one.">
		<cfargument name="RoutePatient" required="true" type="cmComponents.com.common.model.RoutePatient" hint="I am the RoutePatient bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.RoutePatient)>
			<cfset success = update(arguments.RoutePatient) />
		<cfelse>
			<cfset success = create(arguments.RoutePatient) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific RoutePatient exists within the database, using the ID as a check.">
		<cfargument name="RoutePatient" required="true" type="cmComponents.com.common.model.RoutePatient" hint="I am the RoutePatient bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.datasource.getDSName()#" maxrows="1">
			SELECT count(1) as idexists
			FROM RoutePatient
			WHERE RoutePatientID = <cfqueryparam value="#arguments.RoutePatient.getRoutePatientID()#" CFSQLType="cf_sql_integer" />
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
				
		<cfargument name="RoutePatient" required="true" type="cmComponents.com.common.model.RoutePatient" />
		
		<cfset var qCreateRoutePatient = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateRoutePatient" datasource="#variables.instance.datasource.getDSName()#">
				INSERT INTO RoutePatient (RouteID,SubRoute,PatientID,FName,LName,City,IDtext,SuppliesText,Checked,Active,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(arguments.RoutePatient.getRouteID())#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(arguments.RoutePatient.getSubRoute()) NEQ "" AND trim(arguments.RoutePatient.getSubRoute()) NEQ "@@" AND trim(arguments.RoutePatient.getSubRoute()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getSubRoute())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.RoutePatient.getPatientID()))>						
						<cfqueryparam value="#trim(arguments.RoutePatient.getPatientID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.RoutePatient.getFName()) NEQ "" AND trim(arguments.RoutePatient.getFName()) NEQ "@@" AND trim(arguments.RoutePatient.getFName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getFName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.RoutePatient.getLName()) NEQ "" AND trim(arguments.RoutePatient.getLName()) NEQ "@@" AND trim(arguments.RoutePatient.getLName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getLName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.RoutePatient.getCity()) NEQ "" AND trim(arguments.RoutePatient.getCity()) NEQ "@@" AND trim(arguments.RoutePatient.getCity()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getCity())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.RoutePatient.getIDtext()) NEQ "" AND trim(arguments.RoutePatient.getIDtext()) NEQ "@@" AND trim(arguments.RoutePatient.getIDtext()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getIDtext())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.RoutePatient.getSuppliesText()) NEQ "" AND trim(arguments.RoutePatient.getSuppliesText()) NEQ "@@" AND trim(arguments.RoutePatient.getSuppliesText()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getSuppliesText())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.RoutePatient.getChecked())#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(arguments.RoutePatient.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.RoutePatient.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.RoutePatient.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				)
				SELECT LAST_INSERT_ID() AS RoutePatientID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.RoutePatient.setRoutePatientID(qCreateRoutePatient.RoutePatientID);
		</cfscript>
		
		<cfreturn arguments.RoutePatient />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="RoutePatient" type="cmComponents.com.common.model.RoutePatient" required="true" />
				
		<cfset var qGetRoutePatient = "" />
				
		<cfset qGetRoutePatient = getRoutePatientByID(trim(arguments.RoutePatient.getRoutePatientID())) />
				
		<cfif qGetRoutePatient.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetRoutePatient.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetRoutePatient, 1)>
				<cfset arguments.RoutePatient.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="RoutePatient" required="true" type="cmComponents.com.common.model.RoutePatient" />
		<cfset var qUpdateRoutePatient = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdateRoutePatient" datasource="#variables.instance.datasource.getDSName()#">
				UPDATE RoutePatient  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					RouteID =						
						<cfqueryparam value="#trim(arguments.RoutePatient.getRouteID())#" cfsqltype="CF_SQL_INTEGER" />,
					
					SubRoute =	
					<cfif trim(arguments.RoutePatient.getSubRoute()) NEQ "" AND trim(arguments.RoutePatient.getSubRoute()) NEQ "@@" AND trim(arguments.RoutePatient.getSubRoute()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getSubRoute())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PatientID =				
					<cfif IsNumeric(trim(arguments.RoutePatient.getPatientID()))>						
						<cfqueryparam value="#trim(arguments.RoutePatient.getPatientID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					FName =	
					<cfif trim(arguments.RoutePatient.getFName()) NEQ "" AND trim(arguments.RoutePatient.getFName()) NEQ "@@" AND trim(arguments.RoutePatient.getFName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getFName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LName =	
					<cfif trim(arguments.RoutePatient.getLName()) NEQ "" AND trim(arguments.RoutePatient.getLName()) NEQ "@@" AND trim(arguments.RoutePatient.getLName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getLName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					City =	
					<cfif trim(arguments.RoutePatient.getCity()) NEQ "" AND trim(arguments.RoutePatient.getCity()) NEQ "@@" AND trim(arguments.RoutePatient.getCity()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getCity())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					IDtext =	
					<cfif trim(arguments.RoutePatient.getIDtext()) NEQ "" AND trim(arguments.RoutePatient.getIDtext()) NEQ "@@" AND trim(arguments.RoutePatient.getIDtext()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getIDtext())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SuppliesText =	
					<cfif trim(arguments.RoutePatient.getSuppliesText()) NEQ "" AND trim(arguments.RoutePatient.getSuppliesText()) NEQ "@@" AND trim(arguments.RoutePatient.getSuppliesText()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.RoutePatient.getSuppliesText())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Checked =						
						<cfqueryparam value="#trim(arguments.RoutePatient.getChecked())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Active =						
						<cfqueryparam value="#trim(arguments.RoutePatient.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.RoutePatient.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.RoutePatient.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE RoutePatientID = <cfqueryparam value="#trim(arguments.RoutePatient.getRoutePatientID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="RoutePatientID" required="true" type="String" />
		
		<cfset var qDeleteRoutePatient = "">

		<cfquery name="qDeleteRoutePatient" datasource="#variables.instance.datasource.getDSName()#" result="status">
			DELETE
			FROM RoutePatient
			WHERE RoutePatientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RoutePatientID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRoutePatientByID" output="false" access="public" returntype="query">
		
		<cfargument name="RoutePatientID" required="yes" type="numeric" />		
		
		<cfset var qGetRoutePatient = "" />		
	
		<cfquery name="qGetRoutePatient" datasource="#variables.instance.datasource.getDSName()#">
	  		SELECT RoutePatientID,RouteID,SubRoute,PatientID,FName,LName,City,IDtext,SuppliesText,Checked,Active,InactiveCode,DateCreated,DateModified
			FROM RoutePatient  
			WHERE RoutePatientID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RoutePatientID)#" /> 
		</cfquery>
		
		<cfreturn qGetRoutePatient>
		
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


