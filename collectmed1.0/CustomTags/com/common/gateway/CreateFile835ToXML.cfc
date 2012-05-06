	



<cfcomponent>
  
   <cffunction name="onIncomingMessage" output="no">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
							
			<cf_gcCFScriptIncludes>		
			<cfset data = CFEvent.data>
			
			<cfset request.datasource = "#trim(data.datasource)#">			
			<cfset request.RO_datasource = "#trim(data.datasource)#">
			<cfset request.applicationPath = "#trim(data.applicationPath)#">
			<cfset siteID = "#trim(data.siteID)#">			
			<cfset clientID = "#trim(data.clientID)#">    	
			<cfset fileID = "#trim(data.fileID)#">  
			<cfset SupportEmailAddressID = "#trim(data.SupportEmailAddressID)#"> 
					
	
			<!-------------------------------------------------------------------------------------->
			<!--- Verify that the needed parameters have been sent in.                           --->
			<!-------------------------------------------------------------------------------------->
			<cf_gcVerifyFields
				fields="clientID,fileID,SupportEmailAddressID"
				fieldnames="Client ID,File ID,Support Email Address ID"
				datatypes="numeric,numeric,numeric"
				senderrortocaller="yes">
				
			<cfif errorMessage NEQ "">
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "#trim(errorMessage)#">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The file processed is missing fields. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong></p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#message#')>
				<cfset request.FileProcess.commit()>				
				<cfthrow message="#trim(message)#">
			</cfif>	
							
			<!-------------------------------------------------------------------------------------->
			<!--- Create the File object.                                                        --->
			<!-------------------------------------------------------------------------------------->		
			<cfset request.File = CreateObject("component","com.common.File")>	
			
					
			<!-------------------------------------------------------------------------------------->
			<!--- First find out if the file actually has a DB record.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfif request.File.checkFileExistsInDB(trim(fileID))>
				<cfset request.File.Init(trim(fileID))>	
			<cfelse>
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The file you are attempting to process does not exist in the database. Please contact an administrator if you feel this is an error.">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong></p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>					
				<cfthrow message="#trim(message)#">
			</cfif>
		
			<!----------------------------------------------------------------------------------------------->
			<!--- To this point the DB record is in place now setup the variables to check the directory. --->
			<!----------------------------------------------------------------------------------------------->		
			<cfset directoryPath = request.File.getServerDirectory()>
			<cfset fileName	= request.File.getServerFile()>			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Does the File Exists and can it be found in the Directory with this string     --->
			<!--- in it.                                                                         --->
			<!-------------------------------------------------------------------------------------->			
			<cfset existsFile = request.File.checkFileExistsInDirectory(filename: "#trim(fileName)#", directory: "#trim(directoryPath)#\")>
			
			<cfif NOT existsFile>
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The file you are attempting to process does not exist in the directory but does exist in the database. Please contact an administrator.">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client file in directory does not exist. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			
			</cfif>			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check the file the 835 file string.                                            --->
			<!-------------------------------------------------------------------------------------->			
			<cffile action="READ" file="#trim(directoryPath)#\#trim(fileName)#" variable="fileContents">
			
			<!-------------------------------------------------------------------------------------->
			<!--- Take out any single qoutes before converting to XML.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfset fileContents = Replace(fileContents, "'", "", "ALL")>			
			<cffile action="write" nameconflict="OVERWRITE" file="#trim(directoryPath)#\#trim(fileName)#" output="#trim(fileContents)#">
			
				
			<cfif NOT FindNoCase("ST*835*", trim(fileContents))>					
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message="The file uploaded does not meet the 835 file standard. Please check the file for errors. 105">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client file in directory does not exist. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			</cfif>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- At this point the file has passed all tests and can be converted into          --->
			<!--- an 835 XML file to be processed into the DB                                    --->
			<!-------------------------------------------------------------------------------------->			
			<cf_ei_1002_XtremeTranslatorConvert 
				fileID="#trim(fileID)#" 
				directorypath="#trim(directoryPath)#" 
				filename="#ListFirst(trim(fileName), '.')#"
				fileextension="#ListLast(trim(fileName), '.')#">			
			
			
				
			<!-------------------------------------------------------------------------------------->
			<!--- Create the DB record of the XML file.                                          --->
			<!-------------------------------------------------------------------------------------->				
			<cfquery name="getFileParameters" datasource="#trim(request.datasource)#">
				INSERT INTO File(DisplayINGUID, ParentFileID, FileType,ClientID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified)
				SELECT 0, #trim(fileID)#, 102,ClientID,UsersID,FilePlacementDirectory,AttemptedServerFile,'Copied from fileID record: #trim(fileID)#',ClientFile,'xml',ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFileName + '.xml','xml',ServerFileName,TimeCreated,NOW() FROM File   WHERE FileID = #trim(fileID)#;	
				SELECT LAST_INSERT_ID() AS xmlFileID 
			</cfquery>
			
			<cfset xmlFileID = getFileParameters.xmlFileID>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create the file Process records.                                               --->
			<!-------------------------------------------------------------------------------------->		
			<cfset request.FileProcess = CreateObject("component", "com.common.db.FileProcessIO")>	
			
			<cfset request.FileProcess.reset()>
			<cfset request.FileProcess.setFileID(trim(fileID))>
			<cfset request.FileProcess.setStatusID(95)>
			<cfset request.FileProcess.setNote('Auto Note: machine generated record.')>
			<cfset request.FileProcess.commit()>
			
			<cfset request.FileProcess.reset()>
			<cfset request.FileProcess.setFileID(trim(fileID))>
			<cfset request.FileProcess.setStatusID(96)>
			<cfset request.FileProcess.setNote('Auto Note: machine generated record.')>
			<cfset request.FileProcess.commit()>
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check the file the 835 file string.                                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfset fileContents = trim(XMLfileContent)>
				
			<cfif NOT FindNoCase("<TransactionSetIdentifierCode1>835</TransactionSetIdentifierCode1>", trim(fileContents))>					
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message="The file uploaded does not meet the 835 file standard. Please check the file for errors. 174 [#trim(fileID)#]">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="File standard not met. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check to make sure that the XML is correct.                                    --->
			<!-------------------------------------------------------------------------------------->			
			<cfset xmlErrorsPassed = "yes">
			<cfset xmlFatalErrorsPassed = "yes">
			<cfset adminMessage = ""> 
			
			<cfset checkXML = XMLValidate("#trim(XMLfileContent)#")>
			
			<cfif IsArray(checkXML.errors) AND NOT ArrayIsEmpty(checkXML.errors)>
				<cfif ArrayLen(checkXML.errors) GTE 2>
					<cfset xmlErrorsPassed = "no">
				<cfelseif ArrayLen(checkXML.errors) EQ 1 AND NOT Find("ISA", checkXML.errors[1])>
					<cfset xmlErrorsPassed = "no">
				</cfif>		
			</cfif>			
						
			<cfif IsArray(checkXML.fatalerrors) AND NOT ArrayIsEmpty(checkXML.fatalerrors)>
				<cfif ArrayLen(checkXML.fatalerrors) GTE 1>
					<cfset xmlFatalErrorsPassed = "no">
				</cfif>		
			</cfif>		
			
			<!--- For Debugging issues create the errors to check for code handling errors.
				<CFSET checkXML.errors = ArrayNew(1)>
				<cfset temp = ArrayAppend(checkXML.errors, "Error: just an error that will keep from processing")>
				<cfset temp = ArrayAppend(checkXML.errors, "Error: Second error that needs to be addressed")>			
				<cfset xmlErrorsPassed = "no">
				
				<CFSET checkXML.fatalerrors = ArrayNew(1)>
				<cfset temp = ArrayAppend(checkXML.fatalerrors, "Fatal Error: Your XML is weak")>
				<cfset temp = ArrayAppend(checkXML.fatalerrors, "Fatal Error: You killed brother Chow now you must die.")>			
				<cfset xmlFatalErrorsPassed = "no">
			--->
			
			<cfif NOT xmlErrorsPassed OR NOT xmlFatalErrorsPassed>	
				
				<cfset Message = "The file uploaded does not meet the XML file standard. Please check the file for errors. 220 <br>file: #trim(directoryPath)#\#trim(fileName)#<br><br>">
				
				<cfif NOT xmlErrorsPassed>
				
					<cfset adminMessage = adminMessage & "<strong>Admin Note Errors:</strong><br>These are the errors shown in the checkXMl.errors array processing.<br><br>">
								
					<cfloop from="1" to="#ArrayLen(checkXML.errors)#" index="i">
						<cfset adminMessage = adminMessage & checkXML.errors[i] & "<br>">
					</cfloop>
					
				</cfif>	
				
				<cfif NOT xmlFatalErrorsPassed>
					
					<cfif NOT xmlErrorsPassed>
						<cfset adminMessage = adminMessage & "<p></p>">
					</cfif>
					
					<cfset adminMessage = adminMessage & "<strong>Admin Note FATAL Errors:</strong><br>These are the FATAL errors shown in the checkXMl.FATALerrors array processing.<br><br>">
								
					<cfloop from="1" to="#ArrayLen(checkXML.fatalerrors)#" index="i">
						<cfset adminMessage = adminMessage & checkXML.fatalerrors[i] & "<br>">
					</cfloop>
					
				</cfif>	
										
				<cfset adminMessage = adminMessage & "<p><strong>User Note:</strong><br>#message#</p>">
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#SupportEmailAddressID#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="#trim(adminMessage)#">	
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="XML issues with processing file IMMEDIATE ATTENTION REQUIRED." message="#trim(adminMessage)#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(adminMessage)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
				
			</cfif>	
					
			
			<!-------------------------------------------------------------------------------------->
			<!--- Now that all the tests are passed we can bring the XML file into a local       --->
			<!--- variable.                                                                      --->
			<!-------------------------------------------------------------------------------------->		
			<cfset interchange835 = XMLParse(fileContents)>
					
			<cfset InterchangeClientAddressLine1 = "">	
			<cfset InterchangeClientAddressLine2 = "">	
			<cfset InterchangeClientCity = "">	
			<cfset InterchangeClientState = "">	
			<cfset InterchangeClientZipcode = "">	
			<cfset InterchangeClientName = "">
					
			
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check the XML file for the Payee information make sure that the logged in user  --->
			<!--- is submitting for the correct client.                                           --->
			<!--------------------------------------------------------------------------------------->							
			<cfset N1s = XMLSearch(interchange835, "//N1")>

			<cfloop from="1" to="#trim(ArrayLen(N1s))#" index="N1">
				
				<cfif ArrayLen(N1s[N1].XMLChildren) GTE 4 AND N1s[N1].EntityIdentifierCode1.XMLText EQ "PE">	
					<cfset providerID = N1s[N1].REF.ReferenceIdentification2.XMLText>									
				</cfif>				
				
				<cfif N1s[N1].EntityIdentifierCode1.XMLText EQ "PE">	
					
					<cfif StructKeyExists(N1s[N1], 'Name2')>
						<cfset InterchangeClientName = N1s[N1].Name2.XMLText>	
					</cfif>
					
					<cfif StructKeyExists(N1s[N1].N3, 'AddressInformation1')>
						<cfset InterchangeClientAddressLine1 = N1s[N1].N3.AddressInformation1.XMLText>	
					</cfif>
					<cfif StructKeyExists(N1s[N1].N3, 'AddressInformation2')>
						<cfset InterchangeClientAddressLine2 = N1s[N1].N3.AddressInformation2.XMLText>	
					</cfif>
					
					<cfif StructKeyExists(N1s[N1].N4, 'CityName1')>
						<cfset InterchangeClientCity = N1s[N1].N4.CityName1.XMLText>	
					</cfif>
							
					<cfif StructKeyExists(N1s[N1].N4, 'StateorProvinceCode2')>
						<cfset InterchangeClientState = N1s[N1].N4.StateorProvinceCode2.XMLText>	
					</cfif>
					
					<cfif StructKeyExists(N1s[N1].N4, 'PostalCode3')>
						<cfset InterchangeClientZipcode = N1s[N1].N4.PostalCode3.XMLText>	
					</cfif>
														
				</cfif>
				
			</cfloop>

			<!--- this movees to the looping of the ST segment 01/23/07
			<!-------------------------------------------------------------------------------------->
			<!--- Query to see if the clientID in the 835 XML is already in the DB.              --->
			<!-------------------------------------------------------------------------------------->			
			<!---<cfinvoke component="com.common.db.ClientIO" method="getClientQuery" providerid="#trim(providerID)#" active="1" returnvariable="getClientRecord">--->
			<cfset getClientRecordClientID = "">
						
			<cfquery name="getClientRecord" datasource="#trim(request.datasource)#">
				SELECT clientID, providerID AS clientProviderIDS
				FROM pa_master.Client 				
			</cfquery>
			
			<cfloop query="getClientRecord">
				<cfif ListFindNoCase(clientProviderIDS, trim(providerID))>
					<cfset getClientRecordClientID = clientID>
					<cfbreak>
				</cfif>
			</cfloop>		

			<!-------------------------------------------------------------------------------------->
			<!--- If there is no record of the client in the database then we need to throw an   --->
			<!--- error and warn support of the issue.                                           --->
			<!-------------------------------------------------------------------------------------->			
			<cfif NOT IsNumeric(getClientRecordClientID)>
			
				<cfset request.File.deleteFileDBAndDirectory(trim(fileID))>
				<cfset request.File.deleteFileDBAndDirectory(trim(XMLFileID))>
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The client does not exist. Please contact an administrator.">
				<cfset adminMessage = "<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>The Provider ID (#trim(providerID)#) that the 835 XML file (#trim(directoryPath)#\#trim(fileName)#) contains does not exist in the client table. FILES WERE DELETED.</p>">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client id in 835 XML file does not exist. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="#trim(adminMessage)#">	
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>
				<cfthrow message="#trim(message)#">		
			
			</cfif>
			--->
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Find out if the interchange has been already run through.                      --->
			<!-------------------------------------------------------------------------------------->			
			<cfset interchangeFileID = trim(interchange835.ISA.ControlNumber13.XMLText)>
			
			<!---this movees to the looping of the ST segment 01/23/07
			<cfset reassociationTraceNumber = trim(interchange835.ISA.GS.TRN.ReferenceIdentification2.XMLText)>
			--->
						
			<!-------------------------------------------------------------------------------------->
			<!--- Set the Intarchange Date.                                                      --->
			<!-------------------------------------------------------------------------------------->			
			<cfif StructKeyExists(interchange835.ISA.GS, 'DTM') AND interchange835.ISA.GS.DTM.DateTimeQualifier1.XMLText EQ 405>						
				<cfset interchangeDateYear = MID(interchange835.ISA.GS.DTM.Date2.XMLText, 1, 4)>
				<cfset interchangeDateMonth = MID(interchange835.ISA.GS.DTM.Date2.XMLText, 5, 2)>
				<cfset interchangeDateDay = MID(interchange835.ISA.GS.DTM.Date2.XMLText, 7, 2)>
				<cfset interchangeDate = CreateDate(interchangeDateYear, interchangeDateMonth, interchangeDateDay)>						
			<cfelse>				
				<cfset interchangeDateYear = MID(interchange835.ISA.Date9.XMLText, 1, 2)>
				<cfset interchangeDateMonth = MID(interchange835.ISA.Date9.XMLText, 3, 2)>
				<cfset interchangeDateDay = MID(interchange835.ISA.Date9.XMLText, 5, 2)>			
				<cfset interchangeDate = CreateDate(interchangeDateYear, interchangeDateMonth, interchangeDateDay)>			
			</cfif>
			
			
			<cfset interchangeFileID = "#interchangeFileID##DateFormat(interchangeDate, 'dmyyyy')#">						
			
			<cfset request.Interchange = CreateObject("component","com.common.Interchange")>	
			<cfset getInterchange = request.Interchange.getInterchangeQuery(interchangeFileID: trim(interchangeFileID))>			
						
			<cfif getInterchange.RecordCount GTE 1>				
				
				<cfset request.File.deleteFileDBAndDirectory(trim(fileID))>
				<cfset request.File.deleteFileDBAndDirectory(trim(XMLFileID))>
			
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The report you are trying to process has already been processed. If you feel this is an error please contact an administrator.">
				<cfset adminMessage = "<p><strong>User was sent:</strong> <br>#trim(message)#</p>">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The report to process has already been processed. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="#trim(adminMessage)#">
				<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset request.FileProcess.commit()>	
				<cfthrow message="#trim(message)#">
				
			<cfelse>
			
			
			<!---<cf_db_Insert_debugTable
		referenceid="123"
		note="#InterchangeClientName#|#InterchangeClientAddressLine1#|#InterchangeClientAddressLine2#|#InterchangeClientCity#|#InterchangeClientState#|#InterchangeClientZipcode#|#InterchangeClientName#">
			--->
			
				<!-------------------------------------------------------------------------------------->
				<!--- The interchange has not been processed before. We can now add the interchange  --->
				<!--- record and get the ID.                                                         --->
				<!-------------------------------------------------------------------------------------->						
				<cfset request.Interchange.setFileID(trim(fileID))>
				<cfset request.Interchange.setInterchangeFileID(trim(interchangeFileID))> 
				<cfset request.Interchange.setInterchangeDate(trim(interchangeDate))>
				<cfset request.Interchange.setClientID(trim(clientID))>
				<!---<cfset request.Interchange.setReassociationTraceNumber(trim(reassociationTraceNumber))>--->
				<cfset request.Interchange.setInterchangeClientName(trim(InterchangeClientName))>	
				<cfset request.Interchange.setInterchangeClientAddressLine1(trim(InterchangeClientAddressLine1))>	
				<cfset request.Interchange.setInterchangeClientAddressLine2(trim(InterchangeClientAddressLine2))>	
				<cfset request.Interchange.setInterchangeClientCity(trim(InterchangeClientCity))>	
				<cfset request.Interchange.setInterchangeClientState(trim(InterchangeClientState))>	
				<cfset request.Interchange.setInterchangeClientZipcode(trim(InterchangeClientZipcode))>									
				<cfset request.Interchange.setInterchangeSenderIDQualifier(trim(interchange835.ISA.IDQualifier5.XMLText))>	
				<cfset request.Interchange.setInterchangeSenderID(trim(interchange835.ISA.SenderID6.XMLText))>
				<cfset request.Interchange.setInterchangeReceiverIDQualifier(trim(interchange835.ISA.IDQualifier7.XMLText))>	
				<cfset request.Interchange.setInterchangeReceiverID(trim(interchange835.ISA.ReceiverID8.XMLText))>	
					
				<!-------------------------------------------------------------------------------------->
				<!--- On page 79 of the implementation guide is the explanation of this value        --->
				<!-------------------------------------------------------------------------------------->				
				<!---Took out now that there can be multiple ST in an interchange.
				<cfif StructKeyExists(interchange835.ISA.GS.LX, 'AssignedNumber1')>
					<cfset LXAssignedNumber = interchange835.ISA.GS.LX.AssignedNumber1.XMLText>
				<cfelse>
					<cfset LXAssignedNumber = "">	
				</cfif>
				<cfset request.Interchange.setLXAssignedNumber(trim(LXAssignedNumber))>
				--->
				
				<cfset interchangeID = request.Interchange.Commit()>
					
					
			</cfif>		
			
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- Create a call to the processing of XML into the database via another gateway.  --->
			<!-------------------------------------------------------------------------------------->
			<cfscript>	   
			   structParameters = structNew();	    
			   structParameters.datasource = #trim(request.datasource)#;
			   structParameters.siteID = #trim(SiteID)#;	 
			   structParameters.clientID = #trim(clientID)#;    	
			   structParameters.fileID = #trim(fileID)#;
			   structParameters.XMLfileID = #trim(XMLfileID)#;
			   structParameters.interchangeID = #trim(interchangeID)#;  
			   structParameters.SupportEmailAddressID = #trim(SupportEmailAddressID)#;			     		   
			</cfscript>	
			
			<cfset status = SendGatewayMessage("Process835XMLToDB", structParameters)>
		
			
									
			<!-------------------------------------------------------------------------------------->
			<!--- Placing this in response to the inability by JRun to possibly not releasing    --->
			<!--- ram used by the request scope. 05/04/05                                        --->
			<!-------------------------------------------------------------------------------------->
			<cfset tempClear = StructClear(Request)>				
									
			
		
			<cfcatch type="Any">
				
				<cf_gcGatewayLogger datasource="#trim(request.datasource)#" code="115" logtext="115 There was an issue with the file processing. <p> IN CreateFile835ToXML.cfc <p> #cfcatch.type# #cfcatch.message# #cfcatch.detail# 377">
							
			</cfcatch>
		
		
		</cftry>
     
   </cffunction>
   
</cfcomponent>

	