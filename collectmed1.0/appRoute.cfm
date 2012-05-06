

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.mainSearchContainer" default="searchP">
	<cfset mainSearchContainer = attributes.mainSearchContainer>
	
	<cfparam name="attributes.mainSearchContainerHeight" default="400">
	<cfset mainSearchContainerHeight = attributes.mainSearchContainerHeight>
	
	<cfparam name="attributes.mainSearchContainerWidth" default="450">
	<cfset mainSearchContainerWidth = attributes.mainSearchContainerWidth>	
	
	<cfparam name="attributes.insuranceCompanyID" default="44584"><!--- TODO This is Texas Medicaid must be changed --->
	<cfset insuranceCompanyID = attributes.insuranceCompanyID>	
	
	<cfset RouteID = url.RouteID>


<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->					
<script type="text/javascript" src="scripts/tagVerificationTXMedicaid.js"></script>



<!-------------------------------------------------------------------------------------->
<!--- Get the Queries needed for this page.                                          --->
<!-------------------------------------------------------------------------------------->
<cfscript>
	variables.filterRoutePatient = structNew();
	variables.filterRoutePatient.RouteID = RouteID;	
	variables.filterRoutePatient.Active = 1;
	variables.filterRoutePatient.OrderBy = "SubRoute,RoutePatientID";
	variables.RouteSVC = application.beanFactory.getBean('old_RoutePatientService');	
	variables.allRoutePatients = variables.RouteSVC.getAllRoutePatients(variables.filterRoutePatient);

	variables.allPatients = "";
	variables.PatientBean = application.beanFactory.getBean('old_Patient');	
	if(isQuery(variables.allRoutePatients) AND variables.allRoutePatients.recordCount gte 1){
		variables.allPatients = variables.PatientBean.getPatients(ClientID: trim(session.ClientID), PatientIDs: ValueList(variables.allRoutePatients.PatientID));	
	}
	
	variables.filterRoute = structNew();
	variables.filterRoute.RouteID = RouteID;
	variables.filterRoute.Active = 1;	
	variables.RouteSVC = application.beanFactory.getBean('old_RouteService');	
	variables.thisRoute = variables.RouteSVC.getAllRoutes(variables.filterRoute);
</cfscript>


