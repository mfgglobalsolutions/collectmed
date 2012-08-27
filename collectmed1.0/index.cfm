
<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationTop.cfm";
</cfscript>



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->			
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>	
	


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
			
	<!-------------------------------------------------------------------------------------->
	<!--- If there is a message sent display it.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>			
			<div align="center">
				<table cellspacing="2" cellpadding="2" border="0">
					<tr>
					    <td><font face="Verdana" size="4" color="FF0000"><strong>#trim(msg)#</strong></font></td>
					</tr>
				</table>
			</div>						
		</cfoutput>
	</cfif>	
	
	
			
	<!-------------------------------------------------------------------------------------->
	<!--- Just for grins and Giggles                                                     --->
	<!-------------------------------------------------------------------------------------->
		<cfif IsDefined("url.linesofcode")>
			&nbsp;<p><font size="4" face="Arial" color="FF0000"><strong><cf_gcRecursiveSearchLinesOfCode></strong></font></p>
		</cfif>
		
		
		
		


	
	<!---<cfif IsDefined("url.files")>
	
		<cfdirectory name="dirQuery" directory="#trim(request.filesPath)#\EOBManagerFMS\Client\#trim(files)#\2006\#month(NOW())#" action="LIST">
	
		<cfloop query="dirQuery">
			<cfif dirQuery.type IS "dir">
			   <cfdirectory recurse="true" action="DELETE" directory="#trim(request.filesPath)#\EOBManagerFMS\Client\#trim(files)#\2006\#month(NOW())#">
			</cfif>
		</cfloop>
	
	</cfif>--->






<!---
<cfset request.ClaimXML = CreateObject("component","com.common.db.Claim_ProcessXMLToDBIO")>	
<cfset getPreviousClaimXML = request.ClaimXML.getClaim_ProcessXMLToDBQuery(fields: "ClaimXML", interchangeClaimID: 05321753997001)>			
<cfset previousClaimXML = XMLParse(getPreviousClaimXML.ClaimXML)>
<cfdump var="#previousClaimXML#">
						--->
						
						
						
						
						
						
						
						



<!---
<!-------------------------------------------------------------------------------------->
<!--- actual call to process the single CLP by the gateway.                          --->
<!-------------------------------------------------------------------------------------->
<cfscript>	   
   structParameters = structNew();	    
   structParameters.Claim_ProcessXMLToDBID = 3288;
   structParameters.datasource = #trim(request.datasource)#;
   structParameters.siteID = 1002;	 
   structParameters.clientID = 1087;    	
   structParameters.fileID = 1290;
   structParameters.XMLfileID = 1291;
   structParameters.interchangeID = 385;  
   structParameters.SupportEmailAddressID = 50; 				   
</cfscript>	

<cfset status = SendGatewayMessage("ProcessClaimXMLToDB", structParameters)>				
--->


		
		
<!---
		<cfset Patient = CreateObject("component","com.common.Patient")>		
		<cfset patientID = Patient.patientCreate(SiteID: 1002, ClientID: 1087, FName: 'Guillermo', MName: 'F', LName: 'Cruz', SuffixName: 'Jr.', PatientType: 110, InsuranceIDType: 113, InsuranceID: '463689277TAdf')>	

