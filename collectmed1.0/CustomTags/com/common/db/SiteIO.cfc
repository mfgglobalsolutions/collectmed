<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- SiteIO.cfc                                                                     --->
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
<!--- This tag is a CFC tag tied to the Site table in the dB.                        --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_SiteTable                                                        --->  
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
<!--- SiteID<br>                                                                     --->
<!--- ApplicationName<br>                                                            --->
<!--- SiteName<br>                                                                   --->
<!--- Directory<br>                                                                  --->
<!--- URLDomains<br>                                                                 --->
<!--- SessionTimeout<br>                                                             --->
<!--- SupportEmailAddressID<br>                                                      --->
<!--- AdministratorEmailID<br>                                                       --->
<!--- AdministratorPhoneID<br>                                                       --->
<!--- MainPhoneNumberID<br>                                                          --->
<!--- CompanyLogo<br>                                                                --->
<!--- Align<br>                                                                      --->
<!--- BgColor<br>                                                                    --->
<!--- Font<br>                                                                       --->
<!--- FontSize<br>                                                                   --->
<!--- FontColor<br>                                                                  --->
<!--- LoginPage<br>                                                                  --->
<!--- TextBoxBackgroundColor<br>                                                     --->
<!--- TitleHeaderColor<br>                                                           --->
<!--- TitleFontColor<br>                                                             --->
<!--- FooterFileName<br>                                                             --->
<!--- HeaderBackgroundColor<br>                                                      --->
<!--- HeaderBorder<br>                                                               --->
<!--- HeaderBorderColor<br>                                                          --->
<!--- HeaderFileName<br>                                                             --->
<!--- HeaderHeight<br>                                                               --->
<!--- LeftNavigationFontColor<br>                                                    --->
<!--- LeftNavigationFontSize<br>                                                     --->
<!--- LeftNavigationBorder<br>                                                       --->
<!--- LeftTemplateFileName<br>                                                       --->
<!--- LeftNavigationBorderColor<br>                                                  --->
<!--- RightTemplateFileName<br>                                                      --->
<!--- RightNavigationBorder<br>                                                      --->
<!--- RightTableBackgroundColor<br>                                                  --->
<!--- RightNavigationBorderColor<br>                                                 --->
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


