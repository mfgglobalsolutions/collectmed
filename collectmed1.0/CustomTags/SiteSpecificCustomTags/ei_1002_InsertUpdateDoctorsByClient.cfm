<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="DrFile1.txt">
	<cfset filename = attributes.filename>
		
	<cfset count = 1>
	
	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>
	
	

<!------------------------------------------------------------------>
<!--- Set the timeout for the code to be able to run throughly.  --->
<!------------------------------------------------------------------>
	<cfsetting requestTimeOut = "900">
	
	
	
<!------------------------------------------------------------------>
<!--- Verify the needed variables were passed in.                --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="filename,filepath,clientID"
		fieldnames="File Name,File Path,Client ID">	


	<cfset datasource = "PAClient_" & trim(clientID)>
	
	
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
			

		
		
		
		
		
		
		
		
		
		
		
<!---****************************************************************************************************************--->		
	<!---<cfquery name="delTable" datasource="#datasource#">
		if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Doctor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		drop table [dbo].[Doctor]
				
		CREATE TABLE [dbo].[Doctor] (
			[DoctorID] [int] IDENTITY (1001, 1) NOT NULL ,
			[EntityID] [int] NULL ,
			[ClientDoctorID] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[DoctorCategory] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[UPIN] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[MedicareNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[MedicaidNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[GroupName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[SpecialInstructions] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
			[InactiveCode] [int] NULL ,
			[DateCreated] [datetime] NOT NULL ,
			[DateModified] [datetime] NULL 
		) ON [PRIMARY]		
		
		ALTER TABLE [dbo].[Doctor] WITH NOCHECK ADD 
			CONSTRAINT [PK_Doctor] PRIMARY KEY  CLUSTERED 
			(
				[DoctorID]
			) WITH  FILLFACTOR = 90  ON [PRIMARY] 
		
		
		ALTER TABLE [dbo].[Doctor] ADD 
			CONSTRAINT [DF_Doctor_Active] DEFAULT (1) FOR [Active],
			CONSTRAINT [DF_Doctor_DateCreated] DEFAULT (now()) FOR [DateCreated]
			
	</cfquery>--->
<!---****************************************************************************************************************--->
	


		
		
		
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
				
		<cfset thisClientDoctorID = ListGetAt(i,1,"|")>
		<cfset DoctorCategory = ListGetAt(i,2,"|")>		
		<cfset prefix = ListGetAt(i,3,"|")>
		<cfset GroupName = ListGetAt(i,4,"|")>	
		<cfset LASTNAME = ListGetAt(i,5,"|")>		
		<cfset FIRSTNAME = ListGetAt(i,6,"|")>
		<cfset MedicaidNumber = ListGetAt(i,7,"|")>
		<cfset MedicareNumber = ListGetAt(i,8,"|")>
		<cfset UPIN = ListGetAt(i,9,"|")>
		<cfset ADDRESSLINE1 = ListGetAt(i,10,"|")>
		<cfset ADDRESSLINE2 = ListGetAt(i,11,"|")>
		<cfset CITY = ListGetAt(i,12,"|")>
		<cfset ST = ListGetAt(i,13,"|")>
		<cfset ZIPCODE = ListGetAt(i,14,"|")>
		<cfset CONTACT = ListGetAt(i,15,"|")>
		
		<cfif FindNoCase("FAX", CONTACT)>
			<cfset FAX = REQUEST.CleannumericString(CONTACT)>
			<cfif Len(fax) EQ 7>
				<cfset FAX = 000 & trim(FAX)>
			<cfelseif trim(FAX) EQ "">
				<cfset FAX = "NULL"> 	
			<cfelseif Len(FAX) NEQ 10>
				<cfset FAX = "NULL"> 	
			</cfif>
		<cfelse>
			<cfset FAX = "NULL">	
		</cfif>
		
		<cfset PHONE = REQUEST.CleannumericString(ListGetAt(i,16,"|"))>
		<cfif PHONE EQ "">
			<cfset PHONE = "NULL">
		</cfif>
		
		<cfset EXT = ListGetAt(i,17,"|")>
		
		<cfset GroupName = REQUEST.capitalizeEveryFirstLetter(trim(GroupName))>
		<cfset LASTNAME = REQUEST.capitalizeEveryFirstLetter(trim(LastName))>
		<cfset FIRSTNAME = REQUEST.capitalizeEveryFirstLetter(trim(FirstName))>		
		<cfset CITY = REQUEST.capitalizeEveryFirstLetter(trim(City))>
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Query to find out if the doctor is already in the DB                           --->
		<!-------------------------------------------------------------------------------------->				
		<cfquery name="getDoctorID" datasource="#trim(datasource)#">
			SELECT DoctorID
			FROM doctor
			WHERE ClientDoctorID = '#trim(thisClientDoctorID)#' 
		</cfquery>
		
		<cfif getDoctorID.Recordcount LTE 0>
			
			<cfif testmode>
						
				<!-------------------------------------------------------------------------------------->
				<!--- Start the insert of the new Doctor account.                                    --->
				<!-------------------------------------------------------------------------------------->
				<cfquery name="insertNewDoctor" datasource="#trim(datasource)#">
					INSERT INTO entity  (SiteID, ClientID, ObjectTypeID, Prefixname, FName, LName)
					VALUES(#trim(request.Site.getSiteID())#, '#trim(clientID)#', 10, <cfif trim(prefix) EQ "null">NULL<cfelse>'#trim(prefix)#'</cfif>, <cfif trim(FirstName) EQ "null">NULL<cfelse>'#trim(FirstName)#'</cfif>, <cfif trim(LastName) EQ "null">NULL<cfelse>'#trim(LastName)#'</cfif>);
					SELECT LAST_INSERT_ID() AS newDoctorID 
				</cfquery>			
				
				<cfset newDoctorID = insertNewDoctor.newDoctorID>	
				
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="standardlistItemID" ItemDescription="#trim(ST)#" listid="4" active="1" returnvariable="getStateID">
										
				<cfset stateID = getStateID.standardlistItemID>
				
				<cfquery name="insertAddress" datasource="#trim(datasource)#">
					INSERT INTO address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)
					VALUES(11, <cfif trim(AddressLine1) EQ "null">NULL<cfelse>'#trim(AddressLine1)#'</cfif>, <cfif trim(AddressLine2) EQ "null">NULL<cfelse>'#trim(AddressLine2)#'</cfif>, <cfif trim(City) EQ "null">NULL<cfelse>'#trim(City)#'</cfif>, <cfif NOT IsNumeric(stateID)>NULL<cfelse>#trim(StateID)#</cfif>, <cfif trim(ZipCode) EQ "null">NULL<cfelse>'#trim(ZipCode)#'</cfif>);
					SELECT LAST_INSERT_ID() AS addressID 
				</cfquery>
			
				<cfset addressID = insertAddress.addressID>
				
				<cfquery name="insertEntityAddress" datasource="#trim(datasource)#">
					INSERT INTO entityaddress  (EntityID, AddressID, IsDefault)
					VALUES(#trim(newDoctorID)#, '#trim(addressID)#', 1)				
				</cfquery>	
				
						
				<!-------------------------------------------------------------------------------------->
				<!--- Start inserting the new phone number for this Doctor.                            --->
				<!-------------------------------------------------------------------------------------->				
				<cfif Phone NEQ "Null">			
					<cfset Phone = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Phone)) />
				</cfif>
				
				<cfif trim(Ext) NEQ "Null">
					<cfset Ext = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Ext)) />				
				</cfif>
				
				<cfquery name="insertNewDoctorPhone" datasource="#trim(datasource)#">
					INSERT INTO phone  (phoneNumber, phoneExtension, PhoneTypeID)
					VALUES(<cfif trim(Phone) EQ "Null">NULL<cfelse>'#trim(Phone)#'</cfif>, <cfif trim(Ext) EQ "Null">NULL<cfelse>'#trim(Ext)#'</cfif>, 74);
					SELECT LAST_INSERT_ID() AS phoneID 
				</cfquery>
				
				<cfset newDoctorPhoneID = insertNewDoctorPhone.phoneID>	
				
				<cfquery name="insertNewDoctorEntityPhone" datasource="#trim(datasource)#">
					INSERT INTO entityphone  (EntityID, PhoneID, IsDefault)
					VALUES(#trim(newDoctorID)#, '#trim(newDoctorPhoneID)#', 1)				
				</cfquery>
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Start inserting the new Fax number for this Doctor.                            --->
				<!-------------------------------------------------------------------------------------->				
				<cfif Fax NEQ "Null">			
					<cfset Fax = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Fax)) />
				</cfif>							
				
				<cfquery name="insertNewDoctorFax" datasource="#trim(datasource)#">
					INSERT INTO phone  (phoneNumber, PhoneTypeID)
					VALUES(<cfif trim(Fax) EQ "Null">NULL<cfelse>'#trim(Fax)#'</cfif>, 87);
					SELECT LAST_INSERT_ID() AS FaxID 
				</cfquery>
				
				<cfset newDoctorFaxID = insertNewDoctorFax.FaxID>	
				
				<cfquery name="insertNewDoctorEntityFax" datasource="#trim(datasource)#">
					INSERT INTO entityphone  (EntityID, PhoneID, IsDefault)
					VALUES(#trim(newDoctorID)#, '#trim(newDoctorFaxID)#', 1)				
				</cfquery>								
					
									
				<cfquery name="insertCode" datasource="#trim(datasource)#">
					INSERT INTO doctor  (EntityID, ClientDoctorID, DoctorCategory, UPIN, MedicareNumber, MedicaidNumber, GroupName)
					VALUES(#trim(newDoctorID)#, <cfif trim(thisClientDoctorID) EQ "Null">NULL<cfelse>'#trim(thisClientDoctorID)#',</cfif> <cfif trim(DoctorCategory) EQ "Null">NULL<cfelse>'#trim(DoctorCategory)#'</cfif>, <cfif trim(UPIN) EQ "Null">NULL<cfelse>'#trim(UPIN)#'</cfif>, <cfif trim(MedicareNumber) EQ "Null">NULL<cfelse>'#trim(MedicareNumber)#'</cfif>, <cfif trim(MedicaidNumber) EQ "Null">NULL<cfelse>'#trim(MedicaidNumber)#'</cfif>, <cfif trim(GroupName) EQ "Null">NULL<cfelse>'#trim(GroupName)#'</cfif>);
					SELECT LAST_INSERT_ID() AS thisRecordID 
				</cfquery>
				
				
			</cfif>				
					
			<cfoutput>[<strong>Doctor ID:</strong> #thisClientDoctorID#][<strong>Cat:</strong> #DoctorCategory#][<strong>prefix:</strong> #prefix#][<strong>Grp Name:</strong> #GroupName#][<strong>LName:</strong> #LASTNAME#][<strong>FName:</strong> #FIRSTNAME#][<strong>Medicaid:</strong> #MedicaidNumber#][<strong>Medicare:</strong> #MedicareNumber#][<strong>UPIN:</strong> #UPIN#][<strong>ADDRESSLINE1:</strong> #ADDRESSLINE1#][<strong>ADDRESSLINE2:</strong> #ADDRESSLINE2#][<strong>City:</strong> #CITY#][<strong>ST:</strong> #ST#][<strong>ZIPCODE:</strong> #ZIPCODE#][<strong>CONTACT:</strong> #CONTACT#][<strong>FAX:</strong> #FAX#][<strong>Phone:</strong> #PHONE#][<strong>Ext:</strong> #EXT#][<strong>Count:</strong> #trim(Count)#]<br><br></cfoutput>	
			
		</cfif>
				
		<cfset count = count  + 1>
		
	</cfloop>	

	