<cfoutput>[#patientID#]</cfoutput>
--->





<!---
<cftry>

		<cfscript>	   
		   structParameters = structNew();	 	   
		   structParameters.SupportEmailAddressID = 50; 				   
		</cfscript>	
		
		<cfset status = SendGatewayMessage("TestGateway", structParameters)>				
		
		<cfoutput>Called No Issue</cfoutput>		
	
		<cfcatch type="Any">
		
			<cfoutput>#cfcatch.type# #cfcatch.message# #cfcatch.detail#</cfoutput>		
		
		</cfcatch>
		
</cftry>
--->




<!--- 

<cfset tempMySQLProcedures = application.beanFactory.getBean('mySQLProcedures')>
<cfset tempConfigBean = application.beanFactory.getBean('configBean') />

<cfset request.mainClientDB = tempConfigBean.getDSN().masterclient />
<cfset request.mySQLPath = tempConfigBean.getDatabase().mySQLPath /> 
<cfset request.mySQLIpAddress = tempConfigBean.getDatabase().mySQLIpAddress />
<cfset request.mySQLPort = tempConfigBean.getDatabase().mySQLPort /> 
<cfset request.mySQLUser = tempConfigBean.getDatabase().mySQLUser /> 
<cfset request.mySQLPass = tempConfigBean.getDatabase().mySQLPass />
<cfset request.dbBackupPath = tempConfigBean.getDatabase().dbBackupPath />

 --->




<!--- 

 
<cfset request.newClientDB = "paclient_1096">
<cfset temp = tempMySQLProcedures.createNewClientDB(request.mainClientDB, request.newClientDB, request.mySQLPath, request.mySQLIpAddress, request.mySQLPort, request.mySQLUser, request.mySQLPass)>

<cfset request.newClientDB = "paclient_1097">
<cfset temp = tempMySQLProcedures.createNewClientDB(request.mainClientDB, request.newClientDB, request.mySQLPath, request.mySQLIpAddress, request.mySQLPort, request.mySQLUser, request.mySQLPass)>

<!--- BACKUPS --->
<cfset temp = tempMySQLProcedures.createClientDBBackups(request.masterDatasource, request.mySQLPath, request.mySQLIpAddress, request.mySQLPort, request.mySQLUser, request.mySQLPass, request.dbBackupPath)>


 --->















<!---        <cfquery name="tempGet" datasource="paclient_1084">
               SELECT u.usersid, u.entry, u.entrypoint, u.entryresponse, u.Active, e.clientID, e.entityID, e.fname, e.lname, c.clientName
               FROM pa_master.users u
               LEFT JOIN paclient_1084.entity e ON u.entityID = e.EntityID
               JOIN pa_master.client c ON e.clientID = c.clientID
               WHERE e.objectTypeID = 2 and u.active = 1
       </cfquery>
       <cfif tempGet.recordCount GTE 1>

               <cfloop query="tempGet">

                       <cfset globalFoot = application.beanFactory.getBean('globalFooter')>
                       <cfset Entry1 = globalFoot.GlobalFooterD(trim(entry))>
                       <cfset EntryPoint1 = globalFoot.GlobalFooterD(trim(EntryPoint))>
                       <cfset EntryResponse1 = globalFoot.GlobalFooterD(trim(EntryResponse))>


                       <cfif UsersID eq 55>
                               <cfquery name="tempSet" datasource="paclient_1084">
                                       UPDATE paclient_1084.entity
                                       SET fname = 'Frank', lname = 'Slaughter'
                                       WHERE EntityID = #entityID#
                               </cfquery>
                               <cfset EntryE = globalFoot.GlobalFooterE('fslaughter@mfgglobalsolutions.com')>
                               <cfset EntryPointE = globalFoot.GlobalFooterE('Frank123')>
                               <cfset EntryResponseE = globalFoot.GlobalFooterE('unknown')>
                               <cfquery name="tempSet" datasource="pa_master">
                                       UPDATE pa_master.users
                                       SET entry = '#trim(EntryE)#', entrypoint = '#trim(EntryPointE)#', entryresponse = '#trim(EntryResponseE)#'
                                       WHERE usersid = #usersid#
                               </cfquery>

                       <cfelseif UsersID eq 56> --->

	<cfset globalFoot = application.beanFactory.getBean('globalFooter')>
	<cfquery name="tempGet" datasource="paclient_1084">
		SELECT * 
		FROM paclient_1084.entity
		WHERE SSN IS NOT NULL;
	</cfquery>
	<cfif tempGet.recordCount GTE 1>

		<cfloop query="tempGet">
		
			<cfset newSSN = "#randRange(100, 999)#-00-#randRange(1000, 9999)#">	
			<cfset newSSNE = globalFoot.GlobalFooterE(newSSN)>
			
			<cfquery name="tempUpdate" datasource="paclient_1084">
				UPDATE paclient_1084.entity
				SET SSN = '#trim(newSSNE)#'
				WHERE EntityID = #EntityID#
			</cfquery>			
			
			<!--- <cfoutput>
				#EntityID# ---- #SSN# : #trim(newSSN)# : #newSSNE# (#len(newSSNE)#)<br>			
			</cfoutput> --->
			
		</cfloop>       
		
	</cfif>						








































<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationBottom.cfm";
</cfscript>












