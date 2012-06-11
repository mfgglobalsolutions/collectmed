<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- Procedure_MEDICARE_CLAIMADJUSTMENTIO.cfc                                       --->
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->
<!--- This tag is a CFC tag tied to the Procedure_MEDICARE_CLAIMADJUSTMENT table in  --->
<!--- the dB.                                                                        --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_Procedure_MEDICARE_CLAIMADJUSTMENTTable                          --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!--- Queryname<br>                                                                  --->
<!--- fields<br>                                                                     --->
<!--- orderby<br>                                                                    --->
<!--- groupby (same as fields contents maybe different order)<br>                    --->
<!--- andclause example.... (CN1= Column Name)                                       --->
<!--- [ andclause="RTRIM(CN1)+''+RTRIM(CN2)='#Var#'" ]<br>                           --->
<!--- Procedure_MEDICARE_CLAIMADJUSTMENTID<br>                                       --->
<!--- ProcedureID<br>                                                                --->
<!--- ClaimAdjustmentGroupCode1<br>                                                  --->
<!--- ClaimAdjustmentReasonCode2<br>                                                 --->
<!--- MonetaryAmount3<br>                                                            --->
<!--- Quantity4<br>                                                                  --->
<!--- ClaimAdjustmentReasonCode5<br>                                                 --->
<!--- MonetaryAmount6<br>                                                            --->
<!--- Quantity7<br>                                                                  --->
<!--- ClaimAdjustmentReasonCode8<br>                                                 --->
<!--- MonetaryAmount9<br>                                                            --->
<!--- Quantity10<br>                                                                 --->
<!--- ClaimAdjustmentReasonCode11<br>                                                --->
<!--- MonetaryAmount12<br>                                                           --->
<!--- Quantity13<br>                                                                 --->
<!--- ClaimAdjustmentReasonCode14<br>                                                --->
<!--- MonetaryAmount15<br>                                                           --->
<!--- Quantity16<br>                                                                 --->
<!--- ClaimAdjustmentReasonCode17<br>                                                --->
<!--- MonetaryAmount18<br>                                                           --->
<!--- Quantity19<br>                                                                 --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- recordID                                                                       --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="Procedure_MEDICARE_CLAIMADJUSTMENTIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID = "NULL";
			variables.instance.ProcedureID = "NULL";
			variables.instance.ClaimAdjustmentGroupCode1 = "NULL";
			variables.instance.ClaimAdjustmentReasonCode2 = "NULL";
			variables.instance.MonetaryAmount3 = "NULL";
			variables.instance.Quantity4 = "NULL";
			variables.instance.ClaimAdjustmentReasonCode5 = "NULL";
			variables.instance.MonetaryAmount6 = "NULL";
			variables.instance.Quantity7 = "NULL";
			variables.instance.ClaimAdjustmentReasonCode8 = "";
			variables.instance.MonetaryAmount9 = "NULL";
			variables.instance.Quantity10 = "NULL";
			variables.instance.ClaimAdjustmentReasonCode11 = "NULL";
			variables.instance.MonetaryAmount12 = "NULL";
			variables.instance.Quantity13 = "NULL";
			variables.instance.ClaimAdjustmentReasonCode14 = "NULL";
			variables.instance.MonetaryAmount15 = "NULL";
			variables.instance.Quantity16 = "NULL";
			variables.instance.ClaimAdjustmentReasonCode17 = "NULL";
			variables.instance.MonetaryAmount18 = "NULL";
			variables.instance.Quantity19 = "NULL";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 25)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROCEDURE_MEDICARE_CLAIMADJUSTMENTID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROCEDUREID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMADJUSTMENTGROUPCODE1", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMADJUSTMENTREASONCODE2", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONETARYAMOUNT3", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "QUANTITY4", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMADJUSTMENTREASONCODE5", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONETARYAMOUNT6", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "QUANTITY7", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMADJUSTMENTREASONCODE8", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONETARYAMOUNT9", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "QUANTITY10", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMADJUSTMENTREASONCODE11", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONETARYAMOUNT12", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "QUANTITY13", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMADJUSTMENTREASONCODE14", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONETARYAMOUNT15", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "QUANTITY16", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLAIMADJUSTMENTREASONCODE17", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MONETARYAMOUNT18", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "money", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "QUANTITY19", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "float", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 25)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Procedure_MEDICARE_CLAIMADJUSTMENTID.                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedure_MEDICARE_CLAIMADJUSTMENTID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID>
	</cffunction>
	 
	<cffunction name="setProcedure_MEDICARE_CLAIMADJUSTMENTID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="Yes" type="String">
		
		<cfif Procedure_MEDICARE_CLAIMADJUSTMENTID NEQ "NULL">	
			
			<cfif arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID EQ "@@" OR arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID EQ "">
				
				<cfset arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(Procedure_MEDICARE_CLAIMADJUSTMENTID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Procedure_MEDICARE_CLAIMADJUSTMENTID</strong> (#Procedure_MEDICARE_CLAIMADJUSTMENTID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID = arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ProcedureID.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcedureID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ProcedureID>
	</cffunction>
	 
	<cffunction name="setProcedureID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ProcedureID" required="Yes" type="String">
		
		<cfif ProcedureID NEQ "NULL">	
			
			<cfif arguments.ProcedureID EQ "@@" OR arguments.ProcedureID EQ "">
				
				<cfset arguments.ProcedureID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ProcedureID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ProcedureID</strong> (#ProcedureID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ProcedureID = arguments.ProcedureID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ProcedureID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimAdjustmentGroupCode1.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAdjustmentGroupCode1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimAdjustmentGroupCode1>
	</cffunction>
	 
	<cffunction name="setClaimAdjustmentGroupCode1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimAdjustmentGroupCode1" required="Yes" type="String">
		
		<cfif ClaimAdjustmentGroupCode1 NEQ "NULL">	
			
			<cfif arguments.ClaimAdjustmentGroupCode1 EQ "@@" OR arguments.ClaimAdjustmentGroupCode1 EQ "">
				
				<cfset arguments.ClaimAdjustmentGroupCode1 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimAdjustmentGroupCode1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimAdjustmentGroupCode1</strong> (#ClaimAdjustmentGroupCode1#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimAdjustmentGroupCode1 = arguments.ClaimAdjustmentGroupCode1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimAdjustmentGroupCode1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimAdjustmentReasonCode2.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAdjustmentReasonCode2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimAdjustmentReasonCode2>
	</cffunction>
	 
	<cffunction name="setClaimAdjustmentReasonCode2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimAdjustmentReasonCode2" required="Yes" type="String">
		
		<cfif ClaimAdjustmentReasonCode2 NEQ "NULL">	
			
			<cfif arguments.ClaimAdjustmentReasonCode2 EQ "@@" OR arguments.ClaimAdjustmentReasonCode2 EQ "">
				
				<cfset arguments.ClaimAdjustmentReasonCode2 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimAdjustmentReasonCode2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimAdjustmentReasonCode2</strong> (#ClaimAdjustmentReasonCode2#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimAdjustmentReasonCode2 = arguments.ClaimAdjustmentReasonCode2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimAdjustmentReasonCode2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MonetaryAmount3.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMonetaryAmount3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MonetaryAmount3>
	</cffunction>
	 
	<cffunction name="setMonetaryAmount3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MonetaryAmount3" required="Yes" type="String">
		
		<cfif MonetaryAmount3 NEQ "NULL">	
			
			<cfif arguments.MonetaryAmount3 EQ "@@" OR arguments.MonetaryAmount3 EQ "">
				
				<cfset arguments.MonetaryAmount3 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(MonetaryAmount3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MonetaryAmount3</strong> (#MonetaryAmount3#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MonetaryAmount3 = arguments.MonetaryAmount3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MonetaryAmount3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Quantity4.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuantity4" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Quantity4>
	</cffunction>
	 
	<cffunction name="setQuantity4" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Quantity4" required="Yes" type="String">
		
		<cfif Quantity4 NEQ "NULL">	
			
			<cfif arguments.Quantity4 EQ "@@" OR arguments.Quantity4 EQ "">
				
				<cfset arguments.Quantity4 = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(Quantity4)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Quantity4</strong> (#Quantity4#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Quantity4 = arguments.Quantity4>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Quantity4")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimAdjustmentReasonCode5.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAdjustmentReasonCode5" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimAdjustmentReasonCode5>
	</cffunction>
	 
	<cffunction name="setClaimAdjustmentReasonCode5" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimAdjustmentReasonCode5" required="Yes" type="String">
		
		<cfif ClaimAdjustmentReasonCode5 NEQ "NULL">	
			
			<cfif arguments.ClaimAdjustmentReasonCode5 EQ "@@" OR arguments.ClaimAdjustmentReasonCode5 EQ "">
				
				<cfset arguments.ClaimAdjustmentReasonCode5 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimAdjustmentReasonCode5)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimAdjustmentReasonCode5</strong> (#ClaimAdjustmentReasonCode5#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimAdjustmentReasonCode5 = arguments.ClaimAdjustmentReasonCode5>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimAdjustmentReasonCode5")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MonetaryAmount6.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMonetaryAmount6" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MonetaryAmount6>
	</cffunction>
	 
	<cffunction name="setMonetaryAmount6" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MonetaryAmount6" required="Yes" type="String">
		
		<cfif MonetaryAmount6 NEQ "NULL">	
			
			<cfif arguments.MonetaryAmount6 EQ "@@" OR arguments.MonetaryAmount6 EQ "">
				
				<cfset arguments.MonetaryAmount6 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(MonetaryAmount6)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MonetaryAmount6</strong> (#MonetaryAmount6#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MonetaryAmount6 = arguments.MonetaryAmount6>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MonetaryAmount6")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Quantity7.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuantity7" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Quantity7>
	</cffunction>
	 
	<cffunction name="setQuantity7" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Quantity7" required="Yes" type="String">
		
		<cfif Quantity7 NEQ "NULL">	
			
			<cfif arguments.Quantity7 EQ "@@" OR arguments.Quantity7 EQ "">
				
				<cfset arguments.Quantity7 = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(Quantity7)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Quantity7</strong> (#Quantity7#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Quantity7 = arguments.Quantity7>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Quantity7")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimAdjustmentReasonCode8.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAdjustmentReasonCode8" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimAdjustmentReasonCode8>
	</cffunction>
	 
	<cffunction name="setClaimAdjustmentReasonCode8" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimAdjustmentReasonCode8" required="Yes" type="String">
		
		<cfif ClaimAdjustmentReasonCode8 NEQ "NULL">	
			
			<cfif arguments.ClaimAdjustmentReasonCode8 EQ "@@" OR arguments.ClaimAdjustmentReasonCode8 EQ "">
				
				<cfset arguments.ClaimAdjustmentReasonCode8 = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(ClaimAdjustmentReasonCode8)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimAdjustmentReasonCode8</strong> (#ClaimAdjustmentReasonCode8#) is not of type <strong>char</strong>.">	
			<cfelseif len(ClaimAdjustmentReasonCode8) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClaimAdjustmentReasonCode8</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimAdjustmentReasonCode8 = arguments.ClaimAdjustmentReasonCode8>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimAdjustmentReasonCode8")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MonetaryAmount9.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMonetaryAmount9" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MonetaryAmount9>
	</cffunction>
	 
	<cffunction name="setMonetaryAmount9" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MonetaryAmount9" required="Yes" type="String">
		
		<cfif MonetaryAmount9 NEQ "NULL">	
			
			<cfif arguments.MonetaryAmount9 EQ "@@" OR arguments.MonetaryAmount9 EQ "">
				
				<cfset arguments.MonetaryAmount9 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(MonetaryAmount9)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MonetaryAmount9</strong> (#MonetaryAmount9#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MonetaryAmount9 = arguments.MonetaryAmount9>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MonetaryAmount9")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Quantity10.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuantity10" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Quantity10>
	</cffunction>
	 
	<cffunction name="setQuantity10" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Quantity10" required="Yes" type="String">
		
		<cfif Quantity10 NEQ "NULL">	
			
			<cfif arguments.Quantity10 EQ "@@" OR arguments.Quantity10 EQ "">
				
				<cfset arguments.Quantity10 = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(Quantity10)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Quantity10</strong> (#Quantity10#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Quantity10 = arguments.Quantity10>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Quantity10")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimAdjustmentReasonCode11.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAdjustmentReasonCode11" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimAdjustmentReasonCode11>
	</cffunction>
	 
	<cffunction name="setClaimAdjustmentReasonCode11" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimAdjustmentReasonCode11" required="Yes" type="String">
		
		<cfif ClaimAdjustmentReasonCode11 NEQ "NULL">	
			
			<cfif arguments.ClaimAdjustmentReasonCode11 EQ "@@" OR arguments.ClaimAdjustmentReasonCode11 EQ "">
				
				<cfset arguments.ClaimAdjustmentReasonCode11 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimAdjustmentReasonCode11)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimAdjustmentReasonCode11</strong> (#ClaimAdjustmentReasonCode11#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimAdjustmentReasonCode11 = arguments.ClaimAdjustmentReasonCode11>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimAdjustmentReasonCode11")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MonetaryAmount12.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMonetaryAmount12" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MonetaryAmount12>
	</cffunction>
	 
	<cffunction name="setMonetaryAmount12" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MonetaryAmount12" required="Yes" type="String">
		
		<cfif MonetaryAmount12 NEQ "NULL">	
			
			<cfif arguments.MonetaryAmount12 EQ "@@" OR arguments.MonetaryAmount12 EQ "">
				
				<cfset arguments.MonetaryAmount12 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(MonetaryAmount12)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MonetaryAmount12</strong> (#MonetaryAmount12#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MonetaryAmount12 = arguments.MonetaryAmount12>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MonetaryAmount12")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Quantity13.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuantity13" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Quantity13>
	</cffunction>
	 
	<cffunction name="setQuantity13" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Quantity13" required="Yes" type="String">
		
		<cfif Quantity13 NEQ "NULL">	
			
			<cfif arguments.Quantity13 EQ "@@" OR arguments.Quantity13 EQ "">
				
				<cfset arguments.Quantity13 = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(Quantity13)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Quantity13</strong> (#Quantity13#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Quantity13 = arguments.Quantity13>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Quantity13")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimAdjustmentReasonCode14.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAdjustmentReasonCode14" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimAdjustmentReasonCode14>
	</cffunction>
	 
	<cffunction name="setClaimAdjustmentReasonCode14" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimAdjustmentReasonCode14" required="Yes" type="String">
		
		<cfif ClaimAdjustmentReasonCode14 NEQ "NULL">	
			
			<cfif arguments.ClaimAdjustmentReasonCode14 EQ "@@" OR arguments.ClaimAdjustmentReasonCode14 EQ "">
				
				<cfset arguments.ClaimAdjustmentReasonCode14 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimAdjustmentReasonCode14)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimAdjustmentReasonCode14</strong> (#ClaimAdjustmentReasonCode14#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimAdjustmentReasonCode14 = arguments.ClaimAdjustmentReasonCode14>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimAdjustmentReasonCode14")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MonetaryAmount15.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMonetaryAmount15" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MonetaryAmount15>
	</cffunction>
	 
	<cffunction name="setMonetaryAmount15" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MonetaryAmount15" required="Yes" type="String">
		
		<cfif MonetaryAmount15 NEQ "NULL">	
			
			<cfif arguments.MonetaryAmount15 EQ "@@" OR arguments.MonetaryAmount15 EQ "">
				
				<cfset arguments.MonetaryAmount15 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(MonetaryAmount15)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MonetaryAmount15</strong> (#MonetaryAmount15#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MonetaryAmount15 = arguments.MonetaryAmount15>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MonetaryAmount15")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Quantity16.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuantity16" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Quantity16>
	</cffunction>
	 
	<cffunction name="setQuantity16" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Quantity16" required="Yes" type="String">
		
		<cfif Quantity16 NEQ "NULL">	
			
			<cfif arguments.Quantity16 EQ "@@" OR arguments.Quantity16 EQ "">
				
				<cfset arguments.Quantity16 = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(Quantity16)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Quantity16</strong> (#Quantity16#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Quantity16 = arguments.Quantity16>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Quantity16")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClaimAdjustmentReasonCode17.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimAdjustmentReasonCode17" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClaimAdjustmentReasonCode17>
	</cffunction>
	 
	<cffunction name="setClaimAdjustmentReasonCode17" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClaimAdjustmentReasonCode17" required="Yes" type="String">
		
		<cfif ClaimAdjustmentReasonCode17 NEQ "NULL">	
			
			<cfif arguments.ClaimAdjustmentReasonCode17 EQ "@@" OR arguments.ClaimAdjustmentReasonCode17 EQ "">
				
				<cfset arguments.ClaimAdjustmentReasonCode17 = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClaimAdjustmentReasonCode17)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClaimAdjustmentReasonCode17</strong> (#ClaimAdjustmentReasonCode17#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClaimAdjustmentReasonCode17 = arguments.ClaimAdjustmentReasonCode17>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClaimAdjustmentReasonCode17")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MonetaryAmount18.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMonetaryAmount18" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MonetaryAmount18>
	</cffunction>
	 
	<cffunction name="setMonetaryAmount18" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MonetaryAmount18" required="Yes" type="String">
		
		<cfif MonetaryAmount18 NEQ "NULL">	
			
			<cfif arguments.MonetaryAmount18 EQ "@@" OR arguments.MonetaryAmount18 EQ "">
				
				<cfset arguments.MonetaryAmount18 = "NULL">
						
			<cfelseif NOT REQUEST.ismoneyDataType(MonetaryAmount18)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MonetaryAmount18</strong> (#MonetaryAmount18#) is not of type <strong>money</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MonetaryAmount18 = arguments.MonetaryAmount18>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MonetaryAmount18")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Quantity19.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getQuantity19" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Quantity19>
	</cffunction>
	 
	<cffunction name="setQuantity19" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Quantity19" required="Yes" type="String">
		
		<cfif Quantity19 NEQ "NULL">	
			
			<cfif arguments.Quantity19 EQ "@@" OR arguments.Quantity19 EQ "">
				
				<cfset arguments.Quantity19 = "NULL">
						
			<cfelseif NOT REQUEST.isfloatDataType(Quantity19)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Quantity19</strong> (#Quantity19#) is not of type <strong>float</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Quantity19 = arguments.Quantity19>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Quantity19")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="ProcedureID" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentGroupCode1" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode2" required="No" type="String" default="">
		<cfargument name="MonetaryAmount3" required="No" type="String" default="">
		<cfargument name="Quantity4" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode5" required="No" type="String" default="">
		<cfargument name="MonetaryAmount6" required="No" type="String" default="">
		<cfargument name="Quantity7" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode8" required="No" type="String" default="">
		<cfargument name="MonetaryAmount9" required="No" type="String" default="">
		<cfargument name="Quantity10" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode11" required="No" type="String" default="">
		<cfargument name="MonetaryAmount12" required="No" type="String" default="">
		<cfargument name="Quantity13" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode14" required="No" type="String" default="">
		<cfargument name="MonetaryAmount15" required="No" type="String" default="">
		<cfargument name="Quantity16" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode17" required="No" type="String" default="">
		<cfargument name="MonetaryAmount18" required="No" type="String" default="">
		<cfargument name="Quantity19" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.ProcedureID = arguments.ProcedureID>
		<cfset variables.instance.ClaimAdjustmentGroupCode1 = arguments.ClaimAdjustmentGroupCode1>
		<cfset variables.instance.ClaimAdjustmentReasonCode2 = arguments.ClaimAdjustmentReasonCode2>
		<cfset variables.instance.MonetaryAmount3 = arguments.MonetaryAmount3>
		<cfset variables.instance.Quantity4 = arguments.Quantity4>
		<cfset variables.instance.ClaimAdjustmentReasonCode5 = arguments.ClaimAdjustmentReasonCode5>
		<cfset variables.instance.MonetaryAmount6 = arguments.MonetaryAmount6>
		<cfset variables.instance.Quantity7 = arguments.Quantity7>
		<cfset variables.instance.ClaimAdjustmentReasonCode8 = arguments.ClaimAdjustmentReasonCode8>
		<cfset variables.instance.MonetaryAmount9 = arguments.MonetaryAmount9>
		<cfset variables.instance.Quantity10 = arguments.Quantity10>
		<cfset variables.instance.ClaimAdjustmentReasonCode11 = arguments.ClaimAdjustmentReasonCode11>
		<cfset variables.instance.MonetaryAmount12 = arguments.MonetaryAmount12>
		<cfset variables.instance.Quantity13 = arguments.Quantity13>
		<cfset variables.instance.ClaimAdjustmentReasonCode14 = arguments.ClaimAdjustmentReasonCode14>
		<cfset variables.instance.MonetaryAmount15 = arguments.MonetaryAmount15>
		<cfset variables.instance.Quantity16 = arguments.Quantity16>
		<cfset variables.instance.ClaimAdjustmentReasonCode17 = arguments.ClaimAdjustmentReasonCode17>
		<cfset variables.instance.MonetaryAmount18 = arguments.MonetaryAmount18>
		<cfset variables.instance.Quantity19 = arguments.Quantity19>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="Procedure_MEDICARE_CLAIMADJUSTMENTIO" output="No">
		
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="yes" type="numeric">		
		<cfset var qGetProcedure_MEDICARE_CLAIMADJUSTMENT = "">
		
		<cfset preInit(Procedure_MEDICARE_CLAIMADJUSTMENTID)>
	
		<cfquery name="qGetProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(request.datasource)#">
	  		SELECT Procedure_MEDICARE_CLAIMADJUSTMENTID,ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode,DateCreated,DateModified
			FROM procedure_medicare_claimadjustment  
			WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = #trim(arguments.Procedure_MEDICARE_CLAIMADJUSTMENTID)# 
		</cfquery>
		
		<cfif qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID EQ "NULL") 
				variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID = "NULL"; 
			ELSE 
				variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ProcedureID EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ProcedureID EQ "NULL") 
				variables.instance.ProcedureID = "NULL"; 
			ELSE 
				variables.instance.ProcedureID = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ProcedureID;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentGroupCode1 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentGroupCode1 EQ "NULL") 
				variables.instance.ClaimAdjustmentGroupCode1 = "NULL"; 
			ELSE 
				variables.instance.ClaimAdjustmentGroupCode1 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentGroupCode1;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode2 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode2 EQ "NULL") 
				variables.instance.ClaimAdjustmentReasonCode2 = "NULL"; 
			ELSE 
				variables.instance.ClaimAdjustmentReasonCode2 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode2;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount3 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount3 EQ "NULL") 
				variables.instance.MonetaryAmount3 = "NULL"; 
			ELSE 
				variables.instance.MonetaryAmount3 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount3;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity4 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity4 EQ "NULL") 
				variables.instance.Quantity4 = "NULL"; 
			ELSE 
				variables.instance.Quantity4 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity4;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode5 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode5 EQ "NULL") 
				variables.instance.ClaimAdjustmentReasonCode5 = "NULL"; 
			ELSE 
				variables.instance.ClaimAdjustmentReasonCode5 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode5;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount6 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount6 EQ "NULL") 
				variables.instance.MonetaryAmount6 = "NULL"; 
			ELSE 
				variables.instance.MonetaryAmount6 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount6;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity7 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity7 EQ "NULL") 
				variables.instance.Quantity7 = "NULL"; 
			ELSE 
				variables.instance.Quantity7 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity7;
							
				variables.instance.ClaimAdjustmentReasonCode8 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode8;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount9 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount9 EQ "NULL") 
				variables.instance.MonetaryAmount9 = "NULL"; 
			ELSE 
				variables.instance.MonetaryAmount9 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount9;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity10 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity10 EQ "NULL") 
				variables.instance.Quantity10 = "NULL"; 
			ELSE 
				variables.instance.Quantity10 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity10;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode11 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode11 EQ "NULL") 
				variables.instance.ClaimAdjustmentReasonCode11 = "NULL"; 
			ELSE 
				variables.instance.ClaimAdjustmentReasonCode11 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode11;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount12 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount12 EQ "NULL") 
				variables.instance.MonetaryAmount12 = "NULL"; 
			ELSE 
				variables.instance.MonetaryAmount12 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount12;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity13 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity13 EQ "NULL") 
				variables.instance.Quantity13 = "NULL"; 
			ELSE 
				variables.instance.Quantity13 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity13;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode14 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode14 EQ "NULL") 
				variables.instance.ClaimAdjustmentReasonCode14 = "NULL"; 
			ELSE 
				variables.instance.ClaimAdjustmentReasonCode14 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode14;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount15 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount15 EQ "NULL") 
				variables.instance.MonetaryAmount15 = "NULL"; 
			ELSE 
				variables.instance.MonetaryAmount15 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount15;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity16 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity16 EQ "NULL") 
				variables.instance.Quantity16 = "NULL"; 
			ELSE 
				variables.instance.Quantity16 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity16;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode17 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode17 EQ "NULL") 
				variables.instance.ClaimAdjustmentReasonCode17 = "NULL"; 
			ELSE 
				variables.instance.ClaimAdjustmentReasonCode17 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.ClaimAdjustmentReasonCode17;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount18 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount18 EQ "NULL") 
				variables.instance.MonetaryAmount18 = "NULL"; 
			ELSE 
				variables.instance.MonetaryAmount18 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.MonetaryAmount18;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity19 EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity19 EQ "NULL") 
				variables.instance.Quantity19 = "NULL"; 
			ELSE 
				variables.instance.Quantity19 = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Quantity19;
							
				variables.instance.Active = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.Active;
				
			IF(qGetProcedure_MEDICARE_CLAIMADJUSTMENT.InactiveCode EQ "" OR qGetProcedure_MEDICARE_CLAIMADJUSTMENT.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.InactiveCode;
							
				variables.instance.DateCreated = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.DateCreated;
							
				variables.instance.DateModified = qGetProcedure_MEDICARE_CLAIMADJUSTMENT.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(Procedure_MEDICARE_CLAIMADJUSTMENTID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitProcedure_MEDICARE_CLAIMADJUSTMENT = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID) AND variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitProcedure_MEDICARE_CLAIMADJUSTMENT" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID = qInsertCommitProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID>
				
				<cfreturn qInsertCommitProcedure_MEDICARE_CLAIMADJUSTMENT.Procedure_MEDICARE_CLAIMADJUSTMENTID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "Procedure_MEDICARE_CLAIMADJUSTMENTID,ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ClaimAdjustmentReasonCode8,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE Procedure_MEDICARE_CLAIMADJUSTMENT  SET #columnsToUpdate# WHERE Procedure_MEDICARE_CLAIMADJUSTMENTID = #trim(variables.instance.Procedure_MEDICARE_CLAIMADJUSTMENTID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ClaimAdjustmentReasonCode8,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO procedure_medicare_claimadjustment  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS Procedure_MEDICARE_CLAIMADJUSTMENTID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getProcedure_MEDICARE_CLAIMADJUSTMENTQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getProcedure_MEDICARE_CLAIMADJUSTMENTQuery">						
		<cfargument name="Fields" required="No" type="String" default="Procedure_MEDICARE_CLAIMADJUSTMENTID,ProcedureID,ClaimAdjustmentGroupCode1,ClaimAdjustmentReasonCode2,MonetaryAmount3,Quantity4,ClaimAdjustmentReasonCode5,MonetaryAmount6,Quantity7,ClaimAdjustmentReasonCode8,MonetaryAmount9,Quantity10,ClaimAdjustmentReasonCode11,MonetaryAmount12,Quantity13,ClaimAdjustmentReasonCode14,MonetaryAmount15,Quantity16,ClaimAdjustmentReasonCode17,MonetaryAmount18,Quantity19,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID" required="No" type="String" default="">
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID_IN" required="No" type="String" default="">
		<cfargument name="Procedure_MEDICARE_CLAIMADJUSTMENTID_LIKE" required="No" type="String" default="">
		<cfargument name="ProcedureID" required="No" type="String" default="">
		<cfargument name="ProcedureID_IN" required="No" type="String" default="">
		<cfargument name="ProcedureID_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentGroupCode1" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentGroupCode1_IN" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentGroupCode1_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode2" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode2_IN" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode2_LIKE" required="No" type="String" default="">
		<cfargument name="MonetaryAmount3" required="No" type="String" default="">
		<cfargument name="MonetaryAmount3_IN" required="No" type="String" default="">
		<cfargument name="MonetaryAmount3_LIKE" required="No" type="String" default="">
		<cfargument name="Quantity4" required="No" type="String" default="">
		<cfargument name="Quantity4_IN" required="No" type="String" default="">
		<cfargument name="Quantity4_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode5" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode5_IN" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode5_LIKE" required="No" type="String" default="">
		<cfargument name="MonetaryAmount6" required="No" type="String" default="">
		<cfargument name="MonetaryAmount6_IN" required="No" type="String" default="">
		<cfargument name="MonetaryAmount6_LIKE" required="No" type="String" default="">
		<cfargument name="Quantity7" required="No" type="String" default="">
		<cfargument name="Quantity7_IN" required="No" type="String" default="">
		<cfargument name="Quantity7_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode8" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode8_IN" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode8_LIKE" required="No" type="String" default="">
		<cfargument name="MonetaryAmount9" required="No" type="String" default="">
		<cfargument name="MonetaryAmount9_IN" required="No" type="String" default="">
		<cfargument name="MonetaryAmount9_LIKE" required="No" type="String" default="">
		<cfargument name="Quantity10" required="No" type="String" default="">
		<cfargument name="Quantity10_IN" required="No" type="String" default="">
		<cfargument name="Quantity10_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode11" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode11_IN" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode11_LIKE" required="No" type="String" default="">
		<cfargument name="MonetaryAmount12" required="No" type="String" default="">
		<cfargument name="MonetaryAmount12_IN" required="No" type="String" default="">
		<cfargument name="MonetaryAmount12_LIKE" required="No" type="String" default="">
		<cfargument name="Quantity13" required="No" type="String" default="">
		<cfargument name="Quantity13_IN" required="No" type="String" default="">
		<cfargument name="Quantity13_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode14" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode14_IN" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode14_LIKE" required="No" type="String" default="">
		<cfargument name="MonetaryAmount15" required="No" type="String" default="">
		<cfargument name="MonetaryAmount15_IN" required="No" type="String" default="">
		<cfargument name="MonetaryAmount15_LIKE" required="No" type="String" default="">
		<cfargument name="Quantity16" required="No" type="String" default="">
		<cfargument name="Quantity16_IN" required="No" type="String" default="">
		<cfargument name="Quantity16_LIKE" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode17" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode17_IN" required="No" type="String" default="">
		<cfargument name="ClaimAdjustmentReasonCode17_LIKE" required="No" type="String" default="">
		<cfargument name="MonetaryAmount18" required="No" type="String" default="">
		<cfargument name="MonetaryAmount18_IN" required="No" type="String" default="">
		<cfargument name="MonetaryAmount18_LIKE" required="No" type="String" default="">
		<cfargument name="Quantity19" required="No" type="String" default="">
		<cfargument name="Quantity19_IN" required="No" type="String" default="">
		<cfargument name="Quantity19_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "Procedure_MEDICARE_CLAIMADJUSTMENTID,Procedure_MEDICARE_CLAIMADJUSTMENTID_IN,Procedure_MEDICARE_CLAIMADJUSTMENTID_LIKE,ProcedureID,ProcedureID_IN,ProcedureID_LIKE,ClaimAdjustmentGroupCode1,ClaimAdjustmentGroupCode1_IN,ClaimAdjustmentGroupCode1_LIKE,ClaimAdjustmentReasonCode2,ClaimAdjustmentReasonCode2_IN,ClaimAdjustmentReasonCode2_LIKE,MonetaryAmount3,MonetaryAmount3_IN,MonetaryAmount3_LIKE,Quantity4,Quantity4_IN,Quantity4_LIKE,ClaimAdjustmentReasonCode5,ClaimAdjustmentReasonCode5_IN,ClaimAdjustmentReasonCode5_LIKE,MonetaryAmount6,MonetaryAmount6_IN,MonetaryAmount6_LIKE,Quantity7,Quantity7_IN,Quantity7_LIKE,ClaimAdjustmentReasonCode8,ClaimAdjustmentReasonCode8_IN,ClaimAdjustmentReasonCode8_LIKE,MonetaryAmount9,MonetaryAmount9_IN,MonetaryAmount9_LIKE,Quantity10,Quantity10_IN,Quantity10_LIKE,ClaimAdjustmentReasonCode11,ClaimAdjustmentReasonCode11_IN,ClaimAdjustmentReasonCode11_LIKE,MonetaryAmount12,MonetaryAmount12_IN,MonetaryAmount12_LIKE,Quantity13,Quantity13_IN,Quantity13_LIKE,ClaimAdjustmentReasonCode14,ClaimAdjustmentReasonCode14_IN,ClaimAdjustmentReasonCode14_LIKE,MonetaryAmount15,MonetaryAmount15_IN,MonetaryAmount15_LIKE,Quantity16,Quantity16_IN,Quantity16_LIKE,ClaimAdjustmentReasonCode17,ClaimAdjustmentReasonCode17_IN,ClaimAdjustmentReasonCode17_LIKE,MonetaryAmount18,MonetaryAmount18_IN,MonetaryAmount18_LIKE,Quantity19,Quantity19_IN,Quantity19_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Procedure_MEDICARE_CLAIMADJUSTMENT"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getProcedure_MEDICARE_CLAIMADJUSTMENTQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM procedure_medicare_claimadjustment   
				WHERE 1=1
					<cfif Procedure_MEDICARE_CLAIMADJUSTMENTID NEQ "" AND IsNumeric(Procedure_MEDICARE_CLAIMADJUSTMENTID)>AND Procedure_MEDICARE_CLAIMADJUSTMENTID = #Procedure_MEDICARE_CLAIMADJUSTMENTID#</cfif>
					<cfif Procedure_MEDICARE_CLAIMADJUSTMENTID_IN NEQ "">AND Procedure_MEDICARE_CLAIMADJUSTMENTID IN(#trim(Procedure_MEDICARE_CLAIMADJUSTMENTID_IN)#)</cfif>
					<cfif Procedure_MEDICARE_CLAIMADJUSTMENTID_LIKE NEQ "">AND Procedure_MEDICARE_CLAIMADJUSTMENTID LIKE '%#trim(Procedure_MEDICARE_CLAIMADJUSTMENTID_LIKE)#%'</cfif>
					<cfif ProcedureID NEQ "" AND IsNumeric(ProcedureID)>AND ProcedureID = #ProcedureID#</cfif>
					<cfif ProcedureID_IN NEQ "">AND ProcedureID IN(#trim(ProcedureID_IN)#)</cfif>
					<cfif ProcedureID_LIKE NEQ "">AND ProcedureID LIKE '%#trim(ProcedureID_LIKE)#%'</cfif>
					<cfif ClaimAdjustmentGroupCode1 NEQ "" AND IsNumeric(ClaimAdjustmentGroupCode1)>AND ClaimAdjustmentGroupCode1 = #ClaimAdjustmentGroupCode1#</cfif>
					<cfif ClaimAdjustmentGroupCode1_IN NEQ "">AND ClaimAdjustmentGroupCode1 IN(#trim(ClaimAdjustmentGroupCode1_IN)#)</cfif>
					<cfif ClaimAdjustmentGroupCode1_LIKE NEQ "">AND ClaimAdjustmentGroupCode1 LIKE '%#trim(ClaimAdjustmentGroupCode1_LIKE)#%'</cfif>
					<cfif ClaimAdjustmentReasonCode2 NEQ "" AND IsNumeric(ClaimAdjustmentReasonCode2)>AND ClaimAdjustmentReasonCode2 = #ClaimAdjustmentReasonCode2#</cfif>
					<cfif ClaimAdjustmentReasonCode2_IN NEQ "">AND ClaimAdjustmentReasonCode2 IN(#trim(ClaimAdjustmentReasonCode2_IN)#)</cfif>
					<cfif ClaimAdjustmentReasonCode2_LIKE NEQ "">AND ClaimAdjustmentReasonCode2 LIKE '%#trim(ClaimAdjustmentReasonCode2_LIKE)#%'</cfif>
					<cfif MonetaryAmount3 NEQ "" AND IsNumeric(MonetaryAmount3)>AND MonetaryAmount3 = #MonetaryAmount3#</cfif>
					<cfif MonetaryAmount3_IN NEQ "">AND MonetaryAmount3 IN(#trim(MonetaryAmount3_IN)#)</cfif>
					<cfif MonetaryAmount3_LIKE NEQ "">AND MonetaryAmount3 LIKE '%#trim(MonetaryAmount3_LIKE)#%'</cfif>
					<cfif Quantity4 NEQ "" AND IsNumeric(Quantity4)>AND Quantity4 = #Quantity4#</cfif>
					<cfif Quantity4_IN NEQ "">AND Quantity4 IN(#trim(Quantity4_IN)#)</cfif>
					<cfif Quantity4_LIKE NEQ "">AND Quantity4 LIKE '%#trim(Quantity4_LIKE)#%'</cfif>
					<cfif ClaimAdjustmentReasonCode5 NEQ "" AND IsNumeric(ClaimAdjustmentReasonCode5)>AND ClaimAdjustmentReasonCode5 = #ClaimAdjustmentReasonCode5#</cfif>
					<cfif ClaimAdjustmentReasonCode5_IN NEQ "">AND ClaimAdjustmentReasonCode5 IN(#trim(ClaimAdjustmentReasonCode5_IN)#)</cfif>
					<cfif ClaimAdjustmentReasonCode5_LIKE NEQ "">AND ClaimAdjustmentReasonCode5 LIKE '%#trim(ClaimAdjustmentReasonCode5_LIKE)#%'</cfif>
					<cfif MonetaryAmount6 NEQ "" AND IsNumeric(MonetaryAmount6)>AND MonetaryAmount6 = #MonetaryAmount6#</cfif>
					<cfif MonetaryAmount6_IN NEQ "">AND MonetaryAmount6 IN(#trim(MonetaryAmount6_IN)#)</cfif>
					<cfif MonetaryAmount6_LIKE NEQ "">AND MonetaryAmount6 LIKE '%#trim(MonetaryAmount6_LIKE)#%'</cfif>
					<cfif Quantity7 NEQ "" AND IsNumeric(Quantity7)>AND Quantity7 = #Quantity7#</cfif>
					<cfif Quantity7_IN NEQ "">AND Quantity7 IN(#trim(Quantity7_IN)#)</cfif>
					<cfif Quantity7_LIKE NEQ "">AND Quantity7 LIKE '%#trim(Quantity7_LIKE)#%'</cfif>
					<cfif ClaimAdjustmentReasonCode8 NEQ "">AND ClaimAdjustmentReasonCode8 = '#ClaimAdjustmentReasonCode8#'</cfif>
					<cfif ClaimAdjustmentReasonCode8_IN NEQ "">AND ClaimAdjustmentReasonCode8 IN(#trim(ClaimAdjustmentReasonCode8_IN)#)</cfif>
					<cfif ClaimAdjustmentReasonCode8_LIKE NEQ "">AND ClaimAdjustmentReasonCode8 LIKE '%#trim(ClaimAdjustmentReasonCode8_LIKE)#%'</cfif>
					<cfif MonetaryAmount9 NEQ "" AND IsNumeric(MonetaryAmount9)>AND MonetaryAmount9 = #MonetaryAmount9#</cfif>
					<cfif MonetaryAmount9_IN NEQ "">AND MonetaryAmount9 IN(#trim(MonetaryAmount9_IN)#)</cfif>
					<cfif MonetaryAmount9_LIKE NEQ "">AND MonetaryAmount9 LIKE '%#trim(MonetaryAmount9_LIKE)#%'</cfif>
					<cfif Quantity10 NEQ "" AND IsNumeric(Quantity10)>AND Quantity10 = #Quantity10#</cfif>
					<cfif Quantity10_IN NEQ "">AND Quantity10 IN(#trim(Quantity10_IN)#)</cfif>
					<cfif Quantity10_LIKE NEQ "">AND Quantity10 LIKE '%#trim(Quantity10_LIKE)#%'</cfif>
					<cfif ClaimAdjustmentReasonCode11 NEQ "" AND IsNumeric(ClaimAdjustmentReasonCode11)>AND ClaimAdjustmentReasonCode11 = #ClaimAdjustmentReasonCode11#</cfif>
					<cfif ClaimAdjustmentReasonCode11_IN NEQ "">AND ClaimAdjustmentReasonCode11 IN(#trim(ClaimAdjustmentReasonCode11_IN)#)</cfif>
					<cfif ClaimAdjustmentReasonCode11_LIKE NEQ "">AND ClaimAdjustmentReasonCode11 LIKE '%#trim(ClaimAdjustmentReasonCode11_LIKE)#%'</cfif>
					<cfif MonetaryAmount12 NEQ "" AND IsNumeric(MonetaryAmount12)>AND MonetaryAmount12 = #MonetaryAmount12#</cfif>
					<cfif MonetaryAmount12_IN NEQ "">AND MonetaryAmount12 IN(#trim(MonetaryAmount12_IN)#)</cfif>
					<cfif MonetaryAmount12_LIKE NEQ "">AND MonetaryAmount12 LIKE '%#trim(MonetaryAmount12_LIKE)#%'</cfif>
					<cfif Quantity13 NEQ "" AND IsNumeric(Quantity13)>AND Quantity13 = #Quantity13#</cfif>
					<cfif Quantity13_IN NEQ "">AND Quantity13 IN(#trim(Quantity13_IN)#)</cfif>
					<cfif Quantity13_LIKE NEQ "">AND Quantity13 LIKE '%#trim(Quantity13_LIKE)#%'</cfif>
					<cfif ClaimAdjustmentReasonCode14 NEQ "" AND IsNumeric(ClaimAdjustmentReasonCode14)>AND ClaimAdjustmentReasonCode14 = #ClaimAdjustmentReasonCode14#</cfif>
					<cfif ClaimAdjustmentReasonCode14_IN NEQ "">AND ClaimAdjustmentReasonCode14 IN(#trim(ClaimAdjustmentReasonCode14_IN)#)</cfif>
					<cfif ClaimAdjustmentReasonCode14_LIKE NEQ "">AND ClaimAdjustmentReasonCode14 LIKE '%#trim(ClaimAdjustmentReasonCode14_LIKE)#%'</cfif>
					<cfif MonetaryAmount15 NEQ "" AND IsNumeric(MonetaryAmount15)>AND MonetaryAmount15 = #MonetaryAmount15#</cfif>
					<cfif MonetaryAmount15_IN NEQ "">AND MonetaryAmount15 IN(#trim(MonetaryAmount15_IN)#)</cfif>
					<cfif MonetaryAmount15_LIKE NEQ "">AND MonetaryAmount15 LIKE '%#trim(MonetaryAmount15_LIKE)#%'</cfif>
					<cfif Quantity16 NEQ "" AND IsNumeric(Quantity16)>AND Quantity16 = #Quantity16#</cfif>
					<cfif Quantity16_IN NEQ "">AND Quantity16 IN(#trim(Quantity16_IN)#)</cfif>
					<cfif Quantity16_LIKE NEQ "">AND Quantity16 LIKE '%#trim(Quantity16_LIKE)#%'</cfif>
					<cfif ClaimAdjustmentReasonCode17 NEQ "" AND IsNumeric(ClaimAdjustmentReasonCode17)>AND ClaimAdjustmentReasonCode17 = #ClaimAdjustmentReasonCode17#</cfif>
					<cfif ClaimAdjustmentReasonCode17_IN NEQ "">AND ClaimAdjustmentReasonCode17 IN(#trim(ClaimAdjustmentReasonCode17_IN)#)</cfif>
					<cfif ClaimAdjustmentReasonCode17_LIKE NEQ "">AND ClaimAdjustmentReasonCode17 LIKE '%#trim(ClaimAdjustmentReasonCode17_LIKE)#%'</cfif>
					<cfif MonetaryAmount18 NEQ "" AND IsNumeric(MonetaryAmount18)>AND MonetaryAmount18 = #MonetaryAmount18#</cfif>
					<cfif MonetaryAmount18_IN NEQ "">AND MonetaryAmount18 IN(#trim(MonetaryAmount18_IN)#)</cfif>
					<cfif MonetaryAmount18_LIKE NEQ "">AND MonetaryAmount18 LIKE '%#trim(MonetaryAmount18_LIKE)#%'</cfif>
					<cfif Quantity19 NEQ "" AND IsNumeric(Quantity19)>AND Quantity19 = #Quantity19#</cfif>
					<cfif Quantity19_IN NEQ "">AND Quantity19 IN(#trim(Quantity19_IN)#)</cfif>
					<cfif Quantity19_LIKE NEQ "">AND Quantity19 LIKE '%#trim(Quantity19_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getProcedure_MEDICARE_CLAIMADJUSTMENTQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




