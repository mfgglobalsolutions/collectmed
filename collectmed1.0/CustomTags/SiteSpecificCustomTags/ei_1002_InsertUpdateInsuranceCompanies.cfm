<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   ei_1002_InsertUpdateInsuranceCompanies.cfm               --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   Maintenance                                              --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---   Guillermo Cruz                                           --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- File: #trim(request.applicationPath)#\                     --->
<!--- eobmanager\eob_1002_Codes_Import\                          --->
<!--- OCNAList1.txt                                              --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---  &lt;cf_ei_1002_InsertUpdateFinalFeeSchedule<br>           --->
<!---  &nbsp;&nbsp;testmode="no"                                 --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---  [none]                                                    --->  
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!--- <b>filepath</b> (#trim(request.driveLetter)#:\             --->
<!--- eobmanager\eob_1002_Codes_Import)<br>                      --->
<!--- <strong>filename</strong> (OCNAList1.txt)                  --->
<!---<br>                                                        --->
<!--- <strong>testmode</strong> <b>TRUE</b>|FALSE&nbsp;          --->
<!---          (allows test prior to actual action)              --->  
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---   output to screen row action.                             --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---    Created 08/03/05                                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------> 



<!-------------------------------------------------------------------------------------->
<!--- Column Names                                                                   --->
<!--- OCNA,COMPANY,ADDRESS1,ADDRESS2,CITY,ST,ZIP,Phone,URL                           --->
<!-------------------------------------------------------------------------------------->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.testmode" default="no">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="c:\eobmanager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="OCNAList1.txt">
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
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Drop the table and add it back.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="dropAddTable" datasource="#request.datasource#">
		if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsuranceCompany]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		drop table [dbo].[InsuranceCompany]
				
		CREATE TABLE [dbo].[InsuranceCompany] (
			[InsuranceCompanyID] [int] IDENTITY (1001, 1) NOT NULL ,
			[OCNANumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[InsuranceCompanyName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[InsuranceCompanyDBA] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[EntityID] [int] NULL ,
			[InsuranceCompanyURL] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
			[InactiveCode] [int] NULL ,
			[DateCreated] [datetime] NOT NULL ,
			[DateModified] [datetime] NULL 
		) ON [PRIMARY]
				
		ALTER TABLE [dbo].[InsuranceCompany] ADD 
			CONSTRAINT [DF_InsuranceCompany_Active] DEFAULT (1) FOR [Active],
			CONSTRAINT [DF_InsuranceCompany_DateCreated] DEFAULT (now()) FOR [DateCreated],
			CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY  CLUSTERED 
			(
				[InsuranceCompanyID]
			) WITH  FILLFACTOR = 90  ON [PRIMARY] 
	</cfquery> 	
	
	
		
<!------------------------------------------------------------------>
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database.               --->
<!------------------------------------------------------------------>				
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
				
		<cfset OCNANumber = ListGetAt(i,1,"|")>
		<cfset insurancecompanyname = ListGetAt(i,2,"|")>
		<cfset Attention = ListGetAt(i,3,"|")>
		<cfset AddressLine1 = ListGetAt(i,4,"|")>
		<cfset AddressLine2 = ListGetAt(i,5,"|")>
		<cfset AddressCity = ListGetAt(i,6,"|")>
		<cfset StateAbbr = ListGetAt(i,7,"|")>
		<cfset AddressZipCode = REQUEST.cleanNumericString(ListGetAt(i,8,"|"))>		
		<cfset PhoneNumber = REQUEST.cleanNumericString(ListGetAt(i,9,"|"))>
		<cfif ListLen(i, "|") EQ 10> 
			<cfset InsuranceCompanyURL = ListGetAt(i,10,"|")>
		<cfelse>
			<cfset InsuranceCompanyURL = "">
		</cfif>		
		
		<cfset SupportEmailAddressID = session.client.getSupportEmailID()>		
		<cfset insurancecompanydba = "">
		<cfset AddressTypeID = "13">		
		<cfset PhoneTypeID = "">		
		<cfset PhoneExtension = "">			
			
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" itemDescription="#trim(StateAbbr)#" active="1" fields="StandardListItemID" returnvariable="getStateID">
		<cfset AddressStateID = getStateID.StandardListItemID>
			
		<cfset request.InsuranceCompany = CreateObject("component", "com.common.InsuranceCompany")>						
		<cfset getCode = request.InsuranceCompany.getInsuranceCompanyQuery(fields: 'InsuranceCompanyID', OCNANumber: '#trim(OCNANumber)#')>
		
							
		<cfif getCode.RecordCount GTE 1>
			
			<cfoutput><font size="1">[UPDATE]<br>[#trim(i)#]<br><font color="FF0000">[#trim(InsuranceCompanyID)#]</font><p></p></font></cfoutput>
			
			<cfif NOT testmode>
								
			</cfif>
			
		<cfelse>
			
			<cfif NOT testmode>
				
				<cfset insuranceCompanyID = request.InsuranceCompany.addInsuranceCompany(siteID: trim(request.Site.getSiteID()), SupportEmailAddressID, OCNANumber, insurancecompanyname, insurancecompanydba, AddressTypeID, Attention, AddressLine1, AddressLine2, AddressCity, AddressStateID, AddressZipCode, PhoneTypeID, PhoneNumber, PhoneExtension, InsuranceCompanyURL, 'no')>
			
			</cfif>
			
			<cfoutput>[@@-#insuranceCompanyID#-@@]<font size="1">[#count#][INSERT NEW]<br>[#trim(i)#]<br><font color="FF0000">[trim(code)]</font><p></p></font></cfoutput>
			
			
			
		</cfif>			
	
		<cfset count = count + 1>
		
	</cfloop>
					
	

		
