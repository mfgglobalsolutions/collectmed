<!---
	Change Log

	Date		Programmer			Issue		Description
	----		----------			-------		----------
	03/29/2010	G. Cruz				W02500212	Creation
--->

<cfcomponent output="false">

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="queryToStruct" access="public" returntype="any" output="false" hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">
	
		<!--- Define arguments. --->
		<cfargument name="query" type="query" required="true" />
		<cfargument name="row" type="numeric" required="false" default="0" />
				
		<cfscript>
	
			// Determine the indexes that we will need to loop over. To do so, check to see if we are working with a given row, or the whole record set.
			if (arguments.row){				
				// We are only looping over one row.
				local.fromIndex = arguments.row;
				local.ToIndex = arguments.row;
			} 
			else{				
				// We are looping over the entire query.
				local.fromIndex = 1;
				local.toIndex = arguments.query.recordCount;
			}
	
			// Get the list of columns as an array and the column count.
			local.columns = listToArray( arguments.query.columnList );
			local.columnCount = arrayLen( local.columns );
			
			// Create an array to keep all the objects.
			local.dataArray = arrayNew( 1 );
	
			// Loop over the rows to create a structure for each row.
			for (local.rowIndex = local.fromIndex ; local.rowIndex lte local.toIndex ; local.rowIndex = (local.rowIndex + 1)){
	
				// Create a new structure for this row.
				arrayAppend( local.dataArray, structNew() );
		
				// Get the index of the current data array object.
				local.dataArrayIndex = arrayLen( local.dataArray );
		
				// Loop over the columns to set the structure values.
				for (local.columnIndex = 1 ; local.columnIndex lte local.columnCount ; local.columnIndex = (local.columnIndex + 1)){
		
					// Get the column value.
					local.columnName = local.columns[ local.columnIndex ];
			
					// Set column value into the structure.
					local.dataArray[ local.dataArrayIndex ][ local.columnName ] = arguments.query[ local.columnName ][ local.rowIndex ];
				}
		
			}
	
			// At this point, we have an array of structure objects that represent the rows in the query over the indexes that we wanted to convert. 
			// If we did not want to convert a specific record, return the array. If we wanted to convert a single row, then return the just that STRUCTURE, not the array.
			if (arguments.row){			
				// Return the first array item.
				return( local.dataArray[ 1 ] );			
			} 
			else{			
				// Return the entire array.
				return( local.dataArray );
			}
	
		</cfscript>
	
	</cffunction>	
	
	
	
	
	
</cfcomponent>


