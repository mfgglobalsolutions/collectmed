
<cfcomponent>
  
	<cfset variables.message = "Successful Client Retrieve TX Medicaid Files<br>">
	<cfset variables.instance.InsuranceCompanyMedicaidTexasID = 44584>

   	<cffunction name="onIncomingMessage" output="no">
     
	  	<cfargument name="CFEvent" type="struct" required="yes">
      						 		 		  	
			<cftry>	
						
			<cf_gcCFScriptIncludes>		
			<cfset data = CFEvent.data>
			
			<cfset variables.datasource = trim(data.datasource)>	
			<cfset variables.ediWSPath = trim(data.ediWSPath)>
			
				<cfset variables.icService = application.beanFactory.getBean("InsuranceCompanyService")>
				<cfset variables.gf = application.beanFactory.getBean("globalFooter")>
				<cfset variables.getThisIC = variables.icService.filterByInsuranceCompanyID(variables.instance.InsuranceCompanyMedicaidTexasID)>
				<cfset variables.connectionDataXML = xmlParse(getThisIC.LoginInstructionsXML)>
				<cfset xmlData = xmlsearch(variables.connectionDataXML, "connection")>
		
				<cfif ListFindNoCase("ftp", trim(xmlData[1].type.xmlText))>		
					<cfset variables.user = variables.gf.GlobalFooterD(trim(xmlData[1].username.xmlText))>
					<cfset variables.pass = variables.gf.GlobalFooterD(trim(xmlData[1].password.xmlText))>
					<cfset variables.loginURL = trim(xmlData[1].url.xmlText)>
					<cfset variables.folder = trim(xmlData[1].folder.xmlText)>
				</cfif>
				
				<cfif trim(variables.user) EQ "" OR trim(variables.pass) EQ "" OR trim(variables.loginURL) EQ "" OR trim(variables.folder) EQ "">
					<cfthrow message="One of the mandatory variables is missing.">
				</cfif>
			
			<cfscript>		
				variables.webServicePath = "#trim(ediWSPath)#";
				variables.objEDI = createObject("webservice", variables.ediWSPath); 
				variables.Result = variables.objEDI.retrieveFiles(trim(variables.user), trim(variables.pass), trim(variables.loginURL), variables.folder);    		
			</cfscript> 
					
			<!-------------------------------------------------------------------------------------->
			<!--- Get all the clientIDs that will be run against.                                --->
			<!-------------------------------------------------------------------------------------->	
			<cfset variables.objClient = application.beanFactory.getBean("old_Client")>
			<cfset variables.clientIDs = variables.objClient.getClientIDs()>
			
			<!-------------------------------------------------------------------------------------->
			<!--- They must be in this order.                                                    --->	
			<!-------------------------------------------------------------------------------------->
			<cfset getTXMedicaidFilesFromNationalEDI(variables.clientIDs, request.fmsPathTop, request.tempDocsFolder, variables.folder)>
			<cfset setBIDFileBinding(variables.clientIDs, request.fmsPathTop, request.tempDocsFolder)>
			<cfset processTempDirectory(variables.clientIDs, request.fmsPathTop, request.tempDocsFolder, request.Site.getSupportEmailAddressID(), arguments.CFEvent.data)>
					
			<!------------------------------------------------------------------>
			<!--- Placing this in response to the inability by JRun to       --->
			<!--- possibly not releasing ram used by the request scope.      --->
			<!--- 05/04/05                                                   --->
			<!------------------------------------------------------------------>
				<!--- <cfset tempClear = StructClear(Request)> --->	
									
				<cfreturn true>
		
			<cfcatch type="Any">				
				<cfreturn "Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
			</cfcatch>
			
		</cftry>		
     
   	</cffunction>
   


	<cffunction name="processTempDirectory" returntype="string" output="true">
		
		<cfargument name="clientIDs" required="true" type="string">
		<cfargument name="fmsPathTop" required="true" type="string">
		<cfargument name="tempDocsFolder" required="true" type="string">
		<cfargument name="SupportEmailAddressID" required="true" type="numeric">
		<cfargument name="data" required="true" type="struct">
			
		<cftry>	
	
		
			<cfloop list="#trim(arguments.clientIDs)#" index="cid">
			
				<cfset variables.currentFolder = "#trim(arguments.fmsPathTop)#\#trim(cid)#\#trim(arguments.tempDocsFolder)#\TX\Medicaid" />
				
				<cfdirectory name="mainTempDir_Files" directory="#trim(variables.currentFolder)#" action="LIST">
										
				<cfloop query="mainTempDir_Files">
					
					<cfset variables.ext = ListLast(mainTempDir_Files.name, ".")>
					
					<cfif ListFindNoCase("EXT,ACC,997,REJ,BID,277,835,27C,27S,Z01,Z13,Z04,271", trim(variables.ext))>					
						
						<cfset variables.thisBatchID = ListGetAt(mainTempDir_Files.name, 2, ".")>					
						<cfset variables.parentFileID = getTXMedicaidMasterFileBinding(trim(variables.currentFolder), variables.thisBatchID)>	
						
						<cf_gcEOBFileUpload
							fileType="302"
							clientID="#trim(cid)#"						
							filePath="#trim(variables.currentFolder)#\#trim(mainTempDir_Files.name)#"
							foldersToSkip="temp"
							movefile="true"
							parentFileID="#trim(variables.parentFileID)#"
							SupportEmailAddressID="#arguments.SupportEmailAddressID#">				
																		
						<cfif trim(variables.ext) EQ "271">
							<cfset createMashFile270_271(trim(newFileID), arguments.data)>
						</cfif>
						
								
					</cfif>	
							
				</cfloop>
				
			</cfloop>	
			
			<cfcatch type="Any">				
				<cfreturn "Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
			</cfcatch>
			
		</cftry>
		
	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- get an FTP object to be able to process the files.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTXMedicaidFilesFromNationalEDI" returntype="string" output="false">
		
		<cfargument name="clientIDs" required="true" type="string">	
		<cfargument name="fmsPathTop" required="true" type="string">
		<cfargument name="tempDocsFolder" required="true" type="string">
		<cfargument name="folder" required="true" type="string">
			
		<cftry>	
			
			<cfset variables.ftpConnectionName = "tempFTP">	
			
			<cfftp port="21" action="open" username="admins" password="nationaledi" connection="#trim(variables.ftpConnectionName)#" server="secure.nationaledi.com" stopOnError="Yes">
									
			<cfif cfftp.succeeded>
				
				<cfloop list="#trim(variables.clientIDs)#" index="cid">	
								
					<cfset variables.ListFiles = "" />
					<cfset variables.thisClientFMSPath = "#trim(arguments.fmsPathTop)#\#trim(cid)#\#trim(arguments.tempDocsFolder)#\TX\Medicaid" />
					
					<cfftp transfermode="binary" action="LISTDIR" stoponerror="yes" name="ListFiles" directory="/fms/national/#trim(arguments.folder)#/#trim(cid)#/temp/download" connection="#trim(variables.ftpConnectionName)#">
						
				  	<cfloop query="ListFiles">					   				
						
						<cfif ISDIRECTORY EQ "false" OR ISDIRECTORY EQ "No">
				
							<cfftp action="getFile" remotefile="/fms/national/#trim(arguments.folder)#/#trim(cid)#/temp/download/#trim(name)#" localfile="#trim(variables.thisClientFMSPath)#\#trim(name)#" connection="#trim(variables.ftpConnectionName)#" failIfExists="no">			
				   			<cfif cfftp.succeeded>
								<cfftp action="remove" item="/fms/national/#trim(arguments.folder)#/#trim(cid)#/temp/download/#trim(name)#" connection="#trim(variables.ftpConnectionName)#">
							</cfif>
							
						</cfif>
			
					</cfloop>
						
				</cfloop>
									
			<cfelse>
				<cfmail	from="support@eobmanager.net" to="support@eobmanager.net" subject="IMMEDIATE ATTENTION REQUIRED. UN-Successful FTP Client Retrieve TX Medicaid Files #DayOfWeekAsString(DayOfweek(NOW()))# #DateFormat(NOW(), 'mm/dd/yyyy')# #TimeFormat(NOW(), 'hh:mm:ss')# [#trim(CGI.REMOTE_ADDR)#]" type="HTML">
					<cfdump var="#cfftp#">					
				</cfmail>						
			</cfif>
			
			
			<cfftp port="21" action="close" connection="#trim(variables.ftpConnectionName)#" stopOnError="Yes">
	
	
			<cfcatch type="Any">				
				<cfreturn "Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
			</cfcatch>
			
		</cftry>
		
	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Files have now been brought down from nationalEDI, loop over the clients and   --->
	<!--- bind the batchID to a parentFileID by the .BID file                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="setBIDFileBinding" returntype="string" output="false">
		
		<cfargument name="clientIDs" required="true" type="string">
		<cfargument name="fmsPathTop" required="true" type="string">
		<cfargument name="tempDocsFolder" required="true" type="string">
			
		<cftry>	
		
			<cfloop list="#trim(arguments.clientIDs)#" index="cid">
			
				<cfset variables.currentFolder = "#trim(arguments.fmsPathTop)#\#trim(cid)#\#trim(arguments.tempDocsFolder)#\TX\Medicaid" />
				
				<cfdirectory name="mainTempDir_BID" directory="#trim(variables.currentFolder)#" action="LIST">		
								
				<cfloop query="mainTempDir_BID">
					
					<cfset variables.ext = ListLast(mainTempDir_BID.name, ".")>
					
					<cfif FindNoCase("BID", trim(variables.ext))>			
					
						<!-------------------------------------------------------------------------------------->								 
						<!--- POSSIBLE FILENAMES EXAMPLES                                                    --->  
						<!--- 146153871.G77008PE.10843020110002767100410052541.txt.BID					     --->
						<!--- 146153871.G77008P9.G65006VN.146153871.10843020110002680092210102335.txt.BID    --->
						<!-------------------------------------------------------------------------------------->				
						<cfset variables.thisBatchID = ListGetAt(mainTempDir_BID.name, 2, ".")>					
						<cfset variables.thisClientID = LEFT(ListGetAt(mainTempDir_BID.name, ListLen(mainTempDir_BID.name, ".")-2, "."), 4)>						
						
						<cfif trim(cid) eq variables.thisClientID>
											
							<!-------------------------------------------------------------------------------------->
							<!--- Check to see if this batchID has already been processed.                       --->	
							<!-------------------------------------------------------------------------------------->
							<cfset variables.parentFileID = getTXMedicaidMasterFileBinding(trim(variables.currentFolder), variables.thisBatchID)>
							<cfif NOT Isnumeric(variables.parentFileID)>	
								
								<cfset variables.thisParentFileName = ListGetAt(mainTempDir_BID.name, ListLen(mainTempDir_BID.name, ".")-2, ".")>
								<cfset variables.thisParentFileID =  val(mid(variables.thisParentFileName, 11, 7))>					
								<cfset variables.newBatchIDLine = "#trim(variables.thisBatchID)#,#DateFormat(NOW(), 'mm/dd/yyyy')#,#trim(variables.thisParentFileID)#">						
								<cffile action="append" file="#trim(variables.currentFolder)#\TXMedicaidMasterFileBinding.txt" output="#trim(variables.newBatchIDLine)#">				
							
							</cfif>
									
						</cfif>
															
					</cfif>	
								
				</cfloop>
				
			</cfloop>	
			
			<cfcatch type="Any">				
				<cfreturn "Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- getTXMedicaidMasterFileBinding file                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTXMedicaidMasterFileBinding" returntype="string" output="false">
		
		<cfargument name="directoryPath" required="true" type="string">
		<cfargument name="batchID" required="true" type="string">
			
		<cftry>		
			
			<cfif NOT fileExists("#trim(arguments.directoryPath)#\TXMedicaidMasterFileBinding.txt")>
				<cffile action="WRITE" output="" file="#trim(arguments.directoryPath)#\TXMedicaidMasterFileBinding.txt">
			</cfif>
			
			<cfset returnFileID = "">
			<cffile action="READ" file="#trim(arguments.directoryPath)#\TXMedicaidMasterFileBinding.txt" variable="masterFileContents">
			
			<cfloop list="#trim(masterFileContents)#" delimiters="#chr(13)##chr(10)#" index="i">
				<cfif FindNoCase(trim(arguments.batchID), i)>
					<cfset returnFileID = ListLast(i)>
					<cfbreak>
				</cfif>
			</cfloop>			
			
			<cfreturn returnFileID>
		
			<cfcatch type="Any">				
				<cfreturn "Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	


	<!-------------------------------------------------------------------------------------->
	<!--- create MashFile270_271 file                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="createMashFile270_271" returntype="string" output="false">
		
		<cfargument name="new271FileID" required="true" type="string">
		<cfargument name="data" required="true" type="struct">
			
		<cftry>		
			
			<cfscript>		
				variables.webServicePath = "#trim(arguments.data.Medicaid_271_X12ToXmlWSPath)#";
				variables.obj271_X12ToXml = createObject("webservice", variables.webServicePath);
				variables.objXMLFunctions = application.beanFactory.getBean('old_xmlFunctions');
				variables.objToXML = application.beanFactory.getBean('old_toXML');
				variables.FileSVC = application.beanFactory.getBean('old_FileService');	
				variables.svcVerificationFileTXMedicaid = application.beanFactory.getBean('VerificationFileService_TXMedicaid');
			
				variables.filterF = structNew();
				variables.filterF.FIleID = trim(arguments.new271FileID);		
				variables._271FileQuery = variables.FileSVC.getAllFiles(variables.filterF);
				_271ParentFileID = variables.svcVerificationFileTXMedicaid.getParentVerificationFileByFileName('#trim(variables._271FileQuery.ServerFile)#');
				
				variables.filterF = structNew();
				variables.filterF.FIleID = trim(_271ParentFileID);		
				variables.parentFileQuery = variables.FileSVC.getAllFiles(variables.filterF);	
			</cfscript>
			
			<cffile action="READ" file="#variables._271FileQuery.ServerDirectory#\#variables._271FileQuery.ServerFile#" variable="_271FileContents">
			<cffile action="READ" file="#variables.parentFileQuery.ServerDirectory#\#variables.parentFileQuery.ServerFile#" variable="parentXMLFileContents">	
			
			<cfscript>		
				variables._271xmlResult = variables.obj271_X12ToXml.x12ToXml(string271: trim(variables._271FileContents));	
				variables.parentXMLFileContents = xmlParse(variables.parentXMLFileContents);
				variables._271xmlResult = xmlParse(variables._271xmlResult);	
				variables.Patients = xmlSearch(variables.parentXMLFileContents, "//patient");
				variables.PatientsHL = xmlSearch(variables._271xmlResult, "//hl");
				variables.temp = "YES";	
				pat = "";
			</cfscript> 
				
			<cfloop from="1" to="#trim(ArrayLen(variables.Patients))#" index="pat">				
				
				<cfset variables.thisPatientid = variables.Patients[pat].patientid.XMLText>
			
				<cfloop from="1" to="#trim(ArrayLen(variables.PatientsHL))#" index="patHL">			
					<cfset variables.thisHLID = 0>
					<cfset variables.thisPatientIteration = 0>			
					<cfset variables.PatientsHlTrn = XMLSearch(variables.PatientsHL[patHL], "trn")>		
					<cfloop from="1" to="#trim(ArrayLen(variables.PatientsHlTrn))#" index="patHLtrn">
						<cfif variables.PatientsHlTrn[patHLtrn].trn_01.xmlText EQ 2 AND variables.PatientsHlTrn[patHLtrn].trn_02.xmlText EQ variables.thisPatientid> 
							<cfset variables.thisHLID = patHL>
							<cfbreak>
						</cfif>
					</cfloop>				
					<cfif variables.thisHLID GT 0>
						<cfset variables.thisPatientIteration = patHL>				
						<cfbreak>
					</cfif>						
				</cfloop>		
				
				<cfif variables.thisPatientIteration LTE 0>
					<cfthrow type="any" message="Issue with finding match on 271.">
				</cfif>
				
				<cfset variables.tempXML = variables.objToXML.stringToXML(data: variables.temp, rootelement: "root", itemelement: "patient271")>
				<cfset variables.temp271 = XMLSearch(variables.tempXML, "//root")>
				<cfset variables.objXMLFunctions.xmlAppend(variables.parentXMLFileContents.data.verifications.patient[pat], variables.temp271[1]) /> 
				
				<cfset variables.objXMLFunctions.xmlAppend(variables.parentXMLFileContents.data.verifications.patient[pat].patient271, variables.PatientsHL[variables.thisPatientIteration]) />
										
			</cfloop>			
						
			<!------------------------------------------------------------------------------------------------->
			<!--- code that will call the transformation that will strip out whitespace in the returned xml --->
			<!------------------------------------------------------------------------------------------------->	
			<cfset variables.xsltPath = CreateObject( "java", "java.net.URL" ).Init(JavaCast("string", "file:#arguments.data.stripWhiteSpaceXSLTPATH#" )).getPath() />
			<cffile action="READ" file="#variables.xsltPath#" variable="variables.xsltFile"/>
			<cfset variables.transformers = createObject("java", "xsltTransformer") />
			<cfset variables.parentXMLFileContents = variables.transformers.xsltTransform("#toString(variables.parentXMLFileContents)#", "#toString(variables.xsltFile)#") />
			
					
			<!-------------------------------------------------------------------------------------->
			<!--- Save the XML created in a parentXMLFileContents XML File.                      --->
			<!-------------------------------------------------------------------------------------->
			<cfset newFileID = "">
			<cfset variables.finalFileName = "#variables._271FileQuery.ServerFileName#.Mash270_271.xml">
			<cffile action="write" file="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(variables.finalFileName)#" output="#variables.parentXMLFileContents#" addnewline="no">	
			<cf_gcEOBFileUpload
				fileType="302"
				clientID="#trim(session.ClientID)#"
				filePath="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(variables.finalFileName)#"				
				parentFileID="#variables._271FileQuery.ParentFileID#"
				foldersToSkip="temp"
				movefile="true"
				SupportEmailAddressID="#request.Site.getSupportEmailAddressID()#">
				
			<cfset variables.mashXMLFileID = trim(newFileID)>			

			
			<!-------------------------------------------------------------------------------------->			
			<!--- Crete a Verification for each one of the returned verifications.			     --->
			<!-------------------------------------------------------------------------------------->
			<cfscript>					
				variables.PatientInsuranceCompanySVC = application.beanFactory.getBean('old_PatientInsuranceCompanyService');
				variables.parentXMLFileContents = xmlParse(variables.parentXMLFileContents);	
				variables.Patients = xmlSearch(variables.parentXMLFileContents, "//patient");				
				pat = "";
			</cfscript> 
				
			<cfloop from="1" to="#trim(ArrayLen(variables.Patients))#" index="pat">
				<cfset variables.thisPatientid = variables.Patients[pat].patientid.XMLText>
				<cfset variables.patientsICs = variables.PatientInsuranceCompanySVC.getPatientInsuranceCompanies(arguments.data.datasource, variables.thisPatientid, variables.instance.InsuranceCompanyMedicaidTexasID)>
				
				<!--- Add a PatinetInsuranceCompany Record. --->
				<cfif variables.patientsICs.recordCount lte 0>
					<cfscript>					
						variables.objPatientInsuranceCompany = application.beanFactory.getBean('old_PatientInsuranceCompany');
						variables.objPatientInsuranceCompany.setPatientID(variables.thisPatientid);
						variables.objPatientInsuranceCompany.setInsuranceCompanyID(variables.instance.InsuranceCompanyMedicaidTexasID);
						variables.PatientInsuranceCompanySVC.save(variables.objPatientInsuranceCompany);
						variables.thisPicID = variables.objPatientInsuranceCompany.getRecordID();
					</cfscript> 						
				<cfelse>
					<cfloop query="patientsICs">
						<cfset variables.thisPicID = recordID>
					</cfloop>
				</cfif>
				
				<cfscript>	
					variables.VerificationPatientInsuranceSVC = application.beanFactory.getBean('old_VerificationPatientInsuranceService');		
					variables.objNewVPI = application.beanFactory.getBean("old_VerificationPatientInsurance");
					variables.VerificationPatientInsuranceElectronicSVC = application.beanFactory.getBean('old_VerificationPatientInsuranceElectronicService');		
					variables.objNewVPIE = application.beanFactory.getBean("old_VerificationPatientInsuranceElectronic");
					
					variables.objNewVPI.setusersID(variables.parentFileQuery.usersID);
					variables.objNewVPI.setpicID(variables.thisPicID);
					variables.objNewVPI.setVerificationRepFName('National');
					variables.objNewVPI.setVerificationRepLName('EDI');
					variables.objNewVPI.setVerificationDate(NOW());
					variables.objNewVPI.setVerificationTime(timeFormat(NOW(), 'hh') & ":" & timeFormat(NOW(), 'mm') & " " & timeFormat(NOW(), 'tt'));	
					variables.vpiID = variables.VerificationPatientInsuranceSVC.save(variables.objNewVPI);
					
					variables.objNewVPIE.setVpicID(variables.vpiID.getVerificationPatientInsuranceID());
					variables.objNewVPIE.setMashFileID(variables.mashXMLFileID);
					variables.objNewVPIE.setIndexInFile(pat);
					variables.vpieID = variables.VerificationPatientInsuranceElectronicSVC.save(variables.objNewVPIE);
				</cfscript>				
				
			</cfloop>						
			
			<cfreturn variables.mashXMLFileID>
			
		
			<cfcatch type="Any">				
				
				<cfmail from="support@eobmanager.net" to="support@eobmanager.net" type="html" subject="cfcatch InsuranceCompanyFileRetrievalMedicaid_Texas.cfc">							
					<cfdump var="#cfcatch#">
				</cfmail>	
				
				<cfreturn "Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">
										
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	

</cfcomponent>

	