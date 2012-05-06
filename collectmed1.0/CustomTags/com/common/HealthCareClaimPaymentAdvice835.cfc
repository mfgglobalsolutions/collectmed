

<cfcomponent>		
		
	<cffunction name="rawElementToXML" returntype="string">		
				
		<cfargument name="rawString" required="yes" type="string">		
		<cfargument name="elementDelimeter" required="yes" type="string">
		<cfargument name="subElementDelimeter" required="yes" type="string">
			
							
		<cftry>				
			
			<cfset thisIteration = ListGetAt(rawString, 1, "~")>
			<cfset rootElement = ListGetAt(thisIteration, 1, trim(elementDelimeter))>
			
			<cfset arrElementData = ArrayNew(2) />				
			<cfset xmlStart = xmlNew()>
			<cfset xmlStart.xmlRoot = XmlElemNew(xmlStart,"#lcase(trim(rootElement))#")>			
			<cfset xmlString = xmlParse(xmlStart)>
						
			<!-------------------------------------------------------------------------------------->
			<!--- Loop over the contents and use the tilde as the delimeter for all the lines    --->
			<!-------------------------------------------------------------------------------------->	
			<cfloop index="i" list="#trim(rawString)#" delimiters="~">			
				
				<cfset arrayLength = arrayLen(arrElementData)+1>						
							
				<!-------------------------------------------------------------------------------------->
				<!--- NOTE: must be used twice (used to show NULL where no data was sent in)         --->
				<!-------------------------------------------------------------------------------------->
				<cfset i = ReReplace(i, "\#trim(elementDelimeter)#{2}", "#trim(elementDelimeter)#NULL#trim(elementDelimeter)#", "all")>
				<cfset i = ReReplace(i, "\#trim(elementDelimeter)#{2}", "#trim(elementDelimeter)#NULL#trim(elementDelimeter)#", "all")>
			
				<!-------------------------------------------------------------------------------------->
				<!--- Get the current element that we are working with. It will be the first thing   --->
				<!--- in the i iteration of the file contents.                                       --->
				<!-------------------------------------------------------------------------------------->		
				<cfset thisElement = listGetAt(i, 1, trim(elementDelimeter))>
				
				<!--------------------------------------------------------------------------------------->
				<!--- We need to put the full string element in the data array and its element sector --->
				<!--------------------------------------------------------------------------------------->		
				<cfif trim(thisElement) NEQ "" AND trim(i) NEQ "">
					<cfset arrElementData[arrayLength][1] = trim(thisElement)>
					<cfset arrElementData[arrayLength][2] = "#trim(i)#">
				</cfif>
				
			</cfloop>
			

			
			<!-------------------------------------------------------------------------------------->
			<!--- Loop over the array and put the values into the XML                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfloop from="1" to="#arrayLen(arrElementData)#" index="j">				
				
				<cfset thisStr = trim(arrElementData[j][2])>					
				<cfset ucaseElement = ucase(trim(arrElementData[j][1]))>
				<cfset lcaseElement = lcase(trim(ucaseElement))>
				
				<cfif lcaseElement neq rootElement>
					<cfset mainElem = "">		
					<cfset mainElem = XmlElemNew(xmlString, lcaseElement)>
					<cfset mainElem.XmlText = "">						
					<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainElem>											
				</cfif>			
			
				<cfset mainElem = "">		
				<cfset elemCount = 0>									
				<cfloop list="#trim(thisStr)#" delimiters="*" index="elemListIndex">
					
					<cfif trim(elemListIndex) NEQ ListGetAt(thisStr, 1, elementDelimeter)>							
						
						<!---Create the initial element that is the parent of this list.--->
						<cfset thisElementName = numberFormat(evaluate(elemCount + 1), "00")>
						<cfset elemCount = elemCount + 1>								
						<cfset mainElem = XmlElemNew(xmlString, "#trim(lcaseElement)#_#trim(thisElementName)#")>								
						<cfif NOT find(subElementDelimeter, elemListIndex, 0) AND trim(ListGetAt(thisStr, evaluate(elemCount + 1), elementDelimeter)) NEQ "NULL">		
							<cfset mainElem.XmlText = trim(ListGetAt(thisStr, evaluate(elemCount + 1), elementDelimeter))>
						<cfelse>
							<cfset mainElem.XmlText = "">	
						</cfif>
						
						<cfif lcaseElement neq rootElement>	
							<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainElem>
						<cfelse>	
							<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainElem>
						</cfif>
						
						<!--- If the current iteration contains the Sub-Element delimeter then it must be treated as sub-elements. --->								
						<cfif find(subElementDelimeter, elemListIndex, 0)>									
							
							<!---Now loop the list and create its sub elements.--->											
							<cfset subElementList = trim(elemListIndex)>						
							<cfloop from="1" to="#ListLen(subElementList, subElementDelimeter)#" index="subElemIndex">
								<cfset thisSubElementName = numberFormat(subElemIndex, "00")>
								<cfset mainSubElem = XmlElemNew(xmlString,"#trim(lcaseElement)#_#trim(thisElementName)#_#thisSubElementName#")>
								<cfset mainSubElem.XmlText = ListGetAt(subElementList, subElemIndex, subElementDelimeter)>
								<cfif lcaseElement neq rootElement>	
									<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren)].XmlChildren[subElemIndex] = mainSubElem>										
								<cfelse>
									<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[subElemIndex] = mainSubElem>	
								</cfif>	
							</cfloop>
													
						</cfif>
						
					</cfif>
							
				</cfloop>					
				
			</cfloop>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Now that the xml string is created then go ahead and send it to the caller.    --->
			<!-------------------------------------------------------------------------------------->									
			<cfif isxml(trim(xmlString))>	
								
				<cfset xmlString = toString(trim(xmlString))>
				<cfset xmlString = ReplaceNoCase(xmlString, '<?xml version="1.0" encoding="UTF-8"?>', "")>				
				<cfreturn trim(xmlString)>
				
			<cfelse>
				<cfreturn "Error Creating Element XML">
			</cfif>
							
			<cfcatch type="Any">			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">					
			</cfcatch>
			
		</cftry>
		
	</cffunction>			
		
		
	<cffunction name="XmlAppend" access="public" returntype="any" output="false" hint="Copies the children of one node to the node of another document.">
 	
		<!--- Define arguments. --->
		<cfargument name="NodeA" type="any" required="true" hint="The node whose children will be added to."/>
	 	<cfargument name="NodeB" type="any" required="true" hint="The node whose children will be copied to another document."/>
	 
		<!--- Set up local scope. --->
		<cfset var LOCAL = StructNew() />
	 	
		<!--- Get the child nodes of the originating XML node. This will return both tag nodes and text nodes. We only want the tag nodes. --->
		<cfset LOCAL.ChildNodes = ARGUMENTS.NodeB.GetChildNodes() />
	 	
		<!--- Loop over child nodes. --->
		<cfloop index="LOCAL.ChildIndex" from="1" to="#LOCAL.ChildNodes.GetLength()#" step="1">
	 	
			
			<!-------------------------------------------------------------------------------------->
			<!--- Get a short hand to the current node. Remember that the child nodes NodeList   --->
			<!--- starts with index zero. Therefore, we must subtract one from out child         --->
			<!--- node index.                                                                    --->
			<!-------------------------------------------------------------------------------------->			
			<cfset LOCAL.ChildNode = LOCAL.ChildNodes.Item(JavaCast("int",(LOCAL.ChildIndex - 1))) />
					 
			<!-------------------------------------------------------------------------------------->
			<!--- Import this noded into the target XML doc. If we do not do this first,         --->
			<!--- then ColdFusion will throw an error about us using nodes that are owned by     --->
			<!--- another document. Importing will return a reference to the newly created       --->
			<!--- xml node. The TRUE argument defines this import as DEEP copy.                  --->
			<!-------------------------------------------------------------------------------------->
			<cfset LOCAL.ChildNode = ARGUMENTS.NodeA.GetOwnerDocument().ImportNode(LOCAL.ChildNode, JavaCast( "boolean", true )) />
		 
			<!--- Append the imported xml node to the child nodes of the target node. --->
			<cfset ARGUMENTS.NodeA.AppendChild(LOCAL.ChildNode) />
	 	
		</cfloop>
	 	
		<!--- Return the target node. --->
		<cfreturn ARGUMENTS.NodeA />
	
	</cffunction>	
	
	
	
	<cffunction name="ProcessFileToDB">
     
	  <cfargument name="CFEvent" type="struct" required="yes">
      	 		 		  	
		<cftry>				
						
			<cfset data = CFEvent>
			
			<cfset variables.datasource = "#trim(data.datasource)#">			
			<cfset variables.RO_datasource = "#trim(data.datasource)#">
			<cfset variables.applicationPath = "#trim(data.applicationPath)#">
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
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#message#')>
				<cfset variables.FileProcess.commit()>				
				<cfthrow message="#trim(message)#">
			</cfif>	
							
			<!-------------------------------------------------------------------------------------->
			<!--- Create the File object.                                                        --->
			<!-------------------------------------------------------------------------------------->		
			<cfset variables.File = CreateObject("component","com.common.File")>	
			
					
			<!-------------------------------------------------------------------------------------->
			<!--- First find out if the file actually has a DB record.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfif variables.File.checkFileExistsInDB(trim(fileID))>
				<cfset variables.File.Init(trim(fileID))>	
			<cfelse>
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The file you are attempting to process does not exist in the database. Please contact an administrator if you feel this is an error.">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong></p>">	
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset variables.FileProcess.commit()>					
				<cfthrow message="#trim(message)#">
			</cfif>
		
			<!----------------------------------------------------------------------------------------------->
			<!--- To this point the DB record is in place now setup the variables to check the directory. --->
			<!----------------------------------------------------------------------------------------------->		
			<cfset directoryPath = variables.File.getServerDirectory()>
			<cfset fileName	= variables.File.getServerFile()>			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Does the File Exists and can it be found in the Directory with this string     --->
			<!--- in it.                                                                         --->
			<!-------------------------------------------------------------------------------------->			
			<cfset existsFile = variables.File.checkFileExistsInDirectory(filename: "#trim(fileName)#", directory: "#trim(directoryPath)#\")>
			
			<cfif NOT existsFile>
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The file you are attempting to process does not exist in the directory but does exist in the database. Please contact an administrator.">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client file in directory does not exist. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset variables.FileProcess.commit()>
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
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset variables.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			</cfif>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- At this point the file has passed all tests and can be converted into          --->
			<!--- an 835 XML file to be processed into the DB                                    --->
			<!-------------------------------------------------------------------------------------->		
			<cfset XMLfileContent = Process835ToXMLConvert(fileID: '#trim(fileID)#', directorypath: '#trim(directoryPath)#', filename: '#ListFirst(trim(fileName), ".")#', fileextension: '#ListLast(trim(fileName), ".")#')>	
				
			<!-------------------------------------------------------------------------------------->
			<!--- Create the DB record of the XML file.                                          --->
			<!-------------------------------------------------------------------------------------->				
			<cfquery name="getFileParameters" datasource="#trim(variables.datasource)#">
				INSERT INTO File(DisplayINGUID, ParentFileID, FileType,ClientID,UsersID,FilePlacementDirectory,AttemptedServerFile,ClientDirectory,ClientFile,ClientFileExt,ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFile,ServerFileExt,ServerFileName,TimeCreated,TimeLastModified)
				SELECT 0, #trim(fileID)#, 102,ClientID,UsersID,FilePlacementDirectory,AttemptedServerFile,'Copied from fileID record: #trim(fileID)#',ClientFile,'xml',ClientFileName,ContentSubType,ContentType,DateLastAccessed,FileExisted,FileSize,FileWasAppended,FileWasOverwritten,FileWasRenamed,FileWasSaved,OldFileSize,ServerDirectory,ServerFileName + '.xml','xml',ServerFileName,TimeCreated,now() FROM File   WHERE FileID = #trim(fileID)#;
				SELECT LAST_INSERT_ID() AS xmlFileID 
			</cfquery>
			
			<cfset xmlFileID = getFileParameters.xmlFileID>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create the file Process records.                                               --->
			<!-------------------------------------------------------------------------------------->		
			<cfset variables.FileProcess = CreateObject("component", "com.common.db.FileProcessIO")>	
			
			<cfset variables.FileProcess.reset()>
			<cfset variables.FileProcess.setFileID(trim(fileID))>
			<cfset variables.FileProcess.setStatusID(95)>
			<cfset variables.FileProcess.setNote('Auto Note: machine generated record.')>
			<cfset variables.FileProcess.commit()>
			
			<cfset variables.FileProcess.reset()>
			<cfset variables.FileProcess.setFileID(trim(fileID))>
			<cfset variables.FileProcess.setStatusID(96)>
			<cfset variables.FileProcess.setNote('Auto Note: machine generated record.')>
			<cfset variables.FileProcess.commit()>
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Check the file the 835 file string.                                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfset fileContents = trim(XMLfileContent)>
				
			<cfif NOT FindNoCase("<st_01>835</st_01>", trim(fileContents))>					
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message="The file uploaded does not meet the 835 file standard. Please check the file for errors. 174 [#trim(fileID)#]">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="File standard not met. Immediate attention required" message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>">	
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset variables.FileProcess.commit()>
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
				<cfelseif ArrayLen(checkXML.errors) EQ 1 AND NOT Find("isa", checkXML.errors[1])>
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
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="#trim(adminMessage)#">	
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="XML issues with processing file IMMEDIATE ATTENTION REQUIRED." message="#trim(adminMessage)#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(adminMessage)#')>
				<cfset variables.FileProcess.commit()>
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
						
			<cfquery name="getClientRecord" datasource="#trim(variables.datasource)#">
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
			
				<cfset variables.File.deleteFileDBAndDirectory(trim(fileID))>
				<cfset variables.File.deleteFileDBAndDirectory(trim(XMLFileID))>
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The client does not exist. Please contact an administrator.">
				<cfset adminMessage = "<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><br>The Provider ID (#trim(providerID)#) that the 835 XML file (#trim(directoryPath)#\#trim(fileName)#) contains does not exist in the client table. FILES WERE DELETED.</p>">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client id in 835 XML file does not exist. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="#trim(adminMessage)#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset variables.FileProcess.commit()>
				<cfthrow message="#trim(message)#">		
			
			</cfif>
			--->
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Find out if the interchange has been already run through.                      --->
			<!-------------------------------------------------------------------------------------->			
			<cfset interchangeFileID = trim(interchange835.isa.isa_13.XMLText)>
			
			<!---this movees to the looping of the ST segment 01/23/07
			<cfset reassociationTraceNumber = trim(interchange835.isa.gs.TRN.ReferenceIdentification2.XMLText)>
			--->
						
			<!-------------------------------------------------------------------------------------->
			<!--- Set the Intarchange Date.                                                      --->
			<!-------------------------------------------------------------------------------------->			
			<cfset interchangeDateYear = "">
			<cfset interchangeDateMonth = "">
			<cfset interchangeDateDay = "">
			<cfset interchangeDate = "">				
			<cfif StructKeyExists(interchange835.isa, 'isa_09') AND len(interchange835.isa.isa_09.XMLText) EQ 6>					
				<cfset interchangeDateYear = MID(interchange835.isa.isa_09.XMLText, 1, 2)>
				<cfset interchangeDateMonth = MID(interchange835.isa.isa_09.XMLText, 3, 2)>
				<cfset interchangeDateDay = MID(interchange835.isa.isa_09.XMLText, 5, 2)>			
				<cfset interchangeDate = CreateDate(interchangeDateYear, interchangeDateMonth, interchangeDateDay)>			
			</cfif>			
			
			<cfif isDate(interchangeDate)>
				<cfset interchangeFileID = "#interchangeFileID##DateFormat(interchangeDate, 'dmyyyy')#">						
			<cfelse>
				<cfthrow message="There is an issue with the files interchangeDate: [#trim(interchangeDate)#]. key: interchange835.isa.isa_09.XMLText">
			</cfif>
			
			<cfset variables.Interchange = CreateObject("component","com.common.Interchange")>	
			<cfset getInterchange = variables.Interchange.getInterchangeQuery(interchangeFileID: trim(interchangeFileID))>			
						
			<cfif getInterchange.RecordCount GTE 1>				
				
				<cfset variables.File.deleteFileDBAndDirectory(trim(fileID))>
				<cfset variables.File.deleteFileDBAndDirectory(trim(XMLFileID))>
			
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
				<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
				<cfset message = "The report you are trying to process has already been processed. If you feel this is an error please contact an administrator.">
				<cfset adminMessage = "<p><strong>User was sent:</strong> <br>#trim(message)#</p>">
				<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The report to process has already been processed. IMMEDIATE ATTENTION REQUIRED" message="#trim(adminMessage)#">	
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" siteID="#trim(SiteID)#" code="115" logtext="#trim(adminMessage)#">
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset variables.FileProcess.commit()>	
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
				<cfset variables.Interchange.setFileID(trim(fileID))>
				<cfset variables.Interchange.setInterchangeFileID(trim(interchangeFileID))> 
				<cfset variables.Interchange.setInterchangeDate(trim(interchangeDate))>
				<cfset variables.Interchange.setClientID(trim(clientID))>
				<!---<cfset variables.Interchange.setReassociationTraceNumber(trim(reassociationTraceNumber))>--->
				<cfset variables.Interchange.setInterchangeClientName(trim(InterchangeClientName))>	
				<cfset variables.Interchange.setInterchangeClientAddressLine1(trim(InterchangeClientAddressLine1))>	
				<cfset variables.Interchange.setInterchangeClientAddressLine2(trim(InterchangeClientAddressLine2))>	
				<cfset variables.Interchange.setInterchangeClientCity(trim(InterchangeClientCity))>	
				<cfset variables.Interchange.setInterchangeClientState(trim(InterchangeClientState))>	
				<cfset variables.Interchange.setInterchangeClientZipcode(trim(InterchangeClientZipcode))>									
				<cfset variables.Interchange.setInterchangeSenderIDQualifier(trim(interchange835.isa.isa_05.XMLText))>	
				<cfset variables.Interchange.setInterchangeSenderID(trim(interchange835.isa.isa_06.XMLText))>
				<cfset variables.Interchange.setInterchangeReceiverIDQualifier(trim(interchange835.isa.isa_07.XMLText))>	
				<cfset variables.Interchange.setInterchangeReceiverID(trim(interchange835.isa.isa_08.XMLText))>	
					
				<!-------------------------------------------------------------------------------------->
				<!--- On page 79 of the implementation guide is the explanation of this value        --->
				<!-------------------------------------------------------------------------------------->				
				<!---Took out now that there can be multiple ST in an interchange.
				<cfif StructKeyExists(interchange835.isa.gs.LX, 'AssignedNumber1')>
					<cfset LXAssignedNumber = interchange835.isa.gs.LX.AssignedNumber1.XMLText>
				<cfelse>
					<cfset LXAssignedNumber = "">	
				</cfif>
				<cfset variables.Interchange.setLXAssignedNumber(trim(LXAssignedNumber))>
				--->
				
				<cfset interchangeID = variables.Interchange.Commit()>
					
					
			</cfif>		
			
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- Create a call to the processing of XML into the database via another gateway.  --->
			<!-------------------------------------------------------------------------------------->
			<cfscript>	   
			   structParameters = structNew();	    
			   structParameters.datasource = #trim(variables.datasource)#;
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
				
				<cf_gcGatewayLogger datasource="#trim(variables.datasource)#" code="115" logtext="115 There was an issue with the file processing. <p> IN CreateFile835ToXML.cfc <p> #cfcatch.type# #cfcatch.message# #cfcatch.detail# 377">
							
			</cfcatch>
		
		
		</cftry>
     
   </cffunction>		
		
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- This function will return the formatted XML of the file being processed.       --->
<!-------------------------------------------------------------------------------------->		
	<cffunction name="Process835ToXMLConvert" returntype="string">						
		
		<cfargument name="fileID" required="yes" type="numeric">			
		<cfargument name="fileName" required="yes" type="string">			
		<cfargument name="fileextension" required="yes" type="string">	
		<cfargument name="directoryPath" required="yes" type="string">			
		<cfargument name="SupportEmailAddressID" default="0" required="no" type="numeric">	
		<cfargument name="debug" default="no" required="no" type="boolean">	
							
							
		<cftry>				
			
			<cffile action="READ" file="#trim(directoryPath)#\#trim(fileName)#.#trim(fileextension)#" variable="fileContents">					
		
			<!-------------------------------------------------------------------------------------->
			<!--- Place everything in an array that can be looped easily.                        --->
			<!-------------------------------------------------------------------------------------->			
			<cfset arrData = ArrayNew(1) />	
			<cfset arrGSElements = ArrayNew(1) />
			<cfset arrSTElements = ArrayNew(1) />	
			<cfset arrLXElements = ArrayNew(1) />	
			<cfset arrCLPElements = ArrayNew(1) />	
			<cfset arrSVCElements = ArrayNew(1) />	
							
			<!-------------------------------------------------------------------------------------->
			<!--- Loop over the contents of the file and use the tilde as the delimeter for all  --->
			<!--- the lines in the file.                                                         --->
			<!-------------------------------------------------------------------------------------->	
			<cfloop index="i" list="#trim(fileContents)#" delimiters="~">			
				
				<cfset arrayLength = arrayLen(arrData)+1>
				<cfif left(trim(i), 3) EQ "ISA">					
					<cfset elementDelimeter = mid(i, 4, 1)>		
					<cfset subElementDelimeter = listGetAt(i, 17, trim(elementDelimeter))>						
					<cfif debug>
						<cfoutput>
							<p align="left">
								<font color="FF0000">elementDelimeter:</font> #trim(elementDelimeter)#<br>
								<font color="FF0000">subElementDelimeter:</font> #trim(subElementDelimeter)#
							</p>	
						</cfoutput>
					</cfif>					
				</cfif>	
						
				<!-------------------------------------------------------------------------------------->
				<!--- If the element delimeters are blank something is really wrong!                 --->
				<!-------------------------------------------------------------------------------------->
				<cfif trim(elementDelimeter) EQ "" OR trim(subElementDelimeter) EQ "">
					<cfoutput>No Delimeter</cfoutput>
					<cfabort>
				</cfif>
			
				<!-------------------------------------------------------------------------------------->
				<!--- NOTE: must be used twice (used to show NULL where no data was sent in)         --->
				<!-------------------------------------------------------------------------------------->
				<cfset i = ReReplace(i, "\#trim(elementDelimeter)#{2}", "#trim(elementDelimeter)#NULL#trim(elementDelimeter)#", "all")>
				<cfset i = ReReplace(i, "\#trim(elementDelimeter)#{2}", "#trim(elementDelimeter)#NULL#trim(elementDelimeter)#", "all")>
			
				<!-------------------------------------------------------------------------------------->
				<!--- Get the current element that we are working with. It will be the first thing   --->
				<!--- in the i iteration of the file contents.                                       --->
				<!-------------------------------------------------------------------------------------->		
				<cfset thisElement = listGetAt(i, 1, trim(elementDelimeter))>
				
				<!--------------------------------------------------------------------------------------->
				<!--- We need to put the full string element in the data array and its element sector --->
				<!--------------------------------------------------------------------------------------->		
				<cfif trim(thisElement) NEQ "" AND trim(i) NEQ "">
					<cfset arrData[arrayLength][1] = trim(thisElement)>
					<cfset arrData[arrayLength][2] = "#trim(i)#">
				<cfelse>			
					<!---to be done
					<cferror type="request" template="error.cfm" mailto="#trim(SupportEmailAddressID)#">--->
				</cfif>
				
			</cfloop>			
				
			<!-------------------------------------------------------------------------------------->
			<!--- Find all the GS level elements.                                                --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrData)#" index="j">
				
				<cftry>					
					<cfset beginGS = "">
					<cfset endGE = "">
					<cfif arrData[j][1] EQ "GS">			
						<cfset beginGS = j>
						<cfloop from="#evaluate(j+1)#" to="#arrayLen(arrData)#" index="k">
							<cfif arrData[k][1] EQ "GE">
								<cfset endGE = k>
								<cfbreak>
							</cfif>	
						</cfloop>				
					</cfif> 
					<cfif isNumeric(beginGS) AND isNumeric(endGE) and beginGS LT endGE>						
						<cfset arrGSElements[arrayLen(arrGSElements) + 1] = "#beginGS#|#endGE#">			
					</cfif>
				
					<cfcatch type="Any">							
						<cfset ERROR.processing = "ERROR: Caught Exception - #CFCATCH.TYPE# : #cfcatch.message# : #cfcatch.detail#" />			
					</cfcatch>
				</cftry>
					
			</cfloop>
			
			<cfset numberOfGSElementsReported = arrayLen(arrGSElements)>	
			
			<cfif debug>
				<p align="left"><cfdump expand="no" label="GS Groupings Array" var="#arrGSElements#"></p>
			</cfif>			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Find all the ST level elements.                                                --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrGSElements)#" index="ii">	
				<cfloop from="#ListFirst(arrGSElements[ii], '|')#" to="#ListLast(arrGSElements[ii], '|')#" index="j">
					
				<cftry>					
					<cfset beginST = "">
					<cfset endST = "">
					<cfif arrData[j][1] EQ "ST">			
						<cfset beginST = j>
						<cfloop from="#evaluate(j+1)#" to="#ListLast(arrGSElements[ii], '|')#" index="k">
							<cfif arrData[k][1] EQ "SE">
								<cfset endST = k>
								<cfbreak>
							</cfif>	
						</cfloop>				
					</cfif> 
					<cfif isNumeric(beginST) AND isNumeric(endST) and beginST LT endST>						
						<cfset arrSTElements[arrayLen(arrSTElements) + 1] = "#ii#|#beginST#|#endST#">			
					</cfif>						
					<cfcatch type="Any">							
						<cfset ERROR.processing = "ERROR: Caught Exception - #CFCATCH.TYPE# : #cfcatch.message# : #cfcatch.detail#" />			
					</cfcatch>
				</cftry>			
						
				</cfloop>	
			</cfloop>
			
			<cfif debug>
				<p align="left"><cfdump expand="no" label="GS/ST Groupings Array" var="#arrSTElements#"></p>		
			</cfif>			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Here we interject a loop to check to make sure that the number of ST elements  --->
			<!--- to what the GS states is correct.                                              --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrGSElements)#" index="ii">
				
				<cfif arrData[ListLast(arrGSElements[ii], "|")][1] EQ "GE">
					
					<cfset count = 0>
					<cfset numberOfSTElementsReported = listGetAt(arrData[ListLast(arrGSElements[ii], "|")][2], 2, trim(elementDelimeter))>	
					
					<cfloop from="1" to="#arrayLen(arrSTElements)#" index="st">
						<cfif ListFirst(arrSTElements[st], "|") EQ ii>
							<cfset count = count + 1>
						</cfif>
					</cfloop>	
					
					<cfif count NEQ numberOfSTElementsReported>
						<cfoutput>The number of ST elements (index: #arrGSElements[ii]#) reported (#numberOfSTElementsReported#) does not match what has been found (#count#).</cfoutput>
						<cfabort>
					</cfif>
							
				<cfelse>
					<cfoutput>There is an issue with the GE array. The last element does not contain the GE identifier we are looking for. 215</cfoutput>
					<cfabort>
				</cfif>
				
			</cfloop>				
				
			<!-------------------------------------------------------------------------------------->
			<!--- Find all the LX level elements.                                                --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrSTElements)#" index="ii">			
				<cfloop from="#ListGetAt(arrSTElements[ii], 2, '|')#" to="#ListLast(arrSTElements[ii], '|')#" index="j">		
					
					<cftry>						
						<cfset beginST = "">
						<cfset endST = "">
						<cfif arrData[j][1] EQ "LX">			
							<cfset beginST = j>
							<cfloop from="#evaluate(j+1)#" to="#ListLast(arrSTElements[ii], '|')#" index="k">
								<cfif arrData[k][1] EQ "LX" OR arrData[k][1] EQ "SE">
									<cfset endST = k - 1>
									<cfbreak>
								</cfif>	
							</cfloop>				
						</cfif> 
						<cfif isNumeric(beginST) AND isNumeric(endST) and beginST LT endST>						
							<cfset arrLXElements[arrayLen(arrLXElements) + 1] = "#ListGetAt(arrSTElements[ii], 1, '|')#|#ii#|#beginST#|#endST#">			
						</cfif>
						
						<cfcatch type="Any">							
							<cfset ERROR.processing = "ERROR: Caught Exception - #CFCATCH.TYPE# : #cfcatch.message# : #cfcatch.detail#" />			
						</cfcatch>
					</cftry>
						
				</cfloop>	
			</cfloop>
				
			<cfif debug>		
				<p align="left"><cfdump expand="no" label="GS/ST/LX Groupings Array" var="#arrLXElements#"></p>
			</cfif>			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Here we interject a loop to check to make sure that the number of LX elements  --->
			<!--- to what the SE states is correct.                                              --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrSTElements)#" index="ii">
				
				<cfif arrData[ListLast(arrSTElements[ii], "|")][1] EQ "SE">
					
					<cfset count = 0>
					<cfset numberOfSTLinesReported = listGetAt(arrData[ListLast(arrSTElements[ii], "|")][2], 2, trim(elementDelimeter))>	
					<cfset startST = ListGetAt(arrSTElements[ii], 2, "|")>
					<cfset endST = ListLast(arrSTElements[ii], "|")>
					
					<cfloop from="#startST#" to="#endST#" index="stl">
						<cfset count = count + 1>
					</cfloop>	
					
					<cfif count NEQ numberOfSTLinesReported>
						<cfoutput>The number of ST lines (index: #arrSTElements[ii]#) reported (#numberOfSTLinesReported#) does not match what has been found (#count#).</cfoutput>
						<cfabort>
					</cfif>
							
				<cfelse>
					<cfoutput>There is an issue with the ST array. The last element does not contain the SE identifier we are looking for. 300</cfoutput>
					<cfabort>
				</cfif>
				
			</cfloop>				
			
			<!-------------------------------------------------------------------------------------->
			<!--- Find all the CLP level elements.                                               --->
			<!-------------------------------------------------------------------------------------->		
			<cfloop from="1" to="#arrayLen(arrLXElements)#" index="j">			
				<cfloop from="#ListGetAt(arrLXElements[j], 3, '|')#" to="#ListLast(arrLXElements[j], '|')#" index="t">		
				
					<cftry>				
						<cfset beginST = "">
						<cfset endST = "">
						<cfif arrData[t][1] EQ "CLP">			
							<cfset beginST = t>					
							<cfloop from="#evaluate(t+1)#" to="#ListLast(arrLXElements[j], '|')#" index="k">
								<cfif arrData[k][1] EQ "CLP" OR arrData[k][1] EQ "SE">
									<cfset endST = k - 1>							
									<cfbreak>
								<cfelseif k EQ ListLast(arrLXElements[j], '|')>
									<cfset endST = k>							
									<cfbreak>	
								</cfif>	
							</cfloop>				
						</cfif> 
						<cfif isNumeric(beginST) AND isNumeric(endST) and beginST LT endST>						
							<cfset arrCLPElements[arrayLen(arrCLPElements) + 1] = "#ListGetAt(arrLXElements[j], 1, '|')#|#ListGetAt(arrLXElements[j], 2, '|')#|#j#|#beginST#|#endST#">			
						</cfif>					
							
						<cfcatch type="Any">							
							<cfset ERROR.processing = "ERROR: Caught Exception - #CFCATCH.TYPE# : #cfcatch.message# : #cfcatch.detail#" />			
						</cfcatch>
					</cftry>		
					
				</cfloop>
			</cfloop>	
			
			<cfif debug>	
				<p align="left"><cfdump expand="no" label="GS/ST/LX/CLP Groupings Array" var="#arrCLPElements#"></p>		
			</cfif>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- Find all the SVC level elements.                                               --->
			<!-------------------------------------------------------------------------------------->		
			<cfloop from="1" to="#arrayLen(arrCLPElements)#" index="j">			
				<cfloop from="#ListGetAt(arrCLPElements[j], 4, '|')#" to="#ListLast(arrCLPElements[j], '|')#" index="t">		
				
					<cftry>					
						<cfset beginST = "">
						<cfset endST = "">
						<cfif arrData[t][1] EQ "SVC">			
							<cfset beginST = t>					
							<cfloop from="#evaluate(t+1)#" to="#ListLast(arrCLPElements[j], '|')#" index="k">
								<cfif arrData[k][1] EQ "SVC" OR arrData[k][1] EQ "SE">
									<cfset endST = k - 1>							
									<cfbreak>
								<cfelseif k EQ ListLast(arrCLPElements[j], '|')>
									<cfset endST = k>							
									<cfbreak>	
								</cfif>	
							</cfloop>				
						</cfif> 
						<cfif isNumeric(beginST) AND isNumeric(endST) and beginST LT endST>						
							<cfset arrSVCElements[arrayLen(arrSVCElements) + 1] = "#ListGetAt(arrCLPElements[j], 1, '|')#|#ListGetAt(arrCLPElements[j], 2, '|')#|#ListGetAt(arrCLPElements[j], 3, '|')#|#j#|#beginST#|#endST#">			
						</cfif>
						
						<cfcatch type="Any">							
							<cfset ERROR.processing = "ERROR: Caught Exception - #CFCATCH.TYPE# : #cfcatch.message# : #cfcatch.detail#" />			
						</cfcatch>
					</cftry>		
					
				</cfloop>
			</cfloop>	
			
			<cfif debug>	
				<p align="left"><cfdump expand="no" label="GS/ST/LX/CLP/SVC Groupings Array" var="#arrSVCElements#"></p>		
			</cfif>					
			
			<!-------------------------------------------------------------------------------------->
			<!--- We know the element positions now build the XML. Start with the ISA element.   --->
			<!-------------------------------------------------------------------------------------->
			<cfset xmlString835 = rawElementToXML(arrData[1][2], elementDelimeter, subElementDelimeter)>							
			
			<!-------------------------------------------------------------------------------------->
			<!--- Parse the xml string so the object is available.                               --->
			<!-------------------------------------------------------------------------------------->
			<cfset xmlString835 = xmlParse(xmlString835)>				
			
			<!-------------------------------------------------------------------------------------->
			<!--- Lets loop the data array and add in the GS elements.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrGSElements)#" index="gs">		
				<cfxml variable="xmlGS">
					<cfoutput>
						#rawElementToXML(arrData[ListFirst(arrGSElements[gs], "|")][2], elementDelimeter, subElementDelimeter)#
					</cfoutput>
				</cfxml>
				<cfset xmlAppend(xmlString835.xmlRoot, xmlGS) />	
			</cfloop>				
			
			<!-------------------------------------------------------------------------------------->
			<!--- Lets loop the data array and add in the ST elements.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrSTElements)#" index="st">
				
				<!-------------------------------------------------------------------------------------->
				<!--- We have to get the ST elments rows before any of its children (LX).            --->
				<!-------------------------------------------------------------------------------------->
				<cfset stString = "">		
				<cfset thisGS = ListGetAt(arrSTElements[st], 1, "|")>
				<cfloop from="1" to="#arrayLen(arrLXElements)#" index="lx">
					<cfif ListGetAt(arrLXElements[lx], 1, "|") EQ thisGS AND ListGetAt(arrLXElements[lx], 2, "|") EQ st>
						<cfset stEnd = ListGetAt(arrLXElements[lx], 3, "|") - 1>			
						<cfbreak>
					</cfif>
				</cfloop>	
				<cfloop from="#ListGetAt(arrSTElements[st], 2, "|")#" to="#stEnd#" index="j">					
					<cfset stString = stString & arrData[j][2] & "~">
				</cfloop>		
							
				<cfxml variable="xmlST">
					<cfoutput>
						#rawElementToXML(trim(stString), elementDelimeter, subElementDelimeter)#
					</cfoutput>
				</cfxml>
				<cfset thisGSXml = xmlString835["isa"]["gs"][thisGS]>
				<cfset xmlAppend(thisGSXml, xmlST) />	
				
			</cfloop>					
			
			<!-------------------------------------------------------------------------------------->
			<!--- Lets loop the data array and add in the LX elements.                           --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrLXElements)#" index="lx">
				
				<!-------------------------------------------------------------------------------------->
				<!--- We have to get the LX elements rows before any of its children (CLP).          --->
				<!-------------------------------------------------------------------------------------->
				<cfset lxString = "">		
				<cfset thisGS = ListGetAt(arrLXElements[lx], 1, "|")>
				<cfset thisST = ListGetAt(arrLXElements[lx], 2, "|")>
				<cfset lxEnd = ListGetAt(arrLXElements[lx], 3, "|")>	
				
				<cfloop from="1" to="#arrayLen(arrCLPElements)#" index="clp">
					<cfif ListGetAt(arrCLPElements[clp], 1, "|") EQ thisGS AND ListGetAt(arrCLPElements[clp], 2, "|") EQ thisST AND ListGetAt(arrCLPElements[clp], 3, "|") EQ lx AND ListGetAt(arrCLPElements[clp], 4, "|") GTE lxEnd>
						<cfset lxEnd = ListGetAt(arrCLPElements[clp], 4, "|") - 1>			
						<cfbreak>
					</cfif>
				</cfloop>	
				<cfloop from="#ListGetAt(arrLXElements[lx], 3, "|")#" to="#lxEnd#" index="j">					
					<cfset lxString = lxString & arrData[j][2] & "~">
				</cfloop>	
				
				<!-------------------------------------------------------------------------------------->
				<!--- We have to get this parents numberOfElements not the ordinal position.         --->
				<!-------------------------------------------------------------------------------------->		
				<cfset thisSTCount = 0>
				<cfset thisSTindex = ListGetAt(arrSTElements[thisST], 1, "|")>
				<cfloop from="1" to="#thisST#" index="aa">					
					<cfif ListGetAt(arrSTElements[aa], 1, "|") EQ thisSTindex>
						<cfset thisSTCount = thisSTCount + 1>
					</cfif>
				</cfloop>	
				
				<cfxml variable="xmlLX">
					<cfoutput>
						#rawElementToXML(trim(lxString), elementDelimeter, subElementDelimeter)#
					</cfoutput>
				</cfxml>	
				<cfset thisLXXml = xmlString835["isa"]["gs"][thisGS]["st"][thisSTCount] />
				<cfset xmlAppend(thisLXXml, xmlLX) />	
				
			</cfloop>			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Lets loop the data array and add in the CLP elements.                          --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrCLPElements)#" index="clp">
				
				<!-------------------------------------------------------------------------------------->
				<!--- We have to get the LX elements rows before any of its children (CLP).          --->
				<!-------------------------------------------------------------------------------------->
				<cfset clpString = "">		
				<cfset thisGS = ListGetAt(arrCLPElements[clp], 1, "|")>
				<cfset thisST = ListGetAt(arrCLPElements[clp], 2, "|")>
				<cfset thisLX = ListGetAt(arrCLPElements[clp], 3, "|")>
				<cfset clpEnd = ListGetAt(arrCLPElements[clp], 4, "|")>	
				
				<cfloop from="1" to="#arrayLen(arrSVCElements)#" index="svc">
					<cfif ListGetAt(arrSVCElements[svc], 1, "|") EQ thisGS AND ListGetAt(arrSVCElements[svc], 2, "|") EQ thisST AND ListGetAt(arrSVCElements[svc], 3, "|") EQ thisLX AND ListGetAt(arrSVCElements[svc], 4, "|") EQ clp AND ListGetAt(arrSVCElements[svc], 5, "|") GTE clpEnd>
						<cfset clpEnd = ListGetAt(arrSVCElements[svc], 5, "|") - 1>			
						<cfbreak>
					</cfif>
				</cfloop>	
				<cfloop from="#ListGetAt(arrCLPElements[clp], 4, "|")#" to="#clpEnd#" index="j">					
					<cfset clpString = clpString & arrData[j][2] & "~">
				</cfloop>	
				
				<!-------------------------------------------------------------------------------------->
				<!--- We have to get this parents numberOfElements not the ordinal position.         --->
				<!-------------------------------------------------------------------------------------->		
				<cfset thisSTCount = 0>
				<cfset thisSTindex = ListGetAt(arrSTElements[thisST], 1, "|")>
				<cfloop from="1" to="#thisST#" index="aa">					
					<cfif ListGetAt(arrSTElements[aa], 1, "|") EQ thisSTindex>
						<cfset thisSTCount = thisSTCount + 1>
					</cfif>
				</cfloop>	
				
				<cfset thisLXCount = 0>
				<cfset thisLXindex = ListGetAt(arrLXElements[thisLX], 2, "|")>
				<cfloop from="1" to="#thisLX#" index="ab">					
					<cfif ListGetAt(arrLXElements[ab], 2, "|") EQ thisLXindex>
						<cfset thisLXCount = thisLXCount + 1>
					</cfif>
				</cfloop>	
				
				
				<cfxml variable="xmlCLP">
					<cfoutput>
						#rawElementToXML(trim(clpString), elementDelimeter, subElementDelimeter)#
					</cfoutput>
				</cfxml>	
				<cfset thisCLPXml = xmlString835["isa"]["gs"][thisGS]["st"][thisSTCount]["lx"][thisLXCount] />
				<cfset xmlAppend(thisCLPXml, xmlCLP) />	
				
			</cfloop>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- Lets loop the data array and add in the SVC elements.                          --->
			<!-------------------------------------------------------------------------------------->
			<cfloop from="1" to="#arrayLen(arrSVCElements)#" index="svc">
				
				<!-------------------------------------------------------------------------------------->
				<!--- We have to get the LX elements rows before any of its children (CLP).          --->
				<!-------------------------------------------------------------------------------------->
				<cfset svcString = "">		
				<cfset thisGS = ListGetAt(arrSVCElements[svc], 1, "|")>
				<cfset thisST = ListGetAt(arrSVCElements[svc], 2, "|")>
				<cfset thisLX = ListGetAt(arrSVCElements[svc], 3, "|")>
				<cfset thisCLP = ListGetAt(arrSVCElements[svc], 4, "|")>	
					
				<cfloop from="#ListGetAt(arrSVCElements[svc], 5, "|")#" to="#ListGetAt(arrSVCElements[svc], 6, "|")#" index="j">					
					<cfset svcString = svcString & arrData[j][2] & "~">
				</cfloop>	
				
				<!-------------------------------------------------------------------------------------->
				<!--- We have to get this parents numberOfElements not the ordinal position.         --->
				<!-------------------------------------------------------------------------------------->		
				<cfset thisSTCount = 0>
				<cfset thisSTindex = ListGetAt(arrSTElements[thisST], 1, "|")>
				<cfloop from="1" to="#thisST#" index="aa">					
					<cfif ListGetAt(arrSTElements[aa], 1, "|") EQ thisSTindex>
						<cfset thisSTCount = thisSTCount + 1>
					</cfif>
				</cfloop>	
				
				<cfset thisLXCount = 0>
				<cfset thisLXindex = ListGetAt(arrLXElements[thisLX], 2, "|")>
				<cfloop from="1" to="#thisLX#" index="ab">					
					<cfif ListGetAt(arrLXElements[ab], 2, "|") EQ thisLXindex>
						<cfset thisLXCount = thisLXCount + 1>
					</cfif>
				</cfloop>	
				
				<cfset thisCLPCount = 0>
				<cfset thisCLPindex = ListGetAt(arrCLPElements[thisCLP], 3, "|")>
				<cfloop from="1" to="#thisCLP#" index="ac">					
					<cfif ListGetAt(arrCLPElements[ac], 3, "|") EQ thisCLPindex>
						<cfset thisCLPCount = thisCLPCount + 1>
					</cfif>
				</cfloop>	
				
				<cfxml variable="xmlSVC">
					<cfoutput>
						#rawElementToXML(trim(svcString), elementDelimeter, subElementDelimeter)#
					</cfoutput>
				</cfxml>	
				<cfset thisSVCXml = xmlString835["isa"]["gs"][thisGS]["st"][thisSTCount]["lx"][thisLXCount]["clp"][thisCLPCount] />
				<cfset xmlAppend(thisSVCXml, xmlSVC) />	
				
			</cfloop>
				
			
			
			<cfif debug>				
				<cfset gss = XmlSearch(xmlString835, "/isa/gs")>
				<cfset sts = XmlSearch(xmlString835, "/isa/gs/st")>
				<cfset lxs = XmlSearch(xmlString835, "/isa/gs/st/lx")>
				<cfset clps = XmlSearch(xmlString835, "/isa/gs/st/lx/clp")>
				<cfset svcs = XmlSearch(xmlString835, "/isa/gs/st/lx/clp/svc")>				
				<cfoutput>
					<p align="left">	
						There are #arrayLen(gss)# GS's in this report<br>
						There are #arrayLen(sts)# ST's in this report<br>
						There are #arrayLen(lxs)# LX's in this report<br>
						There are #arrayLen(clps)# CLP's in this report<br>
						There are #arrayLen(svcs)# SVC's in this report
					</p>
				</cfoutput>				
				<p align="left"><cfdump var="#xmlString835#"></p>			
			</cfif>
	
			<cffile action="write" file="#trim(directoryPath)#\#trim(fileName)#.xml" output="#xmlString835#" addnewline="no">				
					
			<!---<cffile action="READ" file="#trim(directoryPath)#\#trim(fileName)#.xml" variable="fileContents">				
			<cfreturn = fileContents>	--->
			
			<cfreturn xmlString835>	
			
			<cfcatch type="Any">					
				<cfset message="#cfcatch.type# #cfcatch.message# #cfcatch.detail#">
				<cf_gcGatewayLogger	datasource="#trim(variables.datasource)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
				<cfset variables.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
				<cfset variables.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
				<cfset variables.FileProcess.commit()>
				<cfthrow message="#trim(message)#">
			</cfcatch>	
				
		</cftry>
	
	</cffunction>
	
		
		
		
