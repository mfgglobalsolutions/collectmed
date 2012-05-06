
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
<cfparam name="attributes.fileDateTimeStamp" default="#DateFormat(NOW(), 'mmddyy')##TimeFormat(NOW(), 'hhmmss')#">
<cfset variables.fileDateTimeStamp = attributes.fileDateTimeStamp>

<cfset variables.pageUUID = CreateUUID()>

	
	
	
<cftry>	
		
	<!-------------------------------------------------------------------------------------->
	<!--- Get the basic information we need for this tag from the XML that is sent in.   --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.thisXML = XMLParse(form.verificatinPatientXML)>
	<cfset variables.verification = XMLSearch(variables.thisXML, "//VERIFICATION")>
	<cfset variables.clientID = variables.verification[1].CLIENTID.XMLText>
	<cfset variables.userID =  variables.verification[1].USERSID.XMLText>
	<cfset variables.insuranceCompanyID =  variables.verification[1].INSURANCECOMPANYID.XMLText>
	<cfset variables.Patients = XMLSearch(variables.thisXML, "//PATIENT")>
	
	<!---TX Medicaid--->
	<cfif variables.insuranceCompanyID EQ 44584>
		
		<cfset variables.isanumber = "1111#randRange(12457, 99999)#"><!---TODO need to come up with formula for this.--->		
		<!--- <cfset variables.user = "146153871"> AURAGATE FTP LOG--->
		<!--- <cfset variables.pass = "kgpqax6s"> AURAGATE FTP LOG --->		
		<cfset variables.user = "">
		<cfset variables.pass = "">
		<cfset variables.loginURL = "">
		<cfset variables.folder = "">
		<cfquery name="getThisIC" datasource="PAClient_#variables.clientID#">
			SELECT LoginInstructionsXML
			FROM InsuranceCompany
			WHERE InsuranceCompanyID = 44584
		</cfquery>
		<cfset variables.connectionDataXML = xmlParse(getThisIC.LoginInstructionsXML)>
		<cfset xmlData = xmlsearch(variables.connectionDataXML, "connection")>
		
		<cfif ListFindNoCase("ftp", trim(xmlData[1].type.xmlText))>
			<cfset variables.userD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(xmlData[1].username.xmlText)) />
			<cfset variables.passD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(xmlData[1].password.xmlText)) />
			<cfset variables.user = variables.userD>
			<cfset variables.pass = variables.passD>
			<cfset variables.loginURL = trim(xmlData[1].url.xmlText)>
			<cfset variables.folder = trim(xmlData[1].folder.xmlText)>
		</cfif>
						
		
		<cfif variables.clientID EQ 1084>			
			
			<!--- TODO Where will this number come from????  --->		
			<cfset variables.npi = 1578560587><!---TODO Physicians Home--->	
			
		</cfif>
		
	</cfif>


	<!------------------------------------------------------------------------------------------------->
	<!--- Crea the xml that will be sent to the EDI url via a webservice that will converted to X12 --->
	<!------------------------------------------------------------------------------------------------->
	<cfxml variable="variables.fileContents">
		<cfoutput>
			<data>
				<npi>#variables.npi#</npi>
				<isa13>#variables.isanumber#</isa13>
				<verifications>
					<cfloop from="1" to="#trim(ArrayLen(variables.Patients))#" index="pat">				
						<cfset patientid = variables.Patients[pat].PATIENTID.XMLText>
						<cfset variables.fName = variables.Patients[pat].FNAME.XMLText>
						<cfset variables.lName = variables.Patients[pat].LNAME.XMLText>	
						<cfset variables.id = variables.Patients[pat].POLICYNUMBER.XMLText>
						<cfset variables.dob = variables.Patients[pat].DOB.XMLText>
						<cfset variables.ssn = variables.Patients[pat].SSN.XMLText>					
						<cfset variables.VERIFYDATES = XMLSearch(variables.Patients[pat], "VERIFYDATES")>
						<cfset variables.fromDate = XMLSearch(variables.VERIFYDATES[1], "FROM")>
						<cfset variables.toDate = XMLSearch(variables.VERIFYDATES[1], "TO")>
						<cfset variables.datetimeperiod = "">
						<cfif IsDate(variables.fromDate[1].XMLText) and IsDate(variables.toDate[1].XMLText)>
							<cfset variables.datetimeperiod = DateFormat(variables.fromDate[1].XMLText, "YYYYMMDD") & "-" & DateFormat(variables.toDate[1].XMLText, "YYYYMMDD")>
						</cfif>								
					
						<cfoutput>											
							<patient>
								<cfif variables.patientid NEQ ""><patientid>#variables.patientid#</patientid><cfelse><patientid/></cfif>
								<cfif variables.fname NEQ ""><fname>#variables.fName#</fname><cfelse><fname/></cfif>
								<cfif variables.lname NEQ ""><lname>#variables.lName#</lname><cfelse><lname/></cfif>
								<cfif variables.id NEQ ""><id>#trim(variables.id)#</id><cfelse><id/></cfif>
								<cfif variables.dob NEQ ""><dob>#trim(variables.dob)#</dob><cfelse><dob/></cfif>
								<cfif variables.ssn NEQ ""><ssn>#trim(variables.ssn)#</ssn><cfelse><ssn/></cfif>					
								<cfif variables.datetimeperiod NEQ ""><datetimeperiod>#trim(variables.datetimeperiod)#</datetimeperiod><cfelse><datetimeperiod/></cfif>
								<sex/>
							</patient>							
						</cfoutput>				
					</cfloop>
				</verifications>
			</data>
		</cfoutput>
	</cfxml>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Save the XML created in a Verification XML File.                               --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.finalFileName = "#session.Client.getClientID()#3020110000001#trim(variables.fileDateTimeStamp)#.xml">
	<cffile action="write" file="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(variables.finalFileName)#" output="#variables.fileContents#" addnewline="no">	
	<cf_gcEOBFileUpload 
		fileType="301"
		clientID="#trim(session.ClientID)#" 	
		filePath="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(variables.finalFileName)#" 
		siteID="#request.Site.getSiteID()#"
		usersID="#trim(session.User.getUsersID())#"
		foldersToSkip="temp"
		movefile="true"
		SupportEmailAddressID="#request.Site.getSupportEmailAddressID()#">
	
	<cfset variables.xmlFileID = trim(newFileID)>
		
	<cfcatch type="Any">
		
		<cfset message = "There was an issue processing the verifications. You can try your verification again or contact an administraator and reference id: #variables.pageUUID#">

		<cf_gcSendEmail	from="support@eobmanager.net" to="support@eobmanager.net"
			subject="IMMEDIATE ATTENTION REQUIRED. User attempted to create a verification file. pageUUID: #variables.pageUUID#"
			message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p><p>issue happened with: #form.verificatinPatientXML#</p></p>">

		<cf_gcGeneralErrorTemplate
			message="#trim(message)#"
			width="75%">

		<cfabort>			
		
	</cfcatch> 
	
	
