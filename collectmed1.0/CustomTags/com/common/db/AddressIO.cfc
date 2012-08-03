<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- AddressIO.cfc                                                                  --->
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
<!--- This tag is a CFC tag tied to the Address table in the dB.                     --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_AddressTable                                                     --->  
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
<!--- AddressID<br>                                                                  --->
<!--- SiteID<br>                                                                     --->
<!--- AddressTypeID<br>                                                              --->
<!--- Attention<br>                                                                  --->
<!--- AddressLine1<br>                                                               --->
<!--- AddressLine2<br>                                                               --->
<!--- City<br>                                                                       --->
<!--- StateID<br>                                                                    --->
<!--- ZipCode<br>                                                                    --->
<!--- CountryID<br>                                                                  --->
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


<cfcomponent name="AddressIO">

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
			variables.instance.AddressID = "NULL";
			variables.instance.SiteID = "NULL";
			variables.instance.AddressTypeID = "";
			variables.instance.Attention = "";
			variables.instance.AddressLine1 = "";
			variables.instance.AddressLine2 = "";
			variables.instance.City = "";
			variables.instance.StateID = "NULL";
			variables.instance.ZipCode = "";
			variables.instance.CountryID = "NULL";
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
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ADDRESSID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SITEID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ADDRESSTYPEID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ATTENTION", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ADDRESSLINE1", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ADDRESSLINE2", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CITY", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "STATEID", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ZIPCODE", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COUNTRYID", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
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
	<!--- GET and SET method for AddressID.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAddressID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AddressID>
	</cffunction>
	 
	<cffunction name="setAddressID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AddressID" required="Yes" type="String">
		
		<cfif AddressID NEQ "NULL">	
			
			<cfif arguments.AddressID EQ "@@" OR arguments.AddressID EQ "">
				
				<cfset arguments.AddressID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AddressID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AddressID</strong> (#AddressID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AddressID = arguments.AddressID>			
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
	<!--- GET and SET method for AddressTypeID.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAddressTypeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AddressTypeID>
	</cffunction>
	 
	<cffunction name="setAddressTypeID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AddressTypeID" required="Yes" type="String">
		
		<cfif AddressTypeID NEQ "NULL">	
			
			<cfif arguments.AddressTypeID EQ "@@" OR arguments.AddressTypeID EQ "">
				
				<cfset arguments.AddressTypeID = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(AddressTypeID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AddressTypeID</strong> (#AddressTypeID#) is not of type <strong>char</strong>.">	
			<cfelseif len(AddressTypeID) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AddressTypeID</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AddressTypeID = arguments.AddressTypeID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AddressTypeID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Attention.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAttention" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Attention>
	</cffunction>
	 
	<cffunction name="setAttention" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Attention" required="Yes" type="String">
		
		<cfif Attention NEQ "NULL">	
			
			<cfif arguments.Attention EQ "@@" OR arguments.Attention EQ "">
				
				<cfset arguments.Attention = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Attention)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Attention</strong> (#Attention#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Attention) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Attention</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Attention = arguments.Attention>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Attention")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AddressLine1.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAddressLine1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AddressLine1>
	</cffunction>
	 
	<cffunction name="setAddressLine1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AddressLine1" required="Yes" type="String">
		
		<cfif AddressLine1 NEQ "NULL">	
			
			<cfif arguments.AddressLine1 EQ "@@" OR arguments.AddressLine1 EQ "">
				
				<cfset arguments.AddressLine1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AddressLine1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AddressLine1</strong> (#AddressLine1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(AddressLine1) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AddressLine1</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AddressLine1 = arguments.AddressLine1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AddressLine1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AddressLine2.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAddressLine2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AddressLine2>
	</cffunction>
	 
	<cffunction name="setAddressLine2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AddressLine2" required="Yes" type="String">
		
		<cfif AddressLine2 NEQ "NULL">	
			
			<cfif arguments.AddressLine2 EQ "@@" OR arguments.AddressLine2 EQ "">
				
				<cfset arguments.AddressLine2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AddressLine2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AddressLine2</strong> (#AddressLine2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(AddressLine2) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AddressLine2</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AddressLine2 = arguments.AddressLine2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AddressLine2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for City.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCity" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.City>
	</cffunction>
	 
	<cffunction name="setCity" access="public" returntype="boolean" output="No">
 		
		<cfargument name="City" required="Yes" type="String">
		
		<cfif City NEQ "NULL">	
			
			<cfif arguments.City EQ "@@" OR arguments.City EQ "">
				
				<cfset arguments.City = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(City)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>City</strong> (#City#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(City) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>City</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.City = arguments.City>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "City")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for StateID.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStateID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.StateID>
	</cffunction>
	 
	<cffunction name="setStateID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="StateID" required="Yes" type="String">
		
		<cfif StateID NEQ "NULL">	
			
			<cfif arguments.StateID EQ "@@" OR arguments.StateID EQ "">
				
				<cfset arguments.StateID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(StateID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>StateID</strong> (#StateID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.StateID = arguments.StateID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "StateID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ZipCode.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getZipCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ZipCode>
	</cffunction>
	 
	<cffunction name="setZipCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ZipCode" required="Yes" type="String">
		
		<cfif ZipCode NEQ "NULL">	
			
			<cfif arguments.ZipCode EQ "@@" OR arguments.ZipCode EQ "">
				
				<cfset arguments.ZipCode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ZipCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ZipCode</strong> (#ZipCode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ZipCode) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ZipCode</strong> cannot be greater than 25 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ZipCode = arguments.ZipCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ZipCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CountryID.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCountryID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CountryID>
	</cffunction>
	 
	<cffunction name="setCountryID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CountryID" required="Yes" type="String">
		
		<cfif CountryID NEQ "NULL">	
			
			<cfif arguments.CountryID EQ "@@" OR arguments.CountryID EQ "">
				
				<cfset arguments.CountryID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(CountryID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CountryID</strong> (#CountryID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CountryID = arguments.CountryID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CountryID")>			
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
		<cfargument name="AddressTypeID" required="No" type="String" default="">
		<cfargument name="Attention" required="No" type="String" default="">
		<cfargument name="AddressLine1" required="No" type="String" default="">
		<cfargument name="AddressLine2" required="No" type="String" default="">
		<cfargument name="City" required="No" type="String" default="">
		<cfargument name="StateID" required="No" type="String" default="">
		<cfargument name="ZipCode" required="No" type="String" default="">
		<cfargument name="CountryID" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.SiteID = arguments.SiteID>
		<cfset variables.instance.AddressTypeID = arguments.AddressTypeID>
		<cfset variables.instance.Attention = arguments.Attention>
		<cfset variables.instance.AddressLine1 = arguments.AddressLine1>
		<cfset variables.instance.AddressLine2 = arguments.AddressLine2>
		<cfset variables.instance.City = arguments.City>
		<cfset variables.instance.StateID = arguments.StateID>
		<cfset variables.instance.ZipCode = arguments.ZipCode>
		<cfset variables.instance.CountryID = arguments.CountryID>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitAddressIO" access="public" returntype="AddressIO" output="No">
		
		<cfargument name="AddressID" required="yes" type="numeric">		
		<cfset var qGetAddress = "">
		
		<cfset preInit(AddressID)>
	
		<cfquery name="qGetAddress" datasource="#trim(request.datasource)#">
	  		SELECT AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified
			FROM address  
			WHERE AddressID = #trim(arguments.AddressID)# 
		</cfquery>
		
		<cfif qGetAddress.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetAddress.AddressID EQ "" OR qGetAddress.AddressID EQ "NULL") 
				variables.instance.AddressID = "NULL"; 
			ELSE 
				variables.instance.AddressID = qGetAddress.AddressID;
				
			IF(qGetAddress.SiteID EQ "" OR qGetAddress.SiteID EQ "NULL") 
				variables.instance.SiteID = "NULL"; 
			ELSE 
				variables.instance.SiteID = qGetAddress.SiteID;
							
				variables.instance.AddressTypeID = qGetAddress.AddressTypeID;
							
				variables.instance.Attention = qGetAddress.Attention;
							
				variables.instance.AddressLine1 = qGetAddress.AddressLine1;
							
				variables.instance.AddressLine2 = qGetAddress.AddressLine2;
							
				variables.instance.City = qGetAddress.City;
				
			IF(qGetAddress.StateID EQ "" OR qGetAddress.StateID EQ "NULL") 
				variables.instance.StateID = "NULL"; 
			ELSE 
				variables.instance.StateID = qGetAddress.StateID;
							
				variables.instance.ZipCode = qGetAddress.ZipCode;
				
			IF(qGetAddress.CountryID EQ "" OR qGetAddress.CountryID EQ "NULL") 
				variables.instance.CountryID = "NULL"; 
			ELSE 
				variables.instance.CountryID = qGetAddress.CountryID;
							
				variables.instance.Active = qGetAddress.Active;
				
			IF(qGetAddress.InactiveCode EQ "" OR qGetAddress.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetAddress.InactiveCode;
							
				variables.instance.DateCreated = qGetAddress.DateCreated;
							
				variables.instance.DateModified = qGetAddress.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(AddressID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitAddress = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.AddressID) AND variables.instance.AddressID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitAddress" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitAddress" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.AddressID = qInsertCommitAddress.AddressID>
				
				<cfreturn qInsertCommitAddress.AddressID>
			
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
			<cfset tableColumns = "AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "AddressTypeID,Attention,AddressLine1,AddressLine2,City,ZipCode,Active">	
			
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
				<cfset sqlStatement = "UPDATE address  SET #columnsToUpdate# WHERE AddressID = #trim(variables.instance.AddressID)#">
				
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
			<cfset stringTableColumns = "AddressTypeID,Attention,AddressLine1,AddressLine2,City,ZipCode,Active">	
			
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
			<cfloop list="SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO address  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS AddressID ">
				
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
	<cffunction name="getAddressQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getAddressQuery">						
		<cfargument name="Fields" required="No" type="String" default="AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="AddressID" required="No" type="String" default="">
		<cfargument name="AddressID_IN" required="No" type="String" default="">
		<cfargument name="AddressID_LIKE" required="No" type="String" default="">
		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="SiteID_IN" required="No" type="String" default="">
		<cfargument name="SiteID_LIKE" required="No" type="String" default="">
		<cfargument name="AddressTypeID" required="No" type="String" default="">
		<cfargument name="AddressTypeID_IN" required="No" type="String" default="">
		<cfargument name="AddressTypeID_LIKE" required="No" type="String" default="">
		<cfargument name="Attention" required="No" type="String" default="">
		<cfargument name="Attention_IN" required="No" type="String" default="">
		<cfargument name="Attention_LIKE" required="No" type="String" default="">
		<cfargument name="AddressLine1" required="No" type="String" default="">
		<cfargument name="AddressLine1_IN" required="No" type="String" default="">
		<cfargument name="AddressLine1_LIKE" required="No" type="String" default="">
		<cfargument name="AddressLine2" required="No" type="String" default="">
		<cfargument name="AddressLine2_IN" required="No" type="String" default="">
		<cfargument name="AddressLine2_LIKE" required="No" type="String" default="">
		<cfargument name="City" required="No" type="String" default="">
		<cfargument name="City_IN" required="No" type="String" default="">
		<cfargument name="City_LIKE" required="No" type="String" default="">
		<cfargument name="StateID" required="No" type="String" default="">
		<cfargument name="StateID_IN" required="No" type="String" default="">
		<cfargument name="StateID_LIKE" required="No" type="String" default="">
		<cfargument name="ZipCode" required="No" type="String" default="">
		<cfargument name="ZipCode_IN" required="No" type="String" default="">
		<cfargument name="ZipCode_LIKE" required="No" type="String" default="">
		<cfargument name="CountryID" required="No" type="String" default="">
		<cfargument name="CountryID_IN" required="No" type="String" default="">
		<cfargument name="CountryID_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "AddressID,AddressID_IN,AddressID_LIKE,SiteID,SiteID_IN,SiteID_LIKE,AddressTypeID,AddressTypeID_IN,AddressTypeID_LIKE,Attention,Attention_IN,Attention_LIKE,AddressLine1,AddressLine1_IN,AddressLine1_LIKE,AddressLine2,AddressLine2_IN,AddressLine2_LIKE,City,City_IN,City_LIKE,StateID,StateID_IN,StateID_LIKE,ZipCode,ZipCode_IN,ZipCode_LIKE,CountryID,CountryID_IN,CountryID_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Address"
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
			<cfquery Name="getAddressQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM address   
				WHERE 1=1
					<cfif AddressID NEQ "" AND IsNumeric(AddressID)>AND AddressID = #AddressID#</cfif>
					<cfif AddressID_IN NEQ "">AND AddressID IN(#trim(AddressID_IN)#)</cfif>
					<cfif AddressID_LIKE NEQ "">AND AddressID LIKE '%#trim(AddressID_LIKE)#%'</cfif>
					<cfif SiteID NEQ "" AND IsNumeric(SiteID)>AND SiteID = #SiteID#</cfif>
					<cfif SiteID_IN NEQ "">AND SiteID IN(#trim(SiteID_IN)#)</cfif>
					<cfif SiteID_LIKE NEQ "">AND SiteID LIKE '%#trim(SiteID_LIKE)#%'</cfif>
					<cfif AddressTypeID NEQ "">AND AddressTypeID = '#AddressTypeID#'</cfif>
					<cfif AddressTypeID_IN NEQ "">AND AddressTypeID IN(#trim(AddressTypeID_IN)#)</cfif>
					<cfif AddressTypeID_LIKE NEQ "">AND AddressTypeID LIKE '%#trim(AddressTypeID_LIKE)#%'</cfif>
					<cfif Attention NEQ "">AND Attention = '#Attention#'</cfif>
					<cfif Attention_IN NEQ "">AND Attention IN(#trim(Attention_IN)#)</cfif>
					<cfif Attention_LIKE NEQ "">AND Attention LIKE '%#trim(Attention_LIKE)#%'</cfif>
					<cfif AddressLine1 NEQ "">AND AddressLine1 = '#AddressLine1#'</cfif>
					<cfif AddressLine1_IN NEQ "">AND AddressLine1 IN(#trim(AddressLine1_IN)#)</cfif>
					<cfif AddressLine1_LIKE NEQ "">AND AddressLine1 LIKE '%#trim(AddressLine1_LIKE)#%'</cfif>
					<cfif AddressLine2 NEQ "">AND AddressLine2 = '#AddressLine2#'</cfif>
					<cfif AddressLine2_IN NEQ "">AND AddressLine2 IN(#trim(AddressLine2_IN)#)</cfif>
					<cfif AddressLine2_LIKE NEQ "">AND AddressLine2 LIKE '%#trim(AddressLine2_LIKE)#%'</cfif>
					<cfif City NEQ "">AND City = '#City#'</cfif>
					<cfif City_IN NEQ "">AND City IN(#trim(City_IN)#)</cfif>
					<cfif City_LIKE NEQ "">AND City LIKE '%#trim(City_LIKE)#%'</cfif>
					<cfif StateID NEQ "" AND IsNumeric(StateID)>AND StateID = #StateID#</cfif>
					<cfif StateID_IN NEQ "">AND StateID IN(#trim(StateID_IN)#)</cfif>
					<cfif StateID_LIKE NEQ "">AND StateID LIKE '%#trim(StateID_LIKE)#%'</cfif>
					<cfif ZipCode NEQ "">AND ZipCode = '#ZipCode#'</cfif>
					<cfif ZipCode_IN NEQ "">AND ZipCode IN(#trim(ZipCode_IN)#)</cfif>
					<cfif ZipCode_LIKE NEQ "">AND ZipCode LIKE '%#trim(ZipCode_LIKE)#%'</cfif>
					<cfif CountryID NEQ "" AND IsNumeric(CountryID)>AND CountryID = #CountryID#</cfif>
					<cfif CountryID_IN NEQ "">AND CountryID IN(#trim(CountryID_IN)#)</cfif>
					<cfif CountryID_LIKE NEQ "">AND CountryID LIKE '%#trim(CountryID_LIKE)#%'</cfif>
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
			
			<cfreturn getAddressQuery>
		
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



