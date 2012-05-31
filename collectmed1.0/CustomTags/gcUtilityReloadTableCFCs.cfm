


<cfquery name="getTables" datasource="PAClient_1084">
	SELECT Name
	FROM dbo.sysobjects  
	WHERE (type = 'U') AND Name NOT LIKE 'dtproperties'
</cfquery>

<cfset tablesList = valuelist(getTables.Name)>

<cfloop list="#trim(tablesList)#" index="i">
	<cf_gcCreateDatabaseTableCFCFileActive tablename="#trim(i)#" ds="PAClient_1084">
<!---	<cf_gcCreateDatabaseTableCFCFileBean tablename="#trim(i)#" ds="PAClient_1084">
	<cf_gcCreateDatabaseTableCFCFileDAO tablename="#trim(i)#" ds="PAClient_1084">
	<cf_gcCreateDatabaseTableCFCFileGateway tablename="#trim(i)#" ds="PAClient_1084">
	<cf_gcCreateDatabaseTableCFCFile tablename="#trim(i)#" ds="PAClient_1084">--->
</cfloop>


<cfquery name="getTables" datasource="pa_master">
	SELECT Name
	FROM dbo.sysobjects  
	WHERE (type = 'U') AND Name NOT LIKE 'dtproperties'
</cfquery>

<cfset tablesList = valuelist(getTables.Name)>

<cfloop list="#trim(tablesList)#" index="i">
	<cf_gcCreateDatabaseTableCFCFileActive tablename="#trim(i)#" ds="pa_master">
<!---	<cf_gcCreateDatabaseTableCFCFileBean tablename="#trim(i)#" ds="pa_master">
	<cf_gcCreateDatabaseTableCFCFileDAO tablename="#trim(i)#" ds="pa_master">
	<cf_gcCreateDatabaseTableCFCFileGAteway tablename="#trim(i)#" ds="pa_master">
	<cf_gcCreateDatabaseTableCFCFile tablename="#trim(i)#" ds="pa_master">--->
</cfloop>

<cfoutput>All Table CFC's Completed</cfoutput>	
	




	


