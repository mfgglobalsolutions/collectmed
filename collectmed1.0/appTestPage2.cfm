
<!---
<cfset ds = "PAClient_1084">
<cfset tableList = "Address,Phone,InsuranceCompany">

<cfloop list="#tableList#" index="table">
	<cf_gcCOM_CreateDatabaseTableCFCFile tablename="#trim(table)#" ds="#trim(ds)#">
	<cf_gcCOM_CreateDatabaseTableCFCFileDAO tablename="#trim(table)#" ds="#trim(ds)#"> 
	<cf_gcCOM_CreateDatabaseTableCFCFileService tablename="#trim(table)#" ds="#trim(ds)#"> 
</cfloop>

<cf_gcCOM_CreateDatabaseTableSystemDAOFile>
<cf_gcCOM_CreateDatabaseTableModelColdSpringConfigFile>
<cf_gcCOM_CreateDatabaseTableDAOsColdSpringConfigFile>
<cf_gcCOM_CreateDatabaseTableServicesColdSpringConfigFile>


<cfdump expand="false" var="#application.beanFactory.getBean('Address')#">
<cfdump expand="false" var="#application.beanFactory.getBean('Address')#">
<cfdump expand="false" var="#application.beanFactory.getBean('Address')#">

<cfdump expand="false" var="#application.beanFactory.getBean('Phone')#">
<cfdump expand="false" var="#application.beanFactory.getBean('Phone')#">
<cfdump expand="false" var="#application.beanFactory.getBean('Phone')#">

<cfdump expand="false" var="#application.beanFactory.getBean('InsuranceCompany')#">
<cfdump expand="false" var="#application.beanFactory.getBean('InsuranceCompany')#">
<cfdump expand="false" var="#application.beanFactory.getBean('InsuranceCompany')#">

<cfabort> --->




<!--- 


<cfset alphabet = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z">
<cfset qFinal = querynew("A_ROUTE,B_COLUMN_2,C_COLUMN_1,D_COLUMN_3,E_COLUMN_4,F_COLUMN_5,G_IsRoute,H_PatientID")>
<cfset variables.sheetNames = "Bryan 12,College Station,Brenham,Navasota,Hearne,Caldwell,Madisonville">
	
<cfloop list="#variables.sheetNames#" index="thisSheetName">

	<cfset filename = "C:\EOBManager\misc\DIAPER ROUTE SUSIE #(thisSheetName)#.csv">
	<cffile action="read" file="#filename#" variable="strCSV">
	<cfset excelData = CSVToQuery(CSV = strCSV.Trim()) />
	
	<cfoutput>
		<cfset routeIndex = 0>
		<cfloop query="excelData">						
			<cfset variables.IsRoute = false>
			
			<cfif (trim(COLUMN_2) NEQ "" OR trim(COLUMN_1) NEQ "" OR trim(COLUMN_3) NEQ "" OR trim(COLUMN_4) NEQ "" OR trim(COLUMN_5) NEQ "") AND (NOT findNoCase("name", trim(COLUMN_2)) OR NOT findNoCase("name", trim(COLUMN_1)))>				
				<cfset thisCOLUMN_1 = COLUMN_1>
				
				<cfif (trim(COLUMN_2) EQ "" AND trim(COLUMN_1) NEQ "" AND trim(COLUMN_3) EQ "" AND trim(COLUMN_4) EQ "" AND trim(COLUMN_5) EQ "") OR (trim(COLUMN_2) EQ trim(COLUMN_1) AND trim(COLUMN_3) EQ "" AND trim(COLUMN_4) EQ "" AND trim(COLUMN_5) EQ "")>
					<cfset routeIndex = routeIndex + 1>
					<cfset routeLetter = ListGetAt(alphabet, routeIndex)>
					<cfif FindNoCase("Route", COLUMN_1)>
						<cfset thisCOLUMN_1 = COLUMN_1 & " " & routeLetter>	
					<cfelseif NOT FindNoCase("Route", COLUMN_1)>
						<cfset thisCOLUMN_1 = COLUMN_1>
					<cfelse>
						<cfset thisCOLUMN_1 = COLUMN_1 & " " & routeLetter>
					</cfif>
					<cfset variables.IsRoute = true>					
				</cfif>
				
				<!--- Find the patient --->
				<cfset thisPatientID = "">
				<cfif trim(COLUMN_4) NEQ "">
					<cfquery name="getPatient" datasource="PaClient_1084">
						SELECT pic.RecordID, pic.PatientID, pic.InsuranceCompanyID, pic.PolicyHoldersFirstName, pic.PolicyHoldersLastName, pic.PolicyHoldersDOB, 
						pat.EntityID, ent.EntityID, ent.FName, ent.LName, ent.DOB
						FROM patientinsurancecompany as pic
						JOIN Patient as pat ON pic.PatientID = pat.PatientID
						JOIN Entity as ent ON pat.EntityID = ent.EntityID
						WHERE pic.PolicyNumber = '#trim(COLUMN_4)#'
					</cfquery>									
					
					<cfif getPatient.RecordCount GTE 1 AND trim(getPatient.PolicyHoldersDOB) EQ trim(getPatient.DOB)>
						<cfset thisPatientID = "#getPatient.PatientID[1]#">
					<cfelseif getPatient.RecordCount GTE 1 AND (NOT IsDate(trim(getPatient.PolicyHoldersDOB)) OR NOT IsDate(trim(getPatient.DOB)))>	
						<cfmail from="support@eobmanager.net" to="support@eobmanager.net" type="HTML" subject="NOT IS DATE DOB #trim(COLUMN_4)#">
							<cfdump var="#getPatient#">
						</cfmail>					
					<cfelseif getPatient.RecordCount GTE 1 AND trim(getPatient.PolicyHoldersDOB) NEQ trim(getPatient.DOB)>									
						<cfset picMonth = Month(getPatient.PolicyHoldersDOB)>
						<cfset picDay = Day(getPatient.PolicyHoldersDOB)>
						<cfset picYear = Year(getPatient.PolicyHoldersDOB)>
						<cfset entMonth = Month(getPatient.DOB)>						
						<cfset entDay = Day(getPatient.DOB)>
						<cfset entYear = Year(getPatient.DOB)>						
						<cfset DOBCount = 0>
						<cfif picMonth neq entMonth><cfset DOBCount = DOBCount + 1></cfif>
						<cfif picDay neq entDay><cfset DOBCount = DOBCount + 1></cfif>
						<cfif picYear neq entYear><cfset DOBCount = DOBCount + 1></cfif>
						<cfif DOBCount gte 2>
							<cfmail from="support@eobmanager.net" to="support@eobmanager.net" type="HTML" subject="dob3 #trim(COLUMN_4)#">
								<cfdump var="#getPatient#">
							</cfmail>	
						<cfelse>
							<cfset thisPatientID = "#getPatient.PatientID[1]#">
						</cfif>												
					</cfif>
					
				</cfif>
				
				<cfset variables.AddRow = true>
				<cfif trim(COLUMN_2) EQ "" AND trim(COLUMN_1) EQ "" AND trim(COLUMN_3) EQ "" AND trim(COLUMN_4) EQ "" AND NOT variables.IsRoute AND trim(thisPatientID) EQ "">
					<cfset variables.AddRow = false>
				</cfif>				
			
				<cfif variables.AddRow>
					<cfset newRow  = QueryAddRow(qFinal, 1)>	
					<cfset temp = QuerySetCell(qFinal, "A_ROUTE", "#trim(thisSheetName)#", qFinal.getRowcount())>
					<cfset temp = QuerySetCell(qFinal, "B_COLUMN_2", "#trim(COLUMN_2)#", qFinal.getRowcount())>
					<cfset temp = QuerySetCell(qFinal, "C_COLUMN_1", "#trim(thisCOLUMN_1)#", qFinal.getRowcount())>
					<cfset temp = QuerySetCell(qFinal, "D_COLUMN_3", "#trim(COLUMN_3)#", qFinal.getRowcount())>
					<cfset temp = QuerySetCell(qFinal, "E_COLUMN_4", "#trim(COLUMN_4)#", qFinal.getRowcount())>
					<cfset temp = QuerySetCell(qFinal, "F_COLUMN_5", "#trim(COLUMN_5)#", qFinal.getRowcount())>	
					<cfset temp = QuerySetCell(qFinal, "G_IsRoute", "#trim(variables.IsRoute)#", qFinal.getRowcount())>	
					<cfset temp = QuerySetCell(qFinal, "H_PatientID", "#trim(thisPatientID)#", qFinal.getRowcount())>
				</cfif>
					
			</cfif>		
		</cfloop>					
	</cfoutput>
	
	
</cfloop>





<cfquery name="createRouteTable" datasource="PAClient_1084">
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Route]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[Route]
</cfquery>

