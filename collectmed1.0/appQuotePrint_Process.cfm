<!---- appQuotePrint_Process.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileDateTimeStamp" default="#DateFormat(NOW(), 'mmddyy')##TimeFormat(NOW(), 'hhmmss')#">
	<cfset fileDateTimeStamp = attributes.fileDateTimeStamp>
	
	<cfparam name="attributes.quoteID" default="">
	<cfset quoteID = attributes.quoteID>
	
	<cfif IsDefined("form.quoteID") AND form.quoteID NEQ "">
		<cfset quoteID = form.quoteID>
	<cfelseif IsDefined("url.quoteID") AND url.quoteID NEQ "">
		<cfset quoteID = url.quoteID>	
	</cfif>
	
	<cfparam name="attributes.formName" default="printQuoteForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="Submitted" default="no">
	
	<cfparam name="attributes.listOfFiles" default="">
	<cfset listOfFiles = attributes.listOfFiles>
	
	<cfparam name="attributes.faxCoverSheet" default="no">
	<cfset faxCoverSheet = attributes.faxCoverSheet>
	
	<cfparam name="attributes.ClientID" default="">
	<cfset ClientID = attributes.ClientID>
	
	<cfparam name="attributes.clientAddressAddressLine1" default="">
	<cfset clientAddressAddressLine1 = attributes.clientAddressAddressLine1>
	
	<cfparam name="attributes.clientAddressAddressLine2" default="">
	<cfset clientAddressAddressLine2 = attributes.clientAddressAddressLine2>
	
	<cfparam name="attributes.clientAddressCity" default="">
	<cfset clientAddressCity = attributes.clientAddressCity>
	
	<cfparam name="attributes.clientAddressStateFull" default="">
	<cfset clientAddressStateFull = attributes.clientAddressStateFull>
	
	<cfparam name="attributes.clientAddressZipCode" default="">
	<cfset clientAddressZipCode = attributes.clientAddressZipCode>
	
	<cfparam name="attributes.defaultPhone" default="">
	<cfset defaultPhone = attributes.defaultPhone>
	
	<cfparam name="attributes.faxPhone" default="">
	<cfset faxPhone = attributes.faxPhone>
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="quoteID"
		fieldnames="Quote ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the quote object.                                                       --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Quote = application.beanFactory.getBean("Quote") />
	<cfset request.Quote.initQuoteIO(trim(quoteID))>	
	
	<cfquery name="getQuoteHCPCID" datasource="#request.datasource#">
		SELECT QuoteHCPCID
		FROM quotehcpc
		WHERE QuoteID = #trim(quoteID)#
	</cfquery>
	
	<cfquery name="request.QuoteHCPC" datasource="#request.datasource#">
		SELECT *
		FROM quotehcpc
		WHERE QuoteHCPCID = #trim(getQuoteHCPCID.quoteHCPCID)#
	</cfquery>

		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the address object to work with addresses with.                         --->
