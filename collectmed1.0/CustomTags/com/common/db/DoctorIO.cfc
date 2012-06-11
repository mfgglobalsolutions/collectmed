<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- DoctorIO.cfc                                                                   --->
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
<!--- This tag is a CFC tag tied to the Doctor table in the dB.                      --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_DoctorTable                                                      --->  
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
<!--- DoctorID<br>                                                                   --->
<!--- EntityID<br>                                                                   --->
<!--- ClientDoctorID<br>                                                             --->
<!--- DoctorCategory<br>                                                             --->
<!--- UPIN<br>                                                                       --->
<!--- MedicareNumber<br>                                                             --->
<!--- MedicaidNumber<br>                                                             --->
<!--- GroupName<br>                                                                  --->
<!--- SpecialInstructions<br>                                                        --->
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


<cfcomponent name="DoctorIO">

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
			variables.instance.DoctorID = "NULL";
			variables.instance.EntityID = "NULL";
			variables.instance.ClientDoctorID = "";
			variables.instance.DoctorCategory = "";
			variables.instance.UPIN = "";
			variables.instance.MedicareNumber = "";
			variables.instance.MedicaidNumber = "";
			variables.instance.GroupName = "";
			variables.instance.SpecialInstructions = "";
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
	<cfset temp = QueryAddRow(defaultsQuery, 13)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DOCTORID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTITYID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTDOCTORID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DOCTORCATEGORY", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "UPIN", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MEDICARENUMBER", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MEDICAIDNUMBER", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "GROUPNAME", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SPECIALINSTRUCTIONS", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DoctorID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDoctorID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DoctorID>
	</cffunction>
	 
	<cffunction name="setDoctorID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DoctorID" required="Yes" type="String">
		
		<cfif DoctorID NEQ "NULL">	
			
			<cfif arguments.DoctorID EQ "@@" OR arguments.DoctorID EQ "">
				
				<cfset arguments.DoctorID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(DoctorID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DoctorID</strong> (#DoctorID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DoctorID = arguments.DoctorID>			
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
	<!--- GET and SET method for ClientDoctorID.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientDoctorID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientDoctorID>
	</cffunction>
	 
	<cffunction name="setClientDoctorID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientDoctorID" required="Yes" type="String">
		
		<cfif ClientDoctorID NEQ "NULL">	
			
			<cfif arguments.ClientDoctorID EQ "@@" OR arguments.ClientDoctorID EQ "">
				
				<cfset arguments.ClientDoctorID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClientDoctorID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientDoctorID</strong> (#ClientDoctorID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClientDoctorID) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClientDoctorID</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientDoctorID = arguments.ClientDoctorID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientDoctorID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DoctorCategory.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDoctorCategory" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DoctorCategory>
	</cffunction>
	 
	<cffunction name="setDoctorCategory" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DoctorCategory" required="Yes" type="String">
		
		<cfif DoctorCategory NEQ "NULL">	
			
			<cfif arguments.DoctorCategory EQ "@@" OR arguments.DoctorCategory EQ "">
				
				<cfset arguments.DoctorCategory = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(DoctorCategory)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DoctorCategory</strong> (#DoctorCategory#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(DoctorCategory) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>DoctorCategory</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DoctorCategory = arguments.DoctorCategory>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DoctorCategory")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UPIN.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUPIN" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UPIN>
	</cffunction>
	 
	<cffunction name="setUPIN" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UPIN" required="Yes" type="String">
		
		<cfif UPIN NEQ "NULL">	
			
			<cfif arguments.UPIN EQ "@@" OR arguments.UPIN EQ "">
				
				<cfset arguments.UPIN = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(UPIN)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UPIN</strong> (#UPIN#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(UPIN) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>UPIN</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UPIN = arguments.UPIN>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "UPIN")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MedicareNumber.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMedicareNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MedicareNumber>
	</cffunction>
	 
	<cffunction name="setMedicareNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MedicareNumber" required="Yes" type="String">
		
		<cfif MedicareNumber NEQ "NULL">	
			
			<cfif arguments.MedicareNumber EQ "@@" OR arguments.MedicareNumber EQ "">
				
				<cfset arguments.MedicareNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MedicareNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MedicareNumber</strong> (#MedicareNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MedicareNumber) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MedicareNumber</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MedicareNumber = arguments.MedicareNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MedicareNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MedicaidNumber.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMedicaidNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MedicaidNumber>
	</cffunction>
	 
	<cffunction name="setMedicaidNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MedicaidNumber" required="Yes" type="String">
		
		<cfif MedicaidNumber NEQ "NULL">	
			
			<cfif arguments.MedicaidNumber EQ "@@" OR arguments.MedicaidNumber EQ "">
				
				<cfset arguments.MedicaidNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MedicaidNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MedicaidNumber</strong> (#MedicaidNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MedicaidNumber) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MedicaidNumber</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MedicaidNumber = arguments.MedicaidNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MedicaidNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for GroupName.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getGroupName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.GroupName>
	</cffunction>
	 
	<cffunction name="setGroupName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="GroupName" required="Yes" type="String">
		
		<cfif GroupName NEQ "NULL">	
			
			<cfif arguments.GroupName EQ "@@" OR arguments.GroupName EQ "">
				
				<cfset arguments.GroupName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(GroupName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>GroupName</strong> (#GroupName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(GroupName) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>GroupName</strong> cannot be greater than 30 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.GroupName = arguments.GroupName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "GroupName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SpecialInstructions.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSpecialInstructions" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SpecialInstructions>
	</cffunction>
	 
	<cffunction name="setSpecialInstructions" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SpecialInstructions" required="Yes" type="String">
		
		<cfif SpecialInstructions NEQ "NULL">	
			
			<cfif arguments.SpecialInstructions EQ "@@" OR arguments.SpecialInstructions EQ "">
				
				<cfset arguments.SpecialInstructions = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SpecialInstructions)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SpecialInstructions</strong> (#SpecialInstructions#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SpecialInstructions) GT 1000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SpecialInstructions</strong> cannot be greater than 1000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SpecialInstructions = arguments.SpecialInstructions>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SpecialInstructions")>			
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
		<cfargument name="ClientDoctorID" required="No" type="String" default="">
		<cfargument name="DoctorCategory" required="No" type="String" default="">
		<cfargument name="UPIN" required="No" type="String" default="">
		<cfargument name="MedicareNumber" required="No" type="String" default="">
		<cfargument name="MedicaidNumber" required="No" type="String" default="">
		<cfargument name="GroupName" required="No" type="String" default="">
		<cfargument name="SpecialInstructions" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.EntityID = arguments.EntityID>
		<cfset variables.instance.ClientDoctorID = arguments.ClientDoctorID>
		<cfset variables.instance.DoctorCategory = arguments.DoctorCategory>
		<cfset variables.instance.UPIN = arguments.UPIN>
		<cfset variables.instance.MedicareNumber = arguments.MedicareNumber>
		<cfset variables.instance.MedicaidNumber = arguments.MedicaidNumber>
		<cfset variables.instance.GroupName = arguments.GroupName>
		<cfset variables.instance.SpecialInstructions = arguments.SpecialInstructions>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="DoctorIO" output="No">
		
		<cfargument name="DoctorID" required="yes" type="numeric">		
		<cfset var qGetDoctor = "">
		
		<cfset preInit(DoctorID)>
	
		<cfquery name="qGetDoctor" datasource="#trim(request.datasource)#">
	  		SELECT DoctorID,EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified
			FROM doctor  
			WHERE DoctorID = #trim(arguments.DoctorID)# 
		</cfquery>
		
		<cfif qGetDoctor.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetDoctor.DoctorID EQ "" OR qGetDoctor.DoctorID EQ "NULL") 
				variables.instance.DoctorID = "NULL"; 
			ELSE 
				variables.instance.DoctorID = qGetDoctor.DoctorID;
				
			IF(qGetDoctor.EntityID EQ "" OR qGetDoctor.EntityID EQ "NULL") 
				variables.instance.EntityID = "NULL"; 
			ELSE 
				variables.instance.EntityID = qGetDoctor.EntityID;
							
				variables.instance.ClientDoctorID = qGetDoctor.ClientDoctorID;
							
				variables.instance.DoctorCategory = qGetDoctor.DoctorCategory;
							
				variables.instance.UPIN = qGetDoctor.UPIN;
							
				variables.instance.MedicareNumber = qGetDoctor.MedicareNumber;
							
				variables.instance.MedicaidNumber = qGetDoctor.MedicaidNumber;
							
				variables.instance.GroupName = qGetDoctor.GroupName;
							
				variables.instance.SpecialInstructions = qGetDoctor.SpecialInstructions;
							
				variables.instance.Active = qGetDoctor.Active;
				
			IF(qGetDoctor.InactiveCode EQ "" OR qGetDoctor.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetDoctor.InactiveCode;
							
				variables.instance.DateCreated = qGetDoctor.DateCreated;
							
				variables.instance.DateModified = qGetDoctor.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(DoctorID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitDoctor = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.DoctorID) AND variables.instance.DoctorID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitDoctor" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitDoctor" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.DoctorID = qInsertCommitDoctor.DoctorID>
				
				<cfreturn qInsertCommitDoctor.DoctorID>
			
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
			<cfset tableColumns = "DoctorID,EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active">	
			
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
				<cfset sqlStatement = "UPDATE Doctor  SET #columnsToUpdate# WHERE DoctorID = #trim(variables.instance.DoctorID)#">
				
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
			<cfset stringTableColumns = "ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active">	
			
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
			<cfloop list="EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO doctor  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS DoctorID ">
				
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
	<cffunction name="getDoctorQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getDoctorQuery">						
		<cfargument name="Fields" required="No" type="String" default="DoctorID,EntityID,ClientDoctorID,DoctorCategory,UPIN,MedicareNumber,MedicaidNumber,GroupName,SpecialInstructions,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="DoctorID" required="No" type="String" default="">
		<cfargument name="DoctorID_IN" required="No" type="String" default="">
		<cfargument name="DoctorID_LIKE" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="EntityID_IN" required="No" type="String" default="">
		<cfargument name="EntityID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientDoctorID" required="No" type="String" default="">
		<cfargument name="ClientDoctorID_IN" required="No" type="String" default="">
		<cfargument name="ClientDoctorID_LIKE" required="No" type="String" default="">
		<cfargument name="DoctorCategory" required="No" type="String" default="">
		<cfargument name="DoctorCategory_IN" required="No" type="String" default="">
		<cfargument name="DoctorCategory_LIKE" required="No" type="String" default="">
		<cfargument name="UPIN" required="No" type="String" default="">
		<cfargument name="UPIN_IN" required="No" type="String" default="">
		<cfargument name="UPIN_LIKE" required="No" type="String" default="">
		<cfargument name="MedicareNumber" required="No" type="String" default="">
		<cfargument name="MedicareNumber_IN" required="No" type="String" default="">
		<cfargument name="MedicareNumber_LIKE" required="No" type="String" default="">
		<cfargument name="MedicaidNumber" required="No" type="String" default="">
		<cfargument name="MedicaidNumber_IN" required="No" type="String" default="">
		<cfargument name="MedicaidNumber_LIKE" required="No" type="String" default="">
		<cfargument name="GroupName" required="No" type="String" default="">
		<cfargument name="GroupName_IN" required="No" type="String" default="">
		<cfargument name="GroupName_LIKE" required="No" type="String" default="">
		<cfargument name="SpecialInstructions" required="No" type="String" default="">
		<cfargument name="SpecialInstructions_IN" required="No" type="String" default="">
		<cfargument name="SpecialInstructions_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "DoctorID,DoctorID_IN,DoctorID_LIKE,EntityID,EntityID_IN,EntityID_LIKE,ClientDoctorID,ClientDoctorID_IN,ClientDoctorID_LIKE,DoctorCategory,DoctorCategory_IN,DoctorCategory_LIKE,UPIN,UPIN_IN,UPIN_LIKE,MedicareNumber,MedicareNumber_IN,MedicareNumber_LIKE,MedicaidNumber,MedicaidNumber_IN,MedicaidNumber_LIKE,GroupName,GroupName_IN,GroupName_LIKE,SpecialInstructions,SpecialInstructions_IN,SpecialInstructions_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Doctor"
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
			<cfquery Name="getDoctorQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM doctor   
				WHERE 1=1
					<cfif DoctorID NEQ "" AND IsNumeric(DoctorID)>AND DoctorID = #DoctorID#</cfif>
					<cfif DoctorID_IN NEQ "">AND DoctorID IN(#trim(DoctorID_IN)#)</cfif>
					<cfif DoctorID_LIKE NEQ "">AND DoctorID LIKE '%#trim(DoctorID_LIKE)#%'</cfif>
					<cfif EntityID NEQ "" AND IsNumeric(EntityID)>AND EntityID = #EntityID#</cfif>
					<cfif EntityID_IN NEQ "">AND EntityID IN(#trim(EntityID_IN)#)</cfif>
					<cfif EntityID_LIKE NEQ "">AND EntityID LIKE '%#trim(EntityID_LIKE)#%'</cfif>
					<cfif ClientDoctorID NEQ "">AND ClientDoctorID = '#ClientDoctorID#'</cfif>
					<cfif ClientDoctorID_IN NEQ "">AND ClientDoctorID IN(#trim(ClientDoctorID_IN)#)</cfif>
					<cfif ClientDoctorID_LIKE NEQ "">AND ClientDoctorID LIKE '%#trim(ClientDoctorID_LIKE)#%'</cfif>
					<cfif DoctorCategory NEQ "">AND DoctorCategory = '#DoctorCategory#'</cfif>
					<cfif DoctorCategory_IN NEQ "">AND DoctorCategory IN(#trim(DoctorCategory_IN)#)</cfif>
					<cfif DoctorCategory_LIKE NEQ "">AND DoctorCategory LIKE '%#trim(DoctorCategory_LIKE)#%'</cfif>
					<cfif UPIN NEQ "">AND UPIN = '#UPIN#'</cfif>
					<cfif UPIN_IN NEQ "">AND UPIN IN(#trim(UPIN_IN)#)</cfif>
					<cfif UPIN_LIKE NEQ "">AND UPIN LIKE '%#trim(UPIN_LIKE)#%'</cfif>
					<cfif MedicareNumber NEQ "">AND MedicareNumber = '#MedicareNumber#'</cfif>
					<cfif MedicareNumber_IN NEQ "">AND MedicareNumber IN(#trim(MedicareNumber_IN)#)</cfif>
					<cfif MedicareNumber_LIKE NEQ "">AND MedicareNumber LIKE '%#trim(MedicareNumber_LIKE)#%'</cfif>
					<cfif MedicaidNumber NEQ "">AND MedicaidNumber = '#MedicaidNumber#'</cfif>
					<cfif MedicaidNumber_IN NEQ "">AND MedicaidNumber IN(#trim(MedicaidNumber_IN)#)</cfif>
					<cfif MedicaidNumber_LIKE NEQ "">AND MedicaidNumber LIKE '%#trim(MedicaidNumber_LIKE)#%'</cfif>
					<cfif GroupName NEQ "">AND GroupName = '#GroupName#'</cfif>
					<cfif GroupName_IN NEQ "">AND GroupName IN(#trim(GroupName_IN)#)</cfif>
					<cfif GroupName_LIKE NEQ "">AND GroupName LIKE '%#trim(GroupName_LIKE)#%'</cfif>
					<cfif SpecialInstructions NEQ "">AND SpecialInstructions = '#SpecialInstructions#'</cfif>
					<cfif SpecialInstructions_IN NEQ "">AND SpecialInstructions IN(#trim(SpecialInstructions_IN)#)</cfif>
					<cfif SpecialInstructions_LIKE NEQ "">AND SpecialInstructions LIKE '%#trim(SpecialInstructions_LIKE)#%'</cfif>
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
			
			<cfreturn getDoctorQuery>
		
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