</cfcomponent>
	




<!---
SVC*HC>A6244>A2*675*471.36**15~
DTM*150*20070108~
DTM*151*20070207~
CAS*PR*2*117.84~
CAS*CO*42*85.8~
REF*6R*06345000000000702~
REF*LU*12~
AMT*B6*589.2~

<SVC>
	<CompositeMedicalProcedureIdentifier1>HC&gt;E1038&gt;RR&gt;KJ&gt;GA</CompositeMedicalProcedureIdentifier1>
	<MonetaryAmount2>75</MonetaryAmount2>
	<MonetaryAmount3>0</MonetaryAmount3>
	<ProductServiceID4></ProductServiceID4>
	<Quantity5></Quantity5>
	<CompositeMedicalProcedureIdentifier6> </CompositeMedicalProcedureIdentifier6>
	<Quantity7>1</Quantity7>
	<DTM>
		<DateTimeQualifier1>472</DateTimeQualifier1>
		<Date2>20070226</Date2>
	</DTM>
	<CAS>
		<ClaimAdjustmentGroupCode1>CO</ClaimAdjustmentGroupCode1>
		<ClaimAdjustmentReasonCode2>18</ClaimAdjustmentReasonCode2>
		<MonetaryAmount3>75</MonetaryAmount3>
	</CAS>
	<REF>
		<ReferenceIdentificationQualifier1>6R</ReferenceIdentificationQualifier1>
		<ReferenceIdentification2>06037000000001001</ReferenceIdentification2>
	</REF>
	<REF>
		<ReferenceIdentificationQualifier1>LU</ReferenceIdentificationQualifier1>
		<ReferenceIdentification2>12</ReferenceIdentification2>
	</REF>
	<LQ>
		<CodeListQualifierCode1>HE</CodeListQualifierCode1>
		<IndustryCode2>N111</IndustryCode2>
	</LQ>