<cfcomponent name="SiteIO">

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
			variables.instance.SiteID = "NULL";
			variables.instance.ApplicationName = "";
			variables.instance.SiteName = "";
			variables.instance.Directory = "";
			variables.instance.URLDomains = "";
			variables.instance.SessionTimeout = "NULL";
			variables.instance.SupportEmailAddressID = "NULL";
			variables.instance.AdministratorEmailID = "NULL";
			variables.instance.AdministratorPhoneID = "NULL";
			variables.instance.MainPhoneNumberID = "NULL";
			variables.instance.CompanyLogo = "";
			variables.instance.Align = "";
			variables.instance.BgColor = "";
			variables.instance.Font = "";
			variables.instance.FontSize = "NULL";
			variables.instance.FontColor = "";
			variables.instance.LoginPage = "";
			variables.instance.TextBoxBackgroundColor = "";
			variables.instance.TitleHeaderColor = "";
			variables.instance.TitleFontColor = "";
			variables.instance.FooterFileName = "";
			variables.instance.HeaderBackgroundColor = "";
			variables.instance.HeaderBorder = "NULL";
			variables.instance.HeaderBorderColor = "";
			variables.instance.HeaderFileName = "";
			variables.instance.HeaderHeight = "NULL";
			variables.instance.LeftNavigationFontColor = "";
			variables.instance.LeftNavigationFontSize = "NULL";
			variables.instance.LeftNavigationBorder = "NULL";
			variables.instance.LeftTemplateFileName = "";
			variables.instance.LeftNavigationBorderColor = "";
			variables.instance.RightTemplateFileName = "";
			variables.instance.RightNavigationBorder = "NULL";
			variables.instance.RightTableBackgroundColor = "";
			variables.instance.RightNavigationBorderColor = "";
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
	<cfset temp = QueryAddRow(defaultsQuery, 39)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SITEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "APPLICATIONNAME", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LEFTNAVIGATIONFONTCOLOR", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LEFTNAVIGATIONFONTSIZE", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "decimal", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LEFTNAVIGATIONBORDER", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "decimal", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LEFTTEMPLATEFILENAME", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LEFTNAVIGATIONBORDERCOLOR", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RIGHTTEMPLATEFILENAME", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RIGHTNAVIGATIONBORDER", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "decimal", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RIGHTTABLEBACKGROUNDCOLOR", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RIGHTNAVIGATIONBORDERCOLOR", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SITENAME", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DIRECTORY", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "URLDOMAINS", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SESSIONTIMEOUT", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "20", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "decimal", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SUPPORTEMAILADDRESSID", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ADMINISTRATOREMAILID", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ADMINISTRATORPHONEID", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MAINPHONENUMBERID", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COMPANYLOGO", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALIGN", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "BGCOLOR", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FONT", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FONTSIZE", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "decimal", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FONTCOLOR", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LOGINPAGE", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TEXTBOXBACKGROUNDCOLOR", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TITLEHEADERCOLOR", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 32)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TITLEFONTCOLOR", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 33)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FOOTERFILENAME", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 34)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HEADERBACKGROUNDCOLOR", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 35)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HEADERBORDER", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "decimal", 36)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HEADERBORDERCOLOR", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 37)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HEADERFILENAME", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 38)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HEADERHEIGHT", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "decimal", 39)>
	

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
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ApplicationName.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getApplicationName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ApplicationName>
	</cffunction>
	 
	<cffunction name="setApplicationName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ApplicationName" required="Yes" type="String">
		
		<cfif ApplicationName NEQ "NULL">	
			
			<cfif arguments.ApplicationName EQ "@@" OR arguments.ApplicationName EQ "">
				
				<cfset arguments.ApplicationName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ApplicationName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ApplicationName</strong> (#ApplicationName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ApplicationName) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ApplicationName</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ApplicationName = arguments.ApplicationName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ApplicationName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SiteName.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSiteName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SiteName>
	</cffunction>
	 
	<cffunction name="setSiteName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SiteName" required="Yes" type="String">
		
		<cfif SiteName NEQ "NULL">	
			
			<cfif arguments.SiteName EQ "@@" OR arguments.SiteName EQ "">
				
				<cfset arguments.SiteName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SiteName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SiteName</strong> (#SiteName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SiteName) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SiteName</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SiteName = arguments.SiteName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SiteName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Directory.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDirectory" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Directory>
	</cffunction>
	 
	<cffunction name="setDirectory" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Directory" required="Yes" type="String">
		
		<cfif Directory NEQ "NULL">	
			
			<cfif arguments.Directory EQ "@@" OR arguments.Directory EQ "">
				
				<cfset arguments.Directory = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Directory)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Directory</strong> (#Directory#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Directory) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Directory</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Directory = arguments.Directory>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Directory")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for URLDomains.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getURLDomains" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.URLDomains>
	</cffunction>
	 
	<cffunction name="setURLDomains" access="public" returntype="boolean" output="No">
 		
		<cfargument name="URLDomains" required="Yes" type="String">
		
		<cfif URLDomains NEQ "NULL">	
			
			<cfif arguments.URLDomains EQ "@@" OR arguments.URLDomains EQ "">
				
				<cfset arguments.URLDomains = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(URLDomains)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>URLDomains</strong> (#URLDomains#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(URLDomains) GT 500>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>URLDomains</strong> cannot be greater than 500 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.URLDomains = arguments.URLDomains>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "URLDomains")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SessionTimeout.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSessionTimeout" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SessionTimeout>
	</cffunction>
	 
	<cffunction name="setSessionTimeout" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SessionTimeout" required="Yes" type="String">
		
		<cfif SessionTimeout NEQ "NULL">	
			
			<cfif arguments.SessionTimeout EQ "@@" OR arguments.SessionTimeout EQ "">
				
				<cfset arguments.SessionTimeout = "NULL">
						
			<cfelseif NOT REQUEST.isdecimalDataType(SessionTimeout)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SessionTimeout</strong> (#SessionTimeout#) is not of type <strong>decimal</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SessionTimeout = arguments.SessionTimeout>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SessionTimeout")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SupportEmailAddressID.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSupportEmailAddressID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SupportEmailAddressID>
	</cffunction>
	 
	<cffunction name="setSupportEmailAddressID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SupportEmailAddressID" required="Yes" type="String">
		
		<cfif SupportEmailAddressID NEQ "NULL">	
			
			<cfif arguments.SupportEmailAddressID EQ "@@" OR arguments.SupportEmailAddressID EQ "">
				
				<cfset arguments.SupportEmailAddressID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(SupportEmailAddressID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SupportEmailAddressID</strong> (#SupportEmailAddressID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SupportEmailAddressID = arguments.SupportEmailAddressID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SupportEmailAddressID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AdministratorEmailID.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAdministratorEmailID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AdministratorEmailID>
	</cffunction>
	 
	<cffunction name="setAdministratorEmailID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AdministratorEmailID" required="Yes" type="String">
		
		<cfif AdministratorEmailID NEQ "NULL">	
			
			<cfif arguments.AdministratorEmailID EQ "@@" OR arguments.AdministratorEmailID EQ "">
				
				<cfset arguments.AdministratorEmailID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AdministratorEmailID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AdministratorEmailID</strong> (#AdministratorEmailID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AdministratorEmailID = arguments.AdministratorEmailID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AdministratorEmailID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AdministratorPhoneID.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAdministratorPhoneID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AdministratorPhoneID>
	</cffunction>
	 
	<cffunction name="setAdministratorPhoneID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AdministratorPhoneID" required="Yes" type="String">
		
		<cfif AdministratorPhoneID NEQ "NULL">	
			
			<cfif arguments.AdministratorPhoneID EQ "@@" OR arguments.AdministratorPhoneID EQ "">
				
				<cfset arguments.AdministratorPhoneID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AdministratorPhoneID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AdministratorPhoneID</strong> (#AdministratorPhoneID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AdministratorPhoneID = arguments.AdministratorPhoneID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AdministratorPhoneID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MainPhoneNumberID.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMainPhoneNumberID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MainPhoneNumberID>
	</cffunction>
	 
	<cffunction name="setMainPhoneNumberID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MainPhoneNumberID" required="Yes" type="String">
		
		<cfif MainPhoneNumberID NEQ "NULL">	
			
			<cfif arguments.MainPhoneNumberID EQ "@@" OR arguments.MainPhoneNumberID EQ "">
				
				<cfset arguments.MainPhoneNumberID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(MainPhoneNumberID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MainPhoneNumberID</strong> (#MainPhoneNumberID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MainPhoneNumberID = arguments.MainPhoneNumberID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MainPhoneNumberID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CompanyLogo.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCompanyLogo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CompanyLogo>
	</cffunction>
	 
	<cffunction name="setCompanyLogo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CompanyLogo" required="Yes" type="String">
		
		<cfif CompanyLogo NEQ "NULL">	
			
			<cfif arguments.CompanyLogo EQ "@@" OR arguments.CompanyLogo EQ "">
				
				<cfset arguments.CompanyLogo = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CompanyLogo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CompanyLogo</strong> (#CompanyLogo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CompanyLogo) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CompanyLogo</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CompanyLogo = arguments.CompanyLogo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CompanyLogo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Align.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlign" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Align>
	</cffunction>
	 
	<cffunction name="setAlign" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Align" required="Yes" type="String">
		
		<cfif Align NEQ "NULL">	
			
			<cfif arguments.Align EQ "@@" OR arguments.Align EQ "">
				
				<cfset arguments.Align = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Align)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Align</strong> (#Align#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Align) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Align</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Align = arguments.Align>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Align")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for BgColor.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getBgColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.BgColor>
	</cffunction>
	 
	<cffunction name="setBgColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="BgColor" required="Yes" type="String">
		
		<cfif BgColor NEQ "NULL">	
			
			<cfif arguments.BgColor EQ "@@" OR arguments.BgColor EQ "">
				
				<cfset arguments.BgColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(BgColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>BgColor</strong> (#BgColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(BgColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>BgColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.BgColor = arguments.BgColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "BgColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Font.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFont" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Font>
	</cffunction>
	 
	<cffunction name="setFont" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Font" required="Yes" type="String">
		
		<cfif Font NEQ "NULL">	
			
			<cfif arguments.Font EQ "@@" OR arguments.Font EQ "">
				
				<cfset arguments.Font = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Font)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Font</strong> (#Font#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Font) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Font</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Font = arguments.Font>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Font")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FontSize.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFontSize" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FontSize>
	</cffunction>
	 
	<cffunction name="setFontSize" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FontSize" required="Yes" type="String">
		
		<cfif FontSize NEQ "NULL">	
			
			<cfif arguments.FontSize EQ "@@" OR arguments.FontSize EQ "">
				
				<cfset arguments.FontSize = "NULL">
						
			<cfelseif NOT REQUEST.isdecimalDataType(FontSize)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FontSize</strong> (#FontSize#) is not of type <strong>decimal</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FontSize = arguments.FontSize>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FontSize")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FontColor.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFontColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FontColor>
	</cffunction>
	 
	<cffunction name="setFontColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FontColor" required="Yes" type="String">
		
		<cfif FontColor NEQ "NULL">	
			
			<cfif arguments.FontColor EQ "@@" OR arguments.FontColor EQ "">
				
				<cfset arguments.FontColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FontColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FontColor</strong> (#FontColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FontColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FontColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FontColor = arguments.FontColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FontColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LoginPage.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLoginPage" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LoginPage>
	</cffunction>
	 
	<cffunction name="setLoginPage" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LoginPage" required="Yes" type="String">
		
		<cfif LoginPage NEQ "NULL">	
			
			<cfif arguments.LoginPage EQ "@@" OR arguments.LoginPage EQ "">
				
				<cfset arguments.LoginPage = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LoginPage)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LoginPage</strong> (#LoginPage#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LoginPage) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LoginPage</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LoginPage = arguments.LoginPage>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LoginPage")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TextBoxBackgroundColor.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTextBoxBackgroundColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TextBoxBackgroundColor>
	</cffunction>
	 
	<cffunction name="setTextBoxBackgroundColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TextBoxBackgroundColor" required="Yes" type="String">
		
		<cfif TextBoxBackgroundColor NEQ "NULL">	
			
			<cfif arguments.TextBoxBackgroundColor EQ "@@" OR arguments.TextBoxBackgroundColor EQ "">
				
				<cfset arguments.TextBoxBackgroundColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TextBoxBackgroundColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TextBoxBackgroundColor</strong> (#TextBoxBackgroundColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TextBoxBackgroundColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TextBoxBackgroundColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TextBoxBackgroundColor = arguments.TextBoxBackgroundColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TextBoxBackgroundColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TitleHeaderColor.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTitleHeaderColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TitleHeaderColor>
	</cffunction>
	 
	<cffunction name="setTitleHeaderColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TitleHeaderColor" required="Yes" type="String">
		
		<cfif TitleHeaderColor NEQ "NULL">	
			
			<cfif arguments.TitleHeaderColor EQ "@@" OR arguments.TitleHeaderColor EQ "">
				
				<cfset arguments.TitleHeaderColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TitleHeaderColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TitleHeaderColor</strong> (#TitleHeaderColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TitleHeaderColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TitleHeaderColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TitleHeaderColor = arguments.TitleHeaderColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TitleHeaderColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TitleFontColor.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTitleFontColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TitleFontColor>
	</cffunction>
	 
	<cffunction name="setTitleFontColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TitleFontColor" required="Yes" type="String">
		
		<cfif TitleFontColor NEQ "NULL">	
			
			<cfif arguments.TitleFontColor EQ "@@" OR arguments.TitleFontColor EQ "">
				
				<cfset arguments.TitleFontColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TitleFontColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TitleFontColor</strong> (#TitleFontColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TitleFontColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TitleFontColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TitleFontColor = arguments.TitleFontColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TitleFontColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FooterFileName.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFooterFileName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FooterFileName>
	</cffunction>
	 
	<cffunction name="setFooterFileName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FooterFileName" required="Yes" type="String">
		
		<cfif FooterFileName NEQ "NULL">	
			
			<cfif arguments.FooterFileName EQ "@@" OR arguments.FooterFileName EQ "">
				
				<cfset arguments.FooterFileName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FooterFileName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FooterFileName</strong> (#FooterFileName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FooterFileName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FooterFileName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FooterFileName = arguments.FooterFileName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FooterFileName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HeaderBackgroundColor.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHeaderBackgroundColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HeaderBackgroundColor>
	</cffunction>
	 
	<cffunction name="setHeaderBackgroundColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HeaderBackgroundColor" required="Yes" type="String">
		
		<cfif HeaderBackgroundColor NEQ "NULL">	
			
			<cfif arguments.HeaderBackgroundColor EQ "@@" OR arguments.HeaderBackgroundColor EQ "">
				
				<cfset arguments.HeaderBackgroundColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HeaderBackgroundColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HeaderBackgroundColor</strong> (#HeaderBackgroundColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(HeaderBackgroundColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HeaderBackgroundColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HeaderBackgroundColor = arguments.HeaderBackgroundColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HeaderBackgroundColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HeaderBorder.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHeaderBorder" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HeaderBorder>
	</cffunction>
	 
	<cffunction name="setHeaderBorder" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HeaderBorder" required="Yes" type="String">
		
		<cfif HeaderBorder NEQ "NULL">	
			
			<cfif arguments.HeaderBorder EQ "@@" OR arguments.HeaderBorder EQ "">
				
				<cfset arguments.HeaderBorder = "NULL">
						
			<cfelseif NOT REQUEST.isdecimalDataType(HeaderBorder)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HeaderBorder</strong> (#HeaderBorder#) is not of type <strong>decimal</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HeaderBorder = arguments.HeaderBorder>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HeaderBorder")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HeaderBorderColor.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHeaderBorderColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HeaderBorderColor>
	</cffunction>
	 
	<cffunction name="setHeaderBorderColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HeaderBorderColor" required="Yes" type="String">
		
		<cfif HeaderBorderColor NEQ "NULL">	
			
			<cfif arguments.HeaderBorderColor EQ "@@" OR arguments.HeaderBorderColor EQ "">
				
				<cfset arguments.HeaderBorderColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HeaderBorderColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HeaderBorderColor</strong> (#HeaderBorderColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(HeaderBorderColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HeaderBorderColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HeaderBorderColor = arguments.HeaderBorderColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HeaderBorderColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HeaderFileName.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHeaderFileName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HeaderFileName>
	</cffunction>
	 
	<cffunction name="setHeaderFileName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HeaderFileName" required="Yes" type="String">
		
		<cfif HeaderFileName NEQ "NULL">	
			
			<cfif arguments.HeaderFileName EQ "@@" OR arguments.HeaderFileName EQ "">
				
				<cfset arguments.HeaderFileName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HeaderFileName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HeaderFileName</strong> (#HeaderFileName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(HeaderFileName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HeaderFileName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HeaderFileName = arguments.HeaderFileName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HeaderFileName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HeaderHeight.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHeaderHeight" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HeaderHeight>
	</cffunction>
	 
	<cffunction name="setHeaderHeight" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HeaderHeight" required="Yes" type="String">
		
		<cfif HeaderHeight NEQ "NULL">	
			
			<cfif arguments.HeaderHeight EQ "@@" OR arguments.HeaderHeight EQ "">
				
				<cfset arguments.HeaderHeight = "NULL">
						
			<cfelseif NOT REQUEST.isdecimalDataType(HeaderHeight)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HeaderHeight</strong> (#HeaderHeight#) is not of type <strong>decimal</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HeaderHeight = arguments.HeaderHeight>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HeaderHeight")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LeftNavigationFontColor.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLeftNavigationFontColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LeftNavigationFontColor>
	</cffunction>
	 
	<cffunction name="setLeftNavigationFontColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LeftNavigationFontColor" required="Yes" type="String">
		
		<cfif LeftNavigationFontColor NEQ "NULL">	
			
			<cfif arguments.LeftNavigationFontColor EQ "@@" OR arguments.LeftNavigationFontColor EQ "">
				
				<cfset arguments.LeftNavigationFontColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LeftNavigationFontColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LeftNavigationFontColor</strong> (#LeftNavigationFontColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LeftNavigationFontColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LeftNavigationFontColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LeftNavigationFontColor = arguments.LeftNavigationFontColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LeftNavigationFontColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LeftNavigationFontSize.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLeftNavigationFontSize" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LeftNavigationFontSize>
	</cffunction>
	 
	<cffunction name="setLeftNavigationFontSize" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LeftNavigationFontSize" required="Yes" type="String">
		
		<cfif LeftNavigationFontSize NEQ "NULL">	
			
			<cfif arguments.LeftNavigationFontSize EQ "@@" OR arguments.LeftNavigationFontSize EQ "">
				
				<cfset arguments.LeftNavigationFontSize = "NULL">
						
			<cfelseif NOT REQUEST.isdecimalDataType(LeftNavigationFontSize)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LeftNavigationFontSize</strong> (#LeftNavigationFontSize#) is not of type <strong>decimal</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LeftNavigationFontSize = arguments.LeftNavigationFontSize>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LeftNavigationFontSize")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LeftNavigationBorder.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLeftNavigationBorder" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LeftNavigationBorder>
	</cffunction>
	 
	<cffunction name="setLeftNavigationBorder" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LeftNavigationBorder" required="Yes" type="String">
		
		<cfif LeftNavigationBorder NEQ "NULL">	
			
			<cfif arguments.LeftNavigationBorder EQ "@@" OR arguments.LeftNavigationBorder EQ "">
				
				<cfset arguments.LeftNavigationBorder = "NULL">
						
			<cfelseif NOT REQUEST.isdecimalDataType(LeftNavigationBorder)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LeftNavigationBorder</strong> (#LeftNavigationBorder#) is not of type <strong>decimal</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LeftNavigationBorder = arguments.LeftNavigationBorder>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LeftNavigationBorder")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LeftTemplateFileName.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLeftTemplateFileName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LeftTemplateFileName>
	</cffunction>
	 
	<cffunction name="setLeftTemplateFileName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LeftTemplateFileName" required="Yes" type="String">
		
		<cfif LeftTemplateFileName NEQ "NULL">	
			
			<cfif arguments.LeftTemplateFileName EQ "@@" OR arguments.LeftTemplateFileName EQ "">
				
				<cfset arguments.LeftTemplateFileName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LeftTemplateFileName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LeftTemplateFileName</strong> (#LeftTemplateFileName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LeftTemplateFileName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LeftTemplateFileName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LeftTemplateFileName = arguments.LeftTemplateFileName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LeftTemplateFileName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LeftNavigationBorderColor.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLeftNavigationBorderColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LeftNavigationBorderColor>
	</cffunction>
	 
	<cffunction name="setLeftNavigationBorderColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LeftNavigationBorderColor" required="Yes" type="String">
		
		<cfif LeftNavigationBorderColor NEQ "NULL">	
			
			<cfif arguments.LeftNavigationBorderColor EQ "@@" OR arguments.LeftNavigationBorderColor EQ "">
				
				<cfset arguments.LeftNavigationBorderColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LeftNavigationBorderColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LeftNavigationBorderColor</strong> (#LeftNavigationBorderColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LeftNavigationBorderColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LeftNavigationBorderColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LeftNavigationBorderColor = arguments.LeftNavigationBorderColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LeftNavigationBorderColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RightTemplateFileName.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRightTemplateFileName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RightTemplateFileName>
	</cffunction>
	 
	<cffunction name="setRightTemplateFileName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RightTemplateFileName" required="Yes" type="String">
		
		<cfif RightTemplateFileName NEQ "NULL">	
			
			<cfif arguments.RightTemplateFileName EQ "@@" OR arguments.RightTemplateFileName EQ "">
				
				<cfset arguments.RightTemplateFileName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(RightTemplateFileName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RightTemplateFileName</strong> (#RightTemplateFileName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(RightTemplateFileName) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RightTemplateFileName</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RightTemplateFileName = arguments.RightTemplateFileName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RightTemplateFileName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RightNavigationBorder.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRightNavigationBorder" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RightNavigationBorder>
	</cffunction>
	 
	<cffunction name="setRightNavigationBorder" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RightNavigationBorder" required="Yes" type="String">
		
		<cfif RightNavigationBorder NEQ "NULL">	
			
			<cfif arguments.RightNavigationBorder EQ "@@" OR arguments.RightNavigationBorder EQ "">
				
				<cfset arguments.RightNavigationBorder = "NULL">
						
			<cfelseif NOT REQUEST.isdecimalDataType(RightNavigationBorder)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RightNavigationBorder</strong> (#RightNavigationBorder#) is not of type <strong>decimal</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RightNavigationBorder = arguments.RightNavigationBorder>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RightNavigationBorder")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RightTableBackgroundColor.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRightTableBackgroundColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RightTableBackgroundColor>
	</cffunction>
	 
	<cffunction name="setRightTableBackgroundColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RightTableBackgroundColor" required="Yes" type="String">
		
		<cfif RightTableBackgroundColor NEQ "NULL">	
			
			<cfif arguments.RightTableBackgroundColor EQ "@@" OR arguments.RightTableBackgroundColor EQ "">
				
				<cfset arguments.RightTableBackgroundColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(RightTableBackgroundColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RightTableBackgroundColor</strong> (#RightTableBackgroundColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(RightTableBackgroundColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RightTableBackgroundColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RightTableBackgroundColor = arguments.RightTableBackgroundColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RightTableBackgroundColor")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RightNavigationBorderColor.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRightNavigationBorderColor" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RightNavigationBorderColor>
	</cffunction>
	 
	<cffunction name="setRightNavigationBorderColor" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RightNavigationBorderColor" required="Yes" type="String">
		
		<cfif RightNavigationBorderColor NEQ "NULL">	
			
			<cfif arguments.RightNavigationBorderColor EQ "@@" OR arguments.RightNavigationBorderColor EQ "">
				
				<cfset arguments.RightNavigationBorderColor = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(RightNavigationBorderColor)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RightNavigationBorderColor</strong> (#RightNavigationBorderColor#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(RightNavigationBorderColor) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RightNavigationBorderColor</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RightNavigationBorderColor = arguments.RightNavigationBorderColor>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RightNavigationBorderColor")>			
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

		<cfargument name="ApplicationName" required="No" type="String" default="">
		<cfargument name="SiteName" required="No" type="String" default="">
		<cfargument name="Directory" required="No" type="String" default="">
		<cfargument name="URLDomains" required="No" type="String" default="">
		<cfargument name="SessionTimeout" required="No" type="String" default="">
		<cfargument name="SupportEmailAddressID" required="No" type="String" default="">
		<cfargument name="AdministratorEmailID" required="No" type="String" default="">
		<cfargument name="AdministratorPhoneID" required="No" type="String" default="">
		<cfargument name="MainPhoneNumberID" required="No" type="String" default="">
		<cfargument name="CompanyLogo" required="No" type="String" default="">
		<cfargument name="Align" required="No" type="String" default="">
		<cfargument name="BgColor" required="No" type="String" default="">
		<cfargument name="Font" required="No" type="String" default="">
		<cfargument name="FontSize" required="No" type="String" default="">
		<cfargument name="FontColor" required="No" type="String" default="">
		<cfargument name="LoginPage" required="No" type="String" default="">
		<cfargument name="TextBoxBackgroundColor" required="No" type="String" default="">
		<cfargument name="TitleHeaderColor" required="No" type="String" default="">
		<cfargument name="TitleFontColor" required="No" type="String" default="">
		<cfargument name="FooterFileName" required="No" type="String" default="">
		<cfargument name="HeaderBackgroundColor" required="No" type="String" default="">
		<cfargument name="HeaderBorder" required="No" type="String" default="">
		<cfargument name="HeaderBorderColor" required="No" type="String" default="">
		<cfargument name="HeaderFileName" required="No" type="String" default="">
		<cfargument name="HeaderHeight" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontColor" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontSize" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorder" required="No" type="String" default="">
		<cfargument name="LeftTemplateFileName" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorderColor" required="No" type="String" default="">
		<cfargument name="RightTemplateFileName" required="No" type="String" default="">
		<cfargument name="RightNavigationBorder" required="No" type="String" default="">
		<cfargument name="RightTableBackgroundColor" required="No" type="String" default="">
		<cfargument name="RightNavigationBorderColor" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.ApplicationName = arguments.ApplicationName>
		<cfset variables.instance.SiteName = arguments.SiteName>
		<cfset variables.instance.Directory = arguments.Directory>
		<cfset variables.instance.URLDomains = arguments.URLDomains>
		<cfset variables.instance.SessionTimeout = arguments.SessionTimeout>
		<cfset variables.instance.SupportEmailAddressID = arguments.SupportEmailAddressID>
		<cfset variables.instance.AdministratorEmailID = arguments.AdministratorEmailID>
		<cfset variables.instance.AdministratorPhoneID = arguments.AdministratorPhoneID>
		<cfset variables.instance.MainPhoneNumberID = arguments.MainPhoneNumberID>
		<cfset variables.instance.CompanyLogo = arguments.CompanyLogo>
		<cfset variables.instance.Align = arguments.Align>
		<cfset variables.instance.BgColor = arguments.BgColor>
		<cfset variables.instance.Font = arguments.Font>
		<cfset variables.instance.FontSize = arguments.FontSize>
		<cfset variables.instance.FontColor = arguments.FontColor>
		<cfset variables.instance.LoginPage = arguments.LoginPage>
		<cfset variables.instance.TextBoxBackgroundColor = arguments.TextBoxBackgroundColor>
		<cfset variables.instance.TitleHeaderColor = arguments.TitleHeaderColor>
		<cfset variables.instance.TitleFontColor = arguments.TitleFontColor>
		<cfset variables.instance.FooterFileName = arguments.FooterFileName>
		<cfset variables.instance.HeaderBackgroundColor = arguments.HeaderBackgroundColor>
		<cfset variables.instance.HeaderBorder = arguments.HeaderBorder>
		<cfset variables.instance.HeaderBorderColor = arguments.HeaderBorderColor>
		<cfset variables.instance.HeaderFileName = arguments.HeaderFileName>
		<cfset variables.instance.HeaderHeight = arguments.HeaderHeight>
		<cfset variables.instance.LeftNavigationFontColor = arguments.LeftNavigationFontColor>
		<cfset variables.instance.LeftNavigationFontSize = arguments.LeftNavigationFontSize>
		<cfset variables.instance.LeftNavigationBorder = arguments.LeftNavigationBorder>
		<cfset variables.instance.LeftTemplateFileName = arguments.LeftTemplateFileName>
		<cfset variables.instance.LeftNavigationBorderColor = arguments.LeftNavigationBorderColor>
		<cfset variables.instance.RightTemplateFileName = arguments.RightTemplateFileName>
		<cfset variables.instance.RightNavigationBorder = arguments.RightNavigationBorder>
		<cfset variables.instance.RightTableBackgroundColor = arguments.RightTableBackgroundColor>
		<cfset variables.instance.RightNavigationBorderColor = arguments.RightNavigationBorderColor>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="SiteIO" output="No">
		
		<cfargument name="SiteID" required="yes" type="numeric">		
		<cfset var qGetSite = "">
		
		<cfset preInit(SiteID)>
	
		<cfquery name="qGetSite" datasource="pa_master">
	  		SELECT SiteID,ApplicationName,SiteName,Directory,URLDomains,SessionTimeout,SupportEmailAddressID,AdministratorEmailID,AdministratorPhoneID,MainPhoneNumberID,CompanyLogo,Align,BgColor,Font,FontSize,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorder,HeaderBorderColor,HeaderFileName,HeaderHeight,LeftNavigationFontColor,LeftNavigationFontSize,LeftNavigationBorder,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightNavigationBorder,RightTableBackgroundColor,RightNavigationBorderColor,Active,InactiveCode,DateCreated,DateModified
			FROM site  
			WHERE SiteID = #trim(arguments.SiteID)# 
		</cfquery>
		
		<cfif qGetSite.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetSite.SiteID EQ "" OR qGetSite.SiteID EQ "NULL") 
				variables.instance.SiteID = "NULL"; 
			ELSE 
				variables.instance.SiteID = qGetSite.SiteID;
							
				variables.instance.ApplicationName = qGetSite.ApplicationName;
							
				variables.instance.SiteName = qGetSite.SiteName;
							
				variables.instance.Directory = qGetSite.Directory;
							
				variables.instance.URLDomains = qGetSite.URLDomains;
				
			IF(qGetSite.SessionTimeout EQ "" OR qGetSite.SessionTimeout EQ "NULL") 
				variables.instance.SessionTimeout = "NULL"; 
			ELSE 
				variables.instance.SessionTimeout = qGetSite.SessionTimeout;
				
			IF(qGetSite.SupportEmailAddressID EQ "" OR qGetSite.SupportEmailAddressID EQ "NULL") 
				variables.instance.SupportEmailAddressID = "NULL"; 
			ELSE 
				variables.instance.SupportEmailAddressID = qGetSite.SupportEmailAddressID;
				
			IF(qGetSite.AdministratorEmailID EQ "" OR qGetSite.AdministratorEmailID EQ "NULL") 
				variables.instance.AdministratorEmailID = "NULL"; 
			ELSE 
				variables.instance.AdministratorEmailID = qGetSite.AdministratorEmailID;
				
			IF(qGetSite.AdministratorPhoneID EQ "" OR qGetSite.AdministratorPhoneID EQ "NULL") 
				variables.instance.AdministratorPhoneID = "NULL"; 
			ELSE 
				variables.instance.AdministratorPhoneID = qGetSite.AdministratorPhoneID;
				
			IF(qGetSite.MainPhoneNumberID EQ "" OR qGetSite.MainPhoneNumberID EQ "NULL") 
				variables.instance.MainPhoneNumberID = "NULL"; 
			ELSE 
				variables.instance.MainPhoneNumberID = qGetSite.MainPhoneNumberID;
							
				variables.instance.CompanyLogo = qGetSite.CompanyLogo;
							
				variables.instance.Align = qGetSite.Align;
							
				variables.instance.BgColor = qGetSite.BgColor;
							
				variables.instance.Font = qGetSite.Font;
				
			IF(qGetSite.FontSize EQ "" OR qGetSite.FontSize EQ "NULL") 
				variables.instance.FontSize = "NULL"; 
			ELSE 
				variables.instance.FontSize = qGetSite.FontSize;
							
				variables.instance.FontColor = qGetSite.FontColor;
							
				variables.instance.LoginPage = qGetSite.LoginPage;
							
				variables.instance.TextBoxBackgroundColor = qGetSite.TextBoxBackgroundColor;
							
				variables.instance.TitleHeaderColor = qGetSite.TitleHeaderColor;
							
				variables.instance.TitleFontColor = qGetSite.TitleFontColor;
							
				variables.instance.FooterFileName = qGetSite.FooterFileName;
							
				variables.instance.HeaderBackgroundColor = qGetSite.HeaderBackgroundColor;
				
			IF(qGetSite.HeaderBorder EQ "" OR qGetSite.HeaderBorder EQ "NULL") 
				variables.instance.HeaderBorder = "NULL"; 
			ELSE 
				variables.instance.HeaderBorder = qGetSite.HeaderBorder;
							
				variables.instance.HeaderBorderColor = qGetSite.HeaderBorderColor;
							
				variables.instance.HeaderFileName = qGetSite.HeaderFileName;
				
			IF(qGetSite.HeaderHeight EQ "" OR qGetSite.HeaderHeight EQ "NULL") 
				variables.instance.HeaderHeight = "NULL"; 
			ELSE 
				variables.instance.HeaderHeight = qGetSite.HeaderHeight;
							
				variables.instance.LeftNavigationFontColor = qGetSite.LeftNavigationFontColor;
				
			IF(qGetSite.LeftNavigationFontSize EQ "" OR qGetSite.LeftNavigationFontSize EQ "NULL") 
				variables.instance.LeftNavigationFontSize = "NULL"; 
			ELSE 
				variables.instance.LeftNavigationFontSize = qGetSite.LeftNavigationFontSize;
				
			IF(qGetSite.LeftNavigationBorder EQ "" OR qGetSite.LeftNavigationBorder EQ "NULL") 
				variables.instance.LeftNavigationBorder = "NULL"; 
			ELSE 
				variables.instance.LeftNavigationBorder = qGetSite.LeftNavigationBorder;
							
				variables.instance.LeftTemplateFileName = qGetSite.LeftTemplateFileName;
							
				variables.instance.LeftNavigationBorderColor = qGetSite.LeftNavigationBorderColor;
							
				variables.instance.RightTemplateFileName = qGetSite.RightTemplateFileName;
				
			IF(qGetSite.RightNavigationBorder EQ "" OR qGetSite.RightNavigationBorder EQ "NULL") 
				variables.instance.RightNavigationBorder = "NULL"; 
			ELSE 
				variables.instance.RightNavigationBorder = qGetSite.RightNavigationBorder;
							
				variables.instance.RightTableBackgroundColor = qGetSite.RightTableBackgroundColor;
							
				variables.instance.RightNavigationBorderColor = qGetSite.RightNavigationBorderColor;
							
				variables.instance.Active = qGetSite.Active;
				
			IF(qGetSite.InactiveCode EQ "" OR qGetSite.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetSite.InactiveCode;
							
				variables.instance.DateCreated = qGetSite.DateCreated;
							
				variables.instance.DateModified = qGetSite.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(SiteID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitSite = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.SiteID) AND variables.instance.SiteID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitSite" datasource="pa_master">
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
			
				<cfquery name="qInsertCommitSite" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.SiteID = qInsertCommitSite.SiteID>
				
				<cfreturn qInsertCommitSite.SiteID>
			
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
			<cfset tableColumns = "SiteID,ApplicationName,SiteName,Directory,URLDomains,SessionTimeout,SupportEmailAddressID,AdministratorEmailID,AdministratorPhoneID,MainPhoneNumberID,CompanyLogo,Align,BgColor,Font,FontSize,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorder,HeaderBorderColor,HeaderFileName,HeaderHeight,LeftNavigationFontColor,LeftNavigationFontSize,LeftNavigationBorder,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightNavigationBorder,RightTableBackgroundColor,RightNavigationBorderColor,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "ApplicationName,SiteName,Directory,URLDomains,CompanyLogo,Align,BgColor,Font,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorderColor,HeaderFileName,LeftNavigationFontColor,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightTableBackgroundColor,RightNavigationBorderColor,Active">	
			
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
				<cfset sqlStatement = "UPDATE site  SET #columnsToUpdate# WHERE SiteID = #trim(variables.instance.SiteID)#">
				
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
			<cfset stringTableColumns = "ApplicationName,SiteName,Directory,URLDomains,CompanyLogo,Align,BgColor,Font,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorderColor,HeaderFileName,LeftNavigationFontColor,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightTableBackgroundColor,RightNavigationBorderColor,Active">	
			
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
			<cfloop list="ApplicationName,SiteName,Directory,URLDomains,SessionTimeout,SupportEmailAddressID,AdministratorEmailID,AdministratorPhoneID,MainPhoneNumberID,CompanyLogo,Align,BgColor,Font,FontSize,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorder,HeaderBorderColor,HeaderFileName,HeaderHeight,LeftNavigationFontColor,LeftNavigationFontSize,LeftNavigationBorder,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightNavigationBorder,RightTableBackgroundColor,RightNavigationBorderColor,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
				<cfset sqlStatement = "INSERT INTO site  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS SiteID ">
				
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
	<cffunction name="getSiteQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getSiteQuery">						
		<cfargument name="Fields" required="No" type="String" default="SiteID,ApplicationName,SiteName,Directory,URLDomains,SessionTimeout,SupportEmailAddressID,AdministratorEmailID,AdministratorPhoneID,MainPhoneNumberID,CompanyLogo,Align,BgColor,Font,FontSize,FontColor,LoginPage,TextBoxBackgroundColor,TitleHeaderColor,TitleFontColor,FooterFileName,HeaderBackgroundColor,HeaderBorder,HeaderBorderColor,HeaderFileName,HeaderHeight,LeftNavigationFontColor,LeftNavigationFontSize,LeftNavigationBorder,LeftTemplateFileName,LeftNavigationBorderColor,RightTemplateFileName,RightNavigationBorder,RightTableBackgroundColor,RightNavigationBorderColor,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="SiteID_IN" required="No" type="String" default="">
		<cfargument name="SiteID_LIKE" required="No" type="String" default="">
		<cfargument name="ApplicationName" required="No" type="String" default="">
		<cfargument name="ApplicationName_IN" required="No" type="String" default="">
		<cfargument name="ApplicationName_LIKE" required="No" type="String" default="">
		<cfargument name="SiteName" required="No" type="String" default="">
		<cfargument name="SiteName_IN" required="No" type="String" default="">
		<cfargument name="SiteName_LIKE" required="No" type="String" default="">
		<cfargument name="Directory" required="No" type="String" default="">
		<cfargument name="Directory_IN" required="No" type="String" default="">
		<cfargument name="Directory_LIKE" required="No" type="String" default="">
		<cfargument name="URLDomains" required="No" type="String" default="">
		<cfargument name="URLDomains_IN" required="No" type="String" default="">
		<cfargument name="URLDomains_LIKE" required="No" type="String" default="">
		<cfargument name="SessionTimeout" required="No" type="String" default="">
		<cfargument name="SessionTimeout_IN" required="No" type="String" default="">
		<cfargument name="SessionTimeout_LIKE" required="No" type="String" default="">
		<cfargument name="SupportEmailAddressID" required="No" type="String" default="">
		<cfargument name="SupportEmailAddressID_IN" required="No" type="String" default="">
		<cfargument name="SupportEmailAddressID_LIKE" required="No" type="String" default="">
		<cfargument name="AdministratorEmailID" required="No" type="String" default="">
		<cfargument name="AdministratorEmailID_IN" required="No" type="String" default="">
		<cfargument name="AdministratorEmailID_LIKE" required="No" type="String" default="">
		<cfargument name="AdministratorPhoneID" required="No" type="String" default="">
		<cfargument name="AdministratorPhoneID_IN" required="No" type="String" default="">
		<cfargument name="AdministratorPhoneID_LIKE" required="No" type="String" default="">
		<cfargument name="MainPhoneNumberID" required="No" type="String" default="">
		<cfargument name="MainPhoneNumberID_IN" required="No" type="String" default="">
		<cfargument name="MainPhoneNumberID_LIKE" required="No" type="String" default="">
		<cfargument name="CompanyLogo" required="No" type="String" default="">
		<cfargument name="CompanyLogo_IN" required="No" type="String" default="">
		<cfargument name="CompanyLogo_LIKE" required="No" type="String" default="">
		<cfargument name="Align" required="No" type="String" default="">
		<cfargument name="Align_IN" required="No" type="String" default="">
		<cfargument name="Align_LIKE" required="No" type="String" default="">
		<cfargument name="BgColor" required="No" type="String" default="">
		<cfargument name="BgColor_IN" required="No" type="String" default="">
		<cfargument name="BgColor_LIKE" required="No" type="String" default="">
		<cfargument name="Font" required="No" type="String" default="">
		<cfargument name="Font_IN" required="No" type="String" default="">
		<cfargument name="Font_LIKE" required="No" type="String" default="">
		<cfargument name="FontSize" required="No" type="String" default="">
		<cfargument name="FontSize_IN" required="No" type="String" default="">
		<cfargument name="FontSize_LIKE" required="No" type="String" default="">
		<cfargument name="FontColor" required="No" type="String" default="">
		<cfargument name="FontColor_IN" required="No" type="String" default="">
		<cfargument name="FontColor_LIKE" required="No" type="String" default="">
		<cfargument name="LoginPage" required="No" type="String" default="">
		<cfargument name="LoginPage_IN" required="No" type="String" default="">
		<cfargument name="LoginPage_LIKE" required="No" type="String" default="">
		<cfargument name="TextBoxBackgroundColor" required="No" type="String" default="">
		<cfargument name="TextBoxBackgroundColor_IN" required="No" type="String" default="">
		<cfargument name="TextBoxBackgroundColor_LIKE" required="No" type="String" default="">
		<cfargument name="TitleHeaderColor" required="No" type="String" default="">
		<cfargument name="TitleHeaderColor_IN" required="No" type="String" default="">
		<cfargument name="TitleHeaderColor_LIKE" required="No" type="String" default="">
		<cfargument name="TitleFontColor" required="No" type="String" default="">
		<cfargument name="TitleFontColor_IN" required="No" type="String" default="">
		<cfargument name="TitleFontColor_LIKE" required="No" type="String" default="">
		<cfargument name="FooterFileName" required="No" type="String" default="">
		<cfargument name="FooterFileName_IN" required="No" type="String" default="">
		<cfargument name="FooterFileName_LIKE" required="No" type="String" default="">
		<cfargument name="HeaderBackgroundColor" required="No" type="String" default="">
		<cfargument name="HeaderBackgroundColor_IN" required="No" type="String" default="">
		<cfargument name="HeaderBackgroundColor_LIKE" required="No" type="String" default="">
		<cfargument name="HeaderBorder" required="No" type="String" default="">
		<cfargument name="HeaderBorder_IN" required="No" type="String" default="">
		<cfargument name="HeaderBorder_LIKE" required="No" type="String" default="">
		<cfargument name="HeaderBorderColor" required="No" type="String" default="">
		<cfargument name="HeaderBorderColor_IN" required="No" type="String" default="">
		<cfargument name="HeaderBorderColor_LIKE" required="No" type="String" default="">
		<cfargument name="HeaderFileName" required="No" type="String" default="">
		<cfargument name="HeaderFileName_IN" required="No" type="String" default="">
		<cfargument name="HeaderFileName_LIKE" required="No" type="String" default="">
		<cfargument name="HeaderHeight" required="No" type="String" default="">
		<cfargument name="HeaderHeight_IN" required="No" type="String" default="">
		<cfargument name="HeaderHeight_LIKE" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontColor" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontColor_IN" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontColor_LIKE" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontSize" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontSize_IN" required="No" type="String" default="">
		<cfargument name="LeftNavigationFontSize_LIKE" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorder" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorder_IN" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorder_LIKE" required="No" type="String" default="">
		<cfargument name="LeftTemplateFileName" required="No" type="String" default="">
		<cfargument name="LeftTemplateFileName_IN" required="No" type="String" default="">
		<cfargument name="LeftTemplateFileName_LIKE" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorderColor" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorderColor_IN" required="No" type="String" default="">
		<cfargument name="LeftNavigationBorderColor_LIKE" required="No" type="String" default="">
		<cfargument name="RightTemplateFileName" required="No" type="String" default="">
		<cfargument name="RightTemplateFileName_IN" required="No" type="String" default="">
		<cfargument name="RightTemplateFileName_LIKE" required="No" type="String" default="">
		<cfargument name="RightNavigationBorder" required="No" type="String" default="">
		<cfargument name="RightNavigationBorder_IN" required="No" type="String" default="">
		<cfargument name="RightNavigationBorder_LIKE" required="No" type="String" default="">
		<cfargument name="RightTableBackgroundColor" required="No" type="String" default="">
		<cfargument name="RightTableBackgroundColor_IN" required="No" type="String" default="">
		<cfargument name="RightTableBackgroundColor_LIKE" required="No" type="String" default="">
		<cfargument name="RightNavigationBorderColor" required="No" type="String" default="">
		<cfargument name="RightNavigationBorderColor_IN" required="No" type="String" default="">
		<cfargument name="RightNavigationBorderColor_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "SiteID,SiteID_IN,SiteID_LIKE,ApplicationName,ApplicationName_IN,ApplicationName_LIKE,SiteName,SiteName_IN,SiteName_LIKE,Directory,Directory_IN,Directory_LIKE,URLDomains,URLDomains_IN,URLDomains_LIKE,SessionTimeout,SessionTimeout_IN,SessionTimeout_LIKE,SupportEmailAddressID,SupportEmailAddressID_IN,SupportEmailAddressID_LIKE,AdministratorEmailID,AdministratorEmailID_IN,AdministratorEmailID_LIKE,AdministratorPhoneID,AdministratorPhoneID_IN,AdministratorPhoneID_LIKE,MainPhoneNumberID,MainPhoneNumberID_IN,MainPhoneNumberID_LIKE,CompanyLogo,CompanyLogo_IN,CompanyLogo_LIKE,Align,Align_IN,Align_LIKE,BgColor,BgColor_IN,BgColor_LIKE,Font,Font_IN,Font_LIKE,FontSize,FontSize_IN,FontSize_LIKE,FontColor,FontColor_IN,FontColor_LIKE,LoginPage,LoginPage_IN,LoginPage_LIKE,TextBoxBackgroundColor,TextBoxBackgroundColor_IN,TextBoxBackgroundColor_LIKE,TitleHeaderColor,TitleHeaderColor_IN,TitleHeaderColor_LIKE,TitleFontColor,TitleFontColor_IN,TitleFontColor_LIKE,FooterFileName,FooterFileName_IN,FooterFileName_LIKE,HeaderBackgroundColor,HeaderBackgroundColor_IN,HeaderBackgroundColor_LIKE,HeaderBorder,HeaderBorder_IN,HeaderBorder_LIKE,HeaderBorderColor,HeaderBorderColor_IN,HeaderBorderColor_LIKE,HeaderFileName,HeaderFileName_IN,HeaderFileName_LIKE,HeaderHeight,HeaderHeight_IN,HeaderHeight_LIKE,LeftNavigationFontColor,LeftNavigationFontColor_IN,LeftNavigationFontColor_LIKE,LeftNavigationFontSize,LeftNavigationFontSize_IN,LeftNavigationFontSize_LIKE,LeftNavigationBorder,LeftNavigationBorder_IN,LeftNavigationBorder_LIKE,LeftTemplateFileName,LeftTemplateFileName_IN,LeftTemplateFileName_LIKE,LeftNavigationBorderColor,LeftNavigationBorderColor_IN,LeftNavigationBorderColor_LIKE,RightTemplateFileName,RightTemplateFileName_IN,RightTemplateFileName_LIKE,RightNavigationBorder,RightNavigationBorder_IN,RightNavigationBorder_LIKE,RightTableBackgroundColor,RightTableBackgroundColor_IN,RightTableBackgroundColor_LIKE,RightNavigationBorderColor,RightNavigationBorderColor_IN,RightNavigationBorderColor_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Site"
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
			<cfquery Name="getSiteQuery" datasource="pa_master">
				SELECT #trim(Fields)#
				FROM site   
				WHERE 1=1
					<cfif SiteID NEQ "" AND IsNumeric(SiteID)>AND SiteID = #SiteID#</cfif>
					<cfif SiteID_IN NEQ "">AND SiteID IN(#trim(SiteID_IN)#)</cfif>
					<cfif SiteID_LIKE NEQ "">AND SiteID LIKE '%#trim(SiteID_LIKE)#%'</cfif>
					<cfif ApplicationName NEQ "">AND ApplicationName = '#ApplicationName#'</cfif>
					<cfif ApplicationName_IN NEQ "">AND ApplicationName IN(#trim(ApplicationName_IN)#)</cfif>
					<cfif ApplicationName_LIKE NEQ "">AND ApplicationName LIKE '%#trim(ApplicationName_LIKE)#%'</cfif>
					<cfif SiteName NEQ "">AND SiteName = '#SiteName#'</cfif>
					<cfif SiteName_IN NEQ "">AND SiteName IN(#trim(SiteName_IN)#)</cfif>
					<cfif SiteName_LIKE NEQ "">AND SiteName LIKE '%#trim(SiteName_LIKE)#%'</cfif>
					<cfif Directory NEQ "">AND Directory = '#Directory#'</cfif>
					<cfif Directory_IN NEQ "">AND Directory IN(#trim(Directory_IN)#)</cfif>
					<cfif Directory_LIKE NEQ "">AND Directory LIKE '%#trim(Directory_LIKE)#%'</cfif>
					<cfif URLDomains NEQ "">AND URLDomains = '#URLDomains#'</cfif>
					<cfif URLDomains_IN NEQ "">AND URLDomains IN(#trim(URLDomains_IN)#)</cfif>
					<cfif URLDomains_LIKE NEQ "">AND URLDomains LIKE '%#trim(URLDomains_LIKE)#%'</cfif>
					<cfif SessionTimeout NEQ "" AND IsNumeric(SessionTimeout)>AND SessionTimeout = #SessionTimeout#</cfif>
					<cfif SessionTimeout_IN NEQ "">AND SessionTimeout IN(#trim(SessionTimeout_IN)#)</cfif>
					<cfif SessionTimeout_LIKE NEQ "">AND SessionTimeout LIKE '%#trim(SessionTimeout_LIKE)#%'</cfif>
					<cfif SupportEmailAddressID NEQ "" AND IsNumeric(SupportEmailAddressID)>AND SupportEmailAddressID = #SupportEmailAddressID#</cfif>
					<cfif SupportEmailAddressID_IN NEQ "">AND SupportEmailAddressID IN(#trim(SupportEmailAddressID_IN)#)</cfif>
					<cfif SupportEmailAddressID_LIKE NEQ "">AND SupportEmailAddressID LIKE '%#trim(SupportEmailAddressID_LIKE)#%'</cfif>
					<cfif AdministratorEmailID NEQ "" AND IsNumeric(AdministratorEmailID)>AND AdministratorEmailID = #AdministratorEmailID#</cfif>
					<cfif AdministratorEmailID_IN NEQ "">AND AdministratorEmailID IN(#trim(AdministratorEmailID_IN)#)</cfif>
					<cfif AdministratorEmailID_LIKE NEQ "">AND AdministratorEmailID LIKE '%#trim(AdministratorEmailID_LIKE)#%'</cfif>
					<cfif AdministratorPhoneID NEQ "" AND IsNumeric(AdministratorPhoneID)>AND AdministratorPhoneID = #AdministratorPhoneID#</cfif>
					<cfif AdministratorPhoneID_IN NEQ "">AND AdministratorPhoneID IN(#trim(AdministratorPhoneID_IN)#)</cfif>
					<cfif AdministratorPhoneID_LIKE NEQ "">AND AdministratorPhoneID LIKE '%#trim(AdministratorPhoneID_LIKE)#%'</cfif>
					<cfif MainPhoneNumberID NEQ "" AND IsNumeric(MainPhoneNumberID)>AND MainPhoneNumberID = #MainPhoneNumberID#</cfif>
					<cfif MainPhoneNumberID_IN NEQ "">AND MainPhoneNumberID IN(#trim(MainPhoneNumberID_IN)#)</cfif>
					<cfif MainPhoneNumberID_LIKE NEQ "">AND MainPhoneNumberID LIKE '%#trim(MainPhoneNumberID_LIKE)#%'</cfif>
					<cfif CompanyLogo NEQ "">AND CompanyLogo = '#CompanyLogo#'</cfif>
					<cfif CompanyLogo_IN NEQ "">AND CompanyLogo IN(#trim(CompanyLogo_IN)#)</cfif>
					<cfif CompanyLogo_LIKE NEQ "">AND CompanyLogo LIKE '%#trim(CompanyLogo_LIKE)#%'</cfif>
					<cfif Align NEQ "">AND Align = '#Align#'</cfif>
					<cfif Align_IN NEQ "">AND Align IN(#trim(Align_IN)#)</cfif>
					<cfif Align_LIKE NEQ "">AND Align LIKE '%#trim(Align_LIKE)#%'</cfif>
					<cfif BgColor NEQ "">AND BgColor = '#BgColor#'</cfif>
					<cfif BgColor_IN NEQ "">AND BgColor IN(#trim(BgColor_IN)#)</cfif>
					<cfif BgColor_LIKE NEQ "">AND BgColor LIKE '%#trim(BgColor_LIKE)#%'</cfif>
					<cfif Font NEQ "">AND Font = '#Font#'</cfif>
					<cfif Font_IN NEQ "">AND Font IN(#trim(Font_IN)#)</cfif>
					<cfif Font_LIKE NEQ "">AND Font LIKE '%#trim(Font_LIKE)#%'</cfif>
					<cfif FontSize NEQ "" AND IsNumeric(FontSize)>AND FontSize = #FontSize#</cfif>
					<cfif FontSize_IN NEQ "">AND FontSize IN(#trim(FontSize_IN)#)</cfif>
					<cfif FontSize_LIKE NEQ "">AND FontSize LIKE '%#trim(FontSize_LIKE)#%'</cfif>
					<cfif FontColor NEQ "">AND FontColor = '#FontColor#'</cfif>
					<cfif FontColor_IN NEQ "">AND FontColor IN(#trim(FontColor_IN)#)</cfif>
					<cfif FontColor_LIKE NEQ "">AND FontColor LIKE '%#trim(FontColor_LIKE)#%'</cfif>
					<cfif LoginPage NEQ "">AND LoginPage = '#LoginPage#'</cfif>
					<cfif LoginPage_IN NEQ "">AND LoginPage IN(#trim(LoginPage_IN)#)</cfif>
					<cfif LoginPage_LIKE NEQ "">AND LoginPage LIKE '%#trim(LoginPage_LIKE)#%'</cfif>
					<cfif TextBoxBackgroundColor NEQ "">AND TextBoxBackgroundColor = '#TextBoxBackgroundColor#'</cfif>
					<cfif TextBoxBackgroundColor_IN NEQ "">AND TextBoxBackgroundColor IN(#trim(TextBoxBackgroundColor_IN)#)</cfif>
					<cfif TextBoxBackgroundColor_LIKE NEQ "">AND TextBoxBackgroundColor LIKE '%#trim(TextBoxBackgroundColor_LIKE)#%'</cfif>
					<cfif TitleHeaderColor NEQ "">AND TitleHeaderColor = '#TitleHeaderColor#'</cfif>
					<cfif TitleHeaderColor_IN NEQ "">AND TitleHeaderColor IN(#trim(TitleHeaderColor_IN)#)</cfif>
					<cfif TitleHeaderColor_LIKE NEQ "">AND TitleHeaderColor LIKE '%#trim(TitleHeaderColor_LIKE)#%'</cfif>
					<cfif TitleFontColor NEQ "">AND TitleFontColor = '#TitleFontColor#'</cfif>
					<cfif TitleFontColor_IN NEQ "">AND TitleFontColor IN(#trim(TitleFontColor_IN)#)</cfif>
					<cfif TitleFontColor_LIKE NEQ "">AND TitleFontColor LIKE '%#trim(TitleFontColor_LIKE)#%'</cfif>
					<cfif FooterFileName NEQ "">AND FooterFileName = '#FooterFileName#'</cfif>
					<cfif FooterFileName_IN NEQ "">AND FooterFileName IN(#trim(FooterFileName_IN)#)</cfif>
					<cfif FooterFileName_LIKE NEQ "">AND FooterFileName LIKE '%#trim(FooterFileName_LIKE)#%'</cfif>
					<cfif HeaderBackgroundColor NEQ "">AND HeaderBackgroundColor = '#HeaderBackgroundColor#'</cfif>
					<cfif HeaderBackgroundColor_IN NEQ "">AND HeaderBackgroundColor IN(#trim(HeaderBackgroundColor_IN)#)</cfif>
					<cfif HeaderBackgroundColor_LIKE NEQ "">AND HeaderBackgroundColor LIKE '%#trim(HeaderBackgroundColor_LIKE)#%'</cfif>
					<cfif HeaderBorder NEQ "" AND IsNumeric(HeaderBorder)>AND HeaderBorder = #HeaderBorder#</cfif>
					<cfif HeaderBorder_IN NEQ "">AND HeaderBorder IN(#trim(HeaderBorder_IN)#)</cfif>
					<cfif HeaderBorder_LIKE NEQ "">AND HeaderBorder LIKE '%#trim(HeaderBorder_LIKE)#%'</cfif>
					<cfif HeaderBorderColor NEQ "">AND HeaderBorderColor = '#HeaderBorderColor#'</cfif>
					<cfif HeaderBorderColor_IN NEQ "">AND HeaderBorderColor IN(#trim(HeaderBorderColor_IN)#)</cfif>
					<cfif HeaderBorderColor_LIKE NEQ "">AND HeaderBorderColor LIKE '%#trim(HeaderBorderColor_LIKE)#%'</cfif>
					<cfif HeaderFileName NEQ "">AND HeaderFileName = '#HeaderFileName#'</cfif>
					<cfif HeaderFileName_IN NEQ "">AND HeaderFileName IN(#trim(HeaderFileName_IN)#)</cfif>
					<cfif HeaderFileName_LIKE NEQ "">AND HeaderFileName LIKE '%#trim(HeaderFileName_LIKE)#%'</cfif>
					<cfif HeaderHeight NEQ "" AND IsNumeric(HeaderHeight)>AND HeaderHeight = #HeaderHeight#</cfif>
					<cfif HeaderHeight_IN NEQ "">AND HeaderHeight IN(#trim(HeaderHeight_IN)#)</cfif>
					<cfif HeaderHeight_LIKE NEQ "">AND HeaderHeight LIKE '%#trim(HeaderHeight_LIKE)#%'</cfif>
					<cfif LeftNavigationFontColor NEQ "">AND LeftNavigationFontColor = '#LeftNavigationFontColor#'</cfif>
					<cfif LeftNavigationFontColor_IN NEQ "">AND LeftNavigationFontColor IN(#trim(LeftNavigationFontColor_IN)#)</cfif>
					<cfif LeftNavigationFontColor_LIKE NEQ "">AND LeftNavigationFontColor LIKE '%#trim(LeftNavigationFontColor_LIKE)#%'</cfif>
					<cfif LeftNavigationFontSize NEQ "" AND IsNumeric(LeftNavigationFontSize)>AND LeftNavigationFontSize = #LeftNavigationFontSize#</cfif>
					<cfif LeftNavigationFontSize_IN NEQ "">AND LeftNavigationFontSize IN(#trim(LeftNavigationFontSize_IN)#)</cfif>
					<cfif LeftNavigationFontSize_LIKE NEQ "">AND LeftNavigationFontSize LIKE '%#trim(LeftNavigationFontSize_LIKE)#%'</cfif>
					<cfif LeftNavigationBorder NEQ "" AND IsNumeric(LeftNavigationBorder)>AND LeftNavigationBorder = #LeftNavigationBorder#</cfif>
					<cfif LeftNavigationBorder_IN NEQ "">AND LeftNavigationBorder IN(#trim(LeftNavigationBorder_IN)#)</cfif>
					<cfif LeftNavigationBorder_LIKE NEQ "">AND LeftNavigationBorder LIKE '%#trim(LeftNavigationBorder_LIKE)#%'</cfif>
					<cfif LeftTemplateFileName NEQ "">AND LeftTemplateFileName = '#LeftTemplateFileName#'</cfif>
					<cfif LeftTemplateFileName_IN NEQ "">AND LeftTemplateFileName IN(#trim(LeftTemplateFileName_IN)#)</cfif>
					<cfif LeftTemplateFileName_LIKE NEQ "">AND LeftTemplateFileName LIKE '%#trim(LeftTemplateFileName_LIKE)#%'</cfif>
					<cfif LeftNavigationBorderColor NEQ "">AND LeftNavigationBorderColor = '#LeftNavigationBorderColor#'</cfif>
					<cfif LeftNavigationBorderColor_IN NEQ "">AND LeftNavigationBorderColor IN(#trim(LeftNavigationBorderColor_IN)#)</cfif>
					<cfif LeftNavigationBorderColor_LIKE NEQ "">AND LeftNavigationBorderColor LIKE '%#trim(LeftNavigationBorderColor_LIKE)#%'</cfif>
					<cfif RightTemplateFileName NEQ "">AND RightTemplateFileName = '#RightTemplateFileName#'</cfif>
					<cfif RightTemplateFileName_IN NEQ "">AND RightTemplateFileName IN(#trim(RightTemplateFileName_IN)#)</cfif>
					<cfif RightTemplateFileName_LIKE NEQ "">AND RightTemplateFileName LIKE '%#trim(RightTemplateFileName_LIKE)#%'</cfif>
					<cfif RightNavigationBorder NEQ "" AND IsNumeric(RightNavigationBorder)>AND RightNavigationBorder = #RightNavigationBorder#</cfif>
					<cfif RightNavigationBorder_IN NEQ "">AND RightNavigationBorder IN(#trim(RightNavigationBorder_IN)#)</cfif>
					<cfif RightNavigationBorder_LIKE NEQ "">AND RightNavigationBorder LIKE '%#trim(RightNavigationBorder_LIKE)#%'</cfif>
					<cfif RightTableBackgroundColor NEQ "">AND RightTableBackgroundColor = '#RightTableBackgroundColor#'</cfif>
					<cfif RightTableBackgroundColor_IN NEQ "">AND RightTableBackgroundColor IN(#trim(RightTableBackgroundColor_IN)#)</cfif>
					<cfif RightTableBackgroundColor_LIKE NEQ "">AND RightTableBackgroundColor LIKE '%#trim(RightTableBackgroundColor_LIKE)#%'</cfif>
					<cfif RightNavigationBorderColor NEQ "">AND RightNavigationBorderColor = '#RightNavigationBorderColor#'</cfif>
					<cfif RightNavigationBorderColor_IN NEQ "">AND RightNavigationBorderColor IN(#trim(RightNavigationBorderColor_IN)#)</cfif>
					<cfif RightNavigationBorderColor_LIKE NEQ "">AND RightNavigationBorderColor LIKE '%#trim(RightNavigationBorderColor_LIKE)#%'</cfif>
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
			
			<cfreturn getSiteQuery>
		
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
		
		<!------------------------------------------------------------------>
		<!--- This function will search for the Id of the site based     --->
		<!--- on the url server name.                                    --->
		<!------------------------------------------------------------------>
		<cffunction name="getSiteIDByURL" hint="This function will search for the Id of the site based on the url server name.">		
			
			<cfargument name="serverName" required="Yes" type="String">
			
			<cfquery Name="getSiteID" datasource="pa_master">
				SELECT siteID
				FROM site  
				WHERE (URLDomains = '#trim(serverName)#' OR URLDomains LIKE '#trim(serverName)#,%' OR URLDomains LIKE '%,#trim(serverName)#' OR URLDomains LIKE '%,#trim(serverName)#,%') AND Active = 1
			</cfquery>
				
			<cfif getSiteID.RecordCount NEQ 1>
				<cf_gcGeneralErrorTemplate				
					message="There was an issue trying to process your request. If you continue to receive this error message please contact an administrator.">		      
			<cfelse>
				<cfreturn getSiteID.SiteID>
			</cfif>	
		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>




