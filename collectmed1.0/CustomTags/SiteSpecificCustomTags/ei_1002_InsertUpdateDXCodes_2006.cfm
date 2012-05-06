

<cfquery name="delTable" datasource="#request.datasource#">
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_DXCode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_DXCode]


CREATE TABLE [dbo].[EOB_MEDICARE_DXCode] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[Code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Description] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]


ALTER TABLE [dbo].[EOB_MEDICARE_DXCode] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_DXCode_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_DXCode_DateCreated] DEFAULT (now()) FOR [DateCreated],
	CONSTRAINT [PK_EOB_MEDICARE_DXCode] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 


</cfquery>





<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="ICD9_2006_V1SHORT.txt">
	<cfset filename = attributes.filename>
		
	<cfset count = 1>
	
	

<!------------------------------------------------------------------>
<!--- Set the timeout for the code to be able to run throughly.  --->
<!------------------------------------------------------------------>
	<cfsetting requestTimeOut = "900">
	
	
	
<!------------------------------------------------------------------>
<!--- Verify the needed variables were passed in.                --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="filename,filepath"
		fieldnames="File Name,File Path">	


	
<!------------------------------------------------------------------>
<!--- Include the files that contain the necessary javascript    --->
<!--- and cfscripts to run this page.                            --->
<!------------------------------------------------------------------>
	<cf_gcCFScriptIncludes>
	<cf_gcJScriptIncludes>



<!------------------------------------------------------------------>
<!--- Check to make sure the directory actually exists.          --->
<!------------------------------------------------------------------>
	<cfif NOT DirectoryExists("#trim(filepath)#\")>
		<cf_gcGeneralErrorTemplate
			message="The specified path does not exist (#trim(filepath)#).">
	</cfif>



<!------------------------------------------------------------------>
<!--- Check to make sure the file actually exists.               --->
<!------------------------------------------------------------------>
	<cfif NOT FileExists("#trim(filepath)#\#trim(fileName)#")>
		<cf_gcGeneralErrorTemplate
			message="The file you are trying to view is not in the specified path (#trim(filepath)#\#trim(fileName)#).">
	</cfif>



<!------------------------------------------------------------------>
<!--- Read the file that has been sent in and set it ue.         --->
<!------------------------------------------------------------------>
	<cffile
		action="READ"
		file="#trim(filepath)#\#trim(fileName)#" variable="fileContent">
		
		
		
<!------------------------------------------------------------------>
<!--- Output to the screen.                                      --->
<!------------------------------------------------------------------>	
	
	<cfif testmode>
		<font size="5" color="FF0000">RAN IN TEST MODE</font><p>
	<cfelse>
		<font size="5" color="FF0000">RAN IN LIVE MODE</font><p>	
	</cfif>
	
	
		
<!------------------------------------------------------------------>
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database.               --->
<!------------------------------------------------------------------>			
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
				
		<cfset thisCode = ListGetAt(i,1,"|")>
		<cfset description = ListGetAt(i,2,"|")>		
				
		<cfif len(thisCode) GT 3>
			<cfset front = Left(thisCode, 3)>
			<cfset back = Mid(thisCode, 4, len(thisCode) - 3)>
			<cfset thisCode = trim(front) & "." & trim(back)>			
		</cfif>		
				
		<cfquery name="getCode" datasource="#trim(request.datasource)#">
			SELECT RecordID 
			FROM pa_master.EOB_MEDICARE_DXCode
			WHERE Code = '#trim(thisCode)#' 
		</cfquery>
		
		<cfif getCode.Recordcount LTE 0>
			
			<cfquery name="insertCode" datasource="#trim(request.datasource)#">
				INSERT INTO pa_master.EOB_MEDICARE_DXCode  (Code, Description)
				VALUES('#trim(thisCode)#', '#trim(Description)#');
				SELECT LAST_INSERT_ID() AS thisRecordID 
			</cfquery>				
					
			<cfoutput>[#trim(thisCode)#][#trim(Count)#]<br><br></cfoutput>		
			
		</cfif>
			
		<cfset count = count  + 1>
		
	</cfloop>	

	