</SVC>




****************************** OLD CODE **********************************

	<!---<cfset compositeMedicalProcedureIdentifier = trim(ListGetAt(thisStr, 2, elementDelimeter))>						
						<cfset mainSVC_01 = XmlElemNew(xmlString,"svc01_01")>
						<cfset mainSVC_01.XmlText = ListGetAt(compositeMedicalProcedureIdentifier, 1, subElementDelimeter)>
						<cfset xmlString.xmlRoot.XmlChildren[1] = mainSVC_01>
						
						<cfset mainSVC_02 = XmlElemNew(xmlString,"svc01_02")>
						<cfset mainSVC_02.XmlText = ListGetAt(compositeMedicalProcedureIdentifier, 2, subElementDelimeter)>
						<cfset xmlString.xmlRoot.XmlChildren[2] = mainSVC_02>--->
						
						
						
<!---<cfcase value="SVC">				
																	
						<cfset compositeMedicalProcedureIdentifier = trim(ListGetAt(thisStr, 2, elementDelimeter))>
						<cfloop from="1" to="#ListLen(compositeMedicalProcedureIdentifier, subElementDelimeter)#" index="SVC01">
							<cfset "xmlString.svc.svc01.svc01_#SVC01#.xmlText" = ListGetAt(compositeMedicalProcedureIdentifier, SVC01, subElementDelimeter)>						
						</cfloop>
						
						<cfset xmlString.svc.svc02.xmlText = trim(ListGetAt(thisStr, 3, elementDelimeter))>
						<cfset xmlString.svc.svc03.xmlText = trim(ListGetAt(thisStr, 4, elementDelimeter))>
						<cfset xmlString.svc.svc04.xmlText = trim(ListGetAt(thisStr, 5, elementDelimeter))>
						<cfset xmlString.svc.svc05.xmlText = trim(ListGetAt(thisStr, 6, elementDelimeter))>
						
						<cfif ListLen(thisStr, elementDelimeter) GTE 7>
							<cfset compositeMedicalProcedureIdentifierSVC06 = trim(ListGetAt(thisStr, 7, elementDelimeter))>
							<cfloop from="1" to="#ListLen(compositeMedicalProcedureIdentifierSVC06, subElementDelimeter)#" index="SVC06">
								<cfset "xmlString.svc.svc06.svc06_#SVC06#.xmlText" = ListGetAt(compositeMedicalProcedureIdentifier, SVC06, subElementDelimeter)>						
							</cfloop>
						</cfif>															
						<cfif ListLen(thisStr, elementDelimeter) GTE 8>
							<cfset xmlString.svc.svc07.xmlText = trim(ListGetAt(thisStr, 8, elementDelimeter))>
						</cfif>
					</cfcase>--->	
					
					
