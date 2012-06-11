<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- EntityRSIO.cfc                                                                 --->
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
<!--- This tag is a CFC tag tied to the EntityRS table in the dB.                    --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_EntityRSTable                                                    --->  
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
<!--- EntityRSID<br>                                                                 --->
<!--- EntityID<br>                                                                   --->
<!--- ColM<br>                                                                       --->
<!--- ColE<br>                                                                       --->
<!--- ColL<br>                                                                       --->
<!--- ColI<br>                                                                       --->
<!--- ColA<br>                                                                       --->
<!--- ColC<br>                                                                       --->
<!--- ColR<br>                                                                       --->
<!--- IsDefault<br>                                                                  --->
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


<cfcomponent name="EntityRSIO">

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
			variables.instance.EntityRSID = "NULL";
			variables.instance.EntityID = "NULL";
			variables.instance.ColM = "";
			variables.instance.ColE = "";
			variables.instance.ColL = "";
			variables.instance.ColI = "";
			variables.instance.ColA = "";
			variables.instance.ColC = "";
			variables.instance.ColR = "";
			variables.instance.IsDefault = "NULL";
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
	<cfset temp = QueryAddRow(defaultsQuery, 14)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTITYRSID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTITYID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COLM", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COLE", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COLL", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COLI", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COLA", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COLC", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COLR", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ISDEFAULT", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "0", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 14)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntityRSID.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityRSID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntityRSID>
	</cffunction>
	 
	<cffunction name="setEntityRSID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntityRSID" required="Yes" type="String">
		
		<cfif EntityRSID NEQ "NULL">	
			
			<cfif arguments.EntityRSID EQ "@@" OR arguments.EntityRSID EQ "">
				
				<cfset arguments.EntityRSID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EntityRSID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntityRSID</strong> (#EntityRSID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntityRSID = arguments.EntityRSID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntityID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntityID>
	</cffunction>
	 
	<cffunction name="setEntityID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntityID" required="Yes" type="String">
		
		<cfif EntityID NEQ "NULL">	
			
			<cfif arguments.EntityID EQ "@@" OR arguments.EntityID EQ "">
				
				<cfset arguments.EntityID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EntityID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntityID</strong> (#EntityID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntityID = arguments.EntityID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EntityID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ColM.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getColM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ColM>
	</cffunction>
	 
	<cffunction name="setColM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ColM" required="Yes" type="String">
		
		<cfif ColM NEQ "NULL">	
			
			<cfif arguments.ColM EQ "@@" OR arguments.ColM EQ "">
				
				<cfset arguments.ColM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ColM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ColM</strong> (#ColM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ColM) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ColM</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ColM = arguments.ColM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ColM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ColE.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getColE" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ColE>
	</cffunction>
	 
	<cffunction name="setColE" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ColE" required="Yes" type="String">
		
		<cfif ColE NEQ "NULL">	
			
			<cfif arguments.ColE EQ "@@" OR arguments.ColE EQ "">
				
				<cfset arguments.ColE = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ColE)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ColE</strong> (#ColE#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ColE) GT 120>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ColE</strong> cannot be greater than 120 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ColE = arguments.ColE>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ColE")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ColL.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getColL" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ColL>
	</cffunction>
	 
	<cffunction name="setColL" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ColL" required="Yes" type="String">
		
		<cfif ColL NEQ "NULL">	
			
			<cfif arguments.ColL EQ "@@" OR arguments.ColL EQ "">
				
				<cfset arguments.ColL = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ColL)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ColL</strong> (#ColL#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ColL) GT 120>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ColL</strong> cannot be greater than 120 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ColL = arguments.ColL>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ColL")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ColI.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getColI" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ColI>
	</cffunction>
	 
	<cffunction name="setColI" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ColI" required="Yes" type="String">
		
		<cfif ColI NEQ "NULL">	
			
			<cfif arguments.ColI EQ "@@" OR arguments.ColI EQ "">
				
				<cfset arguments.ColI = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ColI)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ColI</strong> (#ColI#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ColI) GT 40>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ColI</strong> cannot be greater than 40 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ColI = arguments.ColI>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ColI")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ColA.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getColA" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ColA>
	</cffunction>
	 
	<cffunction name="setColA" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ColA" required="Yes" type="String">
		
		<cfif ColA NEQ "NULL">	
			
			<cfif arguments.ColA EQ "@@" OR arguments.ColA EQ "">
				
				<cfset arguments.ColA = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ColA)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ColA</strong> (#ColA#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ColA) GT 40>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ColA</strong> cannot be greater than 40 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ColA = arguments.ColA>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ColA")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ColC.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getColC" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ColC>
	</cffunction>
	 
	<cffunction name="setColC" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ColC" required="Yes" type="String">
		
		<cfif ColC NEQ "NULL">	
			
			<cfif arguments.ColC EQ "@@" OR arguments.ColC EQ "">
				
				<cfset arguments.ColC = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ColC)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ColC</strong> (#ColC#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ColC) GT 40>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ColC</strong> cannot be greater than 40 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ColC = arguments.ColC>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ColC")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ColR.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getColR" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ColR>
	</cffunction>
	 
	<cffunction name="setColR" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ColR" required="Yes" type="String">
		
		<cfif ColR NEQ "NULL">	
			
			<cfif arguments.ColR EQ "@@" OR arguments.ColR EQ "">
				
				<cfset arguments.ColR = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ColR)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ColR</strong> (#ColR#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ColR) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ColR</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ColR = arguments.ColR>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ColR")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for IsDefault.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIsDefault" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IsDefault>
	</cffunction>
	 
	<cffunction name="setIsDefault" access="public" returntype="boolean" output="No">
 		
		<cfargument name="IsDefault" required="Yes" type="String">
		
		<cfif IsDefault NEQ "NULL">	
			
			<cfif arguments.IsDefault EQ "@@" OR arguments.IsDefault EQ "">
				
				<cfset arguments.IsDefault = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(IsDefault)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>IsDefault</strong> (#IsDefault#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.IsDefault = arguments.IsDefault>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "IsDefault")>			
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

		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="ColM" required="No" type="String" default="">
		<cfargument name="ColE" required="No" type="String" default="">
		<cfargument name="ColL" required="No" type="String" default="">
		<cfargument name="ColI" required="No" type="String" default="">
		<cfargument name="ColA" required="No" type="String" default="">
		<cfargument name="ColC" required="No" type="String" default="">
		<cfargument name="ColR" required="No" type="String" default="">
		<cfargument name="IsDefault" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.EntityID = arguments.EntityID>
		<cfset variables.instance.ColM = arguments.ColM>
		<cfset variables.instance.ColE = arguments.ColE>
		<cfset variables.instance.ColL = arguments.ColL>
		<cfset variables.instance.ColI = arguments.ColI>
		<cfset variables.instance.ColA = arguments.ColA>
		<cfset variables.instance.ColC = arguments.ColC>
		<cfset variables.instance.ColR = arguments.ColR>
		<cfset variables.instance.IsDefault = arguments.IsDefault>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="EntityRSIO" output="No">
		
		<cfargument name="EntityRSID" required="yes" type="numeric">		
		<cfset var qGetEntityRS = "">
		
		<cfset preInit(EntityRSID)>
	
		<cfquery name="qGetEntityRS" datasource="#trim(request.datasource)#">
	  		SELECT EntityRSID,EntityID,ColM,ColE,ColL,ColI,ColA,ColC,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified
			FROM entityrs  
			WHERE EntityRSID = #trim(arguments.EntityRSID)# 
		</cfquery>
		
		<cfif qGetEntityRS.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetEntityRS.EntityRSID EQ "" OR qGetEntityRS.EntityRSID EQ "NULL") 
				variables.instance.EntityRSID = "NULL"; 
			ELSE 
				variables.instance.EntityRSID = qGetEntityRS.EntityRSID;
				
			IF(qGetEntityRS.EntityID EQ "" OR qGetEntityRS.EntityID EQ "NULL") 
				variables.instance.EntityID = "NULL"; 
			ELSE 
				variables.instance.EntityID = qGetEntityRS.EntityID;
							
				variables.instance.ColM = qGetEntityRS.ColM;
							
				variables.instance.ColE = qGetEntityRS.ColE;
							
				variables.instance.ColL = qGetEntityRS.ColL;
							
				variables.instance.ColI = qGetEntityRS.ColI;
							
				variables.instance.ColA = qGetEntityRS.ColA;
							
				variables.instance.ColC = qGetEntityRS.ColC;
							
				variables.instance.ColR = qGetEntityRS.ColR;
				
			IF(qGetEntityRS.IsDefault EQ "" OR qGetEntityRS.IsDefault EQ "NULL") 
				variables.instance.IsDefault = "NULL"; 
			ELSE 
				variables.instance.IsDefault = qGetEntityRS.IsDefault;
							
				variables.instance.Active = qGetEntityRS.Active;
				
			IF(qGetEntityRS.InactiveCode EQ "" OR qGetEntityRS.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetEntityRS.InactiveCode;
							
				variables.instance.DateCreated = qGetEntityRS.DateCreated;
							
				variables.instance.DateModified = qGetEntityRS.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(EntityRSID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitEntityRS = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.EntityRSID) AND variables.instance.EntityRSID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitEntityRS" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitEntityRS" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.EntityRSID = qInsertCommitEntityRS.EntityRSID>
				
				<cfreturn qInsertCommitEntityRS.EntityRSID>
			
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
			<cfset tableColumns = "EntityRSID,EntityID,ColM,ColE,ColL,ColI,ColA,ColC,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ColM,ColE,ColL,ColI,ColA,ColC,ColR,Active">	
			
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
				<cfset sqlStatement = "UPDATE EntityRS  SET #columnsToUpdate# WHERE EntityRSID = #trim(variables.instance.EntityRSID)#">
				
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
			<cfset stringTableColumns = "ColM,ColE,ColL,ColI,ColA,ColC,ColR,Active">	
			
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
			<cfloop list="EntityID,ColM,ColE,ColL,ColI,ColA,ColC,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO entityrs  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS EntityRSID ">
				
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
	<cffunction name="getEntityRSQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getEntityRSQuery">						
		<cfargument name="Fields" required="No" type="String" default="EntityRSID,EntityID,ColM,ColE,ColL,ColI,ColA,ColC,ColR,IsDefault,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="EntityRSID" required="No" type="String" default="">
		<cfargument name="EntityRSID_IN" required="No" type="String" default="">
		<cfargument name="EntityRSID_LIKE" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="EntityID_IN" required="No" type="String" default="">
		<cfargument name="EntityID_LIKE" required="No" type="String" default="">
		<cfargument name="ColM" required="No" type="String" default="">
		<cfargument name="ColM_IN" required="No" type="String" default="">
		<cfargument name="ColM_LIKE" required="No" type="String" default="">
		<cfargument name="ColE" required="No" type="String" default="">
		<cfargument name="ColE_IN" required="No" type="String" default="">
		<cfargument name="ColE_LIKE" required="No" type="String" default="">
		<cfargument name="ColL" required="No" type="String" default="">
		<cfargument name="ColL_IN" required="No" type="String" default="">
		<cfargument name="ColL_LIKE" required="No" type="String" default="">
		<cfargument name="ColI" required="No" type="String" default="">
		<cfargument name="ColI_IN" required="No" type="String" default="">
		<cfargument name="ColI_LIKE" required="No" type="String" default="">
		<cfargument name="ColA" required="No" type="String" default="">
		<cfargument name="ColA_IN" required="No" type="String" default="">
		<cfargument name="ColA_LIKE" required="No" type="String" default="">
		<cfargument name="ColC" required="No" type="String" default="">
		<cfargument name="ColC_IN" required="No" type="String" default="">
		<cfargument name="ColC_LIKE" required="No" type="String" default="">
		<cfargument name="ColR" required="No" type="String" default="">
		<cfargument name="ColR_IN" required="No" type="String" default="">
		<cfargument name="ColR_LIKE" required="No" type="String" default="">
		<cfargument name="IsDefault" required="No" type="String" default="">
		<cfargument name="IsDefault_IN" required="No" type="String" default="">
		<cfargument name="IsDefault_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "EntityRSID,EntityRSID_IN,EntityRSID_LIKE,EntityID,EntityID_IN,EntityID_LIKE,ColM,ColM_IN,ColM_LIKE,ColE,ColE_IN,ColE_LIKE,ColL,ColL_IN,ColL_LIKE,ColI,ColI_IN,ColI_LIKE,ColA,ColA_IN,ColA_LIKE,ColC,ColC_IN,ColC_LIKE,ColR,ColR_IN,ColR_LIKE,IsDefault,IsDefault_IN,IsDefault_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="EntityRS"
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
			<cfquery Name="getEntityRSQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM entityrs   
				WHERE 1=1
					<cfif EntityRSID NEQ "" AND IsNumeric(EntityRSID)>AND EntityRSID = #EntityRSID#</cfif>
					<cfif EntityRSID_IN NEQ "">AND EntityRSID IN(#trim(EntityRSID_IN)#)</cfif>
					<cfif EntityRSID_LIKE NEQ "">AND EntityRSID LIKE '%#trim(EntityRSID_LIKE)#%'</cfif>
					<cfif EntityID NEQ "" AND IsNumeric(EntityID)>AND EntityID = #EntityID#</cfif>
					<cfif EntityID_IN NEQ "">AND EntityID IN(#trim(EntityID_IN)#)</cfif>
					<cfif EntityID_LIKE NEQ "">AND EntityID LIKE '%#trim(EntityID_LIKE)#%'</cfif>
					<cfif ColM NEQ "">AND ColM = '#ColM#'</cfif>
					<cfif ColM_IN NEQ "">AND ColM IN(#trim(ColM_IN)#)</cfif>
					<cfif ColM_LIKE NEQ "">AND ColM LIKE '%#trim(ColM_LIKE)#%'</cfif>
					<cfif ColE NEQ "">AND ColE = '#ColE#'</cfif>
					<cfif ColE_IN NEQ "">AND ColE IN(#trim(ColE_IN)#)</cfif>
					<cfif ColE_LIKE NEQ "">AND ColE LIKE '%#trim(ColE_LIKE)#%'</cfif>
					<cfif ColL NEQ "">AND ColL = '#ColL#'</cfif>
					<cfif ColL_IN NEQ "">AND ColL IN(#trim(ColL_IN)#)</cfif>
					<cfif ColL_LIKE NEQ "">AND ColL LIKE '%#trim(ColL_LIKE)#%'</cfif>
					<cfif ColI NEQ "">AND ColI = '#ColI#'</cfif>
					<cfif ColI_IN NEQ "">AND ColI IN(#trim(ColI_IN)#)</cfif>
					<cfif ColI_LIKE NEQ "">AND ColI LIKE '%#trim(ColI_LIKE)#%'</cfif>
					<cfif ColA NEQ "">AND ColA = '#ColA#'</cfif>
					<cfif ColA_IN NEQ "">AND ColA IN(#trim(ColA_IN)#)</cfif>
					<cfif ColA_LIKE NEQ "">AND ColA LIKE '%#trim(ColA_LIKE)#%'</cfif>
					<cfif ColC NEQ "">AND ColC = '#ColC#'</cfif>
					<cfif ColC_IN NEQ "">AND ColC IN(#trim(ColC_IN)#)</cfif>
					<cfif ColC_LIKE NEQ "">AND ColC LIKE '%#trim(ColC_LIKE)#%'</cfif>
					<cfif ColR NEQ "">AND ColR = '#ColR#'</cfif>
					<cfif ColR_IN NEQ "">AND ColR IN(#trim(ColR_IN)#)</cfif>
					<cfif ColR_LIKE NEQ "">AND ColR LIKE '%#trim(ColR_LIKE)#%'</cfif>
					<cfif IsDefault NEQ "" AND IsNumeric(IsDefault)>AND IsDefault = #IsDefault#</cfif>
					<cfif IsDefault_IN NEQ "">AND IsDefault IN(#trim(IsDefault_IN)#)</cfif>
					<cfif IsDefault_LIKE NEQ "">AND IsDefault LIKE '%#trim(IsDefault_LIKE)#%'</cfif>
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
			
			<cfreturn getEntityRSQuery>
		
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




