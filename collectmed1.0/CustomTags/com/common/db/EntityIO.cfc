

<cfcomponent name="EntityIO">

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
			variables.instance.EntityID = "NULL";
			variables.instance.SiteID = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.ObjectTypeID = "NULL";
			variables.instance.PrefixName = "";
			variables.instance.Fname = "";
			variables.instance.Mname = "";
			variables.instance.Lname = "";
			variables.instance.SuffixName = "";
			variables.instance.DOB = "";
			variables.instance.Sex = "NULL";
			variables.instance.SSN = "";
			variables.instance.MaritalStatus = "NULL";
			variables.instance.EmployerID = "NULL";
			variables.instance.Languages = "";
			variables.instance.Weight = "NULL";
			variables.instance.HeightInInches = "NULL";
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
	<cfset temp = QueryAddRow(defaultsQuery, 21)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTITYID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SITEID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OBJECTTYPEID", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "0", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PREFIXNAME", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FNAME", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MNAME", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LNAME", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SUFFIXNAME", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DOB", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SEX", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SSN", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MARITALSTATUS", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EMPLOYERID", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LANGUAGES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "WEIGHT", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HEIGHTININCHES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 21)>
	

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
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SiteID.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSiteID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SiteID>
	</cffunction>
	 
	<cffunction name="setSiteID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SiteID" required="Yes" type="String">
		
		<cfif SiteID NEQ "NULL">	
			
			<cfif arguments.SiteID EQ "@@" OR arguments.SiteID EQ "">
				
				<cfset arguments.SiteID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(SiteID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SiteID</strong> (#SiteID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SiteID = arguments.SiteID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SiteID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ObjectTypeID.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getObjectTypeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ObjectTypeID>
	</cffunction>
	 
	<cffunction name="setObjectTypeID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ObjectTypeID" required="Yes" type="String">
		
		<cfif ObjectTypeID NEQ "NULL">	
			
			<cfif arguments.ObjectTypeID EQ "@@" OR arguments.ObjectTypeID EQ "">
				
				<cfset arguments.ObjectTypeID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ObjectTypeID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ObjectTypeID</strong> (#ObjectTypeID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ObjectTypeID = arguments.ObjectTypeID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ObjectTypeID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PrefixName.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrefixName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrefixName>
	</cffunction>
	 
	<cffunction name="setPrefixName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrefixName" required="Yes" type="String">
		
		<cfif PrefixName NEQ "NULL">	
			
			<cfif arguments.PrefixName EQ "@@" OR arguments.PrefixName EQ "">
				
				<cfset arguments.PrefixName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PrefixName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrefixName</strong> (#PrefixName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PrefixName) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PrefixName</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PrefixName = arguments.PrefixName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrefixName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Fname.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFname" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Fname>
	</cffunction>
	 
	<cffunction name="setFname" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Fname" required="Yes" type="String">
		
		<cfif Fname NEQ "NULL">	
			
			<cfif arguments.Fname EQ "@@" OR arguments.Fname EQ "">
				
				<cfset arguments.Fname = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Fname)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Fname</strong> (#Fname#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Fname) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Fname</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Fname = arguments.Fname>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Fname")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Mname.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMname" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Mname>
	</cffunction>
	 
	<cffunction name="setMname" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Mname" required="Yes" type="String">
		
		<cfif Mname NEQ "NULL">	
			
			<cfif arguments.Mname EQ "@@" OR arguments.Mname EQ "">
				
				<cfset arguments.Mname = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Mname)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Mname</strong> (#Mname#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Mname) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Mname</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Mname = arguments.Mname>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Mname")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Lname.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLname" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Lname>
	</cffunction>
	 
	<cffunction name="setLname" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Lname" required="Yes" type="String">
		
		<cfif Lname NEQ "NULL">	
			
			<cfif arguments.Lname EQ "@@" OR arguments.Lname EQ "">
				
				<cfset arguments.Lname = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Lname)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Lname</strong> (#Lname#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Lname) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Lname</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Lname = arguments.Lname>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Lname")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SuffixName.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSuffixName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SuffixName>
	</cffunction>
	 
	<cffunction name="setSuffixName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SuffixName" required="Yes" type="String">
		
		<cfif SuffixName NEQ "NULL">	
			
			<cfif arguments.SuffixName EQ "@@" OR arguments.SuffixName EQ "">
				
				<cfset arguments.SuffixName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SuffixName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SuffixName</strong> (#SuffixName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SuffixName) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SuffixName</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SuffixName = arguments.SuffixName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SuffixName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DOB.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDOB" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DOB>
	</cffunction>
	 
	<cffunction name="setDOB" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DOB" required="Yes" type="String">
		
		<cfif DOB NEQ "NULL" AND DOB NEQ "NOW">	
			
			<cfif arguments.DOB EQ "@@" OR arguments.DOB EQ "">
				
				<cfset arguments.DOB = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DOB)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DOB</strong> (#DOB#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DOB = arguments.DOB>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DOB")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Sex.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSex" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Sex>
	</cffunction>
	 
	<cffunction name="setSex" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Sex" required="Yes" type="String">
		
		<cfif Sex NEQ "NULL">	
			
			<cfif arguments.Sex EQ "@@" OR arguments.Sex EQ "">
				
				<cfset arguments.Sex = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(Sex)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Sex</strong> (#Sex#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Sex = arguments.Sex>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Sex")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SSN.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSSN" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SSN>
	</cffunction>
	 
	<cffunction name="setSSN" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SSN" required="Yes" type="String">
		
		<cfif SSN NEQ "NULL">	
			
			<cfif arguments.SSN EQ "@@" OR arguments.SSN EQ "">
				
				<cfset arguments.SSN = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SSN)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SSN</strong> (#SSN#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SSN) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SSN</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SSN = arguments.SSN>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SSN")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MaritalStatus.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMaritalStatus" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MaritalStatus>
	</cffunction>
	 
	<cffunction name="setMaritalStatus" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MaritalStatus" required="Yes" type="String">
		
		<cfif MaritalStatus NEQ "NULL">	
			
			<cfif arguments.MaritalStatus EQ "@@" OR arguments.MaritalStatus EQ "">
				
				<cfset arguments.MaritalStatus = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(MaritalStatus)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MaritalStatus</strong> (#MaritalStatus#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MaritalStatus = arguments.MaritalStatus>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MaritalStatus")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EmployerID.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEmployerID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EmployerID>
	</cffunction>
	 
	<cffunction name="setEmployerID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EmployerID" required="Yes" type="String">
		
		<cfif EmployerID NEQ "NULL">	
			
			<cfif arguments.EmployerID EQ "@@" OR arguments.EmployerID EQ "">
				
				<cfset arguments.EmployerID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EmployerID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EmployerID</strong> (#EmployerID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EmployerID = arguments.EmployerID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EmployerID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Languages.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLanguages" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Languages>
	</cffunction>
	 
	<cffunction name="setLanguages" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Languages" required="Yes" type="String">
		
		<cfif Languages NEQ "NULL">	
			
			<cfif arguments.Languages EQ "@@" OR arguments.Languages EQ "">
				
				<cfset arguments.Languages = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Languages)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Languages</strong> (#Languages#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Languages) GT 15>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Languages</strong> cannot be greater than 15 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Languages = arguments.Languages>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Languages")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Weight.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getWeight" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Weight>
	</cffunction>
	 
	<cffunction name="setWeight" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Weight" required="Yes" type="String">
		
		<cfif Weight NEQ "NULL">	
			
			<cfif arguments.Weight EQ "@@" OR arguments.Weight EQ "">
				
				<cfset arguments.Weight = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(Weight)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Weight</strong> (#Weight#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Weight = arguments.Weight>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Weight")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HeightInInches.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHeightInInches" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HeightInInches>
	</cffunction>
	 
	<cffunction name="setHeightInInches" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HeightInInches" required="Yes" type="String">
		
		<cfif HeightInInches NEQ "NULL">	
			
			<cfif arguments.HeightInInches EQ "@@" OR arguments.HeightInInches EQ "">
				
				<cfset arguments.HeightInInches = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(HeightInInches)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HeightInInches</strong> (#HeightInInches#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HeightInInches = arguments.HeightInInches>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HeightInInches")>			
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

		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ObjectTypeID" required="No" type="String" default="">
		<cfargument name="PrefixName" required="No" type="String" default="">
		<cfargument name="Fname" required="No" type="String" default="">
		<cfargument name="Mname" required="No" type="String" default="">
		<cfargument name="Lname" required="No" type="String" default="">
		<cfargument name="SuffixName" required="No" type="String" default="">
		<cfargument name="DOB" required="No" type="String" default="">
		<cfargument name="Sex" required="No" type="String" default="">
		<cfargument name="SSN" required="No" type="String" default="">
		<cfargument name="MaritalStatus" required="No" type="String" default="">
		<cfargument name="EmployerID" required="No" type="String" default="">
		<cfargument name="Languages" required="No" type="String" default="">
		<cfargument name="Weight" required="No" type="String" default="">
		<cfargument name="HeightInInches" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.SiteID = arguments.SiteID>
		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.ObjectTypeID = arguments.ObjectTypeID>
		<cfset variables.instance.PrefixName = arguments.PrefixName>
		<cfset variables.instance.Fname = arguments.Fname>
		<cfset variables.instance.Mname = arguments.Mname>
		<cfset variables.instance.Lname = arguments.Lname>
		<cfset variables.instance.SuffixName = arguments.SuffixName>
		<cfset variables.instance.DOB = arguments.DOB>
		<cfset variables.instance.Sex = arguments.Sex>
		<cfset variables.instance.SSN = arguments.SSN>
		<cfset variables.instance.MaritalStatus = arguments.MaritalStatus>
		<cfset variables.instance.EmployerID = arguments.EmployerID>
		<cfset variables.instance.Languages = arguments.Languages>
		<cfset variables.instance.Weight = arguments.Weight>
		<cfset variables.instance.HeightInInches = arguments.HeightInInches>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitEntityIO" access="public" returntype="EntityIO" output="No">
		
		<cfargument name="EntityID" required="yes" type="numeric">		
		<cfset var qGetEntity = "">
		
		<cfset preInit(EntityID)>
	
		<cfquery name="qGetEntity" datasource="#trim(request.datasource)#">
	  		SELECT EntityID,SiteID,ClientID,ObjectTypeID,PrefixName,Fname,Mname,Lname,SuffixName,DOB,Sex,SSN,MaritalStatus,EmployerID,Languages,Weight,HeightInInches,Active,InactiveCode,DateCreated,DateModified
			FROM entity  
			WHERE EntityID = #trim(arguments.EntityID)# 
		</cfquery>
		
		<cfif qGetEntity.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetEntity.EntityID EQ "" OR qGetEntity.EntityID EQ "NULL") 
				variables.instance.EntityID = "NULL"; 
			ELSE 
				variables.instance.EntityID = qGetEntity.EntityID;
				
			IF(qGetEntity.SiteID EQ "" OR qGetEntity.SiteID EQ "NULL") 
				variables.instance.SiteID = "NULL"; 
			ELSE 
				variables.instance.SiteID = qGetEntity.SiteID;
				
			IF(qGetEntity.ClientID EQ "" OR qGetEntity.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetEntity.ClientID;
				
			IF(qGetEntity.ObjectTypeID EQ "" OR qGetEntity.ObjectTypeID EQ "NULL") 
				variables.instance.ObjectTypeID = "NULL"; 
			ELSE 
				variables.instance.ObjectTypeID = qGetEntity.ObjectTypeID;
							
				variables.instance.PrefixName = qGetEntity.PrefixName;
							
				variables.instance.Fname = qGetEntity.Fname;
							
				variables.instance.Mname = qGetEntity.Mname;
							
				variables.instance.Lname = qGetEntity.Lname;
							
				variables.instance.SuffixName = qGetEntity.SuffixName;
							
				variables.instance.DOB = qGetEntity.DOB;
				
			IF(qGetEntity.Sex EQ "" OR qGetEntity.Sex EQ "NULL") 
				variables.instance.Sex = "NULL"; 
			ELSE 
				variables.instance.Sex = qGetEntity.Sex;
							
				variables.instance.SSN = qGetEntity.SSN;
				
			IF(qGetEntity.MaritalStatus EQ "" OR qGetEntity.MaritalStatus EQ "NULL") 
				variables.instance.MaritalStatus = "NULL"; 
			ELSE 
				variables.instance.MaritalStatus = qGetEntity.MaritalStatus;
				
			IF(qGetEntity.EmployerID EQ "" OR qGetEntity.EmployerID EQ "NULL") 
				variables.instance.EmployerID = "NULL"; 
			ELSE 
				variables.instance.EmployerID = qGetEntity.EmployerID;
							
				variables.instance.Languages = qGetEntity.Languages;
				
			IF(qGetEntity.Weight EQ "" OR qGetEntity.Weight EQ "NULL") 
				variables.instance.Weight = "NULL"; 
			ELSE 
				variables.instance.Weight = qGetEntity.Weight;
				
			IF(qGetEntity.HeightInInches EQ "" OR qGetEntity.HeightInInches EQ "NULL") 
				variables.instance.HeightInInches = "NULL"; 
			ELSE 
				variables.instance.HeightInInches = qGetEntity.HeightInInches;
							
				variables.instance.Active = qGetEntity.Active;
				
			IF(qGetEntity.InactiveCode EQ "" OR qGetEntity.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetEntity.InactiveCode;
							
				variables.instance.DateCreated = qGetEntity.DateCreated;
							
				variables.instance.DateModified = qGetEntity.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(EntityID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitEntity = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.EntityID) AND variables.instance.EntityID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitEntity" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitEntity" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.EntityID = qInsertCommitEntity.EntityID>
				
				<cfreturn qInsertCommitEntity.EntityID>
			
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
			<cfset tableColumns = "EntityID,SiteID,ClientID,ObjectTypeID,PrefixName,Fname,Mname,Lname,SuffixName,DOB,Sex,SSN,MaritalStatus,EmployerID,Languages,Weight,HeightInInches,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "PrefixName,Fname,Mname,Lname,SuffixName,SSN,Languages,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DOB,DateCreated,DateModified">

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
				<cfset sqlStatement = "UPDATE Entity  SET #columnsToUpdate# WHERE EntityID = #trim(variables.instance.EntityID)#">
				
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
			<cfset stringTableColumns = "PrefixName,Fname,Mname,Lname,SuffixName,SSN,Languages,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DOB,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="SiteID,ClientID,ObjectTypeID,PrefixName,Fname,Mname,Lname,SuffixName,DOB,Sex,SSN,MaritalStatus,EmployerID,Languages,Weight,HeightInInches,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO entity  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS EntityID ">
				
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
	<cffunction name="getEntityQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getEntityQuery">						
		<cfargument name="Fields" required="No" type="String" default="EntityID,SiteID,ClientID,ObjectTypeID,PrefixName,Fname,Mname,Lname,SuffixName,DOB,Sex,SSN,MaritalStatus,EmployerID,Languages,Weight,HeightInInches,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="EntityID_IN" required="No" type="String" default="">
		<cfargument name="EntityID_LIKE" required="No" type="String" default="">
		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="SiteID_IN" required="No" type="String" default="">
		<cfargument name="SiteID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="ObjectTypeID" required="No" type="String" default="">
		<cfargument name="ObjectTypeID_IN" required="No" type="String" default="">
		<cfargument name="ObjectTypeID_LIKE" required="No" type="String" default="">
		<cfargument name="PrefixName" required="No" type="String" default="">
		<cfargument name="PrefixName_IN" required="No" type="String" default="">
		<cfargument name="PrefixName_LIKE" required="No" type="String" default="">
		<cfargument name="Fname" required="No" type="String" default="">
		<cfargument name="Fname_IN" required="No" type="String" default="">
		<cfargument name="Fname_LIKE" required="No" type="String" default="">
		<cfargument name="Mname" required="No" type="String" default="">
		<cfargument name="Mname_IN" required="No" type="String" default="">
		<cfargument name="Mname_LIKE" required="No" type="String" default="">
		<cfargument name="Lname" required="No" type="String" default="">
		<cfargument name="Lname_IN" required="No" type="String" default="">
		<cfargument name="Lname_LIKE" required="No" type="String" default="">
		<cfargument name="SuffixName" required="No" type="String" default="">
		<cfargument name="SuffixName_IN" required="No" type="String" default="">
		<cfargument name="SuffixName_LIKE" required="No" type="String" default="">
		<cfargument name="DOB" required="No" type="String" default="">
		<cfargument name="DOB_IN" required="No" type="String" default="">
		<cfargument name="DOB_LIKE" required="No" type="String" default="">
		<cfargument name="Sex" required="No" type="String" default="">
		<cfargument name="Sex_IN" required="No" type="String" default="">
		<cfargument name="Sex_LIKE" required="No" type="String" default="">
		<cfargument name="SSN" required="No" type="String" default="">
		<cfargument name="SSN_IN" required="No" type="String" default="">
		<cfargument name="SSN_LIKE" required="No" type="String" default="">
		<cfargument name="MaritalStatus" required="No" type="String" default="">
		<cfargument name="MaritalStatus_IN" required="No" type="String" default="">
		<cfargument name="MaritalStatus_LIKE" required="No" type="String" default="">
		<cfargument name="EmployerID" required="No" type="String" default="">
		<cfargument name="EmployerID_IN" required="No" type="String" default="">
		<cfargument name="EmployerID_LIKE" required="No" type="String" default="">
		<cfargument name="Languages" required="No" type="String" default="">
		<cfargument name="Languages_IN" required="No" type="String" default="">
		<cfargument name="Languages_LIKE" required="No" type="String" default="">
		<cfargument name="Weight" required="No" type="String" default="">
		<cfargument name="Weight_IN" required="No" type="String" default="">
		<cfargument name="Weight_LIKE" required="No" type="String" default="">
		<cfargument name="HeightInInches" required="No" type="String" default="">
		<cfargument name="HeightInInches_IN" required="No" type="String" default="">
		<cfargument name="HeightInInches_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "EntityID,EntityID_IN,EntityID_LIKE,SiteID,SiteID_IN,SiteID_LIKE,ClientID,ClientID_IN,ClientID_LIKE,ObjectTypeID,ObjectTypeID_IN,ObjectTypeID_LIKE,PrefixName,PrefixName_IN,PrefixName_LIKE,Fname,Fname_IN,Fname_LIKE,Mname,Mname_IN,Mname_LIKE,Lname,Lname_IN,Lname_LIKE,SuffixName,SuffixName_IN,SuffixName_LIKE,DOB,DOB_IN,DOB_LIKE,Sex,Sex_IN,Sex_LIKE,SSN,SSN_IN,SSN_LIKE,MaritalStatus,MaritalStatus_IN,MaritalStatus_LIKE,EmployerID,EmployerID_IN,EmployerID_LIKE,Languages,Languages_IN,Languages_LIKE,Weight,Weight_IN,Weight_LIKE,HeightInInches,HeightInInches_IN,HeightInInches_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Entity"
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
			<cfquery Name="getEntityQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM entity   
				WHERE 1=1
					<cfif EntityID NEQ "" AND IsNumeric(EntityID)>AND EntityID = #EntityID#</cfif>
					<cfif EntityID_IN NEQ "">AND EntityID IN(#trim(EntityID_IN)#)</cfif>
					<cfif EntityID_LIKE NEQ "">AND EntityID LIKE '%#trim(EntityID_LIKE)#%'</cfif>
					<cfif SiteID NEQ "" AND IsNumeric(SiteID)>AND SiteID = #SiteID#</cfif>
					<cfif SiteID_IN NEQ "">AND SiteID IN(#trim(SiteID_IN)#)</cfif>
					<cfif SiteID_LIKE NEQ "">AND SiteID LIKE '%#trim(SiteID_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif ObjectTypeID NEQ "" AND IsNumeric(ObjectTypeID)>AND ObjectTypeID = #ObjectTypeID#</cfif>
					<cfif ObjectTypeID_IN NEQ "">AND ObjectTypeID IN(#trim(ObjectTypeID_IN)#)</cfif>
					<cfif ObjectTypeID_LIKE NEQ "">AND ObjectTypeID LIKE '%#trim(ObjectTypeID_LIKE)#%'</cfif>
					<cfif PrefixName NEQ "">AND PrefixName = '#PrefixName#'</cfif>
					<cfif PrefixName_IN NEQ "">AND PrefixName IN(#trim(PrefixName_IN)#)</cfif>
					<cfif PrefixName_LIKE NEQ "">AND PrefixName LIKE '%#trim(PrefixName_LIKE)#%'</cfif>
					<cfif Fname NEQ "">AND Fname = '#Fname#'</cfif>
					<cfif Fname_IN NEQ "">AND Fname IN(#trim(Fname_IN)#)</cfif>
					<cfif Fname_LIKE NEQ "">AND Fname LIKE '%#trim(Fname_LIKE)#%'</cfif>
					<cfif Mname NEQ "">AND Mname = '#Mname#'</cfif>
					<cfif Mname_IN NEQ "">AND Mname IN(#trim(Mname_IN)#)</cfif>
					<cfif Mname_LIKE NEQ "">AND Mname LIKE '%#trim(Mname_LIKE)#%'</cfif>
					<cfif Lname NEQ "">AND Lname = '#Lname#'</cfif>
					<cfif Lname_IN NEQ "">AND Lname IN(#trim(Lname_IN)#)</cfif>
					<cfif Lname_LIKE NEQ "">AND Lname LIKE '%#trim(Lname_LIKE)#%'</cfif>
					<cfif SuffixName NEQ "">AND SuffixName = '#SuffixName#'</cfif>
					<cfif SuffixName_IN NEQ "">AND SuffixName IN(#trim(SuffixName_IN)#)</cfif>
					<cfif SuffixName_LIKE NEQ "">AND SuffixName LIKE '%#trim(SuffixName_LIKE)#%'</cfif>
					<cfif DOB NEQ "">AND DOB = '#DOB#'</cfif>
					<cfif DOB_IN NEQ "">AND DOB IN(#trim(DOB_IN)#)</cfif>
					<cfif DOB_LIKE NEQ "">AND DOB LIKE '%#trim(DOB_LIKE)#%'</cfif>
					<cfif Sex NEQ "" AND IsNumeric(Sex)>AND Sex = #Sex#</cfif>
					<cfif Sex_IN NEQ "">AND Sex IN(#trim(Sex_IN)#)</cfif>
					<cfif Sex_LIKE NEQ "">AND Sex LIKE '%#trim(Sex_LIKE)#%'</cfif>
					<cfif SSN NEQ "">AND SSN = '#SSN#'</cfif>
					<cfif SSN_IN NEQ "">AND SSN IN(#trim(SSN_IN)#)</cfif>
					<cfif SSN_LIKE NEQ "">AND SSN LIKE '%#trim(SSN_LIKE)#%'</cfif>
					<cfif MaritalStatus NEQ "" AND IsNumeric(MaritalStatus)>AND MaritalStatus = #MaritalStatus#</cfif>
					<cfif MaritalStatus_IN NEQ "">AND MaritalStatus IN(#trim(MaritalStatus_IN)#)</cfif>
					<cfif MaritalStatus_LIKE NEQ "">AND MaritalStatus LIKE '%#trim(MaritalStatus_LIKE)#%'</cfif>
					<cfif EmployerID NEQ "" AND IsNumeric(EmployerID)>AND EmployerID = #EmployerID#</cfif>
					<cfif EmployerID_IN NEQ "">AND EmployerID IN(#trim(EmployerID_IN)#)</cfif>
					<cfif EmployerID_LIKE NEQ "">AND EmployerID LIKE '%#trim(EmployerID_LIKE)#%'</cfif>
					<cfif Languages NEQ "">AND Languages = '#Languages#'</cfif>
					<cfif Languages_IN NEQ "">AND Languages IN(#trim(Languages_IN)#)</cfif>
					<cfif Languages_LIKE NEQ "">AND Languages LIKE '%#trim(Languages_LIKE)#%'</cfif>
					<cfif Weight NEQ "" AND IsNumeric(Weight)>AND Weight = #Weight#</cfif>
					<cfif Weight_IN NEQ "">AND Weight IN(#trim(Weight_IN)#)</cfif>
					<cfif Weight_LIKE NEQ "">AND Weight LIKE '%#trim(Weight_LIKE)#%'</cfif>
					<cfif HeightInInches NEQ "" AND IsNumeric(HeightInInches)>AND HeightInInches = #HeightInInches#</cfif>
					<cfif HeightInInches_IN NEQ "">AND HeightInInches IN(#trim(HeightInInches_IN)#)</cfif>
					<cfif HeightInInches_LIKE NEQ "">AND HeightInInches LIKE '%#trim(HeightInInches_LIKE)#%'</cfif>
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
			
			<cfreturn getEntityQuery>
		
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