<cfset xmlStart = '
				<svc>
					<svc01>
						<svc01_1></svc01_1>
						<svc01_2></svc01_2>
						<svc01_3></svc01_3>
						<svc01_4></svc01_4>
						<svc01_5></svc01_5>
						<svc01_6></svc01_6>
						<svc01_7></svc01_7>		
					</svc01>
					<svc02></svc02>
					<svc03></svc03>
					<svc04></svc04>
					<svc05></svc05>
					<svc06>
						<svc06_1></svc06_1>
						<svc06_2></svc06_2>
						<svc06_3></svc06_3>
						<svc06_4></svc06_4>
						<svc06_5></svc06_5>
						<svc06_6></svc06_6>
						<svc06_7></svc06_7>		
					</svc06>
					<svc07></svc07>
					<dtm>
						<dtm01></dtm01>
						<dtm02></dtm02>
					</dtm>
					<cas>
						<cas01></cas01>
						<cas02></cas02>
						<cas03></cas03>
						<cas04></cas04>
						<cas05></cas05>
						<cas06></cas06>
						<cas07></cas07>
						<cas08></cas08>
						<cas09></cas09>
						<cas10></cas10>
						<cas11></cas11>
						<cas12></cas12>
						<cas13></cas13>
						<cas14></cas14>
						<cas15></cas15>
						<cas16></cas16>
						<cas17></cas17>
						<cas18></cas18>
						<cas19></cas19>						
					</cas>
					<ref segname="SERVICE IDENTIFICATION">
						<ref01></ref01>
						<ref02></ref02>
					</ref>
					<ref segname="RENDERING PROVIDER INFORMATION">
						<ref01></ref01>
						<ref02></ref02>
					</ref>
					<amt>
						<amt01></amt01>
						<amt02></amt02>
					</amt>
					<qty>
						<qty01></qty01>
						<qty02></qty02>
					</qty>
					<lq>
						<lq01></lq01>
						<lq02></lq02>
					</lq>
				</svc>
			'>
			<cfset xmlStart = ''>										