</cftry>







<!----------------------------------------------------------------------------------------------------------->
<!--- From this point forward the file is in the database we now have to work with them to get it passed. ---> 
<!----------------------------------------------------------------------------------------------------------->
<cftry>
	
	
	<!-------------------------------------------------------------------------------------->	
	<!--- Create the file that will be the parent to all files in this verification. 	 --->
	<!-------------------------------------------------------------------------------------->	
	<cfscript>	
		variables.objNewVerificationFile = application.beanFactory.getBean("old_VerificationFile");
		variables.objNewVerificationFile.setInsuranceCompanyID(trim(variables.insuranceCompanyID));
		variables.objNewVerificationFile.setUsersID(trim(session.user.getUsersID()));
		variables.objNewVerificationFile.setXmlFileID(trim(variables.xmlFileID));
		
		variables.VerificationFileSVC = application.beanFactory.getBean('old_VerificationFileService');		
		variables.VerificationFileSVC.save(variables.objNewVerificationFile);
	</cfscript>
	
		

	<!-------------------------------------------------------------------------------------->
	<!--- Get the X12                                                                    --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.webServicePath = "#trim(request.ediURL)#/TX/Medicaid/External_Edi.cfc?wsdl";
		variables.objEDI = createObject("webservice", variables.webServicePath); 
		variables.xmlResult = variables.objEDI.processToX12270(trim(variables.fileContents));          
		variables.xmlResultObject = XMLParse(variables.xmlResult); 
		variables.thisRequestXML = XMLParse(variables.xmlResultObject);
		variables.elemRequest270X12 = XMLSearch(variables.thisRequestXML, "//x12");
		if(isArray(variables.elemRequest270X12) AND ArrayLen(variables.elemRequest270X12) gte 1){
			variables.strRequest270X12 = variables.elemRequest270X12[1].xmltext;
		}
	</cfscript> 
	
	
	<cfif NOT IsDefined("variables.strRequest270X12")>
		<cfthrow type="Application" detail="[error calling processToX12270]"  message="There was an error produced while processing your file please contact an administrator.">
	</cfif>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Save the file to a temp directory.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.finalFileName = "#session.Client.getClientID()#3020110000002#trim(variables.fileDateTimeStamp)#.txt">
	<cffile action="write" file="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(variables.finalFileName)#" output="#variables.strRequest270X12#" addnewline="no">	
	<cf_gcEOBFileUpload 
		fileType="302"
		clientID="#trim(session.ClientID)#"
		checkFilefor="ST*270*"
		filePath="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(variables.finalFileName)#" 
		siteID="#request.Site.getSiteID()#"
		usersID="#trim(session.User.getUsersID())#"
		foldersToSkip="temp"
		movefile="true"
		parentFileID="#trim(variables.xmlFileID)#" 	
		SupportEmailAddressID="#request.Site.getSupportEmailAddressID()#">
		
	<cfset variables.txtFileID = trim(newFileID)>
		
	<!-------------------------------------------------------------------------------------->
	<!--- At this point we have                                                          --->
	<!--- 1) Created the XML that holds all the verifications.                           --->
	<!--- 2) Created the final XML file that will be saved for records.                  --->
	<!--- 3) converted the XMl to X12.                                                   --->
	<!--- 4) saved the X12 for records.                                                  --->
	<!--- So now we have to send the final X12 270 to the EDI processor for processing.  --->
	<!-------------------------------------------------------------------------------------->
	<cfif returnCode EQ 1>
		
		<cfscript>		
			variables.msg = "Your file was uploaded successfully. It will be processed and you will be notified upon completion.";			
			if (trim(FileWasRenamed) EQ "Yes"){
				variables.msg = variables.msg + "<br>It was renamed (#trim(ServerFile)#) because it already existed.";	
			}				
			variables.sendFileName = "#session.Client.getClientID()#302011#NumberFormat(newfileID, '0000000')##trim(variables.fileDateTimeStamp)#.txt";		
			variables.webServicePath = "#trim(request.ediURL)#/TX/Medicaid/External_Edi.cfc?wsdl";
			variables.objEDI = createObject("webservice", variables.webServicePath); 
			variables.Result = variables.objEDI.putFileX12270(session.Client.getClientID(), trim(newfileID), trim(variables.strRequest270X12), trim(variables.user), trim(variables.pass), trim(variables.sendFileName), trim(variables.loginURL), trim(variables.folder));    		
		</cfscript> 
		
		<cfif NOT variables.Result>
	
			<cfthrow type="Application" detail="[error calling putFileX12270]"  message="There was an error produced while processing your file please contact an administrator. file Upload message: #returnCode# - fileContentsByFileID: #variables.txtFileID#">
					
		</cfif>	
		
							
	<cfelse>
	
		<cfthrow type="Application" detail="[error saving .txt file]"  message="There was an error produced while processing your file please contact an administrator. file Upload message: #returnCode#">
				
	</cfif>	
		
	<cfoutput>	
		<table cellspacing="4" cellpadding="2" border="0" align="center">	
			<tr>		   
				<td align="left" valign="top">				
					<table cellspacing="0" cellpadding="10" border="0">
						<tr>
							<td>
								<cf_gcBorderedTable	title="Verification File Created" tableWidth="100%">	
									<div style="padding:10px;">File ID:#newfileID# <br>#variables.msg#</div>							
								</cf_gcBorderedTable>	
							</td>
						</tr>						
					</table>				
				</td>
			</tr>			
		</table>	
	</cfoutput>


	<cfcatch type="Any">
		
		<cfset message = "There was an issue processing the verifications. Please contact an administraator and reference id: #variables.pageUUID#">

		<cf_gcSendEmail	from="support@eobmanager.net" to="support@eobmanager.net"
			subject="IMMEDIATE ATTENTION REQUIRED. User attempted to create a verification file. pageUUID: #variables.pageUUID#"
			message="<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p><p>User tried creating a verification xml file in database (ID: #variables.xmlFileID#)</p></p>">

		<cf_gcGeneralErrorTemplate
			message="#trim(message)#"
			width="75%">

		<cfabort>			
		
	</cfcatch> 
	
	
</cftry>