<!-------------------------------------------------------------------------------------->
	<cfset request.EntityObj = application.beanFactory.getBean("Entity") />
	<cfset clientAddress = request.EntityObj.getEntityDefaultFullAddress(clientID: trim(session.clientID), EntityID: session.Client.getEntityID(), Active: 1)>					
		
	<cfset defaultPhone = request.EntityObj.getEntityDefaultPhoneFull(clientID: trim(session.clientID), entityID: trim(session.Client.getEntityID()))>
	<cfset faxPhone = request.EntityObj.getEntityFaxPhoneFull(clientID: trim(session.clientID), entityID: trim(session.Client.getEntityID()))>
		
	<cfif IsDefined("form.faxSheet") AND form.faxSheet>					
		
		<cfset faxCoverSheet = "yes">
		
		<cfsavecontent variable="CoverSheetPrintVariable">	
			
			<cfoutput>
			
				<style>	
			
					table.EOBList {
						border-collapse: collapse;
						font: x-small verdana, helvetica, sans-serif;
						margin: 10px;
					}
					table.EOBList caption {
						background-color: ##DCE3EB;
						color: ##003399;
						font-weight: bold;
						padding: 3px 10px 3px 10px;				
					}
					table.EOBList td {
						border: 0px solid ##DCE3EB;
						font-size: 95%;
						padding: 5px 5px 1px 5px;				
						/*vertical-align: top;	*/			
					}
					table.EOBList th {
						border: 0px solid ##DCE3EB;
						color: ##606060;
						font-weight: normal;
						padding: 2px 10px 1px 5px;				
					}					
					.EOBquoteTableBody TABLE{
					    font-size: 1em; 
					}
					.EOBquoteTableBody A:link, .EOBquoteTableBody A:visited{
					    color:##003399;
					    text-decoration:underline; 
					}
					.EOBquoteTableBody A:hover{
					    color:red;
					    text-decoration:none; 
					}
					.EOBquoteTableBody th{
					    font-weight:bold; 
					}
					.EOBquoteTableBody td {
					    font-size: 8pt; 
					    font-family: verdana, arial, helvetica, sans-serif; 
					}					
				</style>
		
			
				<span class="EOBquoteTableBody">							
						
					<!-------------------------------------------------------------------------------------->
					<!--- Start the Cover page code.                                                     --->
					<!-------------------------------------------------------------------------------------->						
					<table width="700" cellspacing="2" cellpadding="2" border="0">
						
						<tr>
						    <td>
								<img src=file:///#trim(request.fmsPath)#/images/logo_#trim(session.ClientID)#.gif border="0" alt="">								
							</td>
							<td class="siteLabel" align="right" valign="top">
								#trim(clientAddress.AddressLine1)#
								<cfif trim(clientAddress.AddressLine2) NEQ ""><br>#trim(clientAddress.AddressLine2)#</cfif>
								<br>#trim(clientAddress.City)#, #trim(clientAddress.StateFull)# #trim(clientAddress.ZipCode)#
								<cfif trim(defaultPhone) NEQ ""><br>Office: #request.formatPhoneUS(defaultPhone)#</cfif>
								<cfif trim(faxPhone) NEQ ""><br>Fax: #request.formatPhoneUS(faxPhone)#</cfif>									
							</td>
						</tr>
						
						<!---<tr>
						    <td class="siteLabel" valign="top">									
								<strong>
									#trim(clientAddress.AddressLine1)#
									<cfif trim(clientAddress.AddressLine2) NEQ ""><br>#trim(clientAddress.AddressLine2)#</cfif>
									<br>#trim(clientAddress.City)#, #trim(clientAddress.StateFull)# #trim(clientAddress.ZipCode)#
									<br>Office: #request.formatPhoneUS(defaultPhone)#
									<br>Fax: #request.formatPhoneUS(faxPhone)#
								</strong>									
							</td>
							<td class="siteLabel" valign="top" align="right">
								<font face="Arial Black" size="3" color="000000">
									#trim(session.Client.getClientName())#&nbsp;
								</font>
							</td>							
						</tr>--->
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr>
						    <td valign="top" colspan="2">
								<font face="Arial Black" size="8" color="000000">
									Fax
								</font>
							</td>
						</tr>
						<tr>
						    <td valign="top">
								<strong>To:</strong> #trim(form.Attention)#
							</td>
							<td align="right">
								<strong>From:</strong> #trim(form.from)#
							</td>
						</tr>
						<tr>
						    <td valign="top">
								<strong>Company:</strong> #trim(form.toCompanyName)#
							</td>
							<td align="right">
								<strong>Pages:</strong> #trim(form.Pages)#
							</td>
						</tr>
						<tr>
						    <td valign="top">
								<strong>Fax:</strong> #trim(form.faxNumber)#
							</td>								
							<td align="right">
								<strong>Date:</strong> #DateFormat(NOW(), 'mm/dd/yyyy')#
							</td>
						</tr>
						<tr>
						    <td valign="top">
								<strong>Phone:</strong> #trim(form.phoneNumber)#
							</td>								
							<td align="right">&nbsp;</td>
						</tr>
						<tr>							   
							<td valign="top">
								<strong>Re:</strong> #trim(form.regarding)#<!---#request.Quote.getPatientFNameTBox()#&nbsp;#request.Quote.getPatientLNameTBox()#--->
							</td>
							<td align="right">&nbsp;</td>
						</tr>
						<td colspan="2">
							<span width="100%" class="EOBclaimTableBody">
								<hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
							</span>
						</td>
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr>
						    <td colspan="2" align="center">
								<table width="600" cellspacing="2" cellpadding="2" border="0">
									<tr>
										<td><strong>NOTE:</strong> #trim(form.faxNote)#</td>
									</tr>
								</table>													
							</td>							
						</tr>
					</table>						
					
				</span>	
												
			</cfoutput>
		
		</cfsavecontent>
		
	</cfif>	
	
		
		
		
		
		
		
	<cf_tagQuotePrint
		faxCoverSheet="#trim(faxCoverSheet)#"
		ClientID="#trim(session.ClientID)#"
		clientAddressAddressLine1="#trim(clientAddress.AddressLine1)#"
		clientAddressAddressLine2="#trim(clientAddress.AddressLine2)#"
		clientAddressCity="#trim(clientAddress.City)#"
		clientAddressStateFull="#trim(clientAddress.StateFull)#"
		clientAddressZipCode="#trim(clientAddress.ZipCode)#"
		defaultPhone="#request.formatPhoneUS(defaultPhone)#"
		faxPhone="#request.formatPhoneUS(faxPhone)#"					
		QuoteID="#request.Quote.getQuoteID()#"			
		PatientFNameTBox="#request.CapitalizeFirstLetter(request.Quote.getPatientFNameTBox())#"
		PatientLNameTBox="#request.CapitalizeFirstLetter(request.Quote.getPatientLNameTBox())#"
		PatientPhoneTBox="#request.formatPhoneUS(request.Quote.getPatientPhoneTBox())#"		
		patientDOBMM="#request.Quote.getpatientDOBMM()#"
		patientDOBDD="#request.Quote.getpatientDOBDD()#"
		patientDOBYY="#request.Quote.getpatientDOBYY()#"
		hcpcCode1TBox="#request.QuoteHCPC.hcpcCode1TBox#"
		hcpcQty1TBox="#request.QuoteHCPC.hcpcQty1TBox#"
		hcpcProduct1TBox="#request.QuoteHCPC.hcpcProduct1TBox#"
		hcpcCost1TBox="#request.QuoteHCPC.hcpcCost1TBox#"
		hcpcDX1TBox="#request.QuoteHCPC.hcpcDX1TBox#"
		hcpcDiagnosis1TBox="#request.QuoteHCPC.hcpcDiagnosis1TBox#"
		hcpcLengthOfNeedYear1TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear1TBox#"
		hcpcLengthOfNeedMonth1TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth1TBox#"
		hcpcCode2TBox="#request.QuoteHCPC.hcpcCode2TBox#"
		hcpcQty2TBox="#request.QuoteHCPC.hcpcQty2TBox#"
		hcpcProduct2TBox="#request.QuoteHCPC.hcpcProduct2TBox#"
		hcpcCost2TBox="#request.QuoteHCPC.hcpcCost2TBox#"
		hcpcDX2TBox="#request.QuoteHCPC.hcpcDX2TBox#"
		hcpcDiagnosis2TBox="#request.QuoteHCPC.hcpcDiagnosis2TBox#"
		hcpcLengthOfNeedYear2TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear2TBox#"
		hcpcLengthOfNeedMonth2TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth2TBox#"
		hcpcCode3TBox="#request.QuoteHCPC.hcpcCode3TBox#"
		hcpcQty3TBox="#request.QuoteHCPC.hcpcQty3TBox#"
		hcpcProduct3TBox="#request.QuoteHCPC.hcpcProduct3TBox#"
		hcpcCost3TBox="#request.QuoteHCPC.hcpcCost3TBox#"
		hcpcDX3TBox="#request.QuoteHCPC.hcpcDX3TBox#"
		hcpcDiagnosis3TBox="#request.QuoteHCPC.hcpcDiagnosis3TBox#"
		hcpcLengthOfNeedYear3TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear3TBox#"
		hcpcLengthOfNeedMonth3TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth3TBox#"
		hcpcCode4TBox="#request.QuoteHCPC.hcpcCode4TBox#"
		hcpcQty4TBox="#request.QuoteHCPC.hcpcQty4TBox#"
		hcpcProduct4TBox="#request.QuoteHCPC.hcpcProduct4TBox#"
		hcpcCost4TBox="#request.QuoteHCPC.hcpcCost4TBox#"
		hcpcDX4TBox="#request.QuoteHCPC.hcpcDX4TBox#"
		hcpcDiagnosis4TBox="#request.QuoteHCPC.hcpcDiagnosis4TBox#"
		hcpcLengthOfNeedYear4TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear4TBox#"
		hcpcLengthOfNeedMonth4TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth4TBox#"
		hcpcCode5TBox="#request.QuoteHCPC.hcpcCode5TBox#"
		hcpcQty5TBox="#request.QuoteHCPC.hcpcQty5TBox#"
		hcpcProduct5TBox="#request.QuoteHCPC.hcpcProduct5TBox#"
		hcpcCost5TBox="#request.QuoteHCPC.hcpcCost5TBox#"
		hcpcDX5TBox="#request.QuoteHCPC.hcpcDX5TBox#"
		hcpcDiagnosis5TBox="#request.QuoteHCPC.hcpcDiagnosis5TBox#"
		hcpcLengthOfNeedYear5TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear5TBox#"
		hcpcLengthOfNeedMonth5TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth5TBox#"
		hcpcCode6TBox="#request.QuoteHCPC.hcpcCode6TBox#"
		hcpcQty6TBox="#request.QuoteHCPC.hcpcQty6TBox#"
		hcpcProduct6TBox="#request.QuoteHCPC.hcpcProduct6TBox#"
		hcpcCost6TBox="#request.QuoteHCPC.hcpcCost6TBox#"
		hcpcDX6TBox="#request.QuoteHCPC.hcpcDX6TBox#"
		hcpcDiagnosis6TBox="#request.QuoteHCPC.hcpcDiagnosis6TBox#"
		hcpcLengthOfNeedYear6TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear6TBox#"
		hcpcLengthOfNeedMonth6TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth6TBox#"
		hcpcCode7TBox="#request.QuoteHCPC.hcpcCode7TBox#"
		hcpcQty7TBox="#request.QuoteHCPC.hcpcQty7TBox#"
		hcpcProduct7TBox="#request.QuoteHCPC.hcpcProduct7TBox#"
		hcpcCost7TBox="#request.QuoteHCPC.hcpcCost7TBox#"
		hcpcDX7TBox="#request.QuoteHCPC.hcpcDX7TBox#"
		hcpcDiagnosis7TBox="#request.QuoteHCPC.hcpcDiagnosis7TBox#"
		hcpcLengthOfNeedYear7TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear7TBox#"
		hcpcLengthOfNeedMonth7TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth7TBox#"
		hcpcCode8TBox="#request.QuoteHCPC.hcpcCode8TBox#"
		hcpcQty8TBox="#request.QuoteHCPC.hcpcQty8TBox#"
		hcpcProduct8TBox="#request.QuoteHCPC.hcpcProduct8TBox#"
		hcpcCost8TBox="#request.QuoteHCPC.hcpcCost8TBox#"
		hcpcDX8TBox="#request.QuoteHCPC.hcpcDX8TBox#"
		hcpcDiagnosis8TBox="#request.QuoteHCPC.hcpcDiagnosis8TBox#"
		hcpcLengthOfNeedYear8TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear8TBox#"
		hcpcLengthOfNeedMonth8TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth8TBox#"
		hcpcCode9TBox="#request.QuoteHCPC.hcpcCode9TBox#"
		hcpcQty9TBox="#request.QuoteHCPC.hcpcQty9TBox#"
		hcpcProduct9TBox="#request.QuoteHCPC.hcpcProduct9TBox#"
		hcpcCost9TBox="#request.QuoteHCPC.hcpcCost9TBox#"
		hcpcDX9TBox="#request.QuoteHCPC.hcpcDX9TBox#"
		hcpcDiagnosis9TBox="#request.QuoteHCPC.hcpcDiagnosis9TBox#"
		hcpcLengthOfNeedYear9TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear9TBox#"
		hcpcLengthOfNeedMonth9TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth9TBox#"
		hcpcCode10TBox="#request.QuoteHCPC.hcpcCode10TBox#"
		hcpcQty10TBox="#request.QuoteHCPC.hcpcQty10TBox#"
		hcpcProduct10TBox="#request.QuoteHCPC.hcpcProduct10TBox#"
		hcpcCost10TBox="#request.QuoteHCPC.hcpcCost10TBox#"
		hcpcDX10TBox="#request.QuoteHCPC.hcpcDX10TBox#"
		hcpcDiagnosis10TBox="#request.QuoteHCPC.hcpcDiagnosis10TBox#"
		hcpcLengthOfNeedYear10TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear10TBox#"
		hcpcLengthOfNeedMonth10TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth10TBox#"
		hcpcCode11TBox="#request.QuoteHCPC.hcpcCode11TBox#"
		hcpcQty11TBox="#request.QuoteHCPC.hcpcQty11TBox#"
		hcpcProduct11TBox="#request.QuoteHCPC.hcpcProduct11TBox#"
		hcpcCost11TBox="#request.QuoteHCPC.hcpcCost11TBox#"
		hcpcDX11TBox="#request.QuoteHCPC.hcpcDX11TBox#"
		hcpcDiagnosis11TBox="#request.QuoteHCPC.hcpcDiagnosis11TBox#"
		hcpcLengthOfNeedYear11TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear11TBox#"
		hcpcLengthOfNeedMonth11TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth11TBox#"
		hcpcCode12TBox="#request.QuoteHCPC.hcpcCode12TBox#"
		hcpcQty12TBox="#request.QuoteHCPC.hcpcQty12TBox#"
		hcpcProduct12TBox="#request.QuoteHCPC.hcpcProduct12TBox#"
		hcpcCost12TBox="#request.QuoteHCPC.hcpcCost12TBox#"
		hcpcDX12TBox="#request.QuoteHCPC.hcpcDX12TBox#"
		hcpcDiagnosis12TBox="#request.QuoteHCPC.hcpcDiagnosis12TBox#"
		hcpcLengthOfNeedYear12TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear12TBox#"
		hcpcLengthOfNeedMonth12TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth12TBox#"
		hcpcCode13TBox="#request.QuoteHCPC.hcpcCode13TBox#"
		hcpcQty13TBox="#request.QuoteHCPC.hcpcQty13TBox#"
		hcpcProduct13TBox="#request.QuoteHCPC.hcpcProduct13TBox#"
		hcpcCost13TBox="#request.QuoteHCPC.hcpcCost13TBox#"
		hcpcDX13TBox="#request.QuoteHCPC.hcpcDX13TBox#"
		hcpcDiagnosis13TBox="#request.QuoteHCPC.hcpcDiagnosis13TBox#"
		hcpcLengthOfNeedYear13TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear13TBox#"
		hcpcLengthOfNeedMonth13TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth13TBox#"
		hcpcCode14TBox="#request.QuoteHCPC.hcpcCode14TBox#"
		hcpcQty14TBox="#request.QuoteHCPC.hcpcQty14TBox#"
		hcpcProduct14TBox="#request.QuoteHCPC.hcpcProduct14TBox#"
		hcpcCost14TBox="#request.QuoteHCPC.hcpcCost14TBox#"
		hcpcDX14TBox="#request.QuoteHCPC.hcpcDX14TBox#"
		hcpcDiagnosis14TBox="#request.QuoteHCPC.hcpcDiagnosis14TBox#"
		hcpcLengthOfNeedYear14TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear14TBox#"
		hcpcLengthOfNeedMonth14TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth14TBox#"
		hcpcCode15TBox="#request.QuoteHCPC.hcpcCode15TBox#"
		hcpcQty15TBox="#request.QuoteHCPC.hcpcQty15TBox#"
		hcpcProduct15TBox="#request.QuoteHCPC.hcpcProduct15TBox#"
		hcpcCost15TBox="#request.QuoteHCPC.hcpcCost15TBox#"
		hcpcDX15TBox="#request.QuoteHCPC.hcpcDX15TBox#"
		hcpcDiagnosis15TBox="#request.QuoteHCPC.hcpcDiagnosis15TBox#"
		hcpcLengthOfNeedYear15TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear15TBox#"
		hcpcLengthOfNeedMonth15TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth15TBox#"
		hcpcCode16TBox="#request.QuoteHCPC.hcpcCode16TBox#"
		hcpcQty16TBox="#request.QuoteHCPC.hcpcQty16TBox#"
		hcpcProduct16TBox="#request.QuoteHCPC.hcpcProduct16TBox#"
		hcpcCost16TBox="#request.QuoteHCPC.hcpcCost16TBox#"
		hcpcDX16TBox="#request.QuoteHCPC.hcpcDX16TBox#"
		hcpcDiagnosis16TBox="#request.QuoteHCPC.hcpcDiagnosis16TBox#"
		hcpcLengthOfNeedYear16TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear16TBox#"
		hcpcLengthOfNeedMonth16TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth16TBox#"
		hcpcCode17TBox="#request.QuoteHCPC.hcpcCode17TBox#"
		hcpcQty17TBox="#request.QuoteHCPC.hcpcQty17TBox#"
		hcpcProduct17TBox="#request.QuoteHCPC.hcpcProduct17TBox#"
		hcpcCost17TBox="#request.QuoteHCPC.hcpcCost17TBox#"
		hcpcDX17TBox="#request.QuoteHCPC.hcpcDX17TBox#"
		hcpcDiagnosis17TBox="#request.QuoteHCPC.hcpcDiagnosis17TBox#"
		hcpcLengthOfNeedYear17TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear17TBox#"
		hcpcLengthOfNeedMonth17TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth17TBox#"
		hcpcCode18TBox="#request.QuoteHCPC.hcpcCode18TBox#"
		hcpcQty18TBox="#request.QuoteHCPC.hcpcQty18TBox#"
		hcpcProduct18TBox="#request.QuoteHCPC.hcpcProduct18TBox#"
		hcpcCost18TBox="#request.QuoteHCPC.hcpcCost18TBox#"
		hcpcDX18TBox="#request.QuoteHCPC.hcpcDX18TBox#"
		hcpcDiagnosis18TBox="#request.QuoteHCPC.hcpcDiagnosis18TBox#"
		hcpcLengthOfNeedYear18TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear18TBox#"
		hcpcLengthOfNeedMonth18TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth18TBox#"
		hcpcCode19TBox="#request.QuoteHCPC.hcpcCode19TBox#"
		hcpcQty19TBox="#request.QuoteHCPC.hcpcQty19TBox#"
		hcpcProduct19TBox="#request.QuoteHCPC.hcpcProduct19TBox#"
		hcpcCost19TBox="#request.QuoteHCPC.hcpcCost19TBox#"
		hcpcDX19TBox="#request.QuoteHCPC.hcpcDX19TBox#"
		hcpcDiagnosis19TBox="#request.QuoteHCPC.hcpcDiagnosis19TBox#"
		hcpcLengthOfNeedYear19TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear19TBox#"
		hcpcLengthOfNeedMonth19TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth19TBox#"
		hcpcCode20TBox="#request.QuoteHCPC.hcpcCode20TBox#"
		hcpcQty20TBox="#request.QuoteHCPC.hcpcQty20TBox#"
		hcpcProduct20TBox="#request.QuoteHCPC.hcpcProduct20TBox#"
		hcpcCost20TBox="#request.QuoteHCPC.hcpcCost20TBox#"
		hcpcDX20TBox="#request.QuoteHCPC.hcpcDX20TBox#"
		hcpcDiagnosis20TBox="#request.QuoteHCPC.hcpcDiagnosis20TBox#"
		hcpcLengthOfNeedYear20TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear20TBox#"
		hcpcLengthOfNeedMonth20TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth20TBox#"
		hcpcCode21TBox="#request.QuoteHCPC.hcpcCode21TBox#"
		hcpcQty21TBox="#request.QuoteHCPC.hcpcQty21TBox#"
		hcpcProduct21TBox="#request.QuoteHCPC.hcpcProduct21TBox#"
		hcpcCost21TBox="#request.QuoteHCPC.hcpcCost21TBox#"
		hcpcDX21TBox="#request.QuoteHCPC.hcpcDX21TBox#"
		hcpcDiagnosis21TBox="#request.QuoteHCPC.hcpcDiagnosis21TBox#"
		hcpcLengthOfNeedYear21TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear21TBox#"
		hcpcLengthOfNeedMonth21TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth21TBox#"
		hcpcCode22TBox="#request.QuoteHCPC.hcpcCode22TBox#"
		hcpcQty22TBox="#request.QuoteHCPC.hcpcQty22TBox#"
		hcpcProduct22TBox="#request.QuoteHCPC.hcpcProduct22TBox#"
		hcpcCost22TBox="#request.QuoteHCPC.hcpcCost22TBox#"
		hcpcDX22TBox="#request.QuoteHCPC.hcpcDX22TBox#"
		hcpcDiagnosis22TBox="#request.QuoteHCPC.hcpcDiagnosis22TBox#"
		hcpcLengthOfNeedYear22TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear22TBox#"
		hcpcLengthOfNeedMonth22TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth22TBox#"
		hcpcCode23TBox="#request.QuoteHCPC.hcpcCode23TBox#"
		hcpcQty23TBox="#request.QuoteHCPC.hcpcQty23TBox#"
		hcpcProduct23TBox="#request.QuoteHCPC.hcpcProduct23TBox#"
		hcpcCost23TBox="#request.QuoteHCPC.hcpcCost23TBox#"
		hcpcDX23TBox="#request.QuoteHCPC.hcpcDX23TBox#"
		hcpcDiagnosis23TBox="#request.QuoteHCPC.hcpcDiagnosis23TBox#"
		hcpcLengthOfNeedYear23TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear23TBox#"
		hcpcLengthOfNeedMonth23TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth23TBox#"
		hcpcCode24TBox="#request.QuoteHCPC.hcpcCode24TBox#"
		hcpcQty24TBox="#request.QuoteHCPC.hcpcQty24TBox#"
		hcpcProduct24TBox="#request.QuoteHCPC.hcpcProduct24TBox#"
		hcpcCost24TBox="#request.QuoteHCPC.hcpcCost24TBox#"
		hcpcDX24TBox="#request.QuoteHCPC.hcpcDX24TBox#"
		hcpcDiagnosis24TBox="#request.QuoteHCPC.hcpcDiagnosis24TBox#"
		hcpcLengthOfNeedYear24TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear24TBox#"
		hcpcLengthOfNeedMonth24TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth24TBox#"
		hcpcCode25TBox="#request.QuoteHCPC.hcpcCode25TBox#"
		hcpcQty25TBox="#request.QuoteHCPC.hcpcQty25TBox#"
		hcpcProduct25TBox="#request.QuoteHCPC.hcpcProduct25TBox#"
		hcpcCost25TBox="#request.QuoteHCPC.hcpcCost25TBox#"
		hcpcDX25TBox="#request.QuoteHCPC.hcpcDX25TBox#"
		hcpcDiagnosis25TBox="#request.QuoteHCPC.hcpcDiagnosis25TBox#"
		hcpcLengthOfNeedYear25TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear25TBox#"
		hcpcLengthOfNeedMonth25TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth25TBox#"
		hcpcCode26TBox="#request.QuoteHCPC.hcpcCode26TBox#"
		hcpcQty26TBox="#request.QuoteHCPC.hcpcQty26TBox#"
		hcpcProduct26TBox="#request.QuoteHCPC.hcpcProduct26TBox#"
		hcpcCost26TBox="#request.QuoteHCPC.hcpcCost26TBox#"
		hcpcDX26TBox="#request.QuoteHCPC.hcpcDX26TBox#"
		hcpcDiagnosis26TBox="#request.QuoteHCPC.hcpcDiagnosis26TBox#"
		hcpcLengthOfNeedYear26TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear26TBox#"
		hcpcLengthOfNeedMonth26TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth26TBox#"
		hcpcCode27TBox="#request.QuoteHCPC.hcpcCode27TBox#"
		hcpcQty27TBox="#request.QuoteHCPC.hcpcQty27TBox#"
		hcpcProduct27TBox="#request.QuoteHCPC.hcpcProduct27TBox#"
		hcpcCost27TBox="#request.QuoteHCPC.hcpcCost27TBox#"
		hcpcDX27TBox="#request.QuoteHCPC.hcpcDX27TBox#"
		hcpcDiagnosis27TBox="#request.QuoteHCPC.hcpcDiagnosis27TBox#"
		hcpcLengthOfNeedYear27TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear27TBox#"
		hcpcLengthOfNeedMonth27TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth27TBox#"
		hcpcCode28TBox="#request.QuoteHCPC.hcpcCode28TBox#"
		hcpcQty28TBox="#request.QuoteHCPC.hcpcQty28TBox#"
		hcpcProduct28TBox="#request.QuoteHCPC.hcpcProduct28TBox#"
		hcpcCost28TBox="#request.QuoteHCPC.hcpcCost28TBox#"
		hcpcDX28TBox="#request.QuoteHCPC.hcpcDX28TBox#"
		hcpcDiagnosis28TBox="#request.QuoteHCPC.hcpcDiagnosis28TBox#"
		hcpcLengthOfNeedYear28TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear28TBox#"
		hcpcLengthOfNeedMonth28TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth28TBox#"
		hcpcCode29TBox="#request.QuoteHCPC.hcpcCode29TBox#"
		hcpcQty29TBox="#request.QuoteHCPC.hcpcQty29TBox#"
		hcpcProduct29TBox="#request.QuoteHCPC.hcpcProduct29TBox#"
		hcpcCost29TBox="#request.QuoteHCPC.hcpcCost29TBox#"
		hcpcDX29TBox="#request.QuoteHCPC.hcpcDX29TBox#"
		hcpcDiagnosis29TBox="#request.QuoteHCPC.hcpcDiagnosis29TBox#"
		hcpcLengthOfNeedYear29TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear29TBox#"
		hcpcLengthOfNeedMonth29TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth29TBox#"
		hcpcCode30TBox="#request.QuoteHCPC.hcpcCode30TBox#"
		hcpcQty30TBox="#request.QuoteHCPC.hcpcQty30TBox#"
		hcpcProduct30TBox="#request.QuoteHCPC.hcpcProduct30TBox#"
		hcpcCost30TBox="#request.QuoteHCPC.hcpcCost30TBox#"
		hcpcDX30TBox="#request.QuoteHCPC.hcpcDX30TBox#"
		hcpcDiagnosis30TBox="#request.QuoteHCPC.hcpcDiagnosis30TBox#"
		hcpcLengthOfNeedYear30TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear30TBox#"
		hcpcLengthOfNeedMonth30TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth30TBox#"
		hcpcCode31TBox="#request.QuoteHCPC.hcpcCode31TBox#"
		hcpcQty31TBox="#request.QuoteHCPC.hcpcQty31TBox#"
		hcpcProduct31TBox="#request.QuoteHCPC.hcpcProduct31TBox#"
		hcpcCost31TBox="#request.QuoteHCPC.hcpcCost31TBox#"
		hcpcDX31TBox="#request.QuoteHCPC.hcpcDX31TBox#"
		hcpcDiagnosis31TBox="#request.QuoteHCPC.hcpcDiagnosis31TBox#"
		hcpcLengthOfNeedYear31TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear31TBox#"
		hcpcLengthOfNeedMonth31TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth31TBox#"
		hcpcCode32TBox="#request.QuoteHCPC.hcpcCode32TBox#"
		hcpcQty32TBox="#request.QuoteHCPC.hcpcQty32TBox#"
		hcpcProduct32TBox="#request.QuoteHCPC.hcpcProduct32TBox#"
		hcpcCost32TBox="#request.QuoteHCPC.hcpcCost32TBox#"
		hcpcDX32TBox="#request.QuoteHCPC.hcpcDX32TBox#"
		hcpcDiagnosis32TBox="#request.QuoteHCPC.hcpcDiagnosis32TBox#"
		hcpcLengthOfNeedYear32TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear32TBox#"
		hcpcLengthOfNeedMonth32TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth32TBox#"
		hcpcCode33TBox="#request.QuoteHCPC.hcpcCode33TBox#"
		hcpcQty33TBox="#request.QuoteHCPC.hcpcQty33TBox#"
		hcpcProduct33TBox="#request.QuoteHCPC.hcpcProduct33TBox#"
		hcpcCost33TBox="#request.QuoteHCPC.hcpcCost33TBox#"
		hcpcDX33TBox="#request.QuoteHCPC.hcpcDX33TBox#"
		hcpcDiagnosis33TBox="#request.QuoteHCPC.hcpcDiagnosis33TBox#"
		hcpcLengthOfNeedYear33TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear33TBox#"
		hcpcLengthOfNeedMonth33TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth33TBox#"
		hcpcCode34TBox="#request.QuoteHCPC.hcpcCode34TBox#"
		hcpcQty34TBox="#request.QuoteHCPC.hcpcQty34TBox#"
		hcpcProduct34TBox="#request.QuoteHCPC.hcpcProduct34TBox#"
		hcpcCost34TBox="#request.QuoteHCPC.hcpcCost34TBox#"
		hcpcDX34TBox="#request.QuoteHCPC.hcpcDX34TBox#"
		hcpcDiagnosis34TBox="#request.QuoteHCPC.hcpcDiagnosis34TBox#"
		hcpcLengthOfNeedYear34TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear34TBox#"
		hcpcLengthOfNeedMonth34TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth34TBox#"
		hcpcCode35TBox="#request.QuoteHCPC.hcpcCode35TBox#"
		hcpcQty35TBox="#request.QuoteHCPC.hcpcQty35TBox#"
		hcpcProduct35TBox="#request.QuoteHCPC.hcpcProduct35TBox#"
		hcpcCost35TBox="#request.QuoteHCPC.hcpcCost35TBox#"
		hcpcDX35TBox="#request.QuoteHCPC.hcpcDX35TBox#"
		hcpcDiagnosis35TBox="#request.QuoteHCPC.hcpcDiagnosis35TBox#"
		hcpcLengthOfNeedYear35TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear35TBox#"
		hcpcLengthOfNeedMonth35TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth35TBox#"
		hcpcCode36TBox="#request.QuoteHCPC.hcpcCode36TBox#"
		hcpcQty36TBox="#request.QuoteHCPC.hcpcQty36TBox#"
		hcpcProduct36TBox="#request.QuoteHCPC.hcpcProduct36TBox#"
		hcpcCost36TBox="#request.QuoteHCPC.hcpcCost36TBox#"
		hcpcDX36TBox="#request.QuoteHCPC.hcpcDX36TBox#"
		hcpcDiagnosis36TBox="#request.QuoteHCPC.hcpcDiagnosis36TBox#"
		hcpcLengthOfNeedYear36TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear36TBox#"
		hcpcLengthOfNeedMonth36TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth36TBox#"
		hcpcCode37TBox="#request.QuoteHCPC.hcpcCode37TBox#"
		hcpcQty37TBox="#request.QuoteHCPC.hcpcQty37TBox#"
		hcpcProduct37TBox="#request.QuoteHCPC.hcpcProduct37TBox#"
		hcpcCost37TBox="#request.QuoteHCPC.hcpcCost37TBox#"
		hcpcDX37TBox="#request.QuoteHCPC.hcpcDX37TBox#"
		hcpcDiagnosis37TBox="#request.QuoteHCPC.hcpcDiagnosis37TBox#"
		hcpcLengthOfNeedYear37TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear37TBox#"
		hcpcLengthOfNeedMonth37TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth37TBox#"
		hcpcCode38TBox="#request.QuoteHCPC.hcpcCode38TBox#"
		hcpcQty38TBox="#request.QuoteHCPC.hcpcQty38TBox#"
		hcpcProduct38TBox="#request.QuoteHCPC.hcpcProduct38TBox#"
		hcpcCost38TBox="#request.QuoteHCPC.hcpcCost38TBox#"
		hcpcDX38TBox="#request.QuoteHCPC.hcpcDX38TBox#"
		hcpcDiagnosis38TBox="#request.QuoteHCPC.hcpcDiagnosis38TBox#"
		hcpcLengthOfNeedYear38TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear38TBox#"
		hcpcLengthOfNeedMonth38TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth38TBox#"
		hcpcCode39TBox="#request.QuoteHCPC.hcpcCode39TBox#"
		hcpcQty39TBox="#request.QuoteHCPC.hcpcQty39TBox#"
		hcpcProduct39TBox="#request.QuoteHCPC.hcpcProduct39TBox#"
		hcpcCost39TBox="#request.QuoteHCPC.hcpcCost39TBox#"
		hcpcDX39TBox="#request.QuoteHCPC.hcpcDX39TBox#"
		hcpcDiagnosis39TBox="#request.QuoteHCPC.hcpcDiagnosis39TBox#"
		hcpcLengthOfNeedYear39TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear39TBox#"
		hcpcLengthOfNeedMonth39TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth39TBox#"
		hcpcCode40TBox="#request.QuoteHCPC.hcpcCode40TBox#"
		hcpcQty40TBox="#request.QuoteHCPC.hcpcQty40TBox#"
		hcpcProduct40TBox="#request.QuoteHCPC.hcpcProduct40TBox#"
		hcpcCost40TBox="#request.QuoteHCPC.hcpcCost40TBox#"
		hcpcDX40TBox="#request.QuoteHCPC.hcpcDX40TBox#"
		hcpcDiagnosis40TBox="#request.QuoteHCPC.hcpcDiagnosis40TBox#"
		hcpcLengthOfNeedYear40TBox="#request.QuoteHCPC.hcpcLengthOfNeedYear40TBox#"
		hcpcLengthOfNeedMonth40TBox="#request.QuoteHCPC.hcpcLengthOfNeedMonth40TBox#"		
		quoteNote="#trim(form.quoteNote)#">	
		
		
		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create the Quote print file PDF. Placing pagetype="A4" keeps everything on     --->
		<!--- the same page.                                                                 --->
		<!-------------------------------------------------------------------------------------->
		<!---<cfif IsDefined("form.faxSheet") AND form.faxSheet>					
			
			<cfdocument marginbottom=".05" marginleft=".15" marginright=".15" margintop=".15" format="PDF" filename="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\QuoteCoverSheetVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(QuoteID)#.pdf" overwrite="yes">
				<cfoutput>							
					#CoverSheetPrintVariable#
				</cfoutput>
			</cfdocument>
			<cfset listOfFiles = listAppend(listOfFiles,"#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\QuoteCoverSheetVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(QuoteID)#.pdf")>
		
		</cfif>--->	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Create the Quote print file PDF. Placing pagetype="A4" keeps everything on     --->
		<!--- the same page.                                                                 --->
		<!-------------------------------------------------------------------------------------->
		<cfdocument marginbottom=".05" marginleft=".15" marginright=".15" margintop=".15" format="PDF" filename="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\QuotePrintVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(QuoteID)#.pdf" overwrite="yes">
			<cfoutput>			
				<cfif IsDefined("form.faxSheet") AND form.faxSheet>		
					#CoverSheetPrintVariable#				
				</cfif>
				#QuotePrintVariable#
			</cfoutput>
		</cfdocument>
		<cfset listOfFiles = listAppend(listOfFiles,"#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\QuotePrintVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(QuoteID)#.pdf")>
								
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create the actual pdf that will be printed.                                    --->
		<!-------------------------------------------------------------------------------------->			
		<cfif ListLen(listOfFiles) GTE 1>
			
			<cfset finalFileName = "QuotePrintFinal_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(QuoteID)#.pdf">
		
			<cf_gcConcatenatePDFs 
				listofPDFs="#trim(listOfFiles)#"
				finalOutPutFile="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(finalFileName)#">
			
				
	
			<!-------------------------------------------------------------------------------------->
			<!--- Now that we know the print was done lets log it.                               --->
			<!-------------------------------------------------------------------------------------->
			<cfset newPrinted = ListAppend(request.Quote.getPrinted(), "#DateFormat(NOW(), 'mm/dd/yyyy')#|#TimeFormat(NOW(), 'hh:mm:ss tt')#|#trim(session.User.getUsersID())#|#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#|#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(finalFileName)#")>
			
			<cfquery name="updateQuote" datasource="#request.datasource#">
				UPDATE quote
				SET printed = '#trim(newPrinted)#'
				WHERE QuoteID = #trim(quoteID)#
			</cfquery>
			
		<cfdump var="#trim(request.tempDocsURL)#/#trim(finalFileName)#">	<cfabort>	
									
			<!-------------------------------------------------------------------------------------->
			<!--- Locate the user to where they will be able to print it.                        --->
			<!-------------------------------------------------------------------------------------->		
			<cfoutput>		
				<!---<script language="JavaScript">
					location = '#trim(request.tempDocsURL)#/#trim(finalFileName)#';							
				</script>--->
				
				<script language="JavaScript">					
					reminder=window.open('#trim(request.tempDocsURL)#/#trim(finalFileName)#', 'reminder', 'top=0,left=0,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#'); reminder.focus(0);
					setTimeout('self.close()',500); // close self after a seconds delay			
				</script>
				
			</cfoutput>		
		
		</cfif>
	
		
		
				
		
	<!---<cfoutput>#CoverSheetPrintVariable#</cfoutput>	
	<br><br><br><br><br><br><br><br><br><br><br>
	<cfoutput>#QuotePrintVariable#</cfoutput>--->