--->		




<!---<cfcase value="DTM">
						
						<cfset mainDTM = XmlElemNew(xmlString,"dtm")>
						<cfset mainDTM.XmlText = "">
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainDTM>
												
						<cfset mainDTM = XmlElemNew(xmlString,"dtm01")>
						<cfset mainDTM.XmlText = trim(ListGetAt(thisStr, 2, elementDelimeter))>
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainDTM>
						
						<cfset mainDTM = XmlElemNew(xmlString,"dtm02")>
						<cfset mainDTM.XmlText = trim(ListGetAt(thisStr, 3, elementDelimeter))>
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainDTM>						
					
					</cfcase>
					
					
					<cfcase value="CAS">
						
						<cfset mainCAS = XmlElemNew(xmlString,"cas")>
						<cfset mainCAS.XmlText = "">
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainCAS>											
					
						<cfset countCAS = 0>
						<cfloop list="#trim(thisStr)#" delimiters="*" index="casList">
							<cfif trim(casList) NEQ ListGetAt(thisStr, 1, elementDelimeter)>
								<cfset thisElementName = numberFormat(evaluate(countCAS + 1), "00")>
								<cfset countCAS = countCAS + 1>
								<cfset mainCAS = XmlElemNew(xmlString, "cas#trim(thisElementName)#")>
								<cfset mainCAS.XmlText = trim(ListGetAt(thisStr, evaluate(countCAS + 1), elementDelimeter))>
								<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainCAS>						
							</cfif>
						</cfloop>
										
					</cfcase>
					
					<cfcase value="REF">
						
						<cfset mainREF = XmlElemNew(xmlString,"ref")>
						<cfset mainREF.XmlText = "">
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainREF>											
					
						<cfset countREF = 0>
						<cfloop list="#trim(thisStr)#" delimiters="*" index="refList">
							<cfif trim(refList) NEQ ListGetAt(thisStr, 1, elementDelimeter)>
								<cfset thisElementName = numberFormat(evaluate(countREF + 1), "00")>
								<cfset countREF = countREF + 1>
								<cfset mainREF = XmlElemNew(xmlString, "ref#trim(thisElementName)#")>
								<cfset mainREF.XmlText = trim(ListGetAt(thisStr, evaluate(countREF + 1), elementDelimeter))>
								<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainREF>						
							</cfif>
						</cfloop>
										
					</cfcase>
					
					<cfcase value="AMT">
						
						<cfset mainAMT = XmlElemNew(xmlString,"amt")>
						<cfset mainAMT.XmlText = "">
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainAMT>											
					
						<cfset countAMT = 0>
						<cfloop list="#trim(thisStr)#" delimiters="*" index="amtList">
							<cfif trim(amtList) NEQ ListGetAt(thisStr, 1, elementDelimeter)>
								<cfset thisElementName = numberFormat(evaluate(countAMT + 1), "00")>
								<cfset countAMT = countAMT + 1>
								<cfset mainAMT = XmlElemNew(xmlString, "amt#trim(thisElementName)#")>
								<cfset mainAMT.XmlText = trim(ListGetAt(thisStr, evaluate(countAMT + 1), elementDelimeter))>
								<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainAMT>						
							</cfif>
						</cfloop>
										
					</cfcase>
					
					<cfcase value="QTY">
						
						<cfset mainQTY = XmlElemNew(xmlString,"qty")>
						<cfset mainQTY.XmlText = "">
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainQTY>											
					
						<cfset countQTY = 0>
						<cfloop list="#trim(thisStr)#" delimiters="*" index="qtyList">
							<cfif trim(qtyList) NEQ ListGetAt(thisStr, 1, elementDelimeter)>
								<cfset thisElementName = numberFormat(evaluate(countQTY + 1), "00")>
								<cfset countQTY = countQTY + 1>
								<cfset mainQTY = XmlElemNew(xmlString, "qty#trim(thisElementName)#")>
								<cfset mainQTY.XmlText = trim(ListGetAt(thisStr, evaluate(countQTY + 1), elementDelimeter))>
								<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainQTY>						
							</cfif>
						</cfloop>
										
					</cfcase>
					
					<cfcase value="LQ">
						
						<cfset mainLQ = XmlElemNew(xmlString,"lq")>
						<cfset mainLQ.XmlText = "">
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainLQ>											
					
						<cfset countLQ = 0>
						<cfloop list="#trim(thisStr)#" delimiters="*" index="lqList">
							<cfif trim(lqList) NEQ ListGetAt(thisStr, 1, elementDelimeter)>
								<cfset thisElementName = numberFormat(evaluate(countLQ + 1), "00")>
								<cfset countLQ = countLQ + 1>
								<cfset mainLQ = XmlElemNew(xmlString, "lq#trim(thisElementName)#")>
								<cfset mainLQ.XmlText = trim(ListGetAt(thisStr, evaluate(countLQ + 1), elementDelimeter))>
								<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainLQ>						
							</cfif>
						</cfloop>
										
					</cfcase>--->
					
					
					
					<!---
					<!---<cfloop from="1" to="#ListLen(elemListIndex, subElementDelimeter)#" index="subElemListIndex">
										<cfset thisElementSubName = numberFormat(subElemListIndex, "00")>
										<cfset mainSubElem = XmlElemNew(xmlString,"#trim(lcaseElement)##trim(thisElementName)#_#thisElementSubName#")>
										<cfset mainSubElem.XmlText = ListGetAt(elemListIndex, subElemListIndex, subElementDelimeter)>
										<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSubElem>
									</cfloop>
									<cfset temp = ListGetAt(compositeMedicalProcedureIdentifierSVC06, SVC06, subElementDelimeter)>										
									--->	
					--->
					
					
					
	<!---
	
	<cfswitch expression = "#trim(arrSvcData[j][1])#">
					
					<cfcase value="SV4khjhkC">
						
						<cfset mainSVC = XmlElemNew(xmlString,"svc01")>
						<cfset mainSVC.XmlText = "">
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSVC>
						
						<cfset compositeMedicalProcedureIdentifier = trim(ListGetAt(thisStr, 2, elementDelimeter))>						
						<cfloop from="1" to="#ListLen(compositeMedicalProcedureIdentifier, subElementDelimeter)#" index="SVC01">
							<cfset "mainSVC_#SVC01#" = XmlElemNew(xmlString,"svc01_#SVC01#")>
							<cfset "mainSVC_#SVC01#.XmlText" = ListGetAt(compositeMedicalProcedureIdentifier, SVC01, subElementDelimeter)>
							<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[SVC01] = evaluate("mainSVC_#SVC01#")>
						</cfloop>
						
						<cfset mainSVC = XmlElemNew(xmlString,"svc02")>
						<cfset mainSVC.XmlText = trim(ListGetAt(thisStr, 3, elementDelimeter))>
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSVC>
						
						<cfset mainSVC = XmlElemNew(xmlString,"svc03")>
						<cfset mainSVC.XmlText = trim(ListGetAt(thisStr, 4, elementDelimeter))>
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSVC>
						
						<cfset mainSVC = XmlElemNew(xmlString,"svc04")>
						<cfset mainSVC.XmlText = trim(ListGetAt(thisStr, 5, elementDelimeter))>
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSVC>
						
						<cfset mainSVC = XmlElemNew(xmlString,"svc05")>
						<cfset mainSVC.XmlText = trim(ListGetAt(thisStr, 6, elementDelimeter))>
						<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSVC>						
						
						<cfif ListLen(thisStr, elementDelimeter) GTE 7>
							
							<cfset mainSVC = XmlElemNew(xmlString,"svc06")>
							<cfset mainSVC.XmlText = "">
							<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSVC>
							
							<cfset compositeMedicalProcedureIdentifierSVC06 = trim(ListGetAt(thisStr, 7, elementDelimeter))>						
							<cfloop from="1" to="#ListLen(compositeMedicalProcedureIdentifierSVC06, subElementDelimeter)#" index="SVC06">
								<cfset "mainSVC_#SVC06#" = XmlElemNew(xmlString,"svc06_#SVC06#")>
								<cfset "mainSVC_#SVC06#.XmlText" = ListGetAt(compositeMedicalProcedureIdentifierSVC06, SVC06, subElementDelimeter)>
								<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[SVC06] = evaluate("mainSVC_#SVC06#")>
							</cfloop>
							
						</cfif>
						
						<cfif ListLen(thisStr, elementDelimeter) GTE 8>
							<cfset mainSVC = XmlElemNew(xmlString,"svc07")>
							<cfset mainSVC.XmlText = trim(ListGetAt(thisStr, 8, elementDelimeter))>
							<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainSVC>		
						</cfif>
											
					</cfcase>
														
					<cfdefaultcase>	
					
					</cfdefaultcase>
					
					
					
				</cfswitch>
					
	
	--->				