<cfquery name="createRouteTable2" datasource="PAClient_1084">	
	CREATE TABLE [dbo].[Route] (
		[RouteID] [int] IDENTITY (1001, 1) NOT NULL ,
		[UserID] [int] NULL ,	
		[Name] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,	
		[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
		[InactiveCode] [int] NULL ,
		[DateCreated] [datetime] NOT NULL ,
		[DateModified] [datetime] NULL 
	) ON [PRIMARY]
</cfquery>
<cfquery name="createRouteTable3" datasource="PAClient_1084">	
	ALTER TABLE [dbo].[Route] ADD 
		CONSTRAINT [DF_Route_Active] DEFAULT (1) FOR [Active],
		CONSTRAINT [DF_Route_DateCreated] DEFAULT (now()) FOR [DateCreated],
		CONSTRAINT [PK_Route] PRIMARY KEY  CLUSTERED 
		(
			[RouteID]
		) WITH  FILLFACTOR = 90  ON [PRIMARY] 

</cfquery>

<cfquery name="createRouteTable4" datasource="PAClient_1084">
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoutePatient]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[RoutePatient]
</cfquery>
<cfquery name="createRouteTable6" datasource="PAClient_1084">
	CREATE TABLE [dbo].[RoutePatient] (
		[RoutePatientID] [int] IDENTITY (1001, 1) NOT NULL ,
		[RouteID] [int] NOT NULL ,
		[SubRoute] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[PatientID] [int] NULL ,
		[FName] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[LName] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[City] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[IDtext] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[SuppliesText] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[Checked] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
		[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
		[InactiveCode] [int] NULL ,
		[DateCreated] [datetime] NOT NULL ,
		[DateModified] [datetime] NULL 
	) ON [PRIMARY]
</cfquery>
<cfquery name="createRouteTable5" datasource="PAClient_1084">
	ALTER TABLE [dbo].[RoutePatient] ADD 
		CONSTRAINT [DF_RoutePatient_Checked] DEFAULT (0) FOR [Checked],
		CONSTRAINT [DF_RoutePatient_Active] DEFAULT (1) FOR [Active],
		CONSTRAINT [DF_RoutePatient_DateCreated] DEFAULT (now()) FOR [DateCreated],
		CONSTRAINT [PK_RoutePatient] PRIMARY KEY  CLUSTERED 
		(
			[RoutePatientID]
		) WITH  FILLFACTOR = 90  ON [PRIMARY] 
</cfquery>

<!--- 
A_ROUTE 	B_COLUMN_2 		C_COLUMN_1 	D_COLUMN_3 		E_COLUMN_4 		F_COLUMN_5 		G_ISROUTE 	H_PATIENTID 
Bryan 12  	[empty string]  ROUTE A  	[empty string]  [empty string]  [empty string]  true  		[empty string]  
Bryan 12  	FRANKLIN  		Elbrich  	[CITY]  		[MCD]  			ss blue sheid?  false  		[empty string]   --->


<cfset variables.thisRoute = "">
<cfset variables.thisSubRoute = "">
<cfloop query="qFinal">
	<cfoutput>
		
		<cfif variables.thisRoute NEQ A_ROUTE>
			<cfset variables.thisSubRoute = "">
			<cfset variables.thisRoute = A_ROUTE>
			<cfquery name="insertRoute" datasource="PAClient_1084">
				INSERT INTO route (UserID, Name) VALUES(55, '#variables.thisRoute#');
				SELECT LAST_INSERT_ID() AS newRouteID
			</cfquery>
			<br><br><font color="red">#insertRoute.newRouteID# #variables.thisRoute#</font><br>
		</cfif>
		<cfif G_IsRoute>			
			<cfset variables.thisSubRoute = C_COLUMN_1><br><Br>
		</cfif>		
		<cfif NOT G_IsRoute>	
			<cfquery name="insertRoutePatient" datasource="PAClient_1084">
				INSERT INTO routePatient(RouteID, SubRoute, PatientID, FName, LName, City, IDtext, SuppliesText)
				VALUES(#insertRoute.newRouteID#, '#variables.thisSubRoute#', '#H_PatientID#', '#trim(B_COLUMN_2)#', '#trim(C_COLUMN_1)#', '#D_COLUMN_3#', '#E_COLUMN_4#', '#F_COLUMN_5#')
			</cfquery>						
			[#insertRoute.newRouteID#], [#variables.thisSubRoute#], [#H_PatientID#], [#D_COLUMN_3#], [#E_COLUMN_4#], [#LEFT(F_COLUMN_5, 5)#]<br>						
		</cfif>		
	
	</cfoutput>		
</cfloop>




<cffunction name="CSVToQuery" access="public" reeturntype="query" output="false" hint="Converts the given CSV string to a query.">
 
	<!--- Define arguments. --->
	<cfargument
		name="CSV"	type="string"	required="true"	hint="This is the CSV string that will be manipulated."	/>
 
	<cfargument name="Delimiter" type="string"	required="false" default="," hint="This is the delimiter that will separate the fields within the CSV value."/>
 	<cfargument name="Qualifier" type="string" required="false" default="""" hint="This is the qualifier that will wrap around fields that have special characters embeded."	/>
  
	<!--- Define the local scope. --->
	<cfset var LOCAL = StructNew() />
	<cfset ARGUMENTS.Delimiter = Left( ARGUMENTS.Delimiter, 1 ) />

	<cfif Len( ARGUMENTS.Qualifier )> 
		<cfset ARGUMENTS.Qualifier = Left( ARGUMENTS.Qualifier, 1 ) /> 
	</cfif>
	<cfset LOCAL.LineDelimiter = Chr( 10 ) />
	<cfset ARGUMENTS.CSV = ARGUMENTS.CSV.ReplaceAll("\r?\n", LOCAL.LineDelimiter	) />
	<cfset LOCAL.Delimiters = ARGUMENTS.CSV.ReplaceAll(	"[^\#ARGUMENTS.Delimiter#\#LOCAL.LineDelimiter#]+",	""	).ToCharArray()	/>
	<cfset ARGUMENTS.CSV = (" " & ARGUMENTS.CSV) />
 
	<!--- Now add the space to each field. --->
	<cfset ARGUMENTS.CSV = ARGUMENTS.CSV.ReplaceAll("([\#ARGUMENTS.Delimiter#\#LOCAL.LineDelimiter#]{1})",	"$1 "	) />
	<cfset LOCAL.Tokens = ARGUMENTS.CSV.Split("[\#ARGUMENTS.Delimiter#\#LOCAL.LineDelimiter#]{1}"	) />
	<cfset LOCAL.Rows = ArrayNew( 1 ) />
	<cfset ArrayAppend(LOCAL.Rows,	ArrayNew( 1 )) />
	<cfset LOCAL.RowIndex = 1 />
	<cfset LOCAL.IsInValue = false />
	<cfloop	index="LOCAL.TokenIndex" from="1" to="#ArrayLen( LOCAL.Tokens )#"	step="1"> 
		<cfset LOCAL.FieldIndex = ArrayLen(LOCAL.Rows[ LOCAL.RowIndex ]) />
		<cfset LOCAL.Token = LOCAL.Tokens[ LOCAL.TokenIndex ].ReplaceFirst(	"^.{1}",""	) />
		<cfif Len( ARGUMENTS.Qualifier )>
			<cfif LOCAL.IsInValue>
				<cfset LOCAL.Token = LOCAL.Token.ReplaceAll("\#ARGUMENTS.Qualifier#{2}", "{QUALIFIER}"	) />
				<cfset LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ] = (LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ] & LOCAL.Delimiters[ LOCAL.TokenIndex - 1 ] & LOCAL.Token	) />
				<cfif (Right( LOCAL.Token, 1 ) EQ ARGUMENTS.Qualifier)>
					<cfset LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ] = LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ].ReplaceFirst( ".{1}$", "" ) />
					<cfset LOCAL.IsInValue = false /> 
				</cfif>
			<cfelse>
				<cfif (Left( LOCAL.Token, 1 ) EQ ARGUMENTS.Qualifier)>
					<cfset LOCAL.Token = LOCAL.Token.ReplaceFirst(	"^.{1}",""	) /> 
					<cfset LOCAL.Token = LOCAL.Token.ReplaceAll("\#ARGUMENTS.Qualifier#{2}","{QUALIFIER}") /> 				
					<cfif (Right( LOCAL.Token, 1 ) EQ ARGUMENTS.Qualifier)>
						<cfset ArrayAppend(LOCAL.Rows[ LOCAL.RowIndex ],LOCAL.Token.ReplaceFirst(".{1}$","")) /> 
					<cfelse>
						<cfset LOCAL.IsInValue = true />
						<cfset ArrayAppend(LOCAL.Rows[ LOCAL.RowIndex ],LOCAL.Token) /> 
					</cfif>  
				<cfelse>
					<cfset ArrayAppend(LOCAL.Rows[ LOCAL.RowIndex ],LOCAL.Token) /> 
				</cfif> 
			</cfif>
			<cfset LOCAL.Rows[ LOCAL.RowIndex ][ ArrayLen( LOCAL.Rows[ LOCAL.RowIndex ] ) ] = Replace(LOCAL.Rows[ LOCAL.RowIndex ][ ArrayLen( LOCAL.Rows[ LOCAL.RowIndex ] ) ],"{QUALIFIER}",ARGUMENTS.Qualifier,"ALL") /> 
		<cfelse>
			<cfset ArrayAppend(	LOCAL.Rows[ LOCAL.RowIndex ],LOCAL.Token) /> 
		</cfif>
		<cfif ((NOT LOCAL.IsInValue) AND (LOCAL.TokenIndex LT ArrayLen( LOCAL.Tokens )) AND (LOCAL.Delimiters[ LOCAL.TokenIndex ] EQ LOCAL.LineDelimiter))>
			<cfset ArrayAppend(LOCAL.Rows,	ArrayNew( 1 )) />		
			<cfset LOCAL.RowIndex = (LOCAL.RowIndex + 1) /> 
		</cfif> 
	</cfloop>
	<cfset LOCAL.MaxFieldCount = 0 />
	<cfset LOCAL.EmptyArray = ArrayNew( 1 ) /> 
	<cfloop index="LOCAL.RowIndex" from="1" to="#ArrayLen( LOCAL.Rows )#" step="1"> 
		<!--- Get the max rows encountered so far. --->
		<cfset LOCAL.MaxFieldCount = Max(LOCAL.MaxFieldCount,ArrayLen(LOCAL.Rows[ LOCAL.RowIndex ])) />
		<cfset ArrayAppend(LOCAL.EmptyArray,"") /> 
	</cfloop>
	<cfset LOCAL.Query = QueryNew( "" ) />
	<cfloop index="LOCAL.FieldIndex" from="1" to="#LOCAL.MaxFieldCount#" step="1"> 
		<cfset QueryAddColumn(LOCAL.Query,"COLUMN_#LOCAL.FieldIndex#","CF_SQL_VARCHAR",LOCAL.EmptyArray) /> 
	</cfloop> 
	<cfloop index="LOCAL.RowIndex" from="1" to="#ArrayLen( LOCAL.Rows )#" step="1"> 
		<!--- Loop over the fields in this record. --->
		<cfloop index="LOCAL.FieldIndex" from="1" to="#ArrayLen( LOCAL.Rows[ LOCAL.RowIndex ] )#"	step="1">
			<cfset LOCAL.Query[ "COLUMN_#LOCAL.FieldIndex#" ][ LOCAL.RowIndex ] = JavaCast(	"string",LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ]	) /> 
		</cfloop> 
	</cfloop>
	<cfreturn LOCAL.Query /> 
</cffunction>





<cfabort>
 --->































































<!--- 






<cfset newPageName = "appVerificationCreate.cfm">
<cfset newPageTitle = "Verification Create">
<cfquery name="getPage" datasource="PA_MASTER">
	SELECT PageID, PageName
	FROM page
	WHERE PageName = '#trim(newPageName)#'
</cfquery>
<cfif getPage.RecordCount LTE 0>
	<cfquery name="insertPage" datasource="PA_MASTER">
		INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
		VALUES(1002, 1, '#trim(newPageName)#', '#trim(newPageTitle)#', 1, 'N', 'N', 'N',  'Y', 'Y', 1);
		SELECT LAST_INSERT_ID() AS newPageID 
	</cfquery>
	<cfset variables.newPageID = insertPage.newPageID>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 1, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 2, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 3, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 5, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 6, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 8, 1002, 1)</cfquery>
</cfif>



<cfset newPageName = "appVerificationView.cfm">
<cfset newPageTitle = "Verification View">
<cfquery name="getPage" datasource="PA_MASTER">
	SELECT PageID, PageName
	FROM page
	WHERE PageName = '#trim(newPageName)#'
</cfquery>
<cfif getPage.RecordCount LTE 0>
	<cfquery name="insertPage" datasource="PA_MASTER">
		INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
		VALUES(1002, 1, '#trim(newPageName)#', '#trim(newPageTitle)#', 1, 'N', 'N', 'N',  'Y', 'Y', 1);
		SELECT LAST_INSERT_ID() AS newPageID 
	</cfquery>
	<cfset variables.newPageID = insertPage.newPageID>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 1, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 2, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 3, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 5, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 6, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 8, 1002, 1)</cfquery>
</cfif>



<cfset newPageName = "appVerificationProcess.cfm">
<cfset newPageTitle = "Verification Process">
<cfquery name="getPage" datasource="PA_MASTER">
	SELECT PageID, PageName
	FROM page
	WHERE PageName = '#trim(newPageName)#'
</cfquery>
<cfif getPage.RecordCount LTE 0>
	<cfquery name="insertPage" datasource="PA_MASTER">
		INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
		VALUES(1002, 1, '#trim(newPageName)#', '#trim(newPageTitle)#', 1, 'N', 'N', 'N',  'Y', 'Y', 1);
		SELECT LAST_INSERT_ID() AS newPageID 
	</cfquery>
	<cfset variables.newPageID = insertPage.newPageID>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 1, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 2, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 3, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 5, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 6, 1002, 1)</cfquery>
	<cfquery name="insertPage" datasource="PA_MASTER">INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 8, 1002, 1)</cfquery>
</cfif>

<cfabort>		

 --->
























<!---<cfset ICnames = "PRIVATE PAY,BLUE CROSS AND BLUE SHIEL,NHIC,AARP,TEXAS HOMEHEALTH-CBA,ASSOCIATES HOME HEALTH,NEW ERA LIFE,AMERICAN CANCER SOCIETY,AETNA,MEMO,BLUE CROSS BLUE SHIELD,DANIEL JARVIS HOMEHEALTH,UNITED HEALTHCARE,SCOTT AND WHITE HEALTH,FIRST CARE,HERITAGE SELECT,BCBS,APRIA BRANCH 0042,MUTUAL OF OMAHA,HUMANA,CIGNA,CORAM RESOURCE NETWORK,HOSPICE OF BRAZOS VALLEY,AMERICAN PIONEER,TRICARE,SIERRA HEALTH LIFE,CHIP PLAN,AETNA-TRS CARE,SUPERIOR INSURANCE,GEHA,RISK MANAGEMENT,BANKERS LIFE AND CASUALTY,BLUE CROSS AND BLUE SHIELD,TRS CARE - AETNA,AETNA TRS CARE,UNICARE,BLUE CROSS & BLUE SHIELD,CHAMPUS/TRICARE,LIBERTY MUTUAL,CBA,COPC PROGRAM,PHYSICIANS MUTUAL,STERLING,HEALTHSMART,CORAM,TEXAS REHAB,CAREMARK,FIRST HEALTH,HEALTHCARE BENEFITS,TRI CARE FOR LIFE,AETNA HEALTH PLANS,CHiP,HERITAGE HEALTH PLANS,SCOTT AND WHITE,Superior,UNITED AMERICAN INSURANCE,CBA PROGRAM,CHEC,CHAMPUS CLAIMS,HEALTH FIRST ANCILLARY SE,MOSAIC,NEW ERA,PIONEER LIFE INS OF ILL,TEXAS HOME HEALTH,united health care,Blue Cross Blue Shield of Texas,BRYAN ISD GROUP BENEFITS,GREAT WEST LIFE,MAIL HANDLERS,NATIONAL FOUNDATION LIFE,TEXAS HOME HEALTH CBA,TRI-CARE SOUTH REGION,UNICARE TEXAS SR SELECT,UNITED TEACHERS ASSOC,ALLIANCE,BISD,BLUE CROSS ILLINOIS,CBA HUNTSVILLE/B BOWSER,CIGNA HEALTHCARE,MARTIN LUTHER HOMES,MEDIPLUS/HARTFORD,METRAHEALTH,PRINCIPAL FINANCIAL GROUP,Scott & White,STATE FARM,STERLING LIFE INSURANCE C,TEXAS HOMEHEALTH,TRICARE FOR LIFE,UNION BANKERS,APWUMED,BCBS OF TEXAS,BLUE CROSS OF MISSISSIPPI,CHAMPVA,CIDC,CONSECO,CONTINENTAL GENERAL INS,EMPLOYEE BENEFITS,GAURDIAN BENEFITS,HEALTH CHOICE OF OKLAHOMA,HEAVENLY ANGELS HOSPICE,HIGHMARK BCBS,MHMR,NATIONAL HEALTH ALLIANCE,NATIONAL HEALTH CARE ALL,PCA HEALTH PLAN OF TEXAS,PHILADELPHIA AMERICAN LIF,PRIVATE HEALTHCARE SYSTEM,PROVIDENT INSURANCE,PRUDENTIAL,PRUDENTIAL HEALTHCARE,PYRAMID,SECURE HORIZON,SECURITY LIFE INSURANCE,SOUTHERN FARM BUREAU,STANDARD LIFE,SUPERIOR HEALTH PLAN,TEXAS TRUE CHOICE,UNIVERSAL FIDELITY,USAA,VICTIMS OF CRIME,AAL,AETNA LIFE INSURANCE,AFLAC,AID ASSOC FOR LUTHERANS,AIG INSURANCE,ALLIANCE- CITY OF BRYAN,AMERICAN EXCHANGE,AMERICAN GENERAL LIFE,AMERICAN MEDICAL SECURITY,ANTHEM HEALTH AND LIFE,APRIA HEALTHCARE,ARCO AETNA,BANKERS COMMERICAL LIFE,BLUE CROSS BLUE SHEILD,BLUE CROSS BLUESHIELD,BLUE CROSS OF CALIFORNIA,BLUE CROSS OF MINNESOTA,BLUE CROSS/BLUE SHIELD,BLUE CROSS/HI-MARK,Care Improvement Plus,CHAMPUS CLAIMS PGBA,CHRISTIAN FIDELITY,CNA,CONNECTICUT GENERAL,CONSECO HEALTH INSURANCE,CONTINENTAL LIFE INSURANC,CRAWFORD AND COMPANY,CRUM AND FORSTER,DANIEL JARVIS,EQUITABLE LIFE & CASUALTY,FRA INSURANCE PLANS,GALLAGHER BASSETT,GENERAL AMERICAN,GILSBAR INC,GOLDEN RULE INSURANCE,great west,GREAT WEST HEALTHCARE,HARTFORD INSURANCE,HEALTH ADMIN SERVICE,HEALTHNET FEDERAL SERVICE,HIGH MARK SERVICES,HMO BLUE,HOMELINK,JOHN HANCOCK,LIFE INSURANCE CO OF GA,LOYAL AMERICAN,MAGGIE LASKOWSKI,MET LIFE INSURANCE,METROPOLITAN LIFE,na,nONE,OLYMPIC HEALTH MANAGEMENT,OLYMPIC HERITAGE,ONE HEALTH PLAN,PACIFICARE,PAULA INSURANCE,REBECCA REVELL,Sierra Health & Life,STATESMEN NATIONAL LIFE,SUPERIOR CHIP,Superior/CHIP,THE HOSPICE,TRI-CARE INSURANCE,TRINITY UNIVERSAL OF KANS,UNION PACIFIC RAILROAD,UNITED AMERICAN,UNITED HEALTHCARE/TERMINA,UNITED PAYORS &PROVIDERS">

<!---<cfset ICnames = "UNITED HEALTHCARE/TERMINA,UNITED PAYORS &PROVIDERS">--->
 
<cfloop list="#ICnames#" index="thisName">
	<cfset thisIDToSet = ""> 
	<cfoutput>
				
		<cfquery name="getThisIns" datasource="PAClient_1084">
			SELECT InsuranceCompanyID, InsuranceCompanyName 
			FROM insurancecompany 
			WHERE insuranceCompanyName LIKE '#trim(thisName)#' 		
			ORDER BY InsuranceCompanyID 	
		</cfquery>
		
		<cfset valueListgetThisInsInsuranceCompanyIDs = valueList(getThisIns.InsuranceCompanyID)>
		
		<cfloop list="#valueListgetThisInsInsuranceCompanyIDs#" index="thisICID">	
		
			<cfquery name="searchForAddress" datasource="PAClient_1084">
				SELECT ic.InsuranceCompanyID, ic.InsuranceCompanyName, ic.EntityID
				FROM insurancecompany ic 
				INNER JOIN entityaddress ea ON ic.EntityID = ea.EntityID
				WHERE ic.InsuranceCompanyID = #thisICID#
			</cfquery>	
			
			<cfif searchForAddress.RecordCount GTE 1>
				<cfset thisIDToSet = thisICID>
				<cfbreak>
			</cfif>		
		
		</cfloop>
		
		<cfif NOT isNumeric(thisIDToSet)>	
			<cfset thisIDToSet = getThisIns.InsuranceCompanyID[1]>
		</cfif>
		
		<cfquery name="tempDeActiveInsuranceCompany" datasource="PAClient_1084">
			UPDATE insurancecompany
			SET Active = 0
			WHERE InsuranceCompanyID IN(#valueListgetThisInsInsuranceCompanyIDs#)
		</cfquery>	
		
		<cfquery name="tempActiveInsuranceCompany" datasource="PAClient_1084">
			UPDATE insurancecompany
			SET Active = 1		
			WHERE InsuranceCompanyID = #thisIDToSet#
		</cfquery>	
		<cfquery name="tempPatientInsuranceCompany" datasource="PAClient_1084">
			UPDATE patientinsurancecompany
			SET InsuranceCompanyID = #thisIDToSet#
			WHERE InsuranceCompanyID IN(#valueListgetThisInsInsuranceCompanyIDs#)
		</cfquery>		
		
		*****************************#thisName# [#getThisIns.recordcount#]: #thisIDToSet#**********************<br>
		
	</cfoutput>
</cfloop>--->





























<cfabort>



<!---<cfset pageList = "wsAddress.cfc,wsDXdescription.cfc,wsEmailAddress.cfc,wsEntity.cfc,wsEOB.cfc,wsHCPCdescription.cfc,wsIMChat.cfc,wsInsuranceCompany.cfc,wsIntake.cfc,wsPatient.cfc,wsPatientInsuranceCompany.cfc,wsPhone.cfc,wsQuote.cfc,wsState.cfc,wsUser.cfc,wsVerification.cfc">

<cfloop list="#pageList#" index="newPageName">

	<cfquery name="getPage" datasource="PA_MASTER">
		SELECT PageID, PageName
		FROM page
		WHERE PageName = '#trim(newPageName)#'
	</cfquery>

	<cfif getPage.RecordCount LTE 0>
	
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
			VALUES(1002, 1, '#trim(newPageName)#', 'Web Service #trim(newPageName)#', 1, 'N', 'N', 'N',  'N', 'N', 1);
			SELECT LAST_INSERT_ID() AS newPageID 
		</cfquery>
		<cfset variables.newPageID = insertPage.newPageID>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 1, 1002, 1)	
		</cfquery>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 2, 1002, 1)	
		</cfquery>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 3, 1002, 1)	
		</cfquery>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 4, 1002, 1)	
		</cfquery>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 5, 1002, 1)	
		</cfquery>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 6, 1002, 1)	
		</cfquery>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 7, 1002, 1)	
		</cfquery>
		<cfquery name="insertPage" datasource="PA_MASTER">
			INSERT INTO PageRole(PageID, RoleID, SiteID, Active) VALUES(#variables.newPageID#, 8, 1002, 1)	
		</cfquery>
	
	</cfif>

</cfloop>--->





<cfabort>











<!------- support@eobmanager.net:eobmanagernet@smtpout.secureserver.net --->

<!--- <cfmail to="4692298834@fax.local.net" server="192.168.0.100" port="25" subject="Test send fax" from="gcruz@eobmanager.net" type="text" mimeattach="C:\EOBManager\paFMS\1084\temp\QuotePrintVariable_1084_052709045319_1397.pdf">
	This is a test.
</cfmail> 

<cfmail to="9793144190@fax.local.net" server="192.168.0.100" port="25" subject="Test send fax" from="gcruz@eobmanager.net" type="text" mimeattach="C:\EOBManager\paFMS\1084\temp\QuotePrintVariable_1084_052709045319_1397.pdf">
	This is a test.
</cfmail>  --->

<!---<cf_ei_1002_InsertUpdateFinalFeeSchedule_2008_A testmode="no">
<cf_ei_1002_InsertUpdateFinalFeeSchedule_2008_B testmode="no">--->

<!---<cf_ei_1002_InsertUpdateFinalFeeSchedule_2008_C testmode="no">
<cf_ei_1002_InsertUpdateFinalFeeSchedule_2008_D testmode="no">--->

<!---<cf_ei_1002_InsertUpdateFinalFeeSchedule_2009_A testmode="no">
<cf_ei_1002_InsertUpdateFinalFeeSchedule_2009_B testmode="no">--->

<cfexit>




<!---<cf_gcCreateDatabaseTableCFCFileActive
	tablename="Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT"
	ds="PAClient_1084">


<cfquery name="delFiles" datasource="PAClient_1084">
	DELETE FROM file
	where datecreated >= '2009-05-01'

	DELETE FROM interchange
	where datecreated >= '2009-05-01'

	DELETE FROM claim
	where datecreated >= '2009-05-01'

	DELETE FROM patient
	where datecreated >= '2009-05-01'

	DELETE FROM entity
	where datecreated >= '2009-05-01'

	DELETE FROM claim_processxmltodb
	where datecreated >= '2009-05-01'
</cfquery>


<cfset DELFILEERN = "C:\EOBManager\paFMS\1084\2009\5\25\1\835_2009097_9664.ERN">
<cfset DELFILEXML = "C:\EOBManager\paFMS\1084\2009\5\25\1\835_2009097_9664.XML">

<cfif fileExists("#DELFILEERN#")>
	<cffile action="DELETE" file="#DELFILEERN#">
</cfif>
<cfif fileExists("#DELFILEXML#")>
	<cffile action="DELETE" file="#DELFILEXML#">
</cfif>--->



<!---<cf_gcCreateDatabaseTableCFCFileBean
	tablename="Entity"
	ds="PAClient_1084">

<cf_gcCreateDatabaseTableCFCFileDAO
	tablename="Entity"
	ds="PAClient_1084">


<cf_gcCreateDatabaseTableCFCFileBean
	tablename="Patient"
	ds="PAClient_1084">

<cf_gcCreateDatabaseTableCFCFileDAO
	tablename="Patient"
	ds="PAClient_1084">--->

<!--- <cfscript>
	variables.stPatient = structNew();
	variables.stPatient.PatientID = 70853;
</cfscript>
<cfset objPatientBean = createObject("component", "PatientBean").init("PAClient_1084", variables.stPatient)><!------>

<cfoutput>
	[#objPatientBean.getPatientID()# : #objPatientBean.getAccountNumber()# : #objPatientBean.getEntity().getFNAme()#]
</cfoutput>

<cfset objPatientBean.setAccountNumber("PrivPAy")>

<cfset objPatientBean.save()>

<cfoutput>
	[#objPatientBean.getPatientID()# : #objPatientBean.getAccountNumber()#]
</cfoutput>


<cfset objPatientBean.setAccountNumber("THUSUP")> --->

<!---<cfset objPatientBean.save()>--->


<!---<cfset thisPatient = objPatientDAO.read(70853)>
<cfdump var="[#thisPatient.getAccountNumber()#]">
<cfset thisPatient.setAccountNumber("Guiller")>
<cfset objPatientDAO.update(thisPatient)>
<cfoutput>[#thisPatient.getAccountNumber()#]</cfoutput>

<cfset thisPatient.setPatientID(0)>
<cfset thisPatient.setAccountNumber("99PRIVATEPAY00")>
<cfset objPatientDAO.create(thisPatient)>
<cfoutput>[#thisPatient.getPatientID()#]</cfoutput>

<cfset objPatientDAO.delete(thisPatient)>


<cfdump var="#thisPatient#">--->

<cfabort>


<!---
<cfset addCollection = createObject("component", "AddressCollection")>
<cfset add1 = createObject("component", "Address_object")>
<cfset add2 = createObject("component", "Address_object")>
<cfset add3 = createObject("component", "Address_object")>
<cfscript>
	variables.stAdd = structNew();
	variables.stAdd.AddressTypeID = "13";
	variables.stAdd.Attention = "Joe Blow";
	variables.stAdd.AddressLine1 = "1009 Campbell Drive";
	variables.stAdd.AddressLine2 = "Suite 100";
	variables.stAdd.City = "McKinney";
	variables.stAdd.StateID = 56;
	variables.stAdd.ZipCode = "75071-7419";
	variables.stAdd.CountryID = 12;
</cfscript>
<cfset add1.init(argumentCollection=variables.stAdd)>
<cfset addCollection.add(add1)>
<cfscript>
	variables.stAdd = structNew();
	variables.stAdd.AddressTypeID = "13";
	variables.stAdd.Attention = "Henry Smoke";
	variables.stAdd.AddressLine1 = "10495 Freedon Way";
	variables.stAdd.AddressLine2 = "Suite 200";
	variables.stAdd.City = "Los Angeles";
	variables.stAdd.StateID = 13;
	variables.stAdd.ZipCode = "90601-4159";
	variables.stAdd.CountryID = 12;
</cfscript>
<cfset add2.init(argumentCollection=variables.stAdd)>
<cfset addCollection.add(add2)>
<cfscript>
	variables.stAdd = structNew();
	variables.stAdd.AddressTypeID = "13";
	variables.stAdd.Attention = "Jenny Black";
	variables.stAdd.AddressLine1 = "55 Friends Way";
	variables.stAdd.AddressLine2 = "Suite 300";
	variables.stAdd.City = "Jackson";
	variables.stAdd.StateID = 42;
	variables.stAdd.ZipCode = "85214";
	variables.stAdd.CountryID = 12;
</cfscript>
<cfset add3.init(argumentCollection=variables.stAdd)>
<cfset addCollection.add(add3)>

<cfset thisPatient = createObject("component", "Patient_object")>
<cfscript>
	variables.stPatient = structNew();
	variables.stPatient.ClaimSubmitterIdentifier = 'ER852221';
	variables.stPatient.NM1IdentificationCode9 = 'ABC';
	variables.stPatient.AccountNumber = '456';
	variables.stPatient.Active = 1;
	variables.stPatient.PrefixName = "Mr";
	variables.stPatient.Fname = "John";
	variables.stPatient.Mname = "M";
	variables.stPatient.Lname = "Foster";
	variables.stPatient.SuffixName = "Jr";
	variables.stPatient.DOB = "10/02/1972";
	variables.stPatient.Sex = 1;
	variables.stPatient.SSN = "612-16-5211";
	variables.stPatient.MaritalStatus = 1;
	variables.stPatient.EmployerID = 1112;
	variables.stPatient.Languages = "1,2";
	variables.stPatient.Weight = 167;
	variables.stPatient.HeightInInches = 66;
	variables.stPatient.colAddress = addCollection;
</cfscript>

<cfset thisPatient.init(argumentCollection=variables.stPatient)>

<cfoutput>#thisPatient.getColAddress().getAt(2).getCity()#</cfoutput>

<cfset thisPatient.dump(abort: true)>--->












<!---<cffile action="DELETE" file="C:\EOBManager\paFMS\1084\2009\5\5\1\835_2009097_9664.ERN">
<cffile action="DELETE" file="C:\EOBManager\paFMS\1084\2009\5\5\1\835_2009097_9664.XML">

<cfquery name="delFiles" datasource="PAClient_1084">
	DELETE FROM file
	where datecreated >= '2009-05-04'

	DELETE FROM interchange
	where datecreated >= '2009-05-04'

	DELETE FROM claim
	where datecreated >= '2009-05-04'

	DELETE FROM patient
	where datecreated >= '2009-05-04'

	DELETE FROM entity
	where datecreated >= '2009-05-04'
</cfquery>--->




<cfabort>



<!---<cfset HealthCareClaimPaymentAdvice835 = CreateObject("component", "com.common.HealthCareClaimPaymentAdvice835")>
<cfset XMLfileContent = HealthCareClaimPaymentAdvice835.Process835ToXMLConvert(fileID: '100', directorypath: 'C:\Temp', filename: 'ERN00482_033007_Test100', fileextension: 'ERN')>
<cfdump var="#XMLfileContent#">		--->




<!---
<cfset HealthCareClaimPaymentAdvice835 = CreateObject("component", "com.common.HealthCareClaimPaymentAdvice835")>
<cfset XMLfileContent = HealthCareClaimPaymentAdvice835.Process835ToXMLConvert(fileID: '100', directorypath: 'C:\Temp', filename: 'ERN00482_033007_Test31', fileextension: 'ERN')>
<cfset interchange835 = XMLParse(XMLfileContent)>
<cfset N1s = XMLSearch(interchange835, "/isa/gs/st[1]/n1")>
<cfdump var="#N1s#">--->
























<!---<cfquery name="getAllTables" datasource="mysql_pa_master">
	SELECT * FROM information_schema.SCHEMATA
</cfquery>

<cfdump var="#getAllTables#">--->

<!---<cf_gcUtilityReloadTableCFCs>--->
<!---<cf_gcCreateDatabaseTableCFCFileBean
	tablename="Address"
	ds="PAClient_1084">
<cf_gcCreateDatabaseTableCFCFileDAO
	tablename="Address"
	ds="PAClient_1084">
<cf_gcCreateDatabaseTableCFCFileGateway
	tablename="Address"
	ds="PAClient_1084">--->
<!---<cf_gcCreateDatabaseTableCFCFileActive
	tablename="Client"
	ds="PA_MASTER">
--->


<!---<cfset qUsers = createObject("component", "addressGateway").getAllAsQuery('PAClient_1084')>
<table border="1" cellpadding="4" cellspacing="4">
	<tr bgcolor="aqua">
		<th>User</th>
		<th>Actions</th>
	</tr>
	<cfoutput query="qUsers">
		<tr>
			<td>#qUsers.AddressLine1#</td>
			<td>
				<a href="userform.cfm?user_id=#qUsers.Addressid#">Update</a>
				<a href="userdelete.cfm?user_id=#qUsers.AddressLine1#">Delete</a>
			</td>
		</tr>
	</cfoutput>
</table>--->

<!---
<cfset addressID = 36159>


<cfif IsDefined("form.addressID")>
	<cfset addressID = form.addressID>
</cfif>

<cfset addressComp = createObject("component", "addressGateway")>
<cfset address = addressComp.getByID('PAClient_1084', addressID)>


<cfif IsDefined("form.addressID")>
	<cfset address2 = createObject("component", "AddressBean").init(ds: 'PAClient_1084', stValues: form)>
	<cfset addressComp.save('PAClient_1084', address2)>
	<cflocation url="appTestPage2.cfm" addtoken="No">
</cfif>

<cfoutput>
<cfform>
	<table cellpadding="4" cellspacing="4">
		<tr>
			<td class="label">Address ID:</td>
			<td>#address.getAddressid()#</td></tr>
		<tr>
			<td class="label">SiteID</td>
			<td><cfinput name="SiteID" type="text" value="#address.getSiteID()#"></td>
		</tr>
		<tr>
			<td class="label">AddressTypeID</td>
			<td><cfinput name="AddressTypeID" type="text" value="#address.getAddressTypeID()#"></td>
		</tr>
		<tr>
			<td class="label">Attention</td>
			<td><cfinput name="Attention" type="text" value="#address.getAttention()#"></td>
		</tr>
		<tr>
			<td class="label">AddressLine1</td>
			<td><cfinput name="AddressLine1" type="text" value="#address.getAddressLine1()#"></td>
		</tr>
		<tr>
			<td class="label">AddressLine2</td>
			<td><cfinput name="AddressLine2" type="text" value="#address.getAddressLine2()#"></td>
		</tr>
		<tr>
			<td class="label">City</td>
			<td><cfinput name="City" type="text" value="#address.getCity()#"></td>
		</tr>
		<tr>
			<td class="label">StateID</td>
			<td><cfinput name="StateID" type="text" value="#address.getStateID()#"></td>
		</tr>
		<tr>
			<td class="label">ZipCode</td>
			<td><cfinput name="ZipCode" type="text" value="#address.getZipCode()#"></td>
		</tr>
		<tr>
			<td class="label">CountryID</td>
			<td><cfinput name="CountryID" type="text" value="#address.getCountryID()#"></td>
		</tr>
		<!---<tr>
			<td class="label">Active</td>
			<td><cfinput name="Active" type="text" value="#address.getActive()#"></td>
		</tr>--->
		<tr>
			<td class="label">InactiveCode</td>
			<td><cfinput name="InactiveCode" type="text" value="#address.getInactiveCode()#"></td>
		</tr>
		<tr>
			<td class="label">DateCreated</td>
			<td>#address.getDateCreated()#</td>
		</tr>
		<tr>
			<td class="label">DateModified</td>
			<td>#address.getDateModified()#</td>
		</tr>
	</table>
	<cfinput name="addressID" type="hidden" value="#address.getAddressid()#">
	<cfinput name="submit" type="submit" value="Save">
</cfform>
</cfoutput>



--->





<!---
<cfloop list="SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
	<cfset thisIteration = "address2.get#trim(currentVar)#()">
	<cfoutput>[#evaluate(thisIteration)#]<br></cfoutput>
</cfloop>
--->
<cfabort>



















<!--- 




<style>
	body{
		padding: 0;
		margin: 0;
		background-color: white;
	}
	#outerDiv{
		/*background-color: silver;*/
		border: 2px solid #C8CDD2;
		width: 400px;
		margin: 10px;
	}

	#outerDiv dl{
		float: left;
		margin: 10px 20px;
		padding: 0;
		background-color: white;
		/*border: 1px dotted blue;*/
	}
	#outerDiv dt{
		float: right;
		width: 166px;
		margin: 0;
		padding: 0;
		font-size: 100%;
		letter-spacing: 1px;
		color: #627081;
		text-align: left;
		/*border: 1px dashed red;*/
	}
	#outerDiv dd{

		margin: 0 0 0 98px;
		padding: 0;
		font-size: 75%;
		line-height: 1.5em;
		color: #666;
		text-align: left;
		/*border: 1px dashed blue;*/
	}
	#outerDiv dl dd.img{
		margin: 0;
	}
	#outerDiv dd.img img{
		float: left;
		margin: 0 8px 0 0;
		padding 4px;
		border: 1px solid #D9E0E6;
		border-bottom-color: #C8CDD2;
		border-right-color: #C8CDD2;
		background: #fff;
	}
	#outerDiv .alt dt{
		float: left;
	}
	#outerDiv .alt dd.img img{
		float: right;
		margin: 0 0 0 8px;
	}
	#outerDiv .alt dd{
		margin: 0 98px 0 0;
	}
</style>


<div id="outerDiv">
	<dl>
		<dt>Black Bookcase</dt>
		<dd class="img"><img src="images/temp_BlackBookcase.jpg" width="80" height="80"></dd>
		<dd>This furniture must be secured to the wall with the enclosed anti-topple device. Different wall materials require different types of fasteners. Use fasteners suitable for the walls in your home (not included).</dd>
	</dl>
	<dl class="alt">
		<dt>Coffee Table</dt>
		<dd class="img"><img src="images/temp_CoffeeTable.jpg" width="80" height="80"></dd>
		<dd>Solid wood; a durable natural material.</dd>
	</dl>
	<dl>
		<dt>Large Sofa</dt>
		<dd class="img"><img src="images/temp_BlackSofa.jpg" width="80" height="80"></dd>
		<dd>Seat cushions filled with waterfowl feathers and high resilient polyurethane foam mold to your body and regain their shape when you rise - equally comfortable day after day.</dd>
	</dl>
</div>


 --->




<!---
/*background: #ff0000 url(images/z_bottom_left.gif) no-repeat bottom left;		*/
--->



































<!---
<cf_gcCreateDatabaseTableCFCFile
		tablename="tempTable"
		ds="PAClient_1084">

--->












































<!---
<cfset lineCount = 0>
<cfloop index="i" list="#trim(fileContents)#" delimiters="~">
	<cfset lineCount = lineCount + 1>
	<cfif lineCount EQ 1>
		<cfset elementDelimeter = mid(i, 4, 1)>
		<cfbreak />
	</cfif>
</cfloop>


<cfset isaList = "AuthorizationInformationQualifier,AuthorizationInformation,SecurityInformationQualifier,SecurityInformation,InterchangeIDQualifier,InterchangeSenderID,InterchangeIDQualifier,InterchangeReceiverID,InterchangeDate,InterchangeTime,InterchangeControlStandardsIdentifier,InterchangeControlVersionNumber,InterchangeControlNumber,AcknowledgmentRequested,UsageIndicator,ComponentElementSeparator">
<cfset isaListCount = 1>
<cfloop list="#trim(isaList)#" index="isa_i">
	<cfset "#trim(isa_i)#" = listGetAt(i, isaListCount, trim(elementDelimeter))>
	<cfset isaListCount = isaListCount + 1>
	<cfset xmlString = xmlString & "<#trim(isa_i)#>#trim(evaluate(isa_i))#</#trim(isa_i)#>">
</cfloop>
<cfoutput><br><br><br>xmlString: #trim(xmlString)#<br><br><br></cfoutput>
--->


<!---
<cfset lineCount = 0>
<cfloop index="i" list="#trim(parseString)#" delimiters="~">
	<cfset lineCount = lineCount + 1>
	<cfoutput>[#lineCount#] #i#<br><br></cfoutput>
	<cfset thisStr = "">
	<cfif len(trim(i)) GT 0>

		<cfset FieldNo = -1>

		<!--- NOTE: must be used twice --->
		<cfset i = ReReplace(i, "\*{2}", "*{NULL}*", "all")>
		<cfset i = ReReplace(i, "\*{2}", "*{NULL}*", "all")>

		<cfloop index="Field" list="#trim(i)#" delimiters="*">
		<cfset FieldNo=#FieldNo#+1>
			<cfif FieldNo is 0>
				<!--- FieldNo 0 is the label for the record type --->
				<cfset RecType=trim(Field)>
				<cfif len(RecType)>
				<!--- In real life, you'd do a lookup here to get the record layout --->
				<cfset thisStr=thisStr&"RecType: #Field#">
				<cfelse>
				<cfset thisStr=thisStr&"RecType: {EMPTY}">
				</cfif>
			<cfelse>
				<!--- Subsequent fields are really fields --->
				<!--- In real life, you'd look up this field number for this record type --->
				<cfset Field=trim(Field)>
				<cfif len(Field)>
					<cfset thisStr=thisStr&"<XML_FieldNo_#FieldNo#>#Field#</XML_FieldNo_#FieldNo#>">
				<cfelse>
					<cfset thisStr=thisStr&", FieldNo_#FieldNo#: {EMPTY}">
				</cfif>
			</cfif>
		</cfloop>
	</cfif>

	<cfoutput>#thisStr#</cfoutput><br>

</cfloop>--->





































<!---
<cfinvoke
	component="ws.wsEntity"
	method="wsGetEntityAddPhoXML"
	data1="1084"
	data2="139244"
	returnvariable="str">





  <cfdump var="#str#">
  --->







































<!---
<cf_gcBorderedTableDynamic tableWidth="706" title="Search&nbsp;Patients">
	<form name="formName">
		<table align="left" cellpadding="5" cellspacing="0" border="0">
			<tr>
				<td valign="top">DOB:</td>
			</tr>
		</table>
	</form>
</cf_gcBorderedTableDynamic>

<br><br>



<cf_gcBorderedTableDynamic tableWidth="706" title="Search&nbsp;Patients">
	<form name="formName2">
		<table align="left" cellpadding="5" cellspacing="0" border="0">
			<tr>
				<td valign="top">DOB:</td>
			</tr>
		</table>
	</form>
</cf_gcBorderedTableDynamic>




--->



























<!--- You cant do a LIKE search on Data that is encrypted

<cfsetting requestTimeOut = "900">

<cfquery name="getIDs" datasource="PAClient_1084">
	SELECT EntityID, SSN
	FROM entity
	WHERE SSN IS NOT NULL AND LEN(SSN) < 20
</cfquery>

<cfloop query="getIDs">

	<cfif IsNumeric(trim(SSN)) AND LEN(trim(SSN)) EQ 9 AND NOT findnocase("0000", trim(SSN))>
		<cfset SSN2 = REQUEST.formatSSN(trim(SSN))>
		<cfset SSNE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(SSN2)) />
		<cfquery name="updateChanged" datasource="PAClient_1084">
			UPDATE entity
			SET SSN = '#trim(SSNE)#'
			WHERE EntityID = #trim(EntityID)#
		</cfquery>
		<!---<cfset SSND = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(SSNE)) />
		<cfoutput><font color="red">#trim(SSN2)# : #trim(SSNE)# [<cfif SSN2 eq SSND>MATCHED<cfelse>NOT</cfif>]</font><br></cfoutput>			--->
	<cfelseif NOT findnocase("-", trim(SSN))>
		<cfquery name="updateNull" datasource="PAClient_1084">
			UPDATE entity
			SET SSN = NULL
			WHERE EntityID = #trim(EntityID)#
		</cfquery>
	<cfelse>
		<cfset SSNE = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(SSN)) />
		<cfquery name="updateRecord" datasource="PAClient_1084">
			UPDATE entity
			SET SSN = '#trim(SSNE)#'
			WHERE EntityID = #trim(EntityID)#
		</cfquery>
		<!---<cfoutput><font color="black">#trim(SSN)# : #trim(SSNE)#</font><br></cfoutput>		--->
	</cfif>

</cfloop>


<cfoutput>[#getIDs.RecordCount#]</cfoutput>

648-12-2984 : 54A206D8EDBAD4B8F5E099123054151B
--->

<!---<cfquery name="getRolePageIDs" datasource="pa_master">
	SELECT DISTINCT PageID
	FROM pagerole WHERE RoleID = 4
</cfquery>
<cfoutput>
	<cfloop query="getRolePageIDs">
		<cfquery name="getThisRole" datasource="pa_master">
			SELECT * FROM pagerole WHERE PageID = #pageID# AND RoleID = 7
		</cfquery>
		<cfif getThisRole.RecordCount LT 1>
			<cfquery name="insertThisRole" datasource="pa_master">
				INSERT INTO PageRole(PageID, RoleID, SiteID)
				VALUES(#pageID#, 7, 1002)
			</cfquery>
			Added #PageID#<br>
		</cfif>
	</cfloop>
</cfoutput>
<cfquery name="getRolePageIDs" datasource="pa_master">
	SELECT DISTINCT PageID
	FROM pagerole WHERE RoleID = 3
</cfquery>
<cfoutput>
	<cfloop query="getRolePageIDs">
		<cfquery name="getThisRole" datasource="pa_master">
			SELECT * FROM pagerole WHERE PageID = #pageID# AND RoleID = 6
		</cfquery>
		<cfif getThisRole.RecordCount LT 1>
			<cfquery name="insertThisRole" datasource="pa_master">
				INSERT INTO PageRole(PageID, RoleID, SiteID)
				VALUES(#pageID#, 6, 1002)
			</cfquery>
			Added #PageID#<br>
		</cfif>
	</cfloop>
</cfoutput>
<cfquery name="getRolePageIDs" datasource="pa_master">
	SELECT DISTINCT PageID
	FROM pagerole WHERE RoleID = 2
</cfquery>
<cfoutput>
	<cfloop query="getRolePageIDs">
		<cfquery name="getThisRole" datasource="pa_master">
			SELECT * FROM pagerole WHERE PageID = #pageID# AND RoleID = 5
		</cfquery>
		<cfif getThisRole.RecordCount LT 1>
			<cfquery name="insertThisRole" datasource="pa_master">
				INSERT INTO PageRole(PageID, RoleID, SiteID)
				VALUES(#pageID#, 5, 1002)
			</cfquery>
			Added #PageID#<br>
		</cfif>
	</cfloop>
</cfoutput>


--->







<!---
Add missing pageids into page roles for roles 1 and 8
<cfquery name="getPageIDs" datasource="pa_master">
	SELECT DISTINCT PAGEID
	FROM page
	WHERE PageID NOT IN(SELECT DISTINCT PAGEID FROM pagerole WHERE ROLEID IN(1,8))
</cfquery>

<cfset pageids = valuelist(getPageIDs.PAGEID)>

<cfloop list="#trim(pageIDs)#" index="i">

	<cfquery name="insert1" datasource="pa_master">
		INSERT INTO PageROLE(PageID, RoleID, SiteID)
		VALUES(#trim(i)#, 1, 1002)
	</cfquery>

	<cfquery name="insert1" datasource="pa_master">
		INSERT INTO PageROLE(PageID, RoleID, SiteID)
		VALUES(#trim(i)#, 8, 1002)
	</cfquery>

</cfloop>
--->












































<!---<cfinclude template="appClaimMyDisplay.cfm">--->





<!---<cf_ei_1002_InsertUpdateMedicareProcedure2008Codes testmode="no">--->
















<!---
<table border="0" cellpadding="0" cellspacing="0">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>

			<cf_gcBorderedTableNew titlesize="2"  title="Company Information" tableWidth="100%">

				<table border="0" cellpadding="1" cellspacing="0">
					<tr>
						<td class="SiteRequiredLabel">
							Name:&nbsp;
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="clientName" value="trim(getClientInformation.ClientName)" size="35" maxlength="80">
						</td>
					</tr>
					<tr>
						<td class="SiteLabel">
							DBA:&nbsp;
						</td>
						<td>
							<input type="Text" class="SiteTextbox" name="clientDBA" value="trim(getClientInformation.ClientDBA)" size="35" maxlength="80">
						</td>
					</tr>
				</table>

			</cf_gcBorderedTableNew>

		</td>
	</tr>

</table>

--->

























































<!---

<!--- Change List --->
<cfquery name="updNew" datasource="PA_MASTER">
	UPDATE standardlist
	SET ListName = 'Relationship'
	WHERE StandardListID = 22
</cfquery>
<!---
Self
Spouse
Child
Other
--->
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('None', 22)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('Friend', 22)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('Parent', 22)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('Grandparent', 22)
</cfquery>












<!--- New List --->
<cfquery name="insNew" datasource="PA_MASTER">
	INSERT INTO StandardList(ListName) VALUES('Payer Level');
	SELECT LAST_INSERT_ID() AS StandardListID 
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('1st', 'Primary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('2nd', 'Secondary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('3rd', 'Tertiary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('4th', 'Quaternary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('5th', 'Quinary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('6th', 'Senary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('7th', 'Septenary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('8th', 'Octonary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('9th', 'Nonary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('10th', 'Denary', #trim(insNew.StandardListID)#)
</cfquery>








<!--- New List --->
<cfquery name="insNew" datasource="PA_MASTER">
	INSERT INTO StandardList(ListName) VALUES('Employment Status');
	SELECT LAST_INSERT_ID() AS StandardListID 
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('None', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('Unemployed', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('Employed', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('Full-Time Student', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ItemNameDisplay, ListID) VALUES('Part-Time Student', #trim(insNew.StandardListID)#)
</cfquery>








<!--- New List --->
<cfquery name="insNew" datasource="PA_MASTER">
	INSERT INTO StandardList(ListName) VALUES('Claim Code');
	SELECT LAST_INSERT_ID() AS StandardListID 
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('09', 'Self-Pay', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('10', 'Central Certification', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('11', 'Other Non-Federal Program', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('12', 'PPO', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('13', 'POS', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('14', 'EPO', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('15', 'Indemnity Insurance', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('16', 'HMO-Medicare Risk', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('AM', 'Automobile Medical', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('BL', 'Blue Cross/Blue Shield', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('CH', 'Champus', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('CI', 'Commercial Insurance Co.', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('DS', 'Disability', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('HM', 'HMO or Health Maintenance Organization', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('LI', 'Liability', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('LM', 'Liability Medical', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('MB', 'Medicare Part B', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('MC', 'Medicare', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('OF', 'Other Federal Program', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('TV', 'Title V', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('VA', 'Veteran Administration Plan', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('WC', 'Workers Compensation Health Claim', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('ZZ', 'Mutually Defined', #trim(insNew.StandardListID)#)
</cfquery>










<!--- New List --->
<cfquery name="insNew" datasource="PA_MASTER">
	INSERT INTO StandardList(ListName) VALUES('Type Code');
	SELECT LAST_INSERT_ID() AS StandardListID 
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('AP', 'Auto Insurance Policy', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('CI', 'Commercial', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('CP', 'Medicare Conditionally Primary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('GP', 'Group Policy', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('HM', 'Health Maintenance Organization (HMO)', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('IP', 'Individual Policy', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('LD', 'Long Term Policy', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('LT', 'Litigation', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('MB', 'Medicare Part B', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('MC', 'Medicare Primary', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('OT', 'Other', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('PP', 'Personal Payment (Cash-No Insurance)', #trim(insNew.StandardListID)#)
</cfquery>











<!--- New List --->
<cfquery name="insNew" datasource="PA_MASTER">
	INSERT INTO StandardList(ListName) VALUES('Place of Service');
	SELECT LAST_INSERT_ID() AS StandardListID 
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('01', 'Pharmacy', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('03', 'School', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('04', 'Homeless Shelter', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('11', 'Office', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('12', 'Home', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('13', 'Living Assisted Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('14', 'Group Home', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('21', 'Inpatient Hospital', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('22', 'Outpatient Hospital', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('23', 'Emergency Room-Hospital', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('24', 'Ambulance Surgical Center', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('25', 'Birthing Center', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('26', 'Military Treatment Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('31', 'Skilled Nursing Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('32', 'Nursing Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('33', 'Custodial Care Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('34', 'Hospice', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('41', 'Ambulance - Land', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('41', 'Ambulance - Air or Water', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('49', 'Independent Clinic', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('50', 'Federally Qualified Health Center', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('51', 'Inpatient Psychiatric Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('52', 'Psychiatric Facility-Partial Hospitalization', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('53', 'Community Mental Health Center', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('54', 'Intermediate Care Facility/Mentally Retarded', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('55', 'Residential Substance Abuse Treatment Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('56', 'Psychiatric Residential Treatment Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('60', 'Mass Immunization Center', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('61', 'Comprehensive Inpatient Rehabilitation Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('62', 'Comprehensive Outpatient Rehabilitation Facility', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('71', 'State or Local Public Health Clinic', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('72', 'Rural Health Clinic', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('65', 'End Stage Renal Disease', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('81', 'Independent Laboratory', #trim(insNew.StandardListID)#)
</cfquery>
<cfquery name="insNewItem" datasource="PA_MASTER">
	INSERT INTO StandardListItem(ExternalListItemID, ItemNameDisplay, ListID) VALUES('99', 'Other Unlisted Facility', #trim(insNew.StandardListID)#)
</cfquery>



--->
































<!---

<cf_gcDBTableChangesScript>




--->





















<!---
<cfquery name="DeactivatePatientInsuranceCompany" datasource="PAClient_#trim(ClientID)#">
					UPDATE patientinsurancecompany
					SET Active = 0, PrimSecTer = NULL
					WHERE PatientID = #trim(patientID)# AND <cfif IsNumeric(InsuranceCompanyID)>InsuranceCompanyID = #trim(InsuranceCompanyID)#<cfelseif IsNumeric(recordID)>recordID = #trim(recordID)#</cfif>
				</cfquery>
--->
























<!---<cf_appFormHCFA1500 claimid="14271">--->



















<!------



<cfoutput>

 <head>

  <link rel="stylesheet" type="text/css" href="pafms/boards.css" />
  <script type="text/javascript" src="pafms/text-utils.js"> </script>
  <script language="javascript" type="text/javascript">
   var request = null;
   function createRequest() {
     try {
       request = new XMLHttpRequest();
     } catch (trymicrosoft) {
       try {
         request = new ActiveXObject("Msxml2.XMLHTTP");
       } catch (othermicrosoft) {
         try {
           request = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (failed) {
           request = null;
         }
       }
     }

     if (request == null)
       alert("Error creating request object!");
   }

   function getBoardsSold() {
     createRequest();
     //var url = "getUpdatedBoardSales-ajax.php";
	 var url = "#trim(request.urlReconstructed)#/ws/wsState.cfc?method=wsGetState2&id=59";
	 request.open("GET", url, true);
     request.onreadystatechange = updatePage;
     request.send(null);
  }

  function updatePage() {
    if (request.readyState == 4) {

	/*
	  if(window.ActiveXObject){
		var doc=new ActiveXObject("Microsoft.XMLDOM");
	  	doc.async="false";
	  	doc.loadXML(request.responseText);
	  }
	  var x=doc.documentElement;
      var newTotal = x.getElementsByTagName("RECORDID")[0].childNodes[0].data;
	*/

      var newTotal = request.responseText;
      var boardsSoldEl = document.getElementById("boards-sold");
      var cashEl = document.getElementById("cash");
      replaceText(boardsSoldEl, newTotal);

      /* Figure out how much cash Katie has made */
      var priceEl = document.getElementById("price");
      var price = getText(priceEl);
      var costEl = document.getElementById("cost");
      var cost = getText(costEl);
      var cashPerBoard = price - cost;
      var cash = cashPerBoard * newTotal;

      /* Update the cash for the slopes on the form */
      cash = Math.round(cash * 100) / 100;
      replaceText(cashEl, cash);
    }
  }
  </script>
 </head>


  <h1>Boards 'R' Us :: Custom Boards Report</h1>
  <div id="boards">
   <table>
    <tr><th>Snowboards Sold</th>
     <td><span id="boards-sold">1012</span></td></tr>
    <tr><th>What I Sell 'em For</th>
     <td>$<span id="price">249.95</span></td></tr>
    <tr><th>What it Costs Me</th>
     <td>$<span id="cost">84.22</span></td></tr>
   </table>
   <h2>Cash for the Slopes:
    $<span id="cash">167718.76</span></h2>
   <form method="GET">
    <input value="Show Me the Money" type="button"
           onClick="getBoardsSold();" />
   </form>
  </div>

</cfoutput>




---->



















































<!----


	<cfparam name="attributes.editorID" default="#randRange(1001, 2252)#">
	<cfset editorID = attributes.editorID>
	<cfparam name="attributes.formName" default="addClaimNote">
	<cfset formName = attributes.formName>
	<cfoutput>
			<span onclick="document.getElementById('DHTMLEditor#editorID#').focus();">Add&nbsp;Focus</span>
				<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
					<tr>
						<td valign="top">
				   			<form name="#trim(formName)#" method="post" action="appClaimNoteAdd.cfm">
								<table cellspacing="4" cellpadding="0" border="0" width="100%">
									<tr>
										<td class="SiteLabel" colspan="2">
											<cf_gcHTMLNoteEditor form_name="#trim(formName)#" tabindex="1" identifier="#trim(editorID)#" field_name="note" editWidthPercent="100" editHeight="35" verbage="">
										</td>
									</tr>
									<tr>
									    <td colspan="2" align="center"><cf_gcSubmitButton tabindex="2" value="Add&nbsp;Note"></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
				<script language="JavaScript">
					function resetSubmitButtons(){
						alert('dsfafsdsdaf');
						document.#formName#.SubmitButton#trim(submitButtonID)#.style.display='inline';
						spSubmitButton#trim(submitButtonID)#.innerText='';
						document.getElementById('DHTMLEditor#EditorID#').focus();
					};
					resetSubmitButtons();
				</script>

	</cfoutput>


---->





























<!---


<cfsetting requestTimeOut = "900">

<cfquery name="getPatientIDs" datasource="PAClient_1084">
	SELECT DISTINCT PatientID
	FROM patientinsurancecompany
</cfquery>


<cfset nums = "1,2,3,4,5,6,7,8,9,10,11,12">

<cfloop query="getPatientIDs">

	<cfquery name="getRecs" datasource="PAClient_1084">
		SELECT recordID, PatientID, InsuranceCompanyID, PrimSecTer, PolicyNumber
		FROM patientinsurancecompany
		WHERE PatientID = #PatientID#
		ORDER BY PrimSecTer, PolicyNumber, InsuranceCompanyID, PatientID
	</cfquery>

	<cfif getRecs.RecordCount GTE 2>

		<cfset thisNums = ValueList(getRecs.PrimSecTer)>
		<cfset thisRecordIds = ValueList(getRecs.RecordID)>
		<cfset thisRecordIds = ListDeleteAt(thisRecordIds, "1")>

		<cfif NOT FindNoCase(thisNums, nums)>

			<cfloop query="getRecs">
				<cfquery name="tempUp" datasource="PAClient_1084">
					UPDATE patientinsurancecompany
					SET primSecTer = #getRecs.CurrentRow#
					WHERE recordID = #getRecs.recordID#
				</cfquery>
				<cfoutput>UPDATE patientinsurancecompany SET primSecTer = #getRecs.CurrentRow# WHERE recordID = #getRecs.recordID#<br></cfoutput>
			</cfloop>
			<cfdump var="#getRecs#">

		</cfif>

	</cfif>

</cfloop>






--->




















<!---

<cfset number = "primary">

<cfoutput>

	<script language="JavaScript">
		function resetVerificationprimary(ids){
			alert(ids);
		};

		function addVerificationRow(id, vpid, dateVerified, timeVerified, verifiedBy, repName, effectDateFrom, effectDateTo){

			var tbody = document.getElementById(id + 'VerificationsTable').getElementsByTagName("tbody")[0];
			var row = document.createElement("tr");
			var te = "resetVerification" + id;
			row.onclick = function(){eval(te)(vpid);};
			row.setAttribute('onmouseover',function cursor(){this.style.cursor="hand"});

			var tdCell1 = document.createElement("td");
			thisText = document.createTextNode(dateVerified);
			tdCell1.setAttribute("className","SiteLabel");
			tdCell1.setAttribute("noWrap","true");
			tdCell1.appendChild(thisText);
			row.appendChild(tdCell1);

			var tdCell2 = document.createElement("td");
			thisText = document.createTextNode(timeVerified);
			tdCell2.setAttribute("className","SiteLabel");
			tdCell2.setAttribute("noWrap","true");
			tdCell2.setAttribute("align","center");
			tdCell2.appendChild(thisText);
			row.appendChild(tdCell2);

			var tdCell3 = document.createElement("td");
			thisText = document.createTextNode(verifiedBy);
			tdCell3.setAttribute("className","SiteLabel");
			tdCell3.setAttribute("noWrap","true");
			tdCell3.appendChild(thisText);
			row.appendChild(tdCell3);

			var tdCell4 = document.createElement("td");
			thisText = document.createTextNode(repName);
			tdCell4.setAttribute("className","SiteLabel");
			tdCell4.setAttribute("noWrap","true");
			tdCell4.appendChild(thisText);
			row.appendChild(tdCell4);

			var tdCell5 = document.createElement("td");
			thisText = document.createTextNode(effectDateFrom);
			tdCell5.setAttribute("className","SiteLabel");
			tdCell5.setAttribute("noWrap","true");
			tdCell5.setAttribute("align","center");
			tdCell5.appendChild(thisText);
			row.appendChild(tdCell5);

			var tdCell6 = document.createElement("td");
			thisText = document.createTextNode(effectDateTo);
			tdCell6.setAttribute("className","SiteLabel");
			tdCell6.setAttribute("noWrap","true");
			tdCell6.setAttribute("align","center");
			tdCell6.appendChild(thisText);
			row.appendChild(tdCell6);

			tbody.appendChild(row);
		};
	</script>

	<table border="0" cellspacing="0" cellpadding="0" id="#number#VerificationsTable">
		<tbody>
			<tr>
				<td class="siteLabel" align="center"><strong>Date Verified</strong></td>
				<td class="siteLabel" align="center"><strong>Time Verified</strong></td>
				<td class="siteLabel" align="center"><strong>Verified By</strong></td>
				<td class="siteLabel" align="center"><strong>Rep Name</strong></td>
				<td class="siteLabel" align="center"><strong>Effective Date From</strong></td>
				<td class="siteLabel" align="center"><strong>Effective Date To</strong></td>
			</tr>
			<tr><td colspan="16">1</td></tr>
			<tr><td colspan="16">2</td></tr>
			<tr><td colspan="16">3</td></tr>
			<tr><td colspan="16">4</td></tr>
			<tr><td colspan="16">5</td></tr>
			<tr><td colspan="16">6</td></tr>
		</tbody>
	</table>
	<table border="0" cellspacing="0" cellpadding="0">
	  	<tr><td colspan="16">&nbsp;</td></tr>
		<tr><td colspan="16">&nbsp;</td></tr>
		<tr><td colspan="16">&nbsp;</td></tr>
		<tr><td colspan="16">&nbsp;</td></tr>
		<tr><td colspan="16">&nbsp;</td></tr>
		<tr>
	    	<td align="center" colspan="7"  style="border-bottm: 1px solid; border-color: 000000;">
		  		<input type="button" class="SiteSubmitbox" value="Add New Row" name="btnadd" onclick="javascript:addVerificationRow('#number#', 322, 'dateVerified', 'timeVerified', 'verifiedBy', 'repName', 'effectDateFrom', 'effectDateTo')">&nbsp;&nbsp;
			</td>
	  	</tr>
	</table>
</cfoutput>






---->

























<!---
/*var tbl = document.getElementById(primsecter + 'VerificationsTable');
	while (tbl.tBodies[0].rows.length > 1) {
	tbl.tBodies[0].deleteRow(1);
}*/

--->






<!---<cf_tagFormPatientIntakeFormInsurance
	number="primary"
	InsuranceNameTBox="Medical Inc"
	PolicyNumberTBox="AWER456RT443">	--->























<!---<cfset temp = CreateObject("component", "com.common.Entity")>
<cfoutput>
	#temp.getEntityAddressPhoneString(1084, 131253)#
</cfoutput>--->
<!----

<!-------------------------------------------------------------------------------------->
<!--- Include the file that WDDX needs to do it's job. Taken from the CFIDE folder.  --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>

	<script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>

	<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
    <cfelse>
    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
    </cfif>

	<script language="JavaScript">
		// Utility function to fetch text from a URL
	    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
	    function _wddxSelectListGetFromURL(strURL) {
	        var objHTTP, result;

	        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
	        if (window.XMLHttpRequest) {
	          objHTTP=new XMLHttpRequest();
	          objHTTP.open("GET", strURL, false);
	          objHTTP.send(null);
	          result=objHTTP.responseText;

	        // For IE browsers under Windows
	        } else if (window.ActiveXObject) {
	          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
	          objHTTP.open("GET", strURL, false);
	          objHTTP.send(null);
	          result=objHTTP.responseText;
	        }

	        // Return result
	        return result;
	    }

		function updateEntity(data1,data2){
			var url = "#trim(request.urlReconstructed)#/ws/wsEntity.cfc?method=wsGetEntityAddressesXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());
			var packet = _wddxSelectListGetFromURL(url);
			var wddxDes = new WddxDeserializer;
			var result = wddxDes.deserialize(packet);
			if (result != null) {
				return result;
			};
			else{
				return false;
			}
		};


		function setInsurance(){

			var text = updateEntity(#trim(session.clientID)#, 127782);

			// code for IE
			if (window.ActiveXObject){
				var doc=new ActiveXObject("Microsoft.XMLDOM");
			  	doc.async="false";
			  	doc.loadXML(text);
			}
			var x=doc.documentElement;

		    for (var i=0; i<x.childNodes.length; i++){
		    	/*alert(x.getElementsByTagName("ACTIVE")[i].childNodes[0].data);
				alert(x.getElementsByTagName("ADDRESSID")[i].childNodes[0].data);
				alert(x.getElementsByTagName("ADDRESSLINE1")[i].childNodes[0].data);*/
				//alert(x.getElementsByTagName("ADDRESSLINE2")[i].childNodes[0].text);
				/*alert(x.getElementsByTagName("ADDRESSTYPE")[i].childNodes[0].data);
				alert(x.getElementsByTagName("ADDRESSTYPEID")[i].childNodes[0].data);
				alert(x.getElementsByTagName("CITY")[i].childNodes[0].data);
				alert(x.getElementsByTagName("COUNTRYID")[i].childNodes[0].data);
				alert(x.getElementsByTagName("DATECREATED")[i].childNodes[0].data);
				alert(x.getElementsByTagName("ISDEFAULT")[i].childNodes[0].data);
				alert(x.getElementsByTagName("SITEID")[i].childNodes[0].data);
				alert(x.getElementsByTagName("STATEABBR")[i].childNodes[0].data);
				alert(x.getElementsByTagName("STATEFULL")[i].childNodes[0].data);
				alert(x.getElementsByTagName("STATEID")[i].childNodes[0].data);
				alert(x.getElementsByTagName("ZIPCODE")[i].childNodes[0].data);*/
				/*alert(x.childNodes[i].childNodes(0).tagName + " : " + x.childNodes[i].childNodes(0).text);
				alert(x.childNodes[i].childNodes(1).tagName + " : " + x.childNodes[i].childNodes(1).text);
				alert(x.childNodes[i].childNodes(2).tagName + " : " + x.childNodes[i].childNodes(2).text);
				alert(x.childNodes[i].childNodes(3).tagName + " : " + x.childNodes[i].childNodes(3).text);
				alert(x.childNodes[i].childNodes(4).tagName + " : " + x.childNodes[i].childNodes(4).text);
				alert(x.childNodes[i].childNodes(5).tagName + " : " + x.childNodes[i].childNodes(5).text);
				alert(x.childNodes[i].childNodes(6).tagName + " : " + x.childNodes[i].childNodes(6).text);
				alert(x.childNodes[i].childNodes(7).tagName + " : " + x.childNodes[i].childNodes(7).text);
				alert(x.childNodes[i].childNodes(8).tagName + " : " + x.childNodes[i].childNodes(8).text);
				alert(x.childNodes[i].childNodes(9).tagName + " : " + x.childNodes[i].childNodes(9).text);
				alert(x.childNodes[i].childNodes(10).tagName + " : " + x.childNodes[i].childNodes(10).text);
				alert(x.childNodes[i].childNodes(11).tagName + " : " + x.childNodes[i].childNodes(11).text);
				alert(x.childNodes[i].childNodes(12).tagName + " : " + x.childNodes[i].childNodes(12).text);
				alert(x.childNodes[i].childNodes(13).tagName + " : " + x.childNodes[i].childNodes(13).text);
				alert(x.childNodes[i].childNodes(14).tagName + " : " + x.childNodes[i].childNodes(14).text);*/
		    };
		};

	</script>

	<br><br>
	<input type="Button" onclick="setInsurance();" value="70849">&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
	<div id="dataArea"></div>

</cfoutput>








---->








<!---<cfset temp = CreateObject("component", "com.common.db.ClientIPAddressIO")>

<cfset temp.init(1)>
<cfset temp.setActive(0)>
<cfset temp.setInactiveCode(68)>
<cfset temp.commit()>

<cfset temp.reset()>
<cfset temp.setIPAddressFrom('155.123.25.12')>
<cfset temp.setIPAddressTo('255.12.26.15')>
<cfset temp.setUsersID(55)>
<cfset newID  = temp.commit()>

<cfoutput>[#newID#]</cfoutput>--->













<!---

<cfquery name="tempGet" datasource="PAClient_1084">
	SELECT     PrimaryPolicyNumberTBox, intakeID
	FROM intake
</cfquery>


<cfset count  = 0>

<cfloop query="tempGet">



	<cfquery name="getIns" datasource="PAClient_1084">
		SELECT     DateCreated AS Expr1, *
		FROM patientinsurancecompany
		WHERE     PolicyNumber = '#trim(PrimaryPolicyNumberTBox)#'
	</cfquery>

	<cfif getIns.RecordCount LTE 0>
		<cfset count = count + 1>
		<cfoutput> NOT FROUND [#count#] #trim(PrimaryPolicyNumberTBox)# [#intakeID#] <br></cfoutput>
	</cfif>

</cfloop>



--->













<!---<cfoutput>
	[#session.User.getUsersID()#]
</cfoutput>







<cfset request.IP = CreateObject("component","com.common.db.ClientIPAddressIO").init(3)>

	<cfset request.IP.setIPAddressFrom('25.42.23.59')>
	<cfset request.IP.Commit()>

	<!---<cfset request.reset()>--->

<cfoutput>
	[#request.IP.getIPAddressFrom()#]
</cfoutput>--->


<!---
<!-------------------------------------------------------------------------------------->
<!--- Include the file that WDDX needs to do it's job. Taken from the CFIDE folder.  --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>

		<script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>

		<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
	    <cfelse>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
	    </cfif>

	</cfoutput>





<cfoutput>

	<script language="JavaScript">
		// Utility function to fetch text from a URL
	    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
	    function _wddxSelectListGetFromURL(strURL) {
	        var objHTTP, result;

	        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
	        if (window.XMLHttpRequest) {
	          objHTTP=new XMLHttpRequest();
	          objHTTP.open("GET", strURL, false);
	          objHTTP.send(null);
	          result=objHTTP.responseText;

	        // For IE browsers under Windows
	        } else if (window.ActiveXObject) {
	          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
	          objHTTP.open("GET", strURL, false);
	          objHTTP.send(null);
	          result=objHTTP.responseText;
	        }

	        // Return result
	        return result;
	    }

		function updateAddress(data1,data2,data3){
			var url = "#trim(request.urlReconstructed)#/ws/wsAddress.cfc?method=wsAddressUpdate&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&Data3=" + escape(data3) + "&" + escape(randNum_JS());
			var packet = _wddxSelectListGetFromURL(url);
			var wddxDes = new WddxDeserializer;
			var result = wddxDes.deserialize(packet);
			if (result != null) {
				return result;
			};
			else{
				return false;
			}
		};


		function setInsurance(){
			var temp = updateAddress(#trim(session.clientID)#, 36119, '13|1167 Villa Maria|Suite 200|Bryan|TX|75963');
			alert(temp);
		};

	</script>

	<br><br>
	<input type="Button" onclick="setInsurance();" value="70849">&nbsp;&nbsp;

</cfoutput>




--->






<!---
#trim(number)#InsuranceNameTBox
#trim(number)#PolicyNumberTBox
#trim(number)#GroupNumberTBox
#trim(number)#PhoneNumberTBox
#trim(number)#FaxNumberTBox
#trim(number)#SendToAddress1TBox
#trim(number)#SendToAddress2TBox
#trim(number)#SendToCityTBox
#trim(number)#SendToStateTBox
#trim(number)#SendToZipcodeTBox
#trim(number)#EffectiveDateMM
#trim(number)#EffectiveDateDD
#trim(number)#EffectiveDateYY
#trim(number)#PolicyHolderFNameTBox
#trim(number)#PolicyHolderMInitialTBox
#trim(number)#PolicyHolderLNameTBox
#trim(number)#HoldersDOBMM
#trim(number)#HoldersDOBDD
#trim(number)#HoldersDOBYY
#trim(number)#PolicyHolderEmployerTBox
#trim(number)#NoteTBox
#trim(number)#VerificationRepFNameTBox
#trim(number)#VerificationRepLNameTBox
#trim(number)#VerificationDateMM
#trim(number)#verificationDateDD
#trim(number)#VerificationDateYY
#trim(number)#VerificationTimeTBox
#trim(number)#CBox_VerificationHaveInsYes
#trim(number)#CBox_VerificationHaveInsNo
#trim(number)#VerificationHaveInsFromMM
#trim(number)#VerificationHaveInsFromDD
#trim(number)#VerificationHaveInsFromYY
#trim(number)#VerificationHaveInsToMM
#trim(number)#VerificationHaveInsToDD
#trim(number)#VerificationHaveInsToYY
#trim(number)#CBox_VerificationHaveDMECovYes
#trim(number)#CBox_VerificationHaveDMECovNo
#trim(number)#CBox_VerificationDeductibleYes
#trim(number)#CBox_VerificationDeductibleNo
#trim(number)#VerificationDeductibleAmountTBox
#trim(number)#VerificationDeductibleAmountMetTBox
#trim(number)#CBox_VerificationPPOPolicyYes
#trim(number)#CBox_VerificationPPOPolicyNo
#trim(number)#VerificationPercentagePayAfterDeductibleTBox
#trim(number)#CBox_VerificationPriorAuthYes
#trim(number)#CBox_VerificationPriorAuthNo
#trim(number)#VerificationAuthNumberTBox
#trim(number)#CBox_VerificationLifetimeBenefitMetYes
#trim(number)#CBox_VerificationLifetimeBenefitMetNo
#trim(number)#VerificationAuthPhoneNumberTBox
#trim(number)#CBox_MedicareSupplementYes
#trim(number)#CBox_MedicareSupplementNo
#trim(number)#CBox_CoordinateBenefitsYes
#trim(number)#CBox_CoordinateBenefitsNo
#trim(number)#CBox_PaidMedicareDeductibleYes
#trim(number)#CBox_PaidMedicareDeductibleNo
#trim(number)#CBox_VerificationMedicaidPlanMQMB
#trim(number)#CBox_VerificationMedicaidPlanQMB
#trim(number)#CBox_VerificationMedicaidPlanTraditional
#trim(number)#VerificationTypeBasePlanTBox
--->














<!---<cfsetting requestTimeOut = "900">


<cfquery name="getIn" datasource="PAClient_1084">
Select IntakeID, PatientID, PatientAddressID, PatientPhoneID, _patientFNameTBox, _patientMInitialTBox, _patientLNameTBox, _patientAddressTBox, _patientCityTBox, _patientStateTBox, _patientZipTBox, _patientPhoneTBox, _patientDOBMM, _patientDOBDD, _patientDOBYY, _OPTION_3a_CBox_PatientSexMale, _OPTION_3a_CBox_PatientSexFemale, _patientSSNTBox, _patientHeightFeet, _patientHeightInches, _patientWeightTBox
FROM intake
WHERE IntakeID IN(289,318)
</cfquery>

<cfset DOB = "">
<cfset Patient = CreateObject("component","com.common.Patient")>
<cfset Entity = CreateObject("component","com.common.Entity")>
<cfset AddressObj = CreateObject("component","com.common.Address")>
<cfset PhoneObj = CreateObject("component","com.common.Phone")>

<cfloop query="getIn">

	<cfset DOB = "">
	<cfset patientID2 = "">
	<cfset EntityID = "">
	<cfset Address = "">
	<cfset Addresses =  "">
	<cfset AddressID = "">
	<cfset PhoneID = "">
	<cfset Patient.reset()>
	<cfset Entity.reset()>
	<cfset AddressObj.reset()>
	<cfset PhoneObj.reset()>

	<cfif IsNumeric(getIn._patientDOBYY) AND IsNumeric(getIn._patientDOBMM) AND IsNumeric(getIn._patientDOBDD)>
		<cfset DOB = CreateDateTime(trim(getIn._patientDOBYY), trim(getIn._patientDOBMM), trim(getIn._patientDOBDD), 0, 0, 0)>
	</cfif>

	<cfoutput>
		<font size="1">
			FName: #trim(getIn._patientFNameTBox)#, LName: #trim(getIn._patientLNameTBox)#, DOB: #trim(DOB)#, SSN: #trim(getIn._patientSSNTBox)#
		</font>
	</cfoutput>

			<cfset Entity.setClientID(trim(session.clientID))>
			<cfset Entity.setFName(trim(_patientFNameTBox))>
			<cfif _patientMInitialTBox NEQ "">
				<cfset Entity.setMName(trim(_patientMInitialTBox))>
			</cfif>
			<cfset Entity.setLName(trim(_patientLNameTBox))>
			<cfset Entity.setDOB(trim(DOB))>
			<cfif IsDefined("_OPTION_3a_CBox_PatientSexMale") AND _OPTION_3a_CBox_PatientSexMale NEQ "">
				<cfset Entity.setSex(0)>
			<cfelseif IsDefined("_OPTION_3a_CBox_PatientSexFemale") AND _OPTION_3a_CBox_PatientSexFemale NEQ "">
				<cfset Entity.setSex(1)>
			</cfif>
			<cfif IsDefined("_patientSSNTBox") AND _patientSSNTBox NEQ "">
				<cfset Entity.setSSN(trim(_patientSSNTBox))>
			</cfif>
			<cfif IsDefined("_patientHeightInches") AND _patientHeightInches NEQ "">
				<cfset Entity.setHeightinInches(trim(_patientHeightInches))>
			</cfif>
			<cfif IsDefined("_patientWeightTBox") AND _patientWeightTBox NEQ "">
				<cfset Entity.setWeight(trim(_patientWeightTBox))>
			</cfif>
			<cfset Entity.setObjectTypeID(3)>
			<cfset EntityID = Entity.commit()>

			<cfset Patient.setEntityID(trim(EntityID))>
			<cfset patientID2 = Patient.commit()>

			<cfoutput><font color="008000">[#patientID2#] [#entityID#]</font></cfoutput>

			<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" itemNameDisplay="#trim(_patientStateTBox)#" listid="4" active="1" returnvariable="getState">
			<cfif getState.Recordcount EQ 1>
				<cfset stateID = getState.StandardListItemID>
			<cfelse>
				<cfset stateID = "NULL">
			</cfif>
			<cfset AddressObj.new(EntityID: trim(EntityID), AddressTypeID: 12, AddressLine1: REQUEST.mssqlReplaceSingleQuote(trim(_patientAddressTBox)), City: REQUEST.mssqlReplaceSingleQuote(trim(_patientCityTBox)), StateID: trim(stateID), ZipCode: REQUEST.mssqlReplaceSingleQuote(trim(_patientZipTBox)))>
			<cfset AddressID = AddressObj.commit()>

			<cfif IsDefined("Entity") AND IsObject(Entity)>
				<cfset Entity.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(EntityID), addressID: trim(AddressID), isDefault: 1)>
			</cfif>
			<cfoutput>[add: #AddressID#]</cfoutput>

			<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterD(request.cleanNumericString(trim(_patientPhoneTBox))) />
			<cfset PhoneObj.setPhoneTypeID(76)>
			<cfset PhoneObj.setPhoneNumber(trim(PhoneNumberE))>
			<cfset PhoneID = PhoneObj.commit()>

			<cfif IsDefined("Entity") AND IsObject(Entity)>
				<cfset Entity.bindEntityPhone(clientID: trim(session.clientID), entityID: trim(EntityID), PhoneID: trim(PhoneID), IsDefault: 0)>
			</cfif>
			<cfoutput>[ph: #PhoneID#]</cfoutput>



		<cfif IsNumeric(PatientID2) AND IsNumeric(AddressID) AND IsNumeric(PhoneID)>
			<cfquery name="updateIntake" datasource="PAClient_1084">
				UPDATE intake
				SET PatientID = #trim(PatientID2)#, PatientAddressID = #trim(AddressID)#, PatientPhoneID = #PhoneID#
				WHERE IntakeID = #trim(intakeID)#
			</cfquery>
		<cfelse>
			<cfoutput>SET PatientID = #trim(PatientID2)#, PatientAddressID = #trim(AddressID)#, PatientPhoneID = #PhoneID# WHERE IntakeID = #trim(intakeID)#</cfoutput>
		</cfif>

	<br><br>


</cfloop>--->


























<!---
<cfsetting requestTimeOut = "900">

<cfquery name="updateIntake2" datasource="PAClient_1084">
	UPDATE intake
	SET patientStateTBox = 'Texas'
	WHERE patientStateTBox IS NOT NULL
</cfquery>


<cfquery name="getIn" datasource="PAClient_1084">
Select IntakeID, PatientID, PatientAddressID, PatientPhoneID, patientFNameTBox, patientMInitialTBox, patientLNameTBox, patientAddressTBox, patientCityTBox, patientStateTBox, patientZipTBox, patientPhoneTBox, patientDOBMM, patientDOBDD, patientDOBYY, OPTION_3a_CBox_PatientSexMale, OPTION_3a_CBox_PatientSexFemale, patientSSNTBox, patientHeightFeet, patientHeightInches, patientWeightTBox
FROM intake
</cfquery>

<cfset DOB = "">

<cfset Patient = CreateObject("component","com.common.Patient")>
<cfset Entity = CreateObject("component","com.common.Entity")>
<cfset AddressObj = CreateObject("component","com.common.Address")>
<cfset PhoneObj = CreateObject("component","com.common.Phone")>

<cfloop query="getIn">

	<cfset DOB = "">
	<cfset patientID2 = "">
	<cfset EntityID = "">
	<cfset Address = "">
	<cfset Addresses =  "">
	<cfset AddressID = "">
	<cfset PhoneID = "">
	<cfset Patient.reset()>
	<cfset Entity.reset()>
	<cfset AddressObj.reset()>
	<cfset PhoneObj.reset()>

	<cfif IsNumeric(getIn.patientDOBYY) AND IsNumeric(getIn.patientDOBMM) AND IsNumeric(getIn.patientDOBDD)>
		<cfset DOB = CreateDateTime(trim(getIn.patientDOBYY), trim(getIn.patientDOBMM), trim(getIn.patientDOBDD), 0, 0, 0)>
	</cfif>

	<cfset getPatient = Patient.patientExists(namematch: 1, clientID: trim(session.clientID), FName: trim(getIn.patientFNameTBox), LName: trim(getIn.patientLNameTBox), DOB: trim(DOB))>

	<cfoutput>
		<font size="1">
			FName: #trim(getIn.patientFNameTBox)#, LName: #trim(getIn.patientLNameTBox)#, DOB: #trim(DOB)#, SSN: #trim(getIn.patientSSNTBox)#
		</font>
	</cfoutput>

		<cfif NOT IsQuery(getPatient) AND getPatient EQ 0>

			<cfquery name="getSS" datasource="PAClient_1084">
				Select e.EntityID, p.PatientID
				FROM entity e JOIN Patient p ON p.EntityID = e.EntityID
				WHERE e.SSN = '#patientSSNTBox#'
			</cfquery>

			<cfif getSS.RecordCount eq 1>
				<cfset patientID2 = getSS.patientID>
				<cfset EntityID = getSS.EntityID>
				<cfoutput><font color="ff00ff">[#patientID2#] [#entityID#]</font></cfoutput>
			</cfif>

		</cfif>


		<cfif NOT IsQuery(getPatient) AND getPatient EQ 0 AND PatientID EQ "" AND EntityID EQ "">
			<cfquery name="getName" datasource="PAClient_1084">
				Select e.EntityID, p.PatientID
				FROM entity e JOIN Patient p ON p.EntityID = e.EntityID
				WHERE (e.FName = '#trim(getIn.patientFNameTBox)#' OR e.FName = '#LEFT(trim(getIn.patientFNameTBox), 1)#') AND e.LName = '#trim(getIn.patientLNameTBox)#'
				AND e.SSN IS NULL AND e.DOB IS NULL
			</cfquery>
			<cfif getName.RecordCount eq 1>
				<cfset patientID2 = getName.patientID>
				<cfset EntityID = getName.EntityID>
				<cfoutput><font color="00ffff">[#patientID2#] [#entityID#]</font></cfoutput>
			</cfif>
		</cfif>


		<cfif NOT IsQuery(getPatient) AND getPatient EQ 0 AND PatientID EQ "" AND EntityID EQ "">

			<cfset Entity.setClientID(trim(session.clientID))>
			<cfset Entity.setFName(trim(patientFNameTBox))>
			<cfif patientMInitialTBox NEQ "">
				<cfset Entity.setMName(trim(patientMInitialTBox))>
			</cfif>
			<cfset Entity.setLName(trim(patientLNameTBox))>
			<cfset Entity.setDOB(trim(DOB))>
			<cfif IsDefined("OPTION_3a_CBox_PatientSexMale") AND OPTION_3a_CBox_PatientSexMale NEQ "">
				<cfset Entity.setSex(0)>
			<cfelseif IsDefined("OPTION_3a_CBox_PatientSexFemale") AND OPTION_3a_CBox_PatientSexFemale NEQ "">
				<cfset Entity.setSex(1)>
			</cfif>
			<cfif IsDefined("patientSSNTBox") AND patientSSNTBox NEQ "">
				<cfset Entity.setSSN(trim(patientSSNTBox))>
			</cfif>
			<cfif IsDefined("patientHeightInches") AND patientHeightInches NEQ "">
				<cfset Entity.setHeightinInches(trim(patientHeightInches))>
			</cfif>
			<cfif IsDefined("patientWeightTBox") AND patientWeightTBox NEQ "">
				<cfset Entity.setWeight(trim(patientWeightTBox))>
			</cfif>
			<cfset Entity.setObjectTypeID(3)>
			<cfset EntityID = Entity.commit()>

			<cfset Patient.setEntityID(trim(EntityID))>
			<cfset patientID2 = Patient.commit()>

			<cfoutput><font color="008000">[#patientID2#] [#entityID#]</font></cfoutput>

		<cfelseif IsQuery(getPatient) AND getPatient.RecordCount EQ 1>
			<cfset patientID2 = getPatient.patientID>
			<cfset EntityID = getPatient.EntityID>
			<cfoutput><font color="0000ff">[#patientID2#] [#entityID#]</font></cfoutput>
		<cfelseif IsQuery(getPatient) AND getPatient.RecordCount EQ 2>
			<cfset ids = valuelist(getPatient.patientID)>
			<cfset eds = valuelist(getPatient.EntityID)>
			<cfset patientID2 = ListFirst(ids)>
			<cfset EntityID = ListFirst(eds)>
			<cfoutput><font color="FF0000">[#patientID2#] [#entityID#]</font></cfoutput>
		<cfelse>
			4444444
		</cfif>


		<cfif isdefined("EntityID") AND isnumeric(EntityID)>

			<cfset Address = Entity.getEntityDefaultAddress(clientID: trim(session.clientID), entityID: EntityID)>
			<cfset AddressID = Address.AddressID>

			<cfif AddressID EQ "">
				<cfset Addresses = Entity.getEntityAddresses(clientID: trim(session.clientID), entityID: EntityID)>
				<cfset AddressID = ListFirst(valueList(Addresses.AddressID))>
			</cfif>

			<cfif AddressID EQ "">

				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" itemNameDisplay="#trim(patientStateTBox)#" listid="4" active="1" returnvariable="getState">
				<cfif getState.Recordcount EQ 1>
					<cfset stateID = getState.StandardListItemID>
				<cfelse>
					<cfset stateID = "NULL">
				</cfif>
				<cfset AddressObj.new(EntityID: trim(EntityID), AddressTypeID: 12, AddressLine1: REQUEST.mssqlReplaceSingleQuote(trim(patientAddressTBox)), City: REQUEST.mssqlReplaceSingleQuote(trim(patientCityTBox)), StateID: trim(stateID), ZipCode: REQUEST.mssqlReplaceSingleQuote(trim(patientZipTBox)))>
				<cfset AddressID = AddressObj.commit()>

				<cfif IsDefined("Entity") AND IsObject(Entity)>
					<cfset Entity.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(EntityID), addressID: trim(AddressID), isDefault: 1)>
				</cfif>

			</cfif>

			<cfoutput>[add: #AddressID#]</cfoutput>



			<cfset Phone = Entity.getEntityDefaultPhone(clientID: trim(session.clientID), entityID: EntityID)>
			<cfset PhoneID = Phone.PhoneID>

			<cfif PhoneID EQ "">
				<cfset Phones = Entity.getEntityPhones(clientID: trim(session.clientID), entityID: EntityID)>
				<cfset PhoneID = ListFirst(valueList(Phones.PhoneID))>
			</cfif>

			<cfif PhoneID EQ "">

			<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterD(request.cleanNumericString(trim(patientPhoneTBox))) />
			<cfset PhoneObj.setPhoneTypeID(76)>
			<cfset PhoneObj.setPhoneNumber(trim(PhoneNumberE))>
			<cfset PhoneID = PhoneObj.commit()>

			<cfif IsDefined("Entity") AND IsObject(Entity)>
				<cfset Entity.bindEntityPhone(clientID: trim(session.clientID), entityID: trim(EntityID), PhoneID: trim(PhoneID), IsDefault: 0)>
			</cfif>

		</cfif>

			<cfoutput>[ph: #PhoneID#]</cfoutput>

		</cfif>

		<cfif IsNumeric(PatientID2) AND IsNumeric(AddressID) AND IsNumeric(PhoneID)>
			<cfquery name="updateIntake" datasource="PAClient_1084">
				UPDATE intake
				SET PatientID = #trim(PatientID2)#, PatientAddressID = #trim(AddressID)#, PatientPhoneID = #PhoneID#
				WHERE IntakeID = #trim(intakeID)#
			</cfquery>
		<cfelse>
			<cfoutput>SET PatientID = #trim(PatientID2)#, PatientAddressID = #trim(AddressID)#, PatientPhoneID = #PhoneID# WHERE IntakeID = #trim(intakeID)#</cfoutput>
		</cfif>

	<br><br>


</cfloop>


--->






















<!---

<cfset DOB = CreateDate("2000", "12", "10")>
<cfset form.patientSSNTBox = "445-15-8521">
<cfset Patient = CreateObject("component","com.common.Patient")>
<cfset getPatient = Patient.patientExists(clientID: trim(session.clientID), DOB: trim(DOB), SSN: trim(form.patientSSNTBox))>
<cfdump var="#getPatient#">	<cfoutput>[#dob#]</cfoutput>


	<cfif IsQuery(getPatient) AND getPatient.RecordCount LTE 0>
		4564
	<cfelse>
		111111
	</cfif>



--->





















<!---<cfquery name="qGetIntake" datasource="#request.datasource#">
		SELECT i.IntakeID, i.ClientID, i.InactiveCode, i.printed, i.AssignedTouserID,i.DateCreated, i.hidden_Step, i.otherTBox, i.hidden_UsersID, i.hidden_TimeStart, IFNULL(i.OPTION_1_CBox_Delivery, 0) AS OPTION_1_CBox_Delivery, 	IFNULL(i.OPTION_1_CBox_Pickup, 0) AS OPTION_1_CBox_Pickup, IFNULL(i.OPTION_1_CBox_Repair, 0) AS OPTION_1_CBox_Repair, 	IFNULL(i.OPTION_1_CBox_Switch, 0) AS OPTION_1_CBox_Switch, IFNULL(i.OPTION_1_CBox_Existing, 0) AS OPTION_1_CBox_Existing, 	IFNULL(i.OPTION_2_CBox_Other, 0) AS OPTION_2_CBox_Other, IFNULL(i.OPTION_2_CBox_Hospice, 0) AS OPTION_2_CBox_Hospice, 	IFNULL(i.OPTION_2_CBox_Hospital, 0) AS OPTION_2_CBox_Hospital, i.hospiceTBox, IFNULL(i.OPTION_3_CBox_Medicare, 0) AS 	OPTION_3_CBox_Medicare, IFNULL(i.OPTION_3_CBox_PrivateInsurance, 0) AS OPTION_3_CBox_PrivateInsurance, IFNULL(i.OPTION_3_CBox_Medicaid, 	0) AS OPTION_3_CBox_Medicaid, IFNULL(i.OPTION_3_CBox_PrivatePay, 0) AS OPTION_3_CBox_PrivatePay, i.hospitalTBox, i.DischargeDateMM, 	i.DischargeDateDD, i.DischargeDateYY, i.typeOfPay_Radio, i.callerFNameTBox, i.callerMInitialTBox, i.callerLNameTBox, i.callerPhoneTBox, i.patientFNameTBox, i.patientMInitialTBox, i.patientLNameTBox, i.roomNumberTBox, i.bedNumberTBox, 	i.patientAddressTBox, i.patientCityTBox, i.patientStateTBox, i.patientZipTBox, i.patientPhoneTBox, i.patientDOBMM, i.patientDOBDD, i.patientDOBYY, i.patientSSNTBox,  i.patientHeightInches, i.patientWeightTBox, i.alternateContactFNameTBox, i.alternateContactMInitialTBox, i.alternateContactLNameTBox, i.alternateContactRelationshipTBox, i.alternateContactPhoneTBox, i.alternateContactWorkPhoneTBox, i.poNumberTBox, i.creditCardTypeTBox, i.creditCardNumberTBox, i.ccDateMM, i.ccDateDD, i.ccDateYY, i.orderingPhysicianFNameTBox, i.orderingPhysicianMInitialTBox, i.orderingPhysicianLNameTBox, i.orderingPhysicianPhoneTBox, i.orderingPhysicianUPINTBox, i.orderingPhysicianFaxTBox, i.orderingPhysicianAddressTBox, i.orderingPhysicianCityTBox, i.orderingPhysicianStateTBox, i.orderingPhysicianZipTBox, IFNULL(i.OPTION_13_CBox_PastEquipmentYes, 0) AS OPTION_13_CBox_PastEquipmentYes, IFNULL(i.OPTION_13_CBox_PastEquipmentNo, 0) AS OPTION_13_CBox_PastEquipmentNo, i.Equipment1TypeTBox, i.Equipment1RentPurchasedSelect, i.Equipment1FromMM, i.Equipment1FromDD, i.Equipment1FromYY, i.Equipment1ToMM, i.Equipment1ToDD, i.Equipment1ToYY, i.Equipment1SupplierNameTBox, i.Equipment1SupplierTelephoneTBox, i.Equipment2TypeTBox, i.Equipment2RentPurchasedSelect, i.Equipment2FromMM, i.Equipment2FromDD, i.Equipment2FromYY, i.Equipment2ToMM, i.Equipment2ToDD, i.Equipment2ToYY, i.Equipment2SupplierNameTBox, i.Equipment2SupplierTelephoneTBox, 	i.Equipment3TypeTBox, i.Equipment3RentPurchasedSelect, i.Equipment3FromMM, i.Equipment3FromDD, i.Equipment3FromYY, i.Equipment3ToMM, i.Equipment3ToDD, i.Equipment3ToYY, i.Equipment3SupplierNameTBox, i.Equipment3SupplierTelephoneTBox, i.Equipment4TypeTBox, i.Equipment4RentPurchasedSelect, i.Equipment4FromMM, i.Equipment4FromDD, i.Equipment4FromYY, i.Equipment4ToMM, i.Equipment4ToDD, i.Equipment4ToYY, i.Equipment4SupplierNameTBox, i.Equipment4SupplierTelephoneTBox, i.Equipment5TypeTBox, i.Equipment5RentPurchasedSelect, i.Equipment5FromMM, i.Equipment5FromDD, i.Equipment5FromYY, i.Equipment5ToMM, i.Equipment5ToDD, i.Equipment5ToYY, i.Equipment5SupplierNameTBox, i.Equipment5SupplierTelephoneTBox, IFNULL(i.OPTION_14_CBox_OxygenPAo2, 0) AS OPTION_14_CBox_OxygenPAo2, IFNULL(i.OPTION_14_CBox_OxygenSAo2, 0) AS OPTION_14_CBox_OxygenSAo2, IFNULL(i.OPTION_14_CBox_OxygenSPo2, 0) AS OPTION_14_CBox_OxygenSPo2, i.OxygenPAO2TBox, i.OxygenSAO2TBox, IFNULL(i.CPAPStudy_CBox, 0) AS CPAPStudy_CBox, i.CPAPStudyNote, i.OxygenSPO2TBox, IFNULL(i.CPAPStudyOnFile_CBox, 0) AS CPAPStudyOnFile_CBox, i.CPAPStudyOnFileNote, i.LabTestDateMM, i.LabTestDateDD, i.LabTestDateYY, i.CPAPStudyPerformedAt, i.LabTestFacilityTBox, i.CPAPStudyPerformedAt2, i.CPAPStudyPerformedAt3, IFNULL(i.OPTION_3a_CBox_PatientSexFemale, 0) AS OPTION_3a_CBox_PatientSexFemale, IFNULL(i.OPTION_3a_CBox_PatientSexMale, 0) AS OPTION_3a_CBox_PatientSexMale, i.Equipment1NoteTBox, i.Equipment2NoteTBox, i.Equipment3NoteTBox, i.Equipment4NoteTBox, i.Equipment5NoteTBox, i.primaryInsuranceNameTBox, i.primaryPolicyNumberTBox, i.primaryGroupNumberTBox, i.primaryPhoneNumberTBox, i.primaryEffectiveDateMM, i.primaryEffectiveDateDD, i.primaryEffectiveDateYY, i.primaryPolicyHolderFNameTBox, i.primaryPolicyHolderMInitialTBox, i.primaryPolicyHolderLNameTBox, i.primaryHoldersDOBMM, i.primaryHoldersDOBDD, i.primaryHoldersDOBYY, i.primaryPolicyHolderEmployerTBox, i.primaryNoteTBox, i.primaryVerificationRepFNameTBox, i.primaryVerificationRepLNameTBox, i.primaryVerificationDateMM, i.primaryVerificationDateDD, i.primaryVerificationDateYY, i.primaryVerificationTimeTBox, i.primaryVerificationHaveInsFromMM, i.primaryVerificationHaveInsFromDD, i.primaryVerificationHaveInsFromYY, i.primaryVerificationHaveInsToMM, i.primaryVerificationHaveInsToDD, i.primaryVerificationHaveInsToYY, IFNULL(i.primaryCBox_VerificationHaveInsYes, 0) AS primaryCBox_VerificationHaveInsYes, IFNULL(i.primaryCBox_VerificationHaveInsNo, 0) AS primaryCBox_VerificationHaveInsNo, IFNULL(i.primaryCBox_VerificationHaveDMECovYes, 0) AS primaryCBox_VerificationHaveDMECovYes, IFNULL(i.primaryCBox_VerificationHaveDMECovNo, 0) AS primaryCBox_VerificationHaveDMECovNo, IFNULL(i.primaryCBox_VerificationDeductibleYes, 0) AS primaryCBox_VerificationDeductibleYes, IFNULL(i.primaryCBox_VerificationDeductibleNo, 0) AS primaryCBox_VerificationDeductibleNo, i.primaryVerificationDeductibleAmountTBox, i.primaryVerificationDeductibleAmountMetTBox, i.primaryVerificationPercentagePayAfterDeductibleTBox, IFNULL(i.primaryCBox_VerificationPPOPolicyYes, 0) AS primaryCBox_VerificationPPOPolicyYes, IFNULL(i.primaryCBox_VerificationPPOPolicyNo, 0) AS primaryCBox_VerificationPPOPolicyNo, i.primaryVerificationAuthNumberTBox, IFNULL(i.primaryCBox_VerificationPriorAuthYes, 0) AS primaryCBox_VerificationPriorAuthYes, IFNULL(i.primaryCBox_VerificationPriorAuthNo, 0) AS primaryCBox_VerificationPriorAuthNo, i.primaryVerificationAuthPhoneNumberTBox, IFNULL(i.primaryCBox_VerificationLifetimeBenefitMetYes, 0) AS primaryCBox_VerificationLifetimeBenefitMetYes, IFNULL(i.primaryCBox_VerificationLifetimeBenefitMetNo, 0) AS primaryCBox_VerificationLifetimeBenefitMetNo, IFNULL(i.primaryCBox_MedicareSupplementYes, 0) AS primaryCBox_MedicareSupplementYes, IFNULL(i.primaryCBox_MedicareSupplementNo, 0) AS primaryCBox_MedicareSupplementNo, IFNULL(i.primaryCBox_CoordinateBenefitsYes, 0) AS primaryCBox_CoordinateBenefitsYes, IFNULL(i.primaryCBox_CoordinateBenefitsNo, 0) AS primaryCBox_CoordinateBenefitsNo, IFNULL(i.primaryCBox_PaidMedicareDeductibleYes, 0) AS primaryCBox_PaidMedicareDeductibleYes, IFNULL(i.primaryCBox_PaidMedicareDeductibleNo, 0) AS primaryCBox_PaidMedicareDeductibleNo, i.primaryVerificationTypeBasePlanTBox, IFNULL(i.primaryCBox_VerificationMedicaidPlanMQMB, 0) AS primaryCBox_VerificationMedicaidPlanMQMB, IFNULL(i.primaryCBox_VerificationMedicaidPlanQMB, 0) AS primaryCBox_VerificationMedicaidPlanQMB, IFNULL(i.primaryCBox_VerificationMedicaidPlanTraditional, 0) AS primaryCBox_VerificationMedicaidPlanTraditional, i.secondaryInsuranceNameTBox, i.secondaryPolicyNumberTBox, i.secondaryGroupNumberTBox, i.secondaryPhoneNumberTBox, i.secondaryEffectiveDateMM, i.secondaryEffectiveDateDD, i.secondaryEffectiveDateYY, i.secondaryPolicyHolderFNameTBox, i.secondaryPolicyHolderMInitialTBox, i.secondaryPolicyHolderLNameTBox, i.secondaryHoldersDOBMM, i.secondaryHoldersDOBDD, i.secondaryHoldersDOBYY, i.secondaryPolicyHolderEmployerTBox, i.secondaryNoteTBox, i.secondaryVerificationRepFNameTBox, i.secondaryVerificationRepLNameTBox, i.secondaryVerificationDateMM, i.secondaryVerificationDateDD, i.secondaryVerificationDateYY, i.secondaryVerificationTimeTBox, i.secondaryVerificationHaveInsFromMM, i.secondaryVerificationHaveInsFromDD, i.secondaryVerificationHaveInsFromYY, i.secondaryVerificationHaveInsToMM, i.secondaryVerificationHaveInsToDD, i.secondaryVerificationHaveInsToYY, IFNULL(i.secondaryCBox_VerificationHaveInsYes, 0) AS secondaryCBox_VerificationHaveInsYes, IFNULL(i.secondaryCBox_VerificationHaveInsNo, 0) AS secondaryCBox_VerificationHaveInsNo, IFNULL(i.secondaryCBox_VerificationHaveDMECovYes, 0) AS secondaryCBox_VerificationHaveDMECovYes, IFNULL(i.secondaryCBox_VerificationHaveDMECovNo, 0) AS secondaryCBox_VerificationHaveDMECovNo, IFNULL(i.secondaryCBox_VerificationDeductibleYes, 0) AS secondaryCBox_VerificationDeductibleYes, IFNULL(i.secondaryCBox_VerificationDeductibleNo, 0) AS secondaryCBox_VerificationDeductibleNo, i.secondaryVerificationDeductibleAmountTBox, i.secondaryVerificationDeductibleAmountMetTBox, i.secondaryVerificationPercentagePayAfterDeductibleTBox, IFNULL(i.secondaryCBox_VerificationPPOPolicyYes, 0) AS secondaryCBox_VerificationPPOPolicyYes, IFNULL(i.secondaryCBox_VerificationPPOPolicyNo, 0) AS secondaryCBox_VerificationPPOPolicyNo, i.secondaryVerificationAuthNumberTBox, IFNULL(i.secondaryCBox_VerificationPriorAuthYes, 0) AS secondaryCBox_VerificationPriorAuthYes, IFNULL(i.secondaryCBox_VerificationPriorAuthNo, 0) AS secondaryCBox_VerificationPriorAuthNo, i.secondaryVerificationAuthPhoneNumberTBox, IFNULL(i.secondaryCBox_VerificationLifetimeBenefitMetYes, 0) AS secondaryCBox_VerificationLifetimeBenefitMetYes, IFNULL(i.secondaryCBox_VerificationLifetimeBenefitMetNo, 0) AS secondaryCBox_VerificationLifetimeBenefitMetNo, IFNULL(i.secondaryCBox_MedicareSupplementYes, 0) AS secondaryCBox_MedicareSupplementYes, IFNULL(i.secondaryCBox_MedicareSupplementNo, 0) AS secondaryCBox_MedicareSupplementNo, IFNULL(i.secondaryCBox_CoordinateBenefitsYes, 0) AS secondaryCBox_CoordinateBenefitsYes, IFNULL(i.secondaryCBox_CoordinateBenefitsNo, 0) AS secondaryCBox_CoordinateBenefitsNo, IFNULL(i.secondaryCBox_PaidMedicareDeductibleYes, 0) AS secondaryCBox_PaidMedicareDeductibleYes, IFNULL(i.secondaryCBox_PaidMedicareDeductibleNo, 0) AS secondaryCBox_PaidMedicareDeductibleNo, i.secondaryVerificationTypeBasePlanTBox, IFNULL(i.secondaryCBox_VerificationMedicaidPlanMQMB, 0) AS secondaryCBox_VerificationMedicaidPlanMQMB, IFNULL(i.secondaryCBox_VerificationMedicaidPlanQMB, 0) AS secondaryCBox_VerificationMedicaidPlanQMB, IFNULL(i.secondaryCBox_VerificationMedicaidPlanTraditional, 0) AS secondaryCBox_VerificationMedicaidPlanTraditional, i.tertiaryInsuranceNameTBox, i.tertiaryPolicyNumberTBox, i.tertiaryGroupNumberTBox, i.tertiaryPhoneNumberTBox, i.tertiaryEffectiveDateMM, i.tertiaryEffectiveDateDD, i.tertiaryEffectiveDateYY, i.tertiaryPolicyHolderFNameTBox, i.tertiaryPolicyHolderMInitialTBox, i.tertiaryPolicyHolderLNameTBox, i.tertiaryHoldersDOBMM, i.tertiaryHoldersDOBDD, i.tertiaryHoldersDOBYY, i.tertiaryPolicyHolderEmployerTBox, i.tertiaryNoteTBox, i.tertiaryVerificationRepFNameTBox, i.tertiaryVerificationRepLNameTBox, i.tertiaryVerificationDateMM, i.tertiaryVerificationDateDD, i.tertiaryVerificationDateYY, i.tertiaryVerificationTimeTBox, i.tertiaryVerificationHaveInsFromMM, i.tertiaryVerificationHaveInsFromDD, i.tertiaryVerificationHaveInsFromYY, i.tertiaryVerificationHaveInsToMM, i.tertiaryVerificationHaveInsToDD, i.tertiaryVerificationHaveInsToYY, IFNULL(i.tertiaryCBox_VerificationHaveInsYes, 0) AS tertiaryCBox_VerificationHaveInsYes, IFNULL(i.tertiaryCBox_VerificationHaveInsNo, 0) AS tertiaryCBox_VerificationHaveInsNo, IFNULL(i.tertiaryCBox_VerificationHaveDMECovYes, 0) AS tertiaryCBox_VerificationHaveDMECovYes, IFNULL(i.tertiaryCBox_VerificationHaveDMECovNo, 0) AS tertiaryCBox_VerificationHaveDMECovNo, IFNULL(i.tertiaryCBox_VerificationDeductibleYes, 0) AS tertiaryCBox_VerificationDeductibleYes, IFNULL(i.tertiaryCBox_VerificationDeductibleNo, 0) AS tertiaryCBox_VerificationDeductibleNo, i.tertiaryVerificationDeductibleAmountTBox, i.tertiaryVerificationDeductibleAmountMetTBox, i.tertiaryVerificationPercentagePayAfterDeductibleTBox, IFNULL(i.tertiaryCBox_VerificationPPOPolicyYes, 0) AS tertiaryCBox_VerificationPPOPolicyYes, IFNULL(i.tertiaryCBox_VerificationPPOPolicyNo, 0) AS tertiaryCBox_VerificationPPOPolicyNo, i.tertiaryVerificationAuthNumberTBox, IFNULL(i.tertiaryCBox_VerificationPriorAuthYes, 0) AS tertiaryCBox_VerificationPriorAuthYes, IFNULL(i.tertiaryCBox_VerificationPriorAuthNo, 0) AS tertiaryCBox_VerificationPriorAuthNo, i.tertiaryVerificationAuthPhoneNumberTBox, IFNULL(i.tertiaryCBox_VerificationLifetimeBenefitMetYes, 0) AS tertiaryCBox_VerificationLifetimeBenefitMetYes, IFNULL(i.tertiaryCBox_VerificationLifetimeBenefitMetNo, 0) AS tertiaryCBox_VerificationLifetimeBenefitMetNo, IFNULL(i.tertiaryCBox_MedicareSupplementYes, 0) AS tertiaryCBox_MedicareSupplementYes, IFNULL(i.tertiaryCBox_MedicareSupplementNo, 0) AS tertiaryCBox_MedicareSupplementNo, IFNULL(i.tertiaryCBox_CoordinateBenefitsYes, 0) AS tertiaryCBox_CoordinateBenefitsYes, IFNULL(i.tertiaryCBox_CoordinateBenefitsNo, 0) AS tertiaryCBox_CoordinateBenefitsNo, IFNULL(i.tertiaryCBox_PaidMedicareDeductibleYes, 0) AS tertiaryCBox_PaidMedicareDeductibleYes, IFNULL(i.tertiaryCBox_PaidMedicareDeductibleNo, 0) AS tertiaryCBox_PaidMedicareDeductibleNo, i.tertiaryVerificationTypeBasePlanTBox, IFNULL(i.tertiaryCBox_VerificationMedicaidPlanMQMB, 0) AS tertiaryCBox_VerificationMedicaidPlanMQMB, IFNULL(i.tertiaryCBox_VerificationMedicaidPlanQMB, 0) AS tertiaryCBox_VerificationMedicaidPlanQMB, IFNULL(tertiaryCBox_VerificationMedicaidPlanTraditional, 0) AS tertiaryCBox_VerificationMedicaidPlanTraditional, i.primaryFaxNumberTBox, i.primarySendToAddress1TBox, i.primarySendToAddress2TBox, i.primarySendToCityTBox, i.primarySendToStateTBox, i.primarySendToZipCodeTBox, i.secondaryFaxNumberTBox, i.secondarySendToAddress1TBox, i.secondarySendToAddress2TBox, i.secondarySendToCityTBox, i.secondarySendToStateTBox, i.secondarySendToZipCodeTBox, i.tertiaryFaxNumberTBox, i.tertiarySendToAddress1TBox, i.tertiarySendToAddress2TBox, i.tertiarySendToCityTBox, i.tertiarySendToStateTBox, i.tertiarySendToZipCodeTBox, i.active, i.closingInvoiceNumber,
		ih.hcpcCode1TBox, ih.hcpcQty1TBox, ih.hcpcProduct1TBox, ih.hcpcCost1TBox, ih.hcpcDX1TBox, ih.hcpcDiagnosis1TBox, ih.hcpcLengthOfNeedYear1TBox, ih.hcpcLengthOfNeedMonth1TBox, ih.hcpcCode2TBox, ih.hcpcQty2TBox, ih.hcpcProduct2TBox, ih.hcpcCost2TBox, ih.hcpcDX2TBox, ih.hcpcDiagnosis2TBox, ih.hcpcLengthOfNeedYear2TBox, ih.hcpcLengthOfNeedMonth2TBox, ih.hcpcCode3TBox, ih.hcpcQty3TBox, ih.hcpcProduct3TBox, ih.hcpcCost3TBox, ih.hcpcDX3TBox, ih.hcpcDiagnosis3TBox, ih.hcpcLengthOfNeedYear3TBox, ih.hcpcLengthOfNeedMonth3TBox, ih.hcpcCode4TBox, ih.hcpcQty4TBox, ih.hcpcProduct4TBox, ih.hcpcCost4TBox, ih.hcpcDX4TBox, ih.hcpcDiagnosis4TBox, ih.hcpcLengthOfNeedYear4TBox, ih.hcpcLengthOfNeedMonth4TBox, ih.hcpcCode5TBox, ih.hcpcQty5TBox, ih.hcpcProduct5TBox, ih.hcpcCost5TBox, ih.hcpcDX5TBox, ih.hcpcDiagnosis5TBox, ih.hcpcLengthOfNeedYear5TBox, ih.hcpcLengthOfNeedMonth5TBox, ih.hcpcCode6TBox, ih.hcpcQty6TBox, ih.hcpcProduct6TBox, ih.hcpcCost6TBox, ih.hcpcDX6TBox, ih.hcpcDiagnosis6TBox, ih.hcpcLengthOfNeedYear6TBox, ih.hcpcLengthOfNeedMonth6TBox, ih.hcpcCode7TBox, ih.hcpcQty7TBox, ih.hcpcProduct7TBox, ih.hcpcCost7TBox, ih.hcpcDX7TBox, ih.hcpcDiagnosis7TBox, ih.hcpcLengthOfNeedYear7TBox, ih.hcpcLengthOfNeedMonth7TBox, ih.hcpcCode8TBox, ih.hcpcQty8TBox, ih.hcpcProduct8TBox, ih.hcpcCost8TBox, ih.hcpcDX8TBox, ih.hcpcDiagnosis8TBox, ih.hcpcLengthOfNeedYear8TBox, ih.hcpcLengthOfNeedMonth8TBox, ih.hcpcCode9TBox, ih.hcpcQty9TBox, ih.hcpcProduct9TBox, ih.hcpcCost9TBox, ih.hcpcDX9TBox, ih.hcpcDiagnosis9TBox, ih.hcpcLengthOfNeedYear9TBox, ih.hcpcLengthOfNeedMonth9TBox, ih.hcpcCode10TBox, ih.hcpcQty10TBox, ih.hcpcProduct10TBox, ih.hcpcCost10TBox, ih.hcpcDX10TBox, ih.hcpcDiagnosis10TBox, ih.hcpcLengthOfNeedYear10TBox, ih.hcpcLengthOfNeedMonth10TBox, ih.hcpcCode11TBox, ih.hcpcQty11TBox, ih.hcpcProduct11TBox, ih.hcpcCost11TBox, ih.hcpcDX11TBox, ih.hcpcDiagnosis11TBox, ih.hcpcLengthOfNeedYear11TBox, ih.hcpcLengthOfNeedMonth11TBox, ih.hcpcCode12TBox, ih.hcpcQty12TBox, ih.hcpcProduct12TBox, ih.hcpcCost12TBox, ih.hcpcDX12TBox, ih.hcpcDiagnosis12TBox, ih.hcpcLengthOfNeedYear12TBox, ih.hcpcLengthOfNeedMonth12TBox, ih.hcpcCode13TBox, ih.hcpcQty13TBox, ih.hcpcProduct13TBox, ih.hcpcCost13TBox, ih.hcpcDX13TBox, ih.hcpcDiagnosis13TBox, ih.hcpcLengthOfNeedYear13TBox, ih.hcpcLengthOfNeedMonth13TBox, ih.hcpcCode14TBox, ih.hcpcQty14TBox, ih.hcpcProduct14TBox, ih.hcpcCost14TBox, ih.hcpcDX14TBox, ih.hcpcDiagnosis14TBox, ih.hcpcLengthOfNeedYear14TBox, ih.hcpcLengthOfNeedMonth14TBox, ih.hcpcCode15TBox, ih.hcpcQty15TBox, ih.hcpcProduct15TBox, ih.hcpcCost15TBox, ih.hcpcDX15TBox, ih.hcpcDiagnosis15TBox, ih.hcpcLengthOfNeedYear15TBox, ih.hcpcLengthOfNeedMonth15TBox, ih.hcpcCode16TBox, ih.hcpcQty16TBox, ih.hcpcProduct16TBox, ih.hcpcCost16TBox, ih.hcpcDX16TBox, ih.hcpcDiagnosis16TBox, ih.hcpcLengthOfNeedYear16TBox, ih.hcpcLengthOfNeedMonth16TBox, ih.hcpcCode17TBox, ih.hcpcQty17TBox, ih.hcpcProduct17TBox, ih.hcpcCost17TBox, ih.hcpcDX17TBox, ih.hcpcDiagnosis17TBox, ih.hcpcLengthOfNeedYear17TBox, ih.hcpcLengthOfNeedMonth17TBox, ih.hcpcCode18TBox, ih.hcpcQty18TBox, ih.hcpcProduct18TBox, ih.hcpcCost18TBox, ih.hcpcDX18TBox, ih.hcpcDiagnosis18TBox, ih.hcpcLengthOfNeedYear18TBox, ih.hcpcLengthOfNeedMonth18TBox, ih.hcpcCode19TBox, ih.hcpcQty19TBox, ih.hcpcProduct19TBox, ih.hcpcCost19TBox, ih.hcpcDX19TBox, ih.hcpcDiagnosis19TBox, ih.hcpcLengthOfNeedYear19TBox, ih.hcpcLengthOfNeedMonth19TBox, ih.hcpcCode20TBox, ih.hcpcQty20TBox, ih.hcpcProduct20TBox, ih.hcpcCost20TBox, ih.hcpcDX20TBox, ih.hcpcDiagnosis20TBox, ih.hcpcLengthOfNeedYear20TBox, ih.hcpcLengthOfNeedMonth20TBox, ih.hcpcCode21TBox, ih.hcpcQty21TBox, ih.hcpcProduct21TBox, ih.hcpcCost21TBox, ih.hcpcDX21TBox, ih.hcpcDiagnosis21TBox, ih.hcpcLengthOfNeedYear21TBox, ih.hcpcLengthOfNeedMonth21TBox, ih.hcpcCode22TBox, ih.hcpcQty22TBox, ih.hcpcProduct22TBox, ih.hcpcCost22TBox, ih.hcpcDX22TBox, ih.hcpcDiagnosis22TBox, ih.hcpcLengthOfNeedYear22TBox, ih.hcpcLengthOfNeedMonth22TBox, ih.hcpcCode23TBox, ih.hcpcQty23TBox, ih.hcpcProduct23TBox, ih.hcpcCost23TBox, ih.hcpcDX23TBox, ih.hcpcDiagnosis23TBox, ih.hcpcLengthOfNeedYear23TBox, ih.hcpcLengthOfNeedMonth23TBox, ih.hcpcCode24TBox, ih.hcpcQty24TBox, ih.hcpcProduct24TBox, ih.hcpcCost24TBox, ih.hcpcDX24TBox, ih.hcpcDiagnosis24TBox, ih.hcpcLengthOfNeedYear24TBox, ih.hcpcLengthOfNeedMonth24TBox, ih.hcpcCode25TBox, ih.hcpcQty25TBox, ih.hcpcProduct25TBox, ih.hcpcCost25TBox, ih.hcpcDX25TBox, ih.hcpcDiagnosis25TBox, ih.hcpcLengthOfNeedYear25TBox, ih.hcpcLengthOfNeedMonth25TBox, ih.hcpcCode26TBox, ih.hcpcQty26TBox, ih.hcpcProduct26TBox, ih.hcpcCost26TBox, ih.hcpcDX26TBox, ih.hcpcDiagnosis26TBox, ih.hcpcLengthOfNeedYear26TBox, ih.hcpcLengthOfNeedMonth26TBox, ih.hcpcCode27TBox, ih.hcpcQty27TBox, ih.hcpcProduct27TBox, ih.hcpcCost27TBox, ih.hcpcDX27TBox, ih.hcpcDiagnosis27TBox, ih.hcpcLengthOfNeedYear27TBox, ih.hcpcLengthOfNeedMonth27TBox, ih.hcpcCode28TBox, ih.hcpcQty28TBox, ih.hcpcProduct28TBox, ih.hcpcCost28TBox, ih.hcpcDX28TBox, ih.hcpcDiagnosis28TBox, ih.hcpcLengthOfNeedYear28TBox, ih.hcpcLengthOfNeedMonth28TBox, ih.hcpcCode29TBox, ih.hcpcQty29TBox, ih.hcpcProduct29TBox, ih.hcpcCost29TBox, ih.hcpcDX29TBox, ih.hcpcDiagnosis29TBox, ih.hcpcLengthOfNeedYear29TBox, ih.hcpcLengthOfNeedMonth29TBox, ih.hcpcCode30TBox, ih.hcpcQty30TBox, ih.hcpcProduct30TBox, ih.hcpcCost30TBox, ih.hcpcDX30TBox, ih.hcpcDiagnosis30TBox, ih.hcpcLengthOfNeedYear30TBox, ih.hcpcLengthOfNeedMonth30TBox, ih.hcpcCode31TBox, ih.hcpcQty31TBox, ih.hcpcProduct31TBox, ih.hcpcCost31TBox, ih.hcpcDX31TBox, ih.hcpcDiagnosis31TBox, ih.hcpcLengthOfNeedYear31TBox, ih.hcpcLengthOfNeedMonth31TBox, ih.hcpcCode32TBox, ih.hcpcQty32TBox, ih.hcpcProduct32TBox, ih.hcpcCost32TBox, ih.hcpcDX32TBox, ih.hcpcDiagnosis32TBox, ih.hcpcLengthOfNeedYear32TBox, ih.hcpcLengthOfNeedMonth32TBox, ih.hcpcCode33TBox, ih.hcpcQty33TBox, ih.hcpcProduct33TBox, ih.hcpcCost33TBox, ih.hcpcDX33TBox, ih.hcpcDiagnosis33TBox, ih.hcpcLengthOfNeedYear33TBox, ih.hcpcLengthOfNeedMonth33TBox, ih.hcpcCode34TBox, ih.hcpcQty34TBox, ih.hcpcProduct34TBox, ih.hcpcCost34TBox, ih.hcpcDX34TBox, ih.hcpcDiagnosis34TBox, ih.hcpcLengthOfNeedYear34TBox, ih.hcpcLengthOfNeedMonth34TBox, ih.hcpcCode35TBox, ih.hcpcQty35TBox, ih.hcpcProduct35TBox, ih.hcpcCost35TBox, ih.hcpcDX35TBox, ih.hcpcDiagnosis35TBox, ih.hcpcLengthOfNeedYear35TBox, ih.hcpcLengthOfNeedMonth35TBox, ih.hcpcCode36TBox, ih.hcpcQty36TBox, ih.hcpcProduct36TBox, ih.hcpcCost36TBox, ih.hcpcDX36TBox, ih.hcpcDiagnosis36TBox, ih.hcpcLengthOfNeedYear36TBox, ih.hcpcLengthOfNeedMonth36TBox, ih.hcpcCode37TBox, ih.hcpcQty37TBox, ih.hcpcProduct37TBox, ih.hcpcCost37TBox, ih.hcpcDX37TBox, ih.hcpcDiagnosis37TBox, ih.hcpcLengthOfNeedYear37TBox, ih.hcpcLengthOfNeedMonth37TBox, ih.hcpcCode38TBox, ih.hcpcQty38TBox, ih.hcpcProduct38TBox, ih.hcpcCost38TBox, ih.hcpcDX38TBox, ih.hcpcDiagnosis38TBox, ih.hcpcLengthOfNeedYear38TBox, ih.hcpcLengthOfNeedMonth38TBox, ih.hcpcCode39TBox, ih.hcpcQty39TBox, ih.hcpcProduct39TBox, ih.hcpcCost39TBox, ih.hcpcDX39TBox, ih.hcpcDiagnosis39TBox, ih.hcpcLengthOfNeedYear39TBox, ih.hcpcLengthOfNeedMonth39TBox, ih.hcpcCode40TBox, ih.hcpcQty40TBox, ih.hcpcProduct40TBox, ih.hcpcCost40TBox, ih.hcpcDX40TBox, ih.hcpcDiagnosis40TBox, ih.hcpcLengthOfNeedYear40TBox, ih.hcpcLengthOfNeedMonth40TBox
		FROM intake i INNER JOIN intakehcpc ih ON i.intakeID = ih.IntakeID
		</cfquery>


<cfoutput>

<cfloop list="#qGetIntake.ColumnList#" index="i">
	IF(qGetIntake.#trim(i)# EQ "" OR qGetIntake.#trim(i)# EQ "NULL")<br>
				variables.instance.#trim(i)# = "NULL";<br>
			ELSE<br>
				variables.instance.#trim(i)# = qGetIntake.#trim(i)#;<br><br>
</cfloop>


</cfoutput>



--->












<cfoutput>

<!---
	<cfloop from="1" to="40" index="i">
		ih.hcpcCode#trim(i)#TBox, ih.hcpcQty#trim(i)#TBox, ih.hcpcProduct#trim(i)#TBox, ih.hcpcCost#trim(i)#TBox, ih.hcpcDX#trim(i)#TBox, ih.hcpcDiagnosis#trim(i)#TBox, ih.hcpcLengthOfNeedYear#trim(i)#TBox, ih.hcpcLengthOfNeedMonth#trim(i)#TBox,
	</cfloop>
--->



	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif trim(hcpcCode#trim(i)#TBox) NEQ "" OR trim(hcpcQty#trim(i)#TBox) NEQ "" OR trim(hcpcProduct#trim(i)#TBox) NEQ "" OR trim(hcpcCost#trim(i)#TBox) NEQ "" OR trim(hcpcDX#trim(i)#TBox) NEQ "" OR trim(hcpcDiagnosis#trim(i)#TBox) NEQ ""&gt;<br>
		&lt;cfset visibility#trim(i)# = "inline"&gt;<br>
		&lt;cfelse&gt;<br>
		&lt;cfset visibility#trim(i)# = "none"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;tr id="tr_hcpc#trim(i)#" style="display: '##trim(visibility#trim(i)#)##';"&gt;<br>
		&lt;td id="td_hcpcCode#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"&gt;&lt;cfif trim(hcpcCode#trim(i)#TBox) NEQ ""&gt;##trim(hcpcCode#trim(i)#TBox)##&lt;cfelse&gt;&nbsp;&lt;/cfif&gt;&lt;/td&gt;<br>
		&lt;td id="td_hcpcQty#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;cfif trim(hcpcQty#trim(i)#TBox) NEQ ""&gt;##trim(hcpcQty#trim(i)#TBox)##&lt;cfelse&gt;&nbsp;&lt;/cfif&gt;&lt;/td&gt;<br>
		&lt;td id="td_hcpcProduct#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;cfif trim(hcpcProduct#trim(i)#TBox) NEQ ""&gt;##trim(hcpcProduct#trim(i)#TBox)##&lt;cfelse&gt;&nbsp;&lt;/cfif&gt;&lt;/td&gt;<br>
		&lt;td id="td_hcpcCost#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;cfif trim(hcpcCost#trim(i)#TBox) NEQ ""&gt;##trim(hcpcCost#trim(i)#TBox)##&lt;cfelse&gt;&nbsp;&lt;/cfif&gt;&lt;/td&gt;<br>
		&lt;td id="td_hcpcDX#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;cfif trim(hcpcDX#trim(i)#TBox) NEQ ""&gt;##trim(hcpcDX#trim(i)#TBox)##&lt;cfelse&gt;&nbsp;&lt;/cfif&gt;&lt;/td&gt;<br>
		&lt;td id="td_hcpcDiagnosis#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;cfif trim(hcpcDiagnosis#trim(i)#TBox) NEQ ""&gt;##trim(hcpcDiagnosis#trim(i)#TBox)##&lt;cfelse&gt;&nbsp;&lt;/cfif&gt;&lt;/td&gt;<br>
		&lt;td id="td_hcpcLengthOfNeed#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;##trim(hcpcLengthOfNeedYear#trim(i)#TBox)## &lt;cfif trim(hcpcLengthOfNeedYear#trim(i)#TBox) NEQ ""&gt;y&lt;/cfif&gt; ##trim(hcpcLengthOfNeedMonth#trim(i)#TBox)## &lt;cfif trim(hcpcLengthOfNeedMonth#trim(i)#TBox) NEQ ""&gt;m&lt;/cfif&gt;&lt;/td&gt;<br>
		&lt;/tr&gt;<br>
	</cfloop>
--->
	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif trim(hcpcCode#trim(i)#TBox) NEQ "" OR trim(hcpcQty#trim(i)#TBox) NEQ "" OR trim(hcpcProduct#trim(i)#TBox) NEQ "" OR trim(hcpcCost#trim(i)#TBox) NEQ "" OR trim(hcpcDX#trim(i)#TBox) NEQ "" OR trim(hcpcDiagnosis#trim(i)#TBox) NEQ ""&gt;<br>
			&lt;cfset visibility#trim(i)# = "inline"&gt;<br>
				&lt;cfelse&gt;<br>
			&lt;cfset visibility#trim(i)# = "none"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;tr id="tr_hcpc#trim(i)#" style="display: '##trim(visibility#trim(i)#)##';"&gt;<br>
			&lt;td id="td_hcpcCode#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;"&gt;##trim(hcpcCode#trim(i)#TBox)##&lt;/td&gt;<br>
			&lt;td id="td_hcpcQty#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"&gt;##trim(hcpcQty#trim(i)#TBox)##&lt;/td&gt;<br>
			&lt;td id="td_hcpcProduct#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"&gt;##trim(hcpcProduct#trim(i)#TBox)##&lt;/td&gt;<br>
			&lt;td id="td_hcpcCost#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"&gt;##trim(hcpcCost#trim(i)#TBox)##&lt;/td&gt;<br>
			&lt;td id="td_hcpcDX#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"&gt;##trim(hcpcDX#trim(i)#TBox)##&lt;/td&gt;<br>
			&lt;td id="td_hcpcDiagnosis#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"&gt;##trim(hcpcDiagnosis#trim(i)#TBox)##&lt;/td&gt;<br>
			&lt;td id="td_hcpcLengthOfNeed#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"&gt;##trim(hcpcLengthOfNeedYear#trim(i)#TBox)##&nbsp;y&nbsp;##trim(hcpcLengthOfNeedMonth#trim(i)#TBox)##&nbsp;m&lt;/td&gt;<br>
		&lt;/tr&gt;<br>
	</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif IsDefined("form.HCPCCODE#trim(i)#TBOX")&gt;,HCPCCODE#trim(i)#TBOX = &lt;cfif form.HCPCCODE#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCCOST#trim(i)#TBOX")&gt;,HCPCCOST#trim(i)#TBOX = &lt;cfif form.HCPCCOST#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCDIAGNOSIS#trim(i)#TBOX")&gt;,HCPCDIAGNOSIS#trim(i)#TBOX = &lt;cfif form.HCPCDIAGNOSIS#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCDX#trim(i)#TBOX")&gt;,HCPCDX#trim(i)#TBOX = &lt;cfif form.HCPCDX#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX#trim(i)#TBOX))##'&lt;cfelse>NULL&lt;/cfif>&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCPRODUCT#trim(i)#TBOX")&gt;,HCPCPRODUCT#trim(i)#TBOX = &lt;cfif form.HCPCPRODUCT#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCQTY#trim(i)#TBOX")&gt;,HCPCQTY#trim(i)#TBOX = &lt;cfif form.HCPCQTY#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcLengthOfNeedYear#trim(i)#TBOX")&gt;,hcpcLengthOfNeedYear#trim(i)#TBOX = &lt;cfif form.hcpcLengthOfNeedYear#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcLengthOfNeedMonth#trim(i)#TBOX")&gt;,hcpcLengthOfNeedMonth#trim(i)#TBOX = &lt;cfif form.hcpcLengthOfNeedMonth#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
	</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif trim(hcpcCode#trim(i)#TBox) NEQ "" OR trim(hcpcQty#trim(i)#TBox) NEQ "" OR trim(hcpcProduct#trim(i)#TBox) NEQ "" OR trim(hcpcCost#trim(i)#TBox) NEQ "" OR trim(hcpcDX#trim(i)#TBox) NEQ "" OR trim(hcpcDiagnosis#trim(i)#TBox) NEQ ""&gt;<br>
		&lt;cfset visibility#trim(i)# = "inline"&gt;<br>
		&lt;cfelse&gt;<br>
		&lt;cfset visibility#trim(i)# = "none"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;tr id="tr_hcpc#trim(i)#" style="display: '##trim(visibility#trim(i)#)##';"&gt;<br>
			&lt;td id="td_hcpcCode#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"&gt;&lt;input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode#trim(i)#TBox" value="##trim(hcpcCode#trim(i)#TBox)##" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct#trim(i)#TBox', 'hcpcQty#trim(i)#TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct#trim(i)#TBox')"&gt;&lt;/td&gt;<br>
			&lt;td id="td_hcpcQty#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty#trim(i)#TBox" value="##trim(hcpcQty#trim(i)#TBox)##" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"&gt;&lt;/td&gt;<br>
			&lt;td id="td_hcpcProduct#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="72" type="Text" size="35" maxlength="35" name="hcpcProduct#trim(i)#TBox" value="##trim(hcpcProduct#trim(i)#TBox)##" class="siteTextBox"&gt;&lt;/td&gt;<br>
			&lt;td id="td_hcpcCost#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost#trim(i)#TBox" value="##trim(hcpcCost#trim(i)#TBox)##" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"&gt;&lt;/td&gt;<br>
			&lt;td id="td_hcpcDX#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX#trim(i)#TBox" value="##trim(hcpcDX#trim(i)#TBox)##" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis#trim(i)#TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis#trim(i)#TBox')"&gt;&lt;/td&gt;<br>
			&lt;td id="td_hcpcDiagnosis#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis#trim(i)#TBox" value="##trim(hcpcDiagnosis#trim(i)#TBox)##" class="siteTextBox"&gt;&lt;/td&gt;<br>
			&lt;td id="td_hcpcLengthOfNeed#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear#trim(i)#TBox" value="##trim(hcpcLengthOfNeedYear#trim(i)#TBox)##" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"&gt;&nbsp;y&nbsp;&lt;input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth#trim(i)#TBox" value="##trim(hcpcLengthOfNeedMonth#trim(i)#TBox)##" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px">&nbsp;m&lt;/td><br>
		&lt;/tr&gt;<br>
	</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		&lt;cfparam name="attributes.hcpcCode#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcCode#trim(i)#TBox = attributes.hcpcCode#trim(i)#TBox&gt;<br><br>
		&lt;cfparam name="attributes.hcpcQty#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcQty#trim(i)#TBox = attributes.hcpcQty#trim(i)#TBox&gt;<br><br>
		&lt;cfparam name="attributes.hcpcProduct#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcProduct#trim(i)#TBox = attributes.hcpcProduct#trim(i)#TBox&gt;<br><br>
		&lt;cfparam name="attributes.hcpcCost#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcCost#trim(i)#TBox = attributes.hcpcCost#trim(i)#TBox&gt;<br><br>
		&lt;cfparam name="attributes.hcpcDX#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcDX#trim(i)#TBox = attributes.hcpcDX#trim(i)#TBox&gt;<br><br>
		&lt;cfparam name="attributes.hcpcDiagnosis#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcDiagnosis#trim(i)#TBox = attributes.hcpcDiagnosis#trim(i)#TBox&gt;<br><br>
		&lt;cfparam name="attributes.hcpcLengthOfNeedYear#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcLengthOfNeedYear#trim(i)#TBox = attributes.hcpcLengthOfNeedYear#trim(i)#TBox&gt;<br><br>
		&lt;cfparam name="attributes.hcpcLengthOfNeedMonth#trim(i)#TBox" default=""&gt;<br>
		&lt;cfset hcpcLengthOfNeedMonth#trim(i)#TBox = attributes.hcpcLengthOfNeedMonth#trim(i)#TBox&gt;<br><br>
	</cfloop>--->




	<!---<cfloop from="1" to="40" index="i">
		hcpcCode#trim(i)#TBox="##request.QuoteHCPC.gethcpcCode#trim(i)#TBox()##"<br>
		hcpcQty#trim(i)#TBox="##request.QuoteHCPC.gethcpcQty#trim(i)#TBox()##"<br>
		hcpcProduct#trim(i)#TBox="##request.QuoteHCPC.gethcpcProduct#trim(i)#TBox()##"<br>
		hcpcCost#trim(i)#TBox="##request.QuoteHCPC.gethcpcCost#trim(i)#TBox()##"<br>
		hcpcDX#trim(i)#TBox="##request.QuoteHCPC.gethcpcDX#trim(i)#TBox()##"<br>
		hcpcDiagnosis#trim(i)#TBox="##request.QuoteHCPC.gethcpcDiagnosis#trim(i)#TBox()##"<br>
		hcpcLengthOfNeedYear#trim(i)#TBox="##request.QuoteHCPC.gethcpcLengthOfNeedYear#trim(i)#TBox()##"<br>
		hcpcLengthOfNeedMonth#trim(i)#TBox="##request.QuoteHCPC.gethcpcLengthOfNeedMonth#trim(i)#TBox()##"<br>
	</cfloop>--->

	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif IsDefined("form.hcpcCost#trim(i)#TBox") AND form.hcpcCost#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost#trim(i)#TBox))##'&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcCode#trim(i)#TBox") AND form.hcpcCode#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode#trim(i)#TBox))##'&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcQty#trim(i)#TBox") AND form.hcpcQty#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty#trim(i)#TBox))##'&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcProduct#trim(i)#TBox") AND form.hcpcProduct#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct#trim(i)#TBox))##'&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcDX#trim(i)#TBox") AND form.hcpcDX#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX#trim(i)#TBox))##'&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcDiagnosis#trim(i)#TBox") AND form.hcpcDiagnosis#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis#trim(i)#TBox))##'&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcLengthOfNeedYear#trim(i)#TBox") AND form.hcpcLengthOfNeedYear#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear#trim(i)#TBox))##'&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcLengthOfNeedMonth#trim(i)#TBox") AND form.hcpcLengthOfNeedMonth#trim(i)#TBox NEQ ""&gt;,'##REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth#trim(i)#TBox))##'&lt;/cfif&gt;<br>
	</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif IsDefined("form.hcpcCost#trim(i)#TBox") AND form.hcpcCost#trim(i)#TBox NEQ ""&gt;,hcpcCost#trim(i)#TBox&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcCode#trim(i)#TBox") AND form.hcpcCode#trim(i)#TBox NEQ ""&gt;,hcpcCode#trim(i)#TBox&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcQty#trim(i)#TBox") AND form.hcpcQty#trim(i)#TBox NEQ ""&gt;,hcpcQty#trim(i)#TBox&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcProduct#trim(i)#TBox") AND form.hcpcProduct#trim(i)#TBox NEQ ""&gt;,hcpcProduct#trim(i)#TBox&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcDX#trim(i)#TBox") AND form.hcpcDX#trim(i)#TBox NEQ ""&gt;,hcpcDX#trim(i)#TBox&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcDiagnosis#trim(i)#TBox") AND form.hcpcDiagnosis#trim(i)#TBox NEQ ""&gt;,hcpcDiagnosis#trim(i)#TBox&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcLengthOfNeedYear#trim(i)#TBox") AND form.hcpcLengthOfNeedYear#trim(i)#TBox NEQ ""&gt;,hcpcLengthOfNeedYear#trim(i)#TBox&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.hcpcLengthOfNeedMonth#trim(i)#TBox") AND form.hcpcLengthOfNeedMonth#trim(i)#TBox NEQ ""&gt;,hcpcLengthOfNeedMonth#trim(i)#TBox&lt;/cfif&gt;<br>
	</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif IsDefined("form.HCPCCODE#trim(i)#TBOX")&gt;,HCPCCODE#trim(i)#TBOX = &lt;cfif form.HCPCCODE#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCCOST#trim(i)#TBOX")&gt;,HCPCCOST#trim(i)#TBOX = &lt;cfif form.HCPCCOST#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCDIAGNOSIS#trim(i)#TBOX")&gt;,HCPCDIAGNOSIS#trim(i)#TBOX = &lt;cfif form.HCPCDIAGNOSIS#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCDX#trim(i)#TBOX")&gt;,HCPCDX#trim(i)#TBOX = &lt;cfif form.HCPCDX#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX#trim(i)#TBOX))##'&lt;cfelse>NULL&lt;/cfif>&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCPRODUCT#trim(i)#TBOX")&gt;,HCPCPRODUCT#trim(i)#TBOX = &lt;cfif form.HCPCPRODUCT#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCQTY#trim(i)#TBOX")&gt;,HCPCQTY#trim(i)#TBOX = &lt;cfif form.HCPCQTY#trim(i)#TBOX NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY#trim(i)#TBOX))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
	</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		&lt;cfif IsDefined("form.HCPCCODE#trim(i)#TBOX") AND getQuote.HCPCCODE#trim(i)#TBOX NEQ form.HCPCCODE#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC CODE #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getQuote.HCPCCODE#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCCODE#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCDIAGNOSIS#trim(i)#TBOX") AND getQuote.HCPCDIAGNOSIS#trim(i)#TBOX NEQ form.HCPCDIAGNOSIS#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC DIAGNOSIS #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getQuote.HCPCDIAGNOSIS#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCDIAGNOSIS#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCDX#trim(i)#TBOX") AND getQuote.HCPCDX#trim(i)#TBOX NEQ form.HCPCDX#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC DX #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getQuote.HCPCDX#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCDX#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCPRODUCT#trim(i)#TBOX") AND getQuote.HCPCPRODUCT#trim(i)#TBOX NEQ form.HCPCPRODUCT#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC PRODUCT #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getQuote.HCPCPRODUCT#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCPRODUCT#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCQTY#trim(i)#TBOX") AND getQuote.HCPCQTY#trim(i)#TBOX NEQ form.HCPCQTY#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC QUANTITY #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getQuote.HCPCQTY#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCQTY#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCCOST#trim(i)#TBOX") AND getQuote.HCPCCOST#trim(i)#TBOX NEQ form.HCPCCOST#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC COST #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getQuote.HCPCCOST#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCCOST#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCLENGTHOFNEEDMONTH#trim(i)#TBOX") AND getIntake.HCPCLENGTHOFNEEDMONTH#trim(i)#TBOX NEQ form.HCPCLENGTHOFNEEDMONTH#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC LENGTH OF NEED MONTH #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getIntake.HCPCLENGTHOFNEEDMONTH#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCLENGTHOFNEEDMONTH#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		&lt;cfif IsDefined("form.HCPCLENGTHOFNEEDYEAR#trim(i)#TBOX") AND getIntake.HCPCLENGTHOFNEEDYEAR#trim(i)#TBOX NEQ form.HCPCLENGTHOFNEEDYEAR#trim(i)#TBOX&gt;<br>
			&lt;cfset note = note & "HCPC LENGTH OF NEED YEAR #trim(i)# changed from &lt;strong&gt;[&lt;/strong&gt;##getIntake.HCPCLENGTHOFNEEDYEAR#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.HCPCLENGTHOFNEEDYEAR#trim(i)#TBOX##&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
	</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		hcpcCode#trim(i)#TBox="##trim(getQuote.hcpcCode#trim(i)#TBox)##"<br>
		hcpcQty#trim(i)#TBox="##trim(getQuote.hcpcQty#trim(i)#TBox)##"<br>
		hcpcProduct#trim(i)#TBox="##trim(getQuote.hcpcProduct#trim(i)#TBox)##"<br>
		hcpcDX#trim(i)#TBox="##trim(getQuote.hcpcDX#trim(i)#TBox)##"<br>
		hcpcDiagnosis#trim(i)#TBox="##trim(getQuote.hcpcDiagnosis#trim(i)#TBox)##"<br>
		hcpcCost#trim(i)#TBox="##trim(getQuote.hcpcCost#trim(i)#TBox)##"<br>
		hcpcLengthOfNeedYear#trim(i)#TBox="##trim(getQuote.hcpcLengthOfNeedYear#trim(i)#TBox)##" <br>
		hcpcLengthOfNeedMonth#trim(i)#TBox="##trim(getQuote.hcpcLengthOfNeedMonth#trim(i)#TBox)##"<br>
	</cfloop>--->

	<!---<cfloop from="1" to="40" index="i">
		qh.hcpcCode#trim(i)#TBox,
		qh.hcpcQty#trim(i)#TBox,
		qh.hcpcProduct#trim(i)#TBox,
		qh.hcpcDX#trim(i)#TBox,
		qh.hcpcDiagnosis#trim(i)#TBox,
		qh.hcpcCost#trim(i)#TBox,
		qh.hcpcLengthOfNeedYear#trim(i)#TBox,
		qh.hcpcLengthOfNeedMonth#trim(i)#TBox,
	</cfloop>--->

	<!---<cfloop from="1" to="10" index="i">
		&lt;cfif hcpcCode#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcCode#trim(i)#TBox)##'&lt;/cfif&gt;,
		&lt;cfif hcpcQty#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcQty#trim(i)#TBox)##'&lt;/cfif&gt;,
		&lt;cfif hcpcProduct#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcProduct#trim(i)#TBox)##'&lt;/cfif&gt;,
		&lt;cfif hcpcDX#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcDX#trim(i)#TBox)##'&lt;/cfif&gt;,
		&lt;cfif hcpcDiagnosis#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcDiagnosis#trim(i)#TBox)##'&lt;/cfif&gt;,
		&lt;cfif hcpcCost#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcCost#trim(i)#TBox)##'&lt;/cfif&gt;,
		&lt;cfif hcpcLengthOfNeedYear#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcLengthOfNeedYear#trim(i)#TBox)##'&lt;/cfif&gt;,
		&lt;cfif hcpcLengthOfNeedMonth#trim(i)#TBox EQ ""&gt;NULL&lt;cfelse&gt;'##trim(hcpcLengthOfNeedMonth#trim(i)#TBox)##'&lt;/cfif&gt;,
	</cfloop>--->



	<!---<cfloop from="1" to="40" index="i">
	&lt;cfparam name="attributes.hcpcCode#trim(i)#TBox" default=""&gt;<br>
	&lt;cfset hcpcCode#trim(i)#TBox = attributes.hcpcCode#trim(i)#TBox&gt;<br><br>

	&lt;cfparam name="attributes.hcpcQty#trim(i)#TBox" default=""&gt;<br>
	&lt;cfset hcpcQty#trim(i)#TBox = attributes.hcpcQty#trim(i)#TBox&gt;<br><br>

	&lt;cfparam name="attributes.hcpcProduct#trim(i)#TBox" default=""&gt;<br>
	&lt;cfset hcpcProduct#trim(i)#TBox = attributes.hcpcProduct#trim(i)#TBox&gt;<br><br>

	&lt;cfparam name="attributes.hcpcCost#trim(i)#TBox" default=""&gt;<br>
	&lt;cfset hcpcCost#trim(i)#TBox = attributes.hcpcCost#trim(i)#TBox&gt;<br><br>

	&lt;cfparam name="attributes.hcpcDX#trim(i)#TBox" default=""&gt;<br>
	&lt;cfset hcpcDX#trim(i)#TBox = attributes.hcpcDX#trim(i)#TBox&gt;<br><br>

	&lt;cfparam name="attributes.hcpcDiagnosis#trim(i)#TBox" default=""&gt;<br>
	&lt;cfset hcpcDiagnosis#trim(i)#TBox = attributes.hcpcDiagnosis#trim(i)#TBox&gt;<br><br>
	</cfloop>--->


		<!---<cfloop from="1" to="40" index="i">
			&lt;cfif trim(hcpcCode#trim(i)#TBox) NEQ "" OR trim(hcpcQty#trim(i)#TBox) NEQ "" OR trim(hcpcProduct#trim(i)#TBox) NEQ "" OR trim(hcpcCost#trim(i)#TBox) NEQ "" OR trim(hcpcDX#trim(i)#TBox) NEQ "" OR trim(hcpcDiagnosis#trim(i)#TBox) NEQ ""&gt;<br>
				&lt;cfset visibility#i# = "inline"&gt;<br>
			&lt;cfelse&gt;	<br>
				&lt;cfset visibility#i# = "none"&gt;<br>
			&lt;/cfif&gt;		<br>
			&lt;tr id="tr_hcpc#trim(i)#" style="display: '##trim(visibility#i#)##';"&gt;<br>
			    &lt;td id="td_hcpcCode#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"&gt;&lt;input tabindex="90" type="Text" size="7" maxlength="7" name="hcpcCode#trim(i)#TBox" value="##trim(hcpcCode#trim(i)#TBox)##" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct#trim(i)#TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct#trim(i)#TBox')"&gt;&lt;/td&gt;<br>
				&lt;td id="td_hcpcQty#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="93" type="Text" size="3" maxlength="3" name="hcpcQty#trim(i)#TBox" value="##trim(hcpcQty#trim(i)#TBox)##" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"&gt;&lt;/td&gt;<br>
				&lt;td id="td_hcpcProduct#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="96" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct#trim(i)#TBox" value="##trim(hcpcProduct#trim(i)#TBox)##" class="siteTextBox"&gt;&lt;/td&gt;<br>
				&lt;td id="td_hcpcCost#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="97" type="Text" size="10" maxlength="10" name="hcpcCost#trim(i)#TBox" value="##trim(hcpcCost#trim(i)#TBox)##" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"&gt;&lt;/td&gt;<br>
				&lt;td id="td_hcpcDX#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="99" type="Text" size="7" maxlength="7" name="hcpcDX#trim(i)#TBox" value="##trim(hcpcDX#trim(i)#TBox)##" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis#trim(i)#TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis#trim(i)#TBox')"&gt;&lt;/td&gt;<br>
				&lt;td id="td_hcpcDiagnosis#trim(i)#TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"&gt;&lt;input tabindex="100" type="Text" size="25" maxlength="35" name="hcpcDiagnosis#trim(i)#TBox" value="##trim(hcpcDiagnosis#trim(i)#TBox)##" class="siteTextBox"&gt;&lt;/td&gt;<br>
			&lt;/tr&gt;<br><br>
		</cfloop>--->


	<!---<cfloop from="1" to="40" index="i">
		[hcpcCode#trim(i)#TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
		[hcpcQty#trim(i)#TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
		[hcpcProduct#trim(i)#TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
		[hcpcDX#trim(i)#TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
		[hcpcDiagnosis#trim(i)#TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
		[hcpcCost#trim(i)#TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
		[hcpcLengthOfNeedYear#trim(i)#TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
		[hcpcLengthOfNeedMonth#trim(i)#TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,<br>
	</cfloop>	--->

</cfoutput>














<!---


<cfquery name="getIntakes" datasource="PAClient_1084">
	SELECT * FROM intake
</cfquery>

<cfloop query="getIntakes">
	<cfquery name="tempIns" datasource="PAClient_1084">
		INSERT INTO intakehcpc (IntakeID, hcpcCode1TBox, hcpcQty1TBox, hcpcProduct1TBox, hcpcDX1TBox, hcpcDiagnosis1TBox, hcpcCost1TBox, hcpcCode2TBox, hcpcQty2TBox, hcpcProduct2TBox, hcpcDX2TBox, hcpcDiagnosis2TBox, hcpcCost2TBox, hcpcCode3TBox, hcpcQty3TBox, hcpcProduct3TBox, hcpcDX3TBox, hcpcDiagnosis3TBox, hcpcCost3TBox, hcpcCode4TBox, hcpcQty4TBox, hcpcProduct4TBox, hcpcDX4TBox, hcpcDiagnosis4TBox,	hcpcCost4TBox, hcpcCode5TBox, hcpcQty5TBox, hcpcProduct5TBox, hcpcDX5TBox, hcpcDiagnosis5TBox,	hcpcCost5TBox, hcpcCode6TBox, hcpcQty6TBox, hcpcProduct6TBox, hcpcDX6TBox, hcpcDiagnosis6TBox, hcpcCost6TBox, hcpcCode7TBox, hcpcQty7TBox, hcpcProduct7TBox, hcpcDX7TBox, hcpcDiagnosis7TBox, hcpcCost7TBox, hcpcCode8TBox, hcpcQty8TBox, hcpcProduct8TBox, hcpcDX8TBox, hcpcDiagnosis8TBox, hcpcCost8TBox, hcpcCode9TBox, hcpcQty9TBox, hcpcProduct9TBox, hcpcDX9TBox, hcpcDiagnosis9TBox, hcpcCost9TBox, hcpcCode10TBox, hcpcQty10TBox, hcpcProduct10TBox, hcpcDX10TBox, hcpcDiagnosis10TBox, hcpcCost10TBox)
		VALUES(#trim(IntakeID)#, <cfif hcpcCode1TBox EQ "">NULL<cfelse>'#trim(hcpcCode1TBox)#'</cfif>, <cfif hcpcQty1TBox EQ "">NULL<cfelse>'#trim(hcpcQty1TBox)#'</cfif>, <cfif hcpcProduct1TBox EQ "">NULL<cfelse>'#trim(hcpcProduct1TBox)#'</cfif>, <cfif hcpcDX1TBox EQ "">NULL<cfelse>'#trim(hcpcDX1TBox)#'</cfif>, <cfif hcpcDiagnosis1TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis1TBox)#'</cfif>, <cfif hcpcCost1TBox EQ "">NULL<cfelse>'#trim(hcpcCost1TBox)#'</cfif>, <cfif hcpcCode2TBox EQ "">NULL<cfelse>'#trim(hcpcCode2TBox)#'</cfif>, <cfif hcpcQty2TBox EQ "">NULL<cfelse>'#trim(hcpcQty2TBox)#'</cfif>, <cfif hcpcProduct2TBox EQ "">NULL<cfelse>'#trim(hcpcProduct2TBox)#'</cfif>, <cfif hcpcDX2TBox EQ "">NULL<cfelse>'#trim(hcpcDX2TBox)#'</cfif>, <cfif hcpcDiagnosis2TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis2TBox)#'</cfif>, <cfif hcpcCost2TBox EQ "">NULL<cfelse>'#trim(hcpcCost2TBox)#'</cfif>, <cfif hcpcCode3TBox EQ "">NULL<cfelse>'#trim(hcpcCode3TBox)#'</cfif>, <cfif hcpcQty3TBox EQ "">NULL<cfelse>'#trim(hcpcQty3TBox)#'</cfif>, <cfif hcpcProduct3TBox EQ "">NULL<cfelse>'#trim(hcpcProduct3TBox)#'</cfif>, <cfif hcpcDX3TBox EQ "">NULL<cfelse>'#trim(hcpcDX3TBox)#'</cfif>, <cfif hcpcDiagnosis3TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis3TBox)#'</cfif>, <cfif hcpcCost3TBox EQ "">NULL<cfelse>'#trim(hcpcCost3TBox)#'</cfif>, <cfif hcpcCode4TBox EQ "">NULL<cfelse>'#trim(hcpcCode4TBox)#'</cfif>, <cfif hcpcQty4TBox EQ "">NULL<cfelse>'#trim(hcpcQty4TBox)#'</cfif>, <cfif hcpcProduct4TBox EQ "">NULL<cfelse>'#trim(hcpcProduct4TBox)#'</cfif>, <cfif hcpcDX4TBox EQ "">NULL<cfelse>'#trim(hcpcDX4TBox)#'</cfif>, <cfif hcpcDiagnosis4TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis4TBox)#'</cfif>, <cfif hcpcCost4TBox EQ "">NULL<cfelse>'#trim(hcpcCost4TBox)#'</cfif>, <cfif hcpcCode5TBox EQ "">NULL<cfelse>'#trim(hcpcCode5TBox)#'</cfif>, <cfif hcpcQty5TBox EQ "">NULL<cfelse>'#trim(hcpcQty5TBox)#'</cfif>, <cfif hcpcProduct5TBox EQ "">NULL<cfelse>'#trim(hcpcProduct5TBox)#'</cfif>, <cfif hcpcDX5TBox EQ "">NULL<cfelse>'#trim(hcpcDX5TBox)#'</cfif>, <cfif hcpcDiagnosis5TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis5TBox)#'</cfif>, <cfif hcpcCost5TBox EQ "">NULL<cfelse>'#trim(hcpcCost5TBox)#'</cfif>, <cfif hcpcCode6TBox EQ "">NULL<cfelse>'#trim(hcpcCode6TBox)#'</cfif>, <cfif hcpcQty6TBox EQ "">NULL<cfelse>'#trim(hcpcQty6TBox)#'</cfif>, <cfif hcpcProduct6TBox EQ "">NULL<cfelse>'#trim(hcpcProduct6TBox)#'</cfif>, <cfif hcpcDX6TBox EQ "">NULL<cfelse>'#trim(hcpcDX6TBox)#'</cfif>, <cfif hcpcDiagnosis6TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis6TBox)#'</cfif>, <cfif hcpcCost6TBox EQ "">NULL<cfelse>'#trim(hcpcCost6TBox)#'</cfif>, <cfif hcpcCode7TBox EQ "">NULL<cfelse>'#trim(hcpcCode7TBox)#'</cfif>, <cfif hcpcQty7TBox EQ "">NULL<cfelse>'#trim(hcpcQty7TBox)#'</cfif>, <cfif hcpcProduct7TBox EQ "">NULL<cfelse>'#trim(hcpcProduct7TBox)#'</cfif>, <cfif hcpcDX7TBox EQ "">NULL<cfelse>'#trim(hcpcDX7TBox)#'</cfif>, <cfif hcpcDiagnosis7TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis7TBox)#'</cfif>, <cfif hcpcCost7TBox EQ "">NULL<cfelse>'#trim(hcpcCost7TBox)#'</cfif>, <cfif hcpcCode8TBox EQ "">NULL<cfelse>'#trim(hcpcCode8TBox)#'</cfif>, <cfif hcpcQty8TBox EQ "">NULL<cfelse>'#trim(hcpcQty8TBox)#'</cfif>, <cfif hcpcProduct8TBox EQ "">NULL<cfelse>'#trim(hcpcProduct8TBox)#'</cfif>, <cfif hcpcDX8TBox EQ "">NULL<cfelse>'#trim(hcpcDX8TBox)#'</cfif>, <cfif hcpcDiagnosis8TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis8TBox)#'</cfif>, <cfif hcpcCost8TBox EQ "">NULL<cfelse>'#trim(hcpcCost8TBox)#'</cfif>, <cfif hcpcCode9TBox EQ "">NULL<cfelse>'#trim(hcpcCode9TBox)#'</cfif>, <cfif hcpcQty9TBox EQ "">NULL<cfelse>'#trim(hcpcQty9TBox)#'</cfif>, <cfif hcpcProduct9TBox EQ "">NULL<cfelse>'#trim(hcpcProduct9TBox)#'</cfif>, <cfif hcpcDX9TBox EQ "">NULL<cfelse>'#trim(hcpcDX9TBox)#'</cfif>, <cfif hcpcDiagnosis9TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis9TBox)#'</cfif>, <cfif hcpcCost9TBox EQ "">NULL<cfelse>'#trim(hcpcCost9TBox)#'</cfif>, <cfif hcpcCode10TBox EQ "">NULL<cfelse>'#trim(hcpcCode10TBox)#'</cfif>, <cfif hcpcQty10TBox EQ "">NULL<cfelse>'#trim(hcpcQty10TBox)#'</cfif>, <cfif hcpcProduct10TBox EQ "">NULL<cfelse>'#trim(hcpcProduct10TBox)#'</cfif>, <cfif hcpcDX10TBox EQ "">NULL<cfelse>'#trim(hcpcDX10TBox)#'</cfif>, <cfif hcpcDiagnosis10TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis10TBox)#'</cfif>, <cfif hcpcCost10TBox EQ "">NULL<cfelse>'#trim(hcpcCost10TBox)#'</cfif>)
	</cfquery>
</cfloop>

--->




<!---


<cfquery name="getQuotes" datasource="PAClient_1084">
	SELECT * FROM quote
</cfquery>

<cfloop query="getQuotes">
	<cfquery name="tempIns" datasource="PAClient_1084">
		INSERT INTO quotehcpc (QuoteID, hcpcCode1TBox, hcpcQty1TBox, hcpcProduct1TBox, hcpcDX1TBox, hcpcDiagnosis1TBox, hcpcCost1TBox, hcpcCode2TBox, hcpcQty2TBox, hcpcProduct2TBox, hcpcDX2TBox, hcpcDiagnosis2TBox, hcpcCost2TBox, hcpcCode3TBox, hcpcQty3TBox, hcpcProduct3TBox, hcpcDX3TBox, hcpcDiagnosis3TBox, hcpcCost3TBox, hcpcCode4TBox, hcpcQty4TBox, hcpcProduct4TBox, hcpcDX4TBox, hcpcDiagnosis4TBox,	hcpcCost4TBox, hcpcCode5TBox, hcpcQty5TBox, hcpcProduct5TBox, hcpcDX5TBox, hcpcDiagnosis5TBox,	hcpcCost5TBox, hcpcCode6TBox, hcpcQty6TBox, hcpcProduct6TBox, hcpcDX6TBox, hcpcDiagnosis6TBox, hcpcCost6TBox, hcpcCode7TBox, hcpcQty7TBox, hcpcProduct7TBox, hcpcDX7TBox, hcpcDiagnosis7TBox, hcpcCost7TBox, hcpcCode8TBox, hcpcQty8TBox, hcpcProduct8TBox, hcpcDX8TBox, hcpcDiagnosis8TBox, hcpcCost8TBox, hcpcCode9TBox, hcpcQty9TBox, hcpcProduct9TBox, hcpcDX9TBox, hcpcDiagnosis9TBox, hcpcCost9TBox, hcpcCode10TBox, hcpcQty10TBox, hcpcProduct10TBox, hcpcDX10TBox, hcpcDiagnosis10TBox, hcpcCost10TBox)
		VALUES(#trim(quoteID)#, <cfif hcpcCode1TBox EQ "">NULL<cfelse>'#trim(hcpcCode1TBox)#'</cfif>, <cfif hcpcQty1TBox EQ "">NULL<cfelse>'#trim(hcpcQty1TBox)#'</cfif>, <cfif hcpcProduct1TBox EQ "">NULL<cfelse>'#trim(hcpcProduct1TBox)#'</cfif>, <cfif hcpcDX1TBox EQ "">NULL<cfelse>'#trim(hcpcDX1TBox)#'</cfif>, <cfif hcpcDiagnosis1TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis1TBox)#'</cfif>, <cfif hcpcCost1TBox EQ "">NULL<cfelse>'#trim(hcpcCost1TBox)#'</cfif>, <cfif hcpcCode2TBox EQ "">NULL<cfelse>'#trim(hcpcCode2TBox)#'</cfif>, <cfif hcpcQty2TBox EQ "">NULL<cfelse>'#trim(hcpcQty2TBox)#'</cfif>, <cfif hcpcProduct2TBox EQ "">NULL<cfelse>'#trim(hcpcProduct2TBox)#'</cfif>, <cfif hcpcDX2TBox EQ "">NULL<cfelse>'#trim(hcpcDX2TBox)#'</cfif>, <cfif hcpcDiagnosis2TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis2TBox)#'</cfif>, <cfif hcpcCost2TBox EQ "">NULL<cfelse>'#trim(hcpcCost2TBox)#'</cfif>, <cfif hcpcCode3TBox EQ "">NULL<cfelse>'#trim(hcpcCode3TBox)#'</cfif>, <cfif hcpcQty3TBox EQ "">NULL<cfelse>'#trim(hcpcQty3TBox)#'</cfif>, <cfif hcpcProduct3TBox EQ "">NULL<cfelse>'#trim(hcpcProduct3TBox)#'</cfif>, <cfif hcpcDX3TBox EQ "">NULL<cfelse>'#trim(hcpcDX3TBox)#'</cfif>, <cfif hcpcDiagnosis3TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis3TBox)#'</cfif>, <cfif hcpcCost3TBox EQ "">NULL<cfelse>'#trim(hcpcCost3TBox)#'</cfif>, <cfif hcpcCode4TBox EQ "">NULL<cfelse>'#trim(hcpcCode4TBox)#'</cfif>, <cfif hcpcQty4TBox EQ "">NULL<cfelse>'#trim(hcpcQty4TBox)#'</cfif>, <cfif hcpcProduct4TBox EQ "">NULL<cfelse>'#trim(hcpcProduct4TBox)#'</cfif>, <cfif hcpcDX4TBox EQ "">NULL<cfelse>'#trim(hcpcDX4TBox)#'</cfif>, <cfif hcpcDiagnosis4TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis4TBox)#'</cfif>, <cfif hcpcCost4TBox EQ "">NULL<cfelse>'#trim(hcpcCost4TBox)#'</cfif>, <cfif hcpcCode5TBox EQ "">NULL<cfelse>'#trim(hcpcCode5TBox)#'</cfif>, <cfif hcpcQty5TBox EQ "">NULL<cfelse>'#trim(hcpcQty5TBox)#'</cfif>, <cfif hcpcProduct5TBox EQ "">NULL<cfelse>'#trim(hcpcProduct5TBox)#'</cfif>, <cfif hcpcDX5TBox EQ "">NULL<cfelse>'#trim(hcpcDX5TBox)#'</cfif>, <cfif hcpcDiagnosis5TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis5TBox)#'</cfif>, <cfif hcpcCost5TBox EQ "">NULL<cfelse>'#trim(hcpcCost5TBox)#'</cfif>, <cfif hcpcCode6TBox EQ "">NULL<cfelse>'#trim(hcpcCode6TBox)#'</cfif>, <cfif hcpcQty6TBox EQ "">NULL<cfelse>'#trim(hcpcQty6TBox)#'</cfif>, <cfif hcpcProduct6TBox EQ "">NULL<cfelse>'#trim(hcpcProduct6TBox)#'</cfif>, <cfif hcpcDX6TBox EQ "">NULL<cfelse>'#trim(hcpcDX6TBox)#'</cfif>, <cfif hcpcDiagnosis6TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis6TBox)#'</cfif>, <cfif hcpcCost6TBox EQ "">NULL<cfelse>'#trim(hcpcCost6TBox)#'</cfif>, <cfif hcpcCode7TBox EQ "">NULL<cfelse>'#trim(hcpcCode7TBox)#'</cfif>, <cfif hcpcQty7TBox EQ "">NULL<cfelse>'#trim(hcpcQty7TBox)#'</cfif>, <cfif hcpcProduct7TBox EQ "">NULL<cfelse>'#trim(hcpcProduct7TBox)#'</cfif>, <cfif hcpcDX7TBox EQ "">NULL<cfelse>'#trim(hcpcDX7TBox)#'</cfif>, <cfif hcpcDiagnosis7TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis7TBox)#'</cfif>, <cfif hcpcCost7TBox EQ "">NULL<cfelse>'#trim(hcpcCost7TBox)#'</cfif>, <cfif hcpcCode8TBox EQ "">NULL<cfelse>'#trim(hcpcCode8TBox)#'</cfif>, <cfif hcpcQty8TBox EQ "">NULL<cfelse>'#trim(hcpcQty8TBox)#'</cfif>, <cfif hcpcProduct8TBox EQ "">NULL<cfelse>'#trim(hcpcProduct8TBox)#'</cfif>, <cfif hcpcDX8TBox EQ "">NULL<cfelse>'#trim(hcpcDX8TBox)#'</cfif>, <cfif hcpcDiagnosis8TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis8TBox)#'</cfif>, <cfif hcpcCost8TBox EQ "">NULL<cfelse>'#trim(hcpcCost8TBox)#'</cfif>, <cfif hcpcCode9TBox EQ "">NULL<cfelse>'#trim(hcpcCode9TBox)#'</cfif>, <cfif hcpcQty9TBox EQ "">NULL<cfelse>'#trim(hcpcQty9TBox)#'</cfif>, <cfif hcpcProduct9TBox EQ "">NULL<cfelse>'#trim(hcpcProduct9TBox)#'</cfif>, <cfif hcpcDX9TBox EQ "">NULL<cfelse>'#trim(hcpcDX9TBox)#'</cfif>, <cfif hcpcDiagnosis9TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis9TBox)#'</cfif>, <cfif hcpcCost9TBox EQ "">NULL<cfelse>'#trim(hcpcCost9TBox)#'</cfif>, <cfif hcpcCode10TBox EQ "">NULL<cfelse>'#trim(hcpcCode10TBox)#'</cfif>, <cfif hcpcQty10TBox EQ "">NULL<cfelse>'#trim(hcpcQty10TBox)#'</cfif>, <cfif hcpcProduct10TBox EQ "">NULL<cfelse>'#trim(hcpcProduct10TBox)#'</cfif>, <cfif hcpcDX10TBox EQ "">NULL<cfelse>'#trim(hcpcDX10TBox)#'</cfif>, <cfif hcpcDiagnosis10TBox EQ "">NULL<cfelse>'#trim(hcpcDiagnosis10TBox)#'</cfif>, <cfif hcpcCost10TBox EQ "">NULL<cfelse>'#trim(hcpcCost10TBox)#'</cfif>)
	</cfquery>
</cfloop>

--->













<!---
<cf_ei_1002_InsertUpdateFinalFeeSchedule_2007 testmode="yes">
--->
<!---
CREATE TABLE [EOB_MEDICARE_2007_PROCEDURECodeFeeSchedule] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPCRecordID] [int] NOT NULL ,
	[CategoryID] [int] NULL ,
	[MOD1] [int] NULL ,
	[MOD2] [int] NULL ,
	[MOD3] [int] NULL ,
	[MOD4] [int] NULL ,
	[Ceiling] [money] NULL ,
	[Floor] [money] NULL ,
	[Fee_AL_16] [money] NULL ,
	[Fee_AK_17] [money] NULL ,
	[Fee_AZ_18] [money] NULL ,
	[Fee_AR_19] [money] NULL ,
	[Fee_CA_20] [money] NULL ,
	[Fee_CO_21] [money] NULL ,
	[Fee_CT_22] [money] NULL ,
	[Fee_DE_23] [money] NULL ,
	[Fee_DC_24] [money] NULL ,
	[Fee_FL_25] [money] NULL ,
	[Fee_GA_26] [money] NULL ,
	[Fee_HI_27] [money] NULL ,
	[Fee_ID_28] [money] NULL ,
	[Fee_IL_29] [money] NULL ,
	[Fee_IN_30] [money] NULL ,
	[Fee_IA_31] [money] NULL ,
	[Fee_KS_32] [money] NULL ,
	[Fee_KY_33] [money] NULL ,
	[Fee_LA_34] [money] NULL ,
	[Fee_ME_35] [money] NULL ,
	[Fee_MD_36] [money] NULL ,
	[Fee_MA_37] [money] NULL ,
	[Fee_MI_38] [money] NULL ,
	[Fee_MN_39] [money] NULL ,
	[Fee_MS_40] [money] NULL ,
	[Fee_MO_41] [money] NULL ,
	[Fee_MT_42] [money] NULL ,
	[Fee_NE_43] [money] NULL ,
	[Fee_NV_44] [money] NULL ,
	[Fee_NE_45] [money] NULL ,
	[Fee_NJ_46] [money] NULL ,
	[Fee_NM_47] [money] NULL ,
	[Fee_NY_48] [money] NULL ,
	[Fee_NC_49] [money] NULL ,
	[Fee_ND_50] [money] NULL ,
	[Fee_OH_51] [money] NULL ,
	[Fee_OK_52] [money] NULL ,
	[Fee_OR_53] [money] NULL ,
	[Fee_PA_54] [money] NULL ,
	[Fee_RI_55] [money] NULL ,
	[Fee_SC_56] [money] NULL ,
	[Fee_SD_57] [money] NULL ,
	[Fee_TN_58] [money] NULL ,
	[Fee_TX_59] [money] NULL ,
	[Fee_UT_60] [money] NULL ,
	[Fee_VT_61] [money] NULL ,
	[Fee_VA_62] [money] NULL ,
	[Fee_WA_63] [money] NULL ,
	[Fee_WV_64] [money] NULL ,
	[Fee_WI_65] [money] NULL ,
	[Fee_WY_66] [money] NULL ,
	[Fee_PR_229] [money] NULL ,
	[Fee_VI_238] [money] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_EOB_MEDICARE_2007_PROCEDURECodeFeeSchedule_Active] DEFAULT (1),
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_EOB_MEDICARE_2007_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (now()),
	[DateModified] [datetime] NULL ,
	CONSTRAINT [PK_EOB_MEDICARE_2007_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY]
) ON [PRIMARY]
GO



--->










<!---<cfset serverName = "Elkiwa">
<cfquery name="createMASTERDB" datasource="#request.datasource#">
	RESTORE DATABASE EOBManager_MASTER
   	FROM EOBManager_1084
   	WITH RECOVERY,
   	MOVE 'EOBManager_data' TO 'C:\Program Files\Microsoft SQL Server\MSSQL$#trim(serverName)#\Data\EOBManager_MASTER_data.mdf',
   	MOVE 'EOBManager_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL$#trim(serverName)#\Data\EOBManager_MASTER_log.ldf'
</cfquery>--->






<!---
<cfset request.NoteXML = CreateObject("component","com.common.Note")>
<cfset noteID = request.NoteXML.addNote(clientID: trim(session.Client.getClientID()), objectID: 8, instanceID: 287)>
<cfset request.NoteXML.addNoteEntry(clientID: trim(session.Client.getClientID()), NoteID: noteID, noteEntry: 'trim(form.note)', userID: trim(session.user.getUsersID()), userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getFName())#')>


--->


<!---

<cfset Patient = CreateObject("component","com.common.Patient")>

<cfset ClaimSubmitterIdentifier = 038613><!---05306--->
<cfset patientFName = "Luis">
<cfset patientLName = "Guajardo">
<cfset patientMiddleName = "">


<cfset patientID = Patient.patientExists(ClientID: 1084, ClaimSubmitterIdentifier: trim(ClaimSubmitterIdentifier), FName: trim(patientFName), MName: trim(patientMiddleName), LName: trim(patientLName), nameMatch: 1)>

<cfoutput><br><br><br></cfoutput>
<cfdump var="#patientID#">


--->




















































<!---
<cfquery name="get1088IDs" datasource="PAClient_1084">
 SELECT p.PatientID as pPatientID, p.ClaimSubmitterIdentifier AS pClientPatientID, p.NM1IdentificationCode9, p.AccountNumber, e.EntityID AS pEntityID, e.Fname AS pFname, e.Lname AS pLname
 FROM entity e INNER JOIN patient p ON e.EntityID = p.EntityID
</cfquery>
<table border=1 cellpadding=3 cellspacing=0>
 <th>Entity ID</th>
 <th>Patient ID</th>
 <th>Client ID</th>
 <th>AccouuntNumber</th>
 <th>NM 1 Ident</th>
 <th>First Name</th>
 <th>Last Name</th>
<cfloop query="get1088IDs">
 <cfoutput>
  <tr>
   <td>#pEntityID#</td>
   <td>#pPatientID#</td>
   <td><font color=red>#pClientPatientID#</font></td>
   <td><cfif AccountNumber EQ "">&nbsp;<cfelse>#AccountNumber#</cfif></td>
   <td><cfif NM1IdentificationCode9 EQ "">&nbsp;<cfelse>#NM1IdentificationCode9#</cfif></td>
   <td>#pFname#</td>
   <td>#pLname#</td>
  </tr>
 </cfoutput>
</cfloop>
</table>
--->






<!---
	<cfparam name="attributes.testmode" default="no">
	<cfset testmode = attributes.testmode>

	<cfparam name="attributes.filepath" default="c:\eobmanager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="FinancialHistory_PHME_PatientsUpdate_AccountNumber.txt">
	<cfset filename = attributes.filename>

	<cfset count = 1>

	<cfsetting requestTimeOut = "900">

	<cffile action="READ" file="#trim(filepath)#\#trim(fileName)#" variable="fileContent">

	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">

		<cftry>


			<cfset Unique = ListGetAt(i, 3, "|")>
			<cfset Unique = NumberFormat(Unique, "00000")>
			<cfset AccountNumber = ListGetAt(i, 4, "|")>

			<cfquery name="getPatient" datasource="#trim(request.datasource)#">
				SELECT PatientID
				FROM patient
				WHERE ClaimSubmitterIdentifier = '#trim(Unique)#'
			</cfquery>

			<cfoutput>
				<cfif IsQuery(getPatient) AND getPatient.RecordCount EQ 1 AND IsNumeric(getPatient.PatientID)>
					<cfif trim(AccountNumber) NEQ "NULL">
						<cfquery name="insPatient" datasource="#trim(request.datasource)#">
							UPDATE patient
							SET AccountNumber = '#trim(AccountNumber)#', NM1IdentificationCode9 = '#trim(AccountNumber)#', dateModified = now()
							WHERE PatientID = #getPatient.PatientID#
						</cfquery>
						<!---SET AccoutNumber = '#trim(AccountNumber)#', NM1IdentificationCode9 = '#trim(AccountNumber)#', dateModified = now()
						WHERE PatientID = #getPatient.PatientID#<br>	--->
					</cfif>
				<cfelseif IsQuery(getPatient) AND getPatient.RecordCount GTE 2>
					<font color="FF0000">2 WHERE PatientID = #getPatient.PatientID#</font><br></font>
				<cfelse>
					<font color="FF0000">3 #trim(Unique)# - #trim(AccountNumber)#</font><br></font>
				</cfif>
			</cfoutput>


			<cfset getPatient = "NULL">
			<cfset Unique = "NULL">
			<cfset AccountNumber = "NULL">
			<cfset count = count + 1>


			<cfcatch type="Any">

				<cfoutput>
					<font color="FF0000">
						<p>Caught an exception, type = #CFCATCH.TYPE#</p>
						<p>#cfcatch.message# #cfcatch.detail#</p>
				        The contents of the tag stack are:
					</font>
					<br>
			        <cfdump var="#cfcatch.tagcontext#">

				</cfoutput>
				<cfabort>

			</cfcatch>

		</cftry>

	</cfloop>

--->
















<!---
<cfquery name="get1088IDs" datasource="PAClient_1084">
 SELECT p.PatientID as pPatientID, p.ClaimSubmitterIdentifier AS pClientPatientID, e.EntityID AS pEntityID, e.Fname AS pFname, e.Lname AS pLname
 FROM entity e INNER JOIN patient p ON e.EntityID = p.EntityID
</cfquery>
<table border=1 cellpadding=3 cellspacing=0>
 <th>Entity ID</th>
 <th>Patient ID</th>
 <th>Client ID</th>
 <th>First Name</th>
 <th>Last Name</th>
<cfloop query="get1088IDs">
 <cfoutput>
  <tr>
   <td>#pEntityID#</td>
   <td>#pPatientID#</td>
   <td><font color=red>#pClientPatientID#</font></td>
   <td>#pFname#</td>
   <td>#pLname#</td>
  </tr>
 </cfoutput>
</cfloop>
</table>

--->

<!--------------------------------------------------------------------------------------->
<!--- This code was written to put the correct ClaimSubmitterIdentifier number on     --->
<!--- the patient table from a restored db from 10/05/06. It originally had the code  --->
<!--- that was imported from PHME.                                                    --->
<!--------------------------------------------------------------------------------------->
<!---<cfquery name="get1088IDs" datasource="PAClient_1088">
	SELECT p.PatientID as pPatientID, p.ClientPatientID AS pClientPatientID, e.EntityID AS pEntityID, e.Fname AS pFname, e.Lname AS pLname
	FROM entity e INNER JOIN patient p ON e.EntityID = p.EntityID
</cfquery>


<cfloop query="get1088IDs">

	<cfquery name="get1084s" datasource="PAClient_1084">
		UPDATE patient
		SET ClaimSubmitterIdentifier = '#pClientPatientID#', dateModified = now()
		WHERE PatientID = #trim(pPatientID)#
	</cfquery>

	<cfquery name="get1084s" datasource="PAClient_1084">
		SELECT p.patientID, p.ClaimSubmitterIdentifier, e.entityID, e.FName, e.LName
		FROM entity e INNER JOIN patient p ON e.entityID = p.entityID
		WHERE PatientID = #trim(pPatientID)#
	</cfquery>

	<cfoutput>
		#get1084s.patientID# <font color="ff0000">[#pPatientID#]</font>, #get1084s.ClaimSubmitterIdentifier# <font color="ff0000">[#pClientPatientID#]</font>, #get1084s.entityID# <font color="ff0000">[#pEntityID#]</font>, #get1084s.FName# <font color="ff0000">[#pFname#]</font>, #get1084s.LName# <font color="ff0000">[#pLname#]</font> <br>
	</cfoutput>

</cfloop>

Test case
SELECT p.PatientID as pPatientID, p.ClaimSubmitterIdentifier AS pClientPatientID, e.EntityID AS pEntityID, e.Fname AS pFname, e.Lname AS pLname
FROM entity e INNER JOIN patient p ON e.EntityID = p.EntityID
WHERE LName = 'Guajardo' AND FName = 'Luis'


SELECT p.PatientID as pPatientID, p.ClientPatientID AS pClientPatientID, e.EntityID AS pEntityID, e.Fname AS pFname, e.Lname AS pLname
FROM entity e INNER JOIN patient p ON e.EntityID = p.EntityID
WHERE LName = 'Guajardo' AND FName = 'Luis'

72922	05013	131579	Luis	Guajardo
72923	05013	131581	Luis	Guajardo
--->








<!---
<cfquery name="getPatientsTable" datasource="#request.datasource#">
	SELECT PatientID, entityIDTemp, entityID, clientAccountNumber, AccountNumber
	FROM patient
</cfquery>

<cfoutput>

	<cfloop query="getPatientsTable">

		<cfquery name="updatePatientsTable" datasource="#request.datasource#">
			UPDATE patient
			SET dateModified = now()
			<cfif entityID NEQ "">, entityIDTemp = #trim(entityID)#</cfif>
			<cfif AccountNumber NEQ "">, clientAccountNumber = '#trim(AccountNumber)#'</cfif>
			WHERE PatientID = #trim(PatientID)#
		</cfquery>

	</cfloop>

</cfoutput>
--->
































<!---


	<cfparam name="attributes.testmode" default="no">
	<cfset testmode = attributes.testmode>

	<cfparam name="attributes.filepath" default="c:\eobmanager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="FinancialHistory_COMB_TAB_Temp.txt">
	<cfset filename = attributes.filename>

	<cfset count = 1>

	<cfsetting requestTimeOut = "900">

	<cffile
		action="READ"
		file="#trim(filepath)#\#trim(fileName)#" variable="fileContent">


	<cfif testmode>
		<font size="5" color="FF0000">RAN IN TEST MODE</font><p>
	<cfelse>
		<font size="5" color="FF0000">RAN IN LIVE MODE</font><p>
	</cfif>



	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">

		<cftry>

				<cfif NOT testmode>

					<cfset FirstName_1 = ListGetAt(i, 1, "|")>
					<cfset MI_2 = ListGetAt(i, 2, "|")>
					<cfset LName_3 = ListGetAt(i, 3, "|")>
					<cfset Address1_4 = ListGetAt(i, 4, "|")>
					<cfset Address2_5 = ListGetAt(i, 5, "|")>
					<cfset City_6 = ListGetAt(i, 6, "|")>
					<cfset ST_7 = ListGetAt(i, 7, "|")>
					<cfset Zip_8 = ListGetAt(i, 8, "|")>
					<cfset PhoneHome_9 = ListGetAt(i, 9, "|")>
					<cfset PhoneWork_10 = ListGetAt(i, 10, "|")>
					<cfset Ext_11 = ListGetAt(i, 11, "|")>
					<cfset Company_12 = ListGetAt(i, 12, "|")>
					<cfset DezineAcctNo_13 = ListGetAt(i, 13, "|")>
					<cfset AcctType_14 = ListGetAt(i, 14, "|")>
					<cfset SSN_15 = ListGetAt(i, 15, "|")>
					<cfset DOB_16 = ListGetAt(i, 16, "|")>
					<cfset Sex_17 = ListGetAt(i, 17, "|")>
					<cfset MarStat_18 = ListGetAt(i, 18, "|")>
					<cfset EmplStat_19 = ListGetAt(i, 19, "|")>
					<cfset StmtFormat_20 = ListGetAt(i, 20, "|")>
					<cfset CoordCare_21 = ListGetAt(i, 21, "|")>
					<cfset CustClass_22 = ListGetAt(i, 22, "|")>
					<cfset ShipTo_23 = ListGetAt(i, 23, "|")>
					<cfset ShipName_24 = ListGetAt(i, 24, "|")>
					<cfset CntFirst_25 = ListGetAt(i, 25, "|")>
					<cfset CntLast_26 = ListGetAt(i, 26, "|")>
					<cfset Address1_27 = ListGetAt(i, 27, "|")>
					<cfset Address2_28 = ListGetAt(i, 28, "|")>
					<cfset City_29 = ListGetAt(i, 29, "|")>
					<cfset State_30 = ListGetAt(i, 30, "|")>
					<cfset Zip_31 = ListGetAt(i, 31, "|")>
					<cfset Phone_32 = ListGetAt(i, 32, "|")>
					<cfset Ext_33 = ListGetAt(i, 33, "|")>
					<cfset Employer_34 = ListGetAt(i, 34, "|")>
					<cfset EmpName_35 = ListGetAt(i, 35, "|")>
					<cfset CNTFIRSTNAMEEMPINFO_36 = ListGetAt(i, 36, "|")>
					<cfset CNTLNAMEEMPINFO_37 = ListGetAt(i, 37, "|")>
					<cfset Address1_38 = ListGetAt(i, 38, "|")>
					<cfset Address2_39 = ListGetAt(i, 39, "|")>
					<cfset City_40 = ListGetAt(i, 40, "|")>
					<cfset State_41 = ListGetAt(i, 41, "|")>
					<cfset Zip_42 = ListGetAt(i, 42, "|")>
					<cfset Phone_43 = ListGetAt(i, 43, "|")>
					<cfset Ext_44 = ListGetAt(i, 44, "|")>

					<cfset Payor1_45 = ListGetAt(i, 45, "|")>
					<cfset PayorName1_46 = ListGetAt(i, 46, "|")>
					<cfset Deductable_47 = ListGetAt(i, 47, "|")>
					<cfset PayPercentage_48 = ListGetAt(i, 48, "|")>
					<cfset Address1_49 = ListGetAt(i, 49, "|")>
					<cfset Address2_50 = ListGetAt(i, 50, "|")>
					<cfset City_51 = ListGetAt(i, 51, "|")>
					<cfset State_52 = ListGetAt(i, 52, "|")>
					<cfset Zip_53 = ListGetAt(i, 53, "|")>
					<cfset CNTName_54 = ListGetAt(i, 54, "|")>
					<cfset PolicyNumber_55 = ListGetAt(i, 55, "|")>
					<cfset GROUPNumber_56 = ListGetAt(i, 56, "|")>
					<cfset Phone_57 = ListGetAt(i, 57, "|")>
					<cfset Ext_58 = ListGetAt(i, 58, "|")>
					<cfset Relation_59 = ListGetAt(i, 59, "|")>
					<cfset LName_60 = ListGetAt(i, 60, "|")>
					<cfset FName_61 = ListGetAt(i, 61, "|")>
					<cfset DOB_62 = ListGetAt(i, 62, "|")>
					<cfset Sex_63 = ListGetAt(i, 63, "|")>

					<cfset Payor2_64 = ListGetAt(i, 64, "|")>
					<cfset PayName2_65 = ListGetAt(i, 65, "|")>
					<cfset Deductablr_66 = ListGetAt(i, 66, "|")>
					<cfset PayPercentage_67 = ListGetAt(i, 67, "|")>
					<cfset Address1_68 = ListGetAt(i, 68, "|")>
					<cfset Address2_69 = ListGetAt(i, 69, "|")>
					<cfset City_70 = ListGetAt(i, 70, "|")>
					<cfset State_71 = ListGetAt(i, 71, "|")>
					<cfset Zip_72 = ListGetAt(i, 72, "|")>
					<cfset CNTName_73 = ListGetAt(i, 73, "|")>
					<cfset PolicyNumber_74 = ListGetAt(i, 74, "|")>
					<cfset GroupNumber_75 = ListGetAt(i, 75, "|")>
					<cfset Phone_76 = ListGetAt(i, 76, "|")>
					<cfset Ext_77 = ListGetAt(i, 77, "|")>
					<cfset REL_78 = ListGetAt(i, 78, "|")>
					<cfset LName_79 = ListGetAt(i, 79, "|")>
					<cfset FName_80 = ListGetAt(i, 80, "|")>
					<cfset DOB_81 = ListGetAt(i, 81, "|")>
					<cfset Sex_82 = ListGetAt(i, 82, "|")>

					<cfset Payor3_83 = ListGetAt(i, 83, "|")>
					<cfset PayName3_84 = ListGetAt(i, 84, "|")>
					<cfset Deductable_85 = ListGetAt(i, 85, "|")>
					<cfset PayPercentage_86 = ListGetAt(i, 86, "|")>
					<cfset Address1_87 = ListGetAt(i, 87, "|")>
					<cfset Address2_88 = ListGetAt(i, 88, "|")>
					<cfset City_89 = ListGetAt(i, 89, "|")>
					<cfset State_90 = ListGetAt(i, 90, "|")>
					<cfset Zip_91 = ListGetAt(i, 91, "|")>
					<cfset CNTName_92 = ListGetAt(i, 92, "|")>
					<cfset PolicyNumber_93 = ListGetAt(i, 93, "|")>
					<cfset GroupNumber_94 = ListGetAt(i, 94, "|")>
					<cfset Phone_95 = ListGetAt(i, 95, "|")>
					<cfset Ext_96 = ListGetAt(i, 96, "|")>
					<cfset REL_97 = ListGetAt(i, 97, "|")>
					<cfset LName_98 = ListGetAt(i, 98, "|")>
					<cfset FName_99 = ListGetAt(i, 99, "|")>
					<cfset DOB_100 = ListGetAt(i, 100, "|")>
					<cfset Sex_101 = ListGetAt(i, 101, "|")>

					<cfset ClaimSubmitterIdentifier_102 = ListGetAt(i, 102, "|")>
					<cfset ClaimSubmitterIdentifier_102 = NumberFormat(ClaimSubmitterIdentifier_102, "00000")>

					<cfif trim(FirstName_1) NEQ "NULL" AND trim(LName_3) NEQ "NULL" >


						<cfif trim(FirstName_1) NEQ "NULL">
							<cfset thisFName = REQUEST.capitalizeFirstLetter(trim(FirstName_1))>
							<cfset First = "#trim(thisFName)#">
						<cfelse>
							<cfset First = "NULL">
						</cfif>

						<cfif trim(MI_2) NEQ "NULL">
							<cfset Middle = "#trim(MI_2)#">
						<cfelse>
							<cfset Middle = "NULL">
						</cfif>

						<cfif trim(LName_3) NEQ "NULL">
							<cfset thisLName = REQUEST.capitalizeFirstLetter(trim(LName_3))>
							<cfset Last = "#trim(thisLName)#">
						<cfelse>
							<cfset Last = "NULL">
						</cfif>

						<cfif LEN(DOB_16) EQ 8 AND DOB_16 NEQ "NULL">
							<cfset dobYear = MID(DOB_16, 1, 4)>
							<cfset dobMonth = MID(DOB_16, 5, 2)>
							<cfset dobDay = MID(DOB_16, 7, 2)>
							<cfset dobDate = CreateODBCDate(CreateDate(dobYear, dobMonth, dobDay))>
						<cfelse>
							<cfset dobDate = "NULL">
						</cfif>

						<cfif trim(Sex_17) EQ "F">
							<cfset Sex = 1>
						<cfelseif trim(Sex_17) EQ "M">
							<cfset Sex = 0>
						<cfelse>
							<cfset Sex = "NULL">
						</cfif>

						<cfif trim(SSN_15) NEQ "NULL" AND trim(SSN_15) NEQ "NULL">
							<cfset SSN = "#trim(SSN_15)#">
						<cfelse>
							<cfset SSN = "NULL">
						</cfif>

						<cfif trim(MarStat_18) NEQ "NULL">
							<cfif trim(MarStat_18) EQ "S">
								<cfset MaritalStatus = 231>
							<cfelseif trim(MarStat_18) EQ "M">
								<cfset MaritalStatus = 232>
							<cfelseif trim(MarStat_18) EQ "W" AND Sex EQ 0>
								<cfset MaritalStatus = 234>
							<cfelseif trim(MarStat_18) EQ "W" AND Sex EQ 1>
								<cfset MaritalStatus = 233>
							<cfelseif trim(MarStat_18) EQ "D">
								<cfset MaritalStatus = 235>
							<cfelse><!---if trim(MarStat_18) EQ "O"--->
								<cfset MaritalStatus = 236>
							</cfif>
						<cfelse>
							<cfset MaritalStatus = "NULL">
						</cfif>

					</cfif>


					<cfquery name="getEntity" datasource="#trim(request.datasource)#">
						SELECT entityID
						FROM entity
						WHERE ClientID = 1084 AND  ObjectTypeID = 3 AND  Fname <cfif First EQ "NULL">IS NULL<cfelse> = '#trim(First)#'</cfif> AND  Mname <cfif Middle EQ "NULL">IS NULL<cfelse> = '#trim(Middle)#'</cfif> AND  Lname <cfif Last EQ "NULL">IS NULL<cfelse> = '#trim(Last)#'</cfif> AND  DOB <cfif dobDate EQ "NULL">IS NULL<cfelse>= #trim(dobDate)#</cfif> AND  Sex <cfif Sex EQ "NULL">IS NULL<cfelse>= #trim(Sex)#</cfif> AND  SSN <cfif SSN EQ "NULL">IS NULL<cfelse> = '#trim(SSN)#'</cfif> AND  MaritalStatus <cfif trim(MaritalStatus) EQ "NULL">IS NULL<cfelse> = #trim(MaritalStatus)#</cfif>
					</cfquery>

					<cfif getEntity.RecordCount EQ 1>

						<cfset EntityID = getEntity.entityID>

						<cfquery name="getPatient" datasource="#trim(request.datasource)#">
							SELECT PatientID
							FROM patient
							WHERE ClaimSubmitterIdentifier = #trim(ClaimSubmitterIdentifier_102)# AND  EntityID = #trim(EntityID)#
						</cfquery>

					</cfif>


					<cfoutput>
						<cfif IsQuery(getPatient) AND IsNumeric(getPatient.PatientID)>
							<cfif DezineAcctNo_13 NEQ "NULL">
								<!---<cfquery name="insPatient" datasource="#trim(request.datasource)#">--->
									UPDATE patient
									SET AccountNumber = '#trim(DezineAcctNo_13)#', IdentificationCode9 = '#trim(DezineAcctNo_13)#'
									WHERE patientID = #getPatient.PatientID#	<br><br>
								<!---</cfquery>	--->
							</cfif>
							<font color="FF0000" size="1">#getPatient.PatientID# : #DezineAcctNo_13#</font><br>
						<cfelse>
							<!---<font size="1">WHERE ClientID = 1084 AND  ObjectTypeID = 3 AND  Fname <cfif First EQ "NULL">IS NULL<cfelse> = '#trim(First)#'</cfif> AND  Mname <cfif Middle EQ "NULL">IS NULL<cfelse> = '#trim(Middle)#'</cfif> AND  Lname <cfif Last EQ "NULL">IS NULL<cfelse> = '#trim(Last)#'</cfif> AND  DOB <cfif dobDate EQ "NULL">IS NULL<cfelse>= #trim(dobDate)#</cfif> AND  Sex <cfif Sex EQ "NULL">IS NULL<cfelse>= #trim(Sex)#</cfif> AND  SSN <cfif SSN EQ "NULL">IS NULL<cfelse> = '#trim(SSN)#'</cfif> AND  MaritalStatus <cfif trim(MaritalStatus) EQ "NULL">IS NULL<cfelse> = #trim(MaritalStatus)#</cfif></font><br>
							WHERE ClaimSubmitterIdentifier = #trim(ClaimSubmitterIdentifier_102)# AND  EntityID = #trim(EntityID)#
							<br><br>	--->
						</cfif>
					</cfoutput>



				</cfif>
			<cfset getPatient = "NULL">
			<cfset DezineAcctNo_13 = "NULL">
			<cfset ClaimSubmitterIdentifier_102 = "NULL">
			<cfset EntityID = "NULL">
			<cfset First = "NULL">
			<cfset Middle = "NULL">
			<cfset Last = "NULL">
			<cfset dobDate = "NULL">
			<cfset Sex = "NULL">
			<cfset SSN = "NULL">
			<cfset MaritalStatus = "NULL">
			<cfset count = count + 1>



			<cfcatch type="Any">

				<cfoutput>
					<font color="FF0000">
						<p>Caught an exception, type = #CFCATCH.TYPE#</p>
						<p>#cfcatch.message# #cfcatch.detail#</p>
				        The contents of the tag stack are:
					</font>
					<br>
			        <cfdump var="#cfcatch.tagcontext#">

				</cfoutput>
				<cfabort>

			</cfcatch>

		</cftry>

	</cfloop>





--->















<!---<cfset request.fileTemp = CreateObject("component", "com.common.File")>
<cfset tempo = request.FileTemp.updateFileStatus(2273, 97, 'This is a test.')>

<cfoutput>tempo = #tempo#</cfoutput>--->





<!---
<cfquery name="tempGet" datasource="#request.datasource#">
SELECT *
FROM claim_processxmltodb
WHERE (PatientID = 76954)
AND Claim_ProcessXMLToDBID NOT IN(8601,8670,8671,8672,8886,8887,8899,8900,8901,8902,8904,8905,8936,8937,8938,8939,9047,9048,9050,9052,9054,9057,9081,9096,9097,9098,9099,9234,9235,9236,9237)
</cfquery>

<cfquery name="getClaimIDs" datasource="#request.datasource#">
SELECT Claim_ProcessXMLToDB.Claim_ProcessXMLToDBID, Claim_ProcessXMLToDB.interchangeClaimID, Claim.ClaimID
FROM claim_processxmltodb INNER JOIN claim ON Claim_ProcessXMLToDB.interchangeClaimID = Claim.InterchangeClaimID
WHERE (Claim_ProcessXMLToDB.PatientID = 76954) AND (Claim_ProcessXMLToDB.Claim_ProcessXMLToDBID NOT IN (8601, 8670, 8671, 8672, 8886, 8887, 8899, 8900, 8901, 8902, 8904, 8905, 8936, 8937, 8938, 8939, 9047, 9048, 9050, 9052, 9054, 9057, 9081, 9096, 9097, 9098, 9099, 9234, 9235, 9236, 9237))
</cfquery>


<cfloop query="tempget">

	<cfset thisClaimXML = XMLParse(ClaimXML)>

	<cfquery name="getid" dbtype="query">
		SELECT ClaimID FROM getClaimIDs WHERE Claim_ProcessXMLToDBID = #Claim_ProcessXMLToDBID#
	</cfquery>
	<cfset claimID = getid.ClaimID>
	<cfset ClaimSubmitterIdentifier = thisClaimXML.CLP.ClaimSubmittersIdentifier1.XMLText>
	<cfoutput><font color="FF0000">[ClaimID: #claimID#]</font> #Claim_ProcessXMLToDBID# - CPID: #ClaimSubmitterIdentifier# </cfoutput>

	<cfif thisClaimXML.CLP.NM1[1].EntityIdentifierCode1.XMLText EQ "QC" AND thisClaimXML.CLP.NM1[1].EntityTypeQualifier2.XMLText EQ 1>

		<cfset patientLName = thisClaimXML.CLP.NM1[1].NameLastorOrganizationName3.XMLText><cfif patientLName NEQ ""><cfset patientLName = UCase(Mid(patientLName,1, 1)) & LCase(mid(patientLName, 2, len(patientLName)))></cfif>
		<cfset patientFName = thisClaimXML.CLP.NM1[1].NameFirst4.XMLText><cfif patientFName NEQ ""><cfset patientFName = UCase(Mid(patientFName,1, 1)) & LCase(mid(patientFName, 2, len(patientFName)))></cfif>
		<cfset patientMiddleName = thisClaimXML.CLP.NM1[1].NameMiddle5.XMLText>
		<cfoutput>#patientFName# [#patientMiddleName#] #patientLName#</cfoutput>

		<cfquery name="getName" datasource="#request.datasource#">
			SELECT entityID FROM entity WHERE ObjectTypeID = 3 AND Fname = '#trim(patientFName)#' AND Lname = '#trim(patientLName)#'
		</cfquery>

		<cfif getname.recordcount EQ 1>
			<cfoutput><font color="FF0000">[entityID: #getname.entityID#]</font></cfoutput>
			<cfquery name="getpid" datasource="#request.datasource#">
				SELECT patientid FROM patient WHERE entityID = #getname.entityID#
			</cfquery>

			<cfif getpid.recordcount EQ 1>
				<cfoutput><font color="FF0000">[change #patientiD# to #getpid.patientiD#]</font></cfoutput>
			</cfif>

		<cfelse>
			<cfoutput>[getNameRC: #getname.recordcount#]</cfoutput>
		</cfif>

		<cfoutput><br></cfoutput>
	</cfif>



</cfloop>




--->















<!---<cffile action="READ" file="C:\EOBManager\EOBManagerFMS\Client\1084\2007\1\23\1\010207.xml" variable="fileContents">

			<!-------------------------------------------------------------------------------------->
			<!--- Now that all the tests are passed we can bring the XML file into a local       --->
			<!--- variable.                                                                      --->
			<!-------------------------------------------------------------------------------------->
			<cfset interchange835 = XMLParse(fileContents)>

			<cfset stElements = XMLSearch(interchange835, "//ST")>

			<cfloop from="1" to="#trim(ArrayLen(stElements))#" index="sti">

				<!--------------------------------------------------------------------------------------->
				<!--- loop through all the claims on this interchange and place them in the database. --->
				<!--------------------------------------------------------------------------------------->
				<cfloop from="1" to="#Arraylen(stElements[sti])#" index="i">

					<cfset TransactionSetControlNumber = stElements[sti].TransactionSetControlNumber2.XMLText>

					<!------>
					<cfset N1s = XMLSearch(stElements[sti], "N1")>
					<cfloop from="1" to="#trim(ArrayLen(N1s))#" index="N1">
						<cfif ArrayLen(N1s[N1].XMLChildren) GTE 4 AND N1s[N1].EntityIdentifierCode1.XMLText EQ "PE">
							<cfset providerID = N1s[N1].REF.ReferenceIdentification2.XMLText>
						</cfif>
					</cfloop>
					<!------>
					<!------>
					<cfset CLPsElements = XMLSearch(stElements[sti], "LX/CLP")>

					<cfloop from="1" to="#trim(ArrayLen(CLPsElements))#" index="CLPi">

						<cfset numberOfClaims = ArrayLen(CLPsElements[CLPi])>
						<cfloop from="1" to="#Arraylen(CLPsElements[CLPi])#" index="i">

							<cfset ClaimSubmitterIdentifier = CLPsElements[CLPi].ClaimSubmittersIdentifier1.XMLText>
							<cfset interchangeClaimID = CLPsElements[CLPi].ReferenceIdentification7.XMLText>

							<cfoutput>[#providerID#] #ClaimSubmitterIdentifier# #interchangeClaimID#<br></cfoutput>

						</cfloop>

					</cfloop>
					<!------>

				</cfloop>

			</cfloop>




--->































<!---
	<cfparam name="attributes.formName" default="PatientQuoteForm">
	<cfset formName = attributes.formName>

<cfoutput>
		<script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>

		<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
	    <cfelse>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
	    </cfif>


<script language="JavaScript">


			// Utility function to fetch text from a URL
		    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
		    function _wddxSelectListGetFromURL(strURL) {
		        var objHTTP, result;

		        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
		        if (window.XMLHttpRequest) {
		          objHTTP=new XMLHttpRequest();
		          objHTTP.open("GET", strURL, false);
		          objHTTP.send(null);
		          result=objHTTP.responseText;

		        // For IE browsers under Windows
		        } else if (window.ActiveXObject) {
		          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
		          objHTTP.open("GET", strURL, false);
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		        }

		        // Return result
		        return result;
		    }




			function getInsuranceCompany(data1, data2){

				var url = "#trim(request.urlReconstructed)#/ws/wsInsuranceCompany.cfc?method=wsInsuranceCompany&Data1=" + escape(data1) + "&Data2=" + escape(data2);
				var packet = _wddxSelectListGetFromURL(url);
				var wddxDes = new WddxDeserializer;
				var result = wddxDes.deserialize(packet);
				alert(result);
				if (result != null) {
					return result;
				};
				else{
					return false;
				}
			};

			var insuranceCompanyInfo = getInsuranceCompany(#trim(session.Client.getClientID())#, 54254);//ACTIVE|ADDRESSID|ADDRESSLINE1|ADDRESSLINE2|ADDRESSTYPE|ADDRESSTYPEID|CITY|COUNTRYID|DATECREATED|ENTITYID|INSURANCECOMPANYDBA|INSURANCECOMPANYID|INSURANCECOMPANYNAME|INSURANCECOMPANYURL|OCNANUMBER|PHONEEXTENSION|PHONEID|PHONENUMBER|STATEABBR|STATEFULL|STATEID|ZIPCODE';

			var insuranceCompanyArray = insuranceCompanyInfo.split("|");


		</script>



</cfoutput>


--->



















<!---<cfobject action="Create" name="PDF417" class={D73733C8-CC80-11D0-B225-00C04FB6C2F5}
context="REMOTE" server="http://192.168.1.115">
<cfdump var="#PDF417#" expand="no">--->

<!---<cfobject action="Create" name="PDF417" class="{D73733C8-CC80-11D0-B225-00C04FB6C2F5}" context="REMOTE" server="\\Win2000k">
<cfdump var="#PDF417#" expand="no">--->

<!---<CFTRY>
    <!--- If it exists, connect to it --->
    <CFOBJECT ACTION="CONNECT" CLASS={00020812-0000-0000-C000-000000000046} NAME="objExcel" TYPE="COM">
  <CFCATCH>
    <!--- The object doesn't exist, so create it --->
    <CFOBJECT ACTION="CREATE" CLASS={00020812-0000-0000-C000-000000000046} NAME="objExcel" TYPE="COM">
  </CFCATCH>
</CFTRY>
<cfdump var="#objExcel#" expand="no">--->

<!---
<cfabort>



<cftry>
	<cfobject type="COM" action="Create" name="fsc" class="{D73733C8-CC80-11D0-B225-00C04FB6C2F5}" context="REMOTE" server="192.68.1.115">
	<cfdump var="#fsc#" label="fsc" expand="No">

	<!---<cfset temp = fsc.Connect("Win2k3")>--->
	<!---<cfdump var="#temp#" label="Connect">

	<cfset tempo = fsc.CreateDocument("c:\temp\021406.txt")>
	<cfdump var="#tempo#" label="CreateDocument">

	<cfset tempo.FaxNumber("14692298834")>
	<cfset tempo.Send()>--->

	<cfcatch type="Any">
		<cfoutput><p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>The contents of the tag stack are:<br><cfdump var="#cfcatch.tagcontext#"></cfoutput>
	</cfcatch>

</cftry>

--->



















<!---


<cfabort>


<cftry>


	<cfobject type="COM" action="Create" name="PDF417" class="PDF417ActiveX.PDF417Ctrl">
	<cfset PDF417.DataColumns(8)>
	<cfset PDF417.DataRows(7)>
	<cfset PDF417.ErrorCorrectionLevel(4)>
	<cfset PDF417.DataToEncode('Melia|1123-20061218-45894')>
	<cfset PDF417.SaveToImageFile(215, 35, "c:\temp\pdf4172.jpg")>

	&nbsp;<p><img src="c:\temp\pdf4172.jpg" border="1" alt=""></p>

	<cfobject type="COM" action="Create" name="ClearImage" class="ClearImage.ClearImage">
	<cfset PDF417 = ClearImage.CreatePDF417()>
	<cfset PDF417.image.open('c:\temp\CProgramFilesRightFax.TIF')>

	<p>
		<hr>
			<cfoutput>#PDF417.FirstBarcode().text#</cfoutput>
		<hr>
	</p>


	<cfcatch type="Any">
		<cfoutput>
			<p>Caught an exception, type = #CFCATCH.TYPE#</p>
			<p>#cfcatch.message# #cfcatch.detail#</p>
	        The contents of the tag stack are:<br>
	        <cfdump var="#cfcatch.tagcontext#">
		</cfoutput>
	</cfcatch>

</cftry>

--->












<!---
UPN Bar Code Labeling: A Guide for Implementation in Healthcare (Paperback)
http://www.hibcc.org/
--->
























<!---<cfset request.intakeNote = CreateObject("component","com.common.Note")>

<cfset intakeNoteID = request.intakeNote.getNoteID(objectID: 8, instanceID: 98, clientID: trim(session.clientID))>

<cfif NOT IsNumeric(intakeNoteID) AND IsNumeric(intakeID)>
	<cfset intakeNoteID = request.intakeNote.addNote(clientID: trim(session.clientID), objectID: 8, instanceID: 98)>
</cfif>


<!------>

<cfabort>
--->

<!---
SELECT     ClosingInvoiceNumber AS Expr1, Active AS Expr2, *
FROM intake
WHERE     (Active = 0) AND (ClosingInvoiceNumber IS NULL)
--->

<!---
<cfquery name="getIntakes" datasource="#trim(request.datasource)#">
	SELECT IntakeID, closingInvoiceNumber, Active
	FROM intake
</cfquery>

<cfset request.intakeNote = CreateObject("component","com.common.Note")>
<cfset note = "System Note: Intake cancelled through cancellation system going online 12/8/06">

<cfloop query="getIntakes">

	<cfif closingInvoiceNumber EQ 0 OR closingInvoiceNumber EQ 00 OR closingInvoiceNumber EQ 000 OR closingInvoiceNumber EQ 0000 OR closingInvoiceNumber EQ 00000 OR closingInvoiceNumber EQ 000000 OR closingInvoiceNumber EQ 0000000 OR closingInvoiceNumber EQ 00000000 OR closingInvoiceNumber EQ 000000000>

		<cfoutput>#IntakeID#, #closingInvoiceNumber#, #Active#<br></cfoutput>

		<cfquery name="Intakes" datasource="#trim(request.datasource)#">
			UPDATE intake
			set closingInvoiceNumber = NULL, Active = 0
			WHERE IntakeID = #trim(IntakeID)#
		</cfquery>

		<cfset intakeNoteID = request.intakeNote.getNoteID(objectID: 8, instanceID: trim(intakeID), clientID: trim(session.clientID))>
		<cfif NOT IsNumeric(intakeNoteID) AND IsNumeric(intakeID)>
			<cfset intakeNoteID = request.intakeNote.addNote(clientID: trim(session.clientID), objectID: 8, instanceID: trim(intakeID))>
		</cfif>

		<cfoutput><font color="FF0000">#intakeNoteID#</font><br><br></cfoutput>

		<cfset request.intakeNote.addNoteEntry(clientID: trim(session.clientID), NoteID: intakeNoteID, noteEntry: '#trim(note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>

	<cfelseif closingInvoiceNumber GTE 1>

		<cfoutput>NOT NULL #IntakeID#, #closingInvoiceNumber#, #Active#<br></cfoutput>

		<cfquery name="Intakes" datasource="#trim(request.datasource)#">
			UPDATE intake
			set Active = 1
			WHERE IntakeID = #trim(IntakeID)#
		</cfquery>

	</cfif>

</cfloop>
--->

















<!---

<cfset request.ClientNightlyBatch = CreateObject("component", "com.common.ClientNightlyBatch")>


<cfset message = "<p>" & request.ClientNightlyBatch.checkUserTasksTimeSpan(1084) & "</p>">


<cfoutput>#message#</cfoutput>


--->




















<!---<cfquery name="getIntakesTimeSpan" datasource="PAClient_1084">
	SELECT i.IntakeID AS intakeID, i.patientFNameTBox, i.PatientLNameTBox, i.assignedToUserID, i.DateModified, TIMESTAMPDIFF(Hour, i.DateModified, now()) AS numofHours, CONCAT(vw.FName, ' ', vw.LName) AS AssignedToName
	FROM intake i
	JOIN view_UserAccountParameters vw ON i.assignedToUserID = vw.UsersID
	WHERE i.Active = 1 AND i.DateModified IS NOT NULL AND TIMESTAMPDIFF(Hour, i.DateModified, now()) > 48
	UNION
	SELECT i.IntakeID AS intakeID, i.patientFNameTBox, i.PatientLNameTBox, i.assignedToUserID, i.DateCreated, TIMESTAMPDIFF(Hour, i.DateCreated, now()) AS numofHours, CONCAT(vw.FName, ' ', vw.LName) AS AssignedToName
	FROM intake i
	JOIN view_UserAccountParameters vw ON i.assignedToUserID = vw.UsersID
	WHERE i.Active = 1 AND i.DateModified IS NULL AND TIMESTAMPDIFF(Hour, i.DateModified, now()) > 48
</cfquery>

<cfset assignedUsersIDs = valueList(getIntakesTimeSpan.assignedToUserID)>
<cf_gcListRemoveDuplicates list="#trim(assignedUsersIDs)#" name="assignedUsersIDs">

<cfloop list="#trim(assignedUsersIDs)#" index="i">

	<cfset note =  "<p><strong>The following intakes have had no action performed on them for 48 hours.</strong></p><script language=JavaScript>function editIntake(intakeid){window.opener.location='appPatientIntakeEdit.cfm?IntakeID='+intakeid};</script>">

	<cfloop query="getIntakesTimeSpan">
		<cfif assignedToUserID EQ i>
			<cfset note = note & "<strong>Intake ID:</strong> <a href=## onclick=editIntake(#trim(IntakeID)#);>#trim(IntakeID)#</a> <strong>Patient:</strong> #patientFNameTBox# #patientLNameTBox# <br><strong>Last Modified:</strong> #DateFormat(DateModified, 'mm/dd/yy')# #TimeFormat(DateModified, 'h:mm:ss tt')#<br>">
		</cfif>
	</cfloop>

	<cfquery name="insertSystemUserMessage" datasource="PAClient_#trim(ClientID)#">
		INSERT INTO SystemUserMessage(UsersID,Note)
		VALUES(#trim(i)#, '#trim(note)#')
	</cfquery>

</cfloop>

--->
























<!---

<cf_gcCleanIntakeSSNs>--->





















<!---<cf_temp>--->

<!---<cf_ei_1002_InsertUpdateFinalFeeSchedule_2002>--->

<!---<cf_ei_1002_InsertUpdateFinalFeeSchedule_2003>--->

<!---<cf_ei_1002_InsertUpdateFinalFeeSchedule_2004>--->

















<!---

<cfset temp = CreateObject("component", "com.common.db.IPAddressLoginIO")>
<cfset temp.setClientID(1084)>
<cfset temp.setStartRange('192.168.1.100')>
<cfset temp.setEndRange('192.168.1.142')>
<cfset temp.setNote('This is the office range.')>

<cfset newID = temp.commit()>

<cfset temp.init(newID)>

<cfoutput>#temp.getStartRange()#</cfoutput>

<cfdump var="#temp#" expand="no">




--->



























<!---<!-------------------------------------------------------------------------------------->
<!--- Start the dicplay or procedure of this page.                                   --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="Submitted" default="no">
	<cfif Submitted>
		<cfexecute name="C:\Temp\EOBUpdatesToC.bat" arguments="" timeout="60"></cfexecute>
		<cfoutput><br><br>Done Loading New Code.</cfoutput>
	<cfelse>
		<form method="post">
			<table border="0" cellpadding="2" cellspacing="2" width="100%"><tr><td align="center" colspan="2"><br><br>
				<input type="submit" value="Load New Code?" class="SiteSubmitbox"><input type="hidden" name="Submitted" value="yes">
			</td></tr></table>
		</form>
	</cfif>







	--->











<!---<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE('9796918713') />
<cfoutput>#PhoneNumberE#</cfoutput>	--->


<!---

	<cfset count = 1>
	<cfsetting requestTimeOut = "900">

	<cffile action="READ" file="C:\Temp\ter.txt" variable="fileContent">

	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">

		<cfset ID = ListGetAt(i,1,"|")>

		<cfoutput>
			&lt;cffunction name="get#trim(ID)#" access="public" returntype="String" output="No"&gt;<br>
		  		&lt;cfreturn variables.instance.#trim(ID)#&gt;<br>
			&lt;/cffunction&gt;<br><br>
		</cfoutput>

		<!---<cfoutput>
		&lt;cfif IsDefined("form.#trim(ID)#") AND form.#trim(ID)# NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.#trim(ID)#))##',&lt;/cfif&gt;<br>
		</cfoutput>--->

		<!---<cfoutput>
		&lt;cfif IsDefined("form.#trim(ID)#") AND form.#trim(ID)# NEQ ""&gt;#trim(ID)#,&lt;/cfif&gt;<br>
		</cfoutput>--->

		<!---<cfoutput>
			&lt;cfif IsDefined("form.#trim(ID)#")&gt;,#trim(ID)# = &lt;cfif form.#trim(ID)# NEQ ""&gt;'##REQUEST.mssqlReplaceSingleQuote(trim(form.#trim(ID)#))##'&lt;cfelse&gt;NULL&lt;/cfif&gt;&lt;/cfif&gt;<br>
		</cfoutput>--->

		<!---<cfoutput>
		&lt;cfif IsDefined("form.#trim(ID)#") AND getIntake.#trim(ID)# NEQ form.#trim(ID)#&gt;<br>
			&lt;cfset note = note & "#UCASE(trim(ID))# changed from &lt;strong&gt;[&lt;/strong&gt;##getIntake.#trim(ID)###&lt;strong&gt;]&lt;/strong&gt; to &lt;strong&gt;[&lt;/strong&gt;##form.#trim(ID)###&lt;strong&gt;]&lt;/strong&gt;&lt;br&gt;"&gt;<br>
		&lt;/cfif&gt;<br>
		</cfoutput>--->



		<!---<cfif (Find("No", trim(ID)) OR Find("Yes", trim(ID)) OR Find("VerificationMedicaidPlan", trim(ID))) AND NOT Find("TBox", trim(ID))>
			<cfoutput>
				IFNULL(#trim(ID)#, 0) AS #trim(ID)#,
			</cfoutput>
		<cfelse>
			<cfoutput>
				#trim(ID)#,
			</cfoutput>
		</cfif>--->

		<cfset count = count  + 1>

	</cfloop>








--->