<style>				
				
	.spacer {width:1px; font-size:1px; height:1px; line-height:1px;}	
	table.tableIntake {font-family:arial; width:234px; font-size:10px;}
	table.tableIntake tr.title td {color:#ccc; background-color:#F4F4F4;}
	table.tableIntake tr.title .blue {background-color:#DCE3EB;}
	table.tableIntake tr.title .blackText {color:#000000; padding-left:2px;}
	table.tableIntake tr.title .dkGreyText {color:#999; padding-left:2px;}
	table.tableIntake tr.title .ltGrey {background-color:#F4F4F4;}
	table.tableIntake tr.title .grey {background-color:#ccc;}
	table.tableIntake tr.title .gtd {background-color:#ccc;}	
	table.tableIntake .percent {font-size:1px; background-color:#DCE3EB;}
	
	.txt11{font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#000000}
	
	input.nb{ 
		border:0px; 
	} 	
	.bgblue {background-color:#DCE3EB;}
	
	.tblMainBorder{				
		border: 0px dashed #ff0000;
	} 
	.tblBorder{ 
		border: 1px solid #DCE3EB;
	}
	.tblCellBorder{			
		padding: 2px;
		border: 1px solid #DCE3EB;
	} 
	.tbl_trBG{
		background: #DCE3EB;
		font-weight: bold;
	}
	.tbl_dataCellBG{
		background: #F8F8F8;
	}
	.tbl_fontSize{
		font-size: 80%;
	}
	.oneHundredWidth{
		 width: '100%';
	}
	.tdPaddingTitle{
		padding: 6px 6px 6px 2px;
	}

</style>
	

<cfoutput>

	<script>
		var currentVal = "";
		var urlReconstructed = '#trim(request.urlReconstructed)#';

		function addPatient(){
			searchPatientOpenClose();
		}
		function setPatient(PatientID, FName, MInitial, LName, MM, DD, YY, SSN, Sex, Weight, Height, AddressID, PhoneID, entityID, MaritalStatus, patientphoneid, patientaddressid, clientid){			
			addDynamic(PatientID);
		}
			
		function setCurrent(elmVal){
			currentVal = elmVal;
		}
		function checkCurrent(elm){
			if(currentVal != elm.value){
				saveThisCell(elm);
			}
		}
		function saveThisCell(elm){		
			var infoArray = elm.id.split("_");
			var saveCell = confirm("If you want to save your changes click \"OK\" otherwise click \"Cancel\"");
			if(saveCell){
					
				var data1 = #trim(session.ClientID)#;			
				var data2 = #trim(session.User.getUsersID())#;					
				var data3 = infoArray[0];
				var data4 = infoArray[1];
				var data5 = elm.value;
				
				$.get("#trim(request.urlReconstructed)#/ws/wsRoute.cfc", 
					{ 
						method: "wsUpdateRoutePatient",
						dataType: "xml",
						Data1: escape(data1),
						Data2: escape(data2),
						Data3: escape(data3),
						Data4: escape(data4),
						Data5: escape(data5),
						rand: escape(randNum_JS())
					},
				 	function(data){										
						//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
						if (window.ActiveXObject){
							var doc=new ActiveXObject("Microsoft.XMLDOM");
						  	doc.async="false";
						  	doc.loadXML(data);
						}				
						
						var x = doc.documentElement;
						
						$(x).find('change').each(function(){								
							var $change = $(this);
							var thisChangeError = $change.find('error').text();																				
							alert(thisChangeError);																	
						});	
						
						if(data4 == "SubRoute"){
							window.location.reload(true);;
						}
										
					//ends the callback function.										
					});			
			}	
			else{
				elm.value = currentVal;	
			};
		};
		
		function addDynamic(newID){	
				
			var data1 = #trim(session.ClientID)#;			
			var data2 = #trim(session.User.getUsersID())#;					
			var data3 = #trim(RouteID)#;
			var data4 = newID;
	
			$.get("#trim(request.urlReconstructed)#/ws/wsRoute.cfc", 
			{ 
				method: "wsAddRoutePatient",
				dataType: "xml",
				Data1: escape(data1), 
				Data2: escape(data2), 							
				Data3: escape(data3), 		
				Data4: escape(data4), 											
				rand: escape(randNum_JS()) 
			},
		 	function(data){										
				//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
				if (window.ActiveXObject){
					var doc=new ActiveXObject("Microsoft.XMLDOM");
				  	doc.async="false";
				  	doc.loadXML(data);
				}				
				
				var x = doc.documentElement;
				
				$(x).find('change').each(function(){
					var $change = $(this);
					var thisChangeError = $change.find('error').text();																				
					alert(thisChangeError);	
					return false;																
				});	
				
				window.location.reload(true);
								
			//ends the callback function.										
			});			
			
		};
		
		function deleteRow(id){
			var delRow = confirm("Are you sure you want to delete this row? click \"OK\" otherwise click \"Cancel\"");
			if(delRow){
					
				var data1 = #trim(session.ClientID)#;			
				var data2 = #trim(session.User.getUsersID())#;					
				var data3 = id;			
				
				$.get("#trim(request.urlReconstructed)#/ws/wsRoute.cfc", 
					{ 
						method: "wsDeleteRoutePatient",
						dataType: "xml",
						Data1: escape(data1), 
						Data2: escape(data2), 							
						Data3: escape(data3), 								
						rand: escape(randNum_JS()) 
					},
				 	function(data){										
						//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
						if (window.ActiveXObject){
							var doc=new ActiveXObject("Microsoft.XMLDOM");
						  	doc.async="false";
						  	doc.loadXML(data);
						}				
						
						var x = doc.documentElement;
						
						$(x).find('change').each(function(){								
							var $change = $(this);
							var thisChangeError = $change.find('error').text();																				
							alert(thisChangeError);																	
						});	
					window.location.reload(true);										
					//ends the callback function.										
					});			
			}	
			else{
				return false;
			};
		}
		
		function verifyPatientByCheckbox(elm){
			var infoArray = elm.id.split("_");
			var data1 = #trim(session.ClientID)#;			
			var data2 = #trim(session.User.getUsersID())#;					
			var data3 = infoArray[0];
			var data4 = 0;
			if(elm.checked){
				data4 = 1;
			};
			$.get("#trim(request.urlReconstructed)#/ws/wsRoute.cfc", 
			{ 
				method: "wsCheckRoutePatient",
				dataType: "xml",
				Data1: escape(data1), 
				Data2: escape(data2), 							
				Data3: escape(data3), 		
				Data4: escape(data4), 								
				rand: escape(randNum_JS()) 
			},
		 	function(data){										
				//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
				if (window.ActiveXObject){
					var doc=new ActiveXObject("Microsoft.XMLDOM");
				  	doc.async="false";
				  	doc.loadXML(data);
				}				
				
				var x = doc.documentElement;
				
				$(x).find('change').each(function(){								
					var $change = $(this);
					var thisChangeError = $change.find('error').text();																				
					alert(thisChangeError);																	
				});												
			//ends the callback function.										
			});						
		};
		
		function submitForVerification(){
			var verifyIDs = new Array();			
			$(':checkbox:checked').each(function(){								
				var thisCompleteID = $(this).attr("id"); 																					
				var infoArray = thisCompleteID.split("_");				
				verifyIDs[verifyIDs.length] = infoArray[2];										
			});	
			if(verifyIDs.length < 1){
				alert("You must have at least one patient in order to submit for verification.");
				return false;	
			};
			
			//Make the call to verify.
			$('##presetPatientIDs').val(verifyIDs.toString());
			$('##verificationRequestForm').submit();
		};
		
		
		function openVerificationDialog(obj){		
			var idArr = obj.id.split('_');			
			$(document).ready(function() {				
				$("##div1").html('<img src="/images/indicator.gif" />');
				$("##div1").dialog();
				var data = getMedicaidVerificationXML(#trim(session.clientID)#, #trim(session.User.getUsersID())#, idArr[1]);				
				var arrayData = data.split("@@");
				parseXmlBuild(arrayData[1], arrayData[0], true);		
				$("##div1").dialog( "option", "title", 'Verification Information: ' + idArr[1]);
				$("##div1").dialog( "option", "width", 600 );				
		  	});
		};

		function closeVerificationDialog(obj){					
			$("##div1").dialog( "close" );	  
		};
		
		function getMedicaidVerificationXML(data1,data2,data3){				
			var url = "#trim(request.urlReconstructed)#/ws/wsVerification.cfc?method=wsGetMedicaidVerification&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&Data3=" + escape(data3) + "&" + escape(randNum_JS());				 
			var packet = _wddxSelectListGetFromURL(url);												
			var wddxDes = new WddxDeserializer;				
			var result = wddxDes.deserialize(packet);							
			if (result != null) {					
				return result;
			}
			else{					
				return false;
			}							
		};	
				
	</script>


	<br>	
	<div id="mainContainer">	
		<table cellspacing="4" cellpadding="2" border="0" align="center">	
			<tr>		   
				<td align="left" valign="top">				
					<table cellspacing="0" cellpadding="10" border="0">
						<tr>
							<td valign="top">
								<cf_gcBorderedTable	title="#thisRoute.name# - Route Patients &nbsp;&nbsp;&nbsp;" tableWidth="100%">	
									<table>
									<tr>
										<td align="right">
										 	<input type="Button" class="SiteSubmitbox" value="Add Patient" id="addPatientButton" onclick="addPatient();">&nbsp;&nbsp;
											<input type="Button" class="SiteSubmitbox" value="Add New Patient" id="addNewPatientButton" onclick="addNewPatient('##addNewPatientContainer');">
										</td>
									</tr>
									<tr>
										<td>
											<table border="1" cellpadding="4" cellspacing="0">
												<tr id="popNote">
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">&nbsp;</th>	
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">Patient ID</th>
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">Sub-Route</th>
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">First Name</th>
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">Last Name</th>
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">City</th>
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">MCD</th>
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">Supplies</th> 
													<th class="SiteLabel" nowrap bgcolor="DCE3EB">&nbsp;</th> 
												</tr>
												
												<cfset variables.currentSubRoute = "">
												<cfset variables.currentSubRouteCount = 0>												
												<cfloop query="variables.allRoutePatients">				
											    	<cfset variables.showSubRouteHeader = false>	
											    	<cfif variables.currentSubRoute NEQ trim(SubRoute)>
											    		<cfset variables.currentSubRoute = trim(SubRoute)>
											    		<cfset variables.showSubRouteHeader = true>
											    	</cfif>
											    	
											    	<cfquery name="thisPatient" dbtype="query">
														SELECT *
														FROM variables.allPatients
														WHERE PatientID = #PatientID#
													</cfquery>
													
											    	<cfset variables.popNote = "">
											    	<cfset thisInsuranceCompanyID = insuranceCompanyID>
											    	<cfset PatientIns = "">
													<cfquery name="PatientIns" datasource="PAClient_#session.ClientID#">
														SELECT pic.recordID, pic.Deductible, pic.GroupName, pic.GroupNumber, ic.InsuranceCompanyDBA, pic.InsuranceCompanyID, ic.InsuranceCompanyName, pic.PayPercentage, pic.PolicyHoldersAddressLine1, pic.PolicyHoldersAddressLine2, pic.PolicyHoldersCity,  pic.PolicyHoldersDOB AS PolicyHoldersDOB, pic.PolicyHoldersEffectiveDateFrom, pic.PolicyHoldersEffectiveDateTo, pic.PolicyHoldersEmployerSchoolName, pic.PolicyHoldersFirstName, pic.PolicyHoldersLastName, pic.PolicyHoldersMiddleInitial, pic.PolicyHoldersPhone, pic.PolicyHoldersPhoneExtension, pic.PolicyHoldersSex, pic.PolicyHoldersStateID, pic.PolicyHoldersZipCode, pic.PolicyNumber, pic.PrimSecTer, pic.Relationship, ic.EntityID AS Z_ICEntityID
														FROM PatientInsuranceCompany pic
														INNER JOIN InsuranceCompany ic ON pic.InsuranceCompanyID = ic.InsuranceCompanyID
														WHERE  pic.patientID = #PatientID# AND pic.Active = 1 
														Order By  pic.PrimSecTer
													</cfquery> 
														
													<cfset variables.verificationCount = 0>				
													<cfif IsQuery(PatientIns) AND PatientIns.RecordCount GTE 1>		
															
														<cfset verificationsArray = ArrayNew(1)>	
														<cfset verificationsXmlArray = ArrayNew(1)>	
														<cfloop query="PatientIns">
															<cfif PatientIns.InsuranceCompanyID EQ thisInsuranceCompanyID>
																<cfset thisString = "">
																<cfquery name="getVerifications" datasource="PAClient_#session.ClientID#">
																	SELECT vpi.VerificationPatientInsuranceID, vpi.DateCreated AS DateCreated, vpi.VerificationDate AS VerificationDate, vpi.VerificationTime,
																	CONCAT(vu.FName, ' ', vu.LName) AS Fullname, vpi.VerificationRepFName, vpi.VerificationRepLName, vpi.VerificationHaveInsFromDate AS VerificationHaveInsFromDate, vpi.VerificationHaveInsToDate AS VerificationHaveInsToDate						 
																	FROM VerificationPatientInsurance vpi		
																	LEFT JOIN view_UserAccountParameters vu on vpi.UsersID = vu.UsersID			
																	WHERE vpi.picID = #trim(recordID)# AND vpi.Active = 1
																	ORDER BY vpi.DateCreated DESC				
																</cfquery> 	
																<cfif getVerifications.RecordCount GTE 1>																
																	<!--- DATECREATED FULLNAME VERIFICATIONDATE VERIFICATIONHAVEINSFROMDATE VERIFICATIONHAVEINSTODATE VERIFICATIONPATIENTINSURANCEID VERIFICATIONREPFNAME VERIFICATIONREPLNAME VERIFICATIONTIME --->
																	<cfset variables.popNote = "<table><tr id=headerRow style=background-color:ffffcc><td class=siteLabel align=center><strong>ID</strong></td><td class=siteLabel align=center><strong>Date Verified</strong></td><td class=siteLabel align=center><strong>Time Verified</strong></td><td class=siteLabel align=center><strong>Verified By</strong></td><td class=siteLabel align=center><strong>Rep Name</strong></td><td class=siteLabel align=center><strong>Effective Date From</strong></td><td class=siteLabel align=center><strong>Effective Date To</strong></td></tr>">
																	<cfloop query="getVerifications">
																		<cfset variables.popNote = variables.popNote & "<tr><td style=cursor:hand id=verification_#VERIFICATIONPATIENTINSURANCEID# onClick=openVerificationDialog(this); class=siteLabel>#VERIFICATIONPATIENTINSURANCEID#</td><td class=siteLabel align=center>#DateFormat(VERIFICATIONDATE, 'm/d/yyyy')#</td><td class=siteLabel align=center>#VERIFICATIONTIME#</td><td class=siteLabel>#FULLNAME#</td><td class=siteLabel>#VERIFICATIONREPFNAME# #VERIFICATIONREPLNAME#</td><td class=siteLabel align=center>#DateFormat(VERIFICATIONHAVEINSFROMDATE, 'm/d/yyyy')#</td><td class=siteLabel align=center>#DateFormat(VERIFICATIONHAVEINSTODATE, 'm/d/yyyy')#</td></tr>">
																	</cfloop>
																	<cfset variables.popNote = variables.popNote & "</table>">
																	<cfset variables.verificationCount = 1>																
																</cfif>	
															</cfif>
														</cfloop>		
													
													</cfif>
											    	
											    	<cfif variables.currentSubRouteCount AND variables.showSubRouteHeader>												    
												    	<tr><td colspan="10" class="bgblue"><strong>#variables.currentSubRoute#</strong></td></tr>
											    	</cfif>
											    	
											    	<tr>
												    	<td nowrap class="SiteLabel"><input type="checkbox" name="#RoutePatientID#_checkbox_#PatientID#" id="#RoutePatientID#_checkbox_#PatientID#" <cfif patientID LTE 0>DISABLED<cfelse>onclick="verifyPatientByCheckbox(this);"</cfif> <cfif checked>checked</cfif>></td>	
														<cfif variables.verificationCount>
															<td class="SiteLabel" style="cursor:hand" nowrap onmouseover="doTooltipNew(0, this, event, '#trim(variables.popNote)#', '650');" onmouseout="hideTip(this);"><cfif patientID LTE 0>&nbsp;<cfelse><u>#PatientID#</u></cfif></td>
														<cfelse>
															<td class="SiteLabel" nowrap><cfif patientID LTE 0>&nbsp;<cfelse>#PatientID#</cfif></td>
														</cfif>
														
														<td class="SiteLabel" nowrap>
															<input type="Text" 
																name="#RoutePatientID#_SubRoute" 
																id="#RoutePatientID#_SubRoute" 
																onclick="setCurrent(this.value); $(this).removeClass('siteTextBoxInvisible').addClass('siteTextBox');" 
																onblur="$(this).removeClass('siteTextBox').addClass('siteTextBoxInvisible');checkCurrent(this);" 
																class="siteTextBoxInvisible" 
																value="#trim(SubRoute)#" 
																size="10" 
																maxlength="50">
														</td>
														<td nowrap class="SiteLabel"><cfif patientID LTE 0>#FNAME#<cfelse>#thisPatient.FNAME#</cfif>&nbsp;</td>
														<td nowrap class="SiteLabel"><cfif patientID LTE 0>#LName#<cfelse>#thisPatient.LNAME#</cfif>&nbsp;</td>
														<td class="SiteLabel" nowrap>
															<input type="Text" 
																name="#RoutePatientID#_City" 
																id="#RoutePatientID#_City" 
																onclick="setCurrent(this.value); $(this).removeClass('siteTextBoxInvisible').addClass('siteTextBox');" 
																onblur="$(this).removeClass('siteTextBox').addClass('siteTextBoxInvisible');checkCurrent(this);" 
																class="siteTextBoxInvisible" 
																value="#trim(City)#" 
																size="10" 
																maxlength="25">
														</td>
														<td class="SiteLabel" nowrap>
															<input type="Text" 
																name="#RoutePatientID#_IDtext" 
																id="#RoutePatientID#_IDtext" 
																onclick="setCurrent(this.value); $(this).removeClass('siteTextBoxInvisible').addClass('siteTextBox');" 
																onblur="$(this).removeClass('siteTextBox').addClass('siteTextBoxInvisible');checkCurrent(this);" 
																class="siteTextBoxInvisible" 
																value="#trim(IDtext)#" 
																size="10" 
																maxlength="20">
														</td>
														<td class="SiteLabel" nowrap>
															<input type="Text" 
																name="#RoutePatientID#_SuppliesText" 
																id="#RoutePatientID#_SuppliesText" 
																onclick="setCurrent(this.value); $(this).removeClass('siteTextBoxInvisible').addClass('siteTextBox');" 
																onblur="$(this).removeClass('siteTextBox').addClass('siteTextBoxInvisible');checkCurrent(this);" 
																class="siteTextBoxInvisible" 
																value="#trim(SuppliesText)#" 
																size="100" 
																maxlength="1000">
														</td>
														<td nowrap class="SiteLabel"><a href="##" onclick="deleteRow(#RoutePatientID#);">Del</a></td>									
													</tr>	
													<cfset variables.currentSubRouteCount = 1>												
												</cfloop>					
											</table>									
										</td>
									</tr>																
								</cf_gcBorderedTable>	
							</td>
						</tr>						
						<tr>
							<td colspan="7" align="right"><br>
								<input type="Button" class="SiteSubmitbox" value="Submit for Verification" id="verificationButton" onclick="submitForVerification();">
							</td>
						</tr>												
					</table>				
				</td>
			</tr>			
		</table>
	</div>	
	<br><br>
	
	<cfinclude template="tagAddNewPatientMask.cfm">


	<!---------------------------------------------------------------------------------------------->
	<!--- create a form that will be sent to the verification screen so the patients are preset. --->
	<!---------------------------------------------------------------------------------------------->	
	<form name="verificationRequestForm" id="verificationRequestForm" action="appVerificationCreate.cfm" method="post">
		<input type="Hidden" name="presetPatientIDs" id="presetPatientIDs" value="">
	</form>

	<div id="div1" title="Verification Information"></div>
	
</cfoutput>



<!-------------------------------------------------------------------------------------->
<!--- Open the patient search screen.                                                --->
<!--------------------------------------------------------------------------------------> 		
<cfoutput>
	<div id="MAINSEARCHCONTAINER"></div>
	<cf_tagInputFormSearchPatient>			
</cfoutput>

	
	




