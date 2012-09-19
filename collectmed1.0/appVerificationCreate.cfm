<!---appVerificationCreate.cfm--->






<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationTop.cfm";
</cfscript>







<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchPatient">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.insuranceCompanyID" default="44584"><!--- TODO This is Texas Medicaid must be changed --->
	<cfset insuranceCompanyID = attributes.insuranceCompanyID>	

	<cfparam name="attributes.fileID" default="">
	<cfset fileID = attributes.fileID>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Did the InsuranceCompanyID come in the URL? This is a copy to new              --->
<!-------------------------------------------------------------------------------------->
	<cfif isDefined("url.icid")>
		<cfset insuranceCompanyID = url.icid>
	</cfif>
	<cfif isDefined("url.fileID")>
		<cfset fileID = url.fileID>
	</cfif>
	
	<cfset variables.presetPatientIDs = "">
	<cfif IsDefined("form.presetPatientIDs")>
		<cfset variables.presetPatientIDs = form.presetPatientIDs>
	<cfelseif IsDefined("url.presetPatientIDs")>
		<cfset variables.presetPatientIDs = url.presetPatientIDs>	
	</cfif>

				
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>

		<cfoutput>
			
			<style>
				 ##pageError{
				   background-color:ffffcc; 
				   display:none;   
				   border:1px solid c0c0c0;    
				   padding:10px; 
				   font-family: Verdana;
				   font-weight: bold;
				   margin-bottom:1em; 
				   color: ##ff0000;
				   text-align: left;
				};
				div.float{
					float: left;					
					margin: 5px;
				};
				##yellowAlert{
					background-color: ##ffffcc; 
					display: none; 
					width: 540; 
					border: 1px solid ##ccc889; 
					color: 616161; 
					padding:10px; 
					margin-bottom: 1em; 
				};				
				##mainContainer{
					border: 0px dashed ##FF0000;
					margin: 5px;
				};				
				##searchPatientMain{
					width: 75px;
				};				
				.patientResultTABLE{
					border: 1px solid ##DCE3EB;
					margin: 0px;
					padding: 0px;					
					background: ##FFFFFF;										
				}
				.patientResultTABLETR {
					border: 0px dotted ##green;
					margin: 0;
					padding: 5px;										
					background: ##FFFFFF;					
				}
				.patientResultTABLETRTH {					
					border: 0px dotted ##green;					
					margin: 0px;
					padding: 5px;
					background: ##DCE3EB;		
					font-family: Verdana;
					font-weight: bold;
					font-size: 11px;										
				}
				.patientResultTABLETRTD {					
					border: 0px dotted ##green;					
					margin: 0px;
					padding: 5px;	
					font-family: Verdana;
					font-weight: normal;
					font-size: 11px;											
				}
				.patientResultTABLETRTD_Error {					
					border: 0px dotted ##green;					
					margin: 0px;
					padding: 5px;	
					font-family: Verdana;
					font-weight: normal;
					font-size: 11px;	
					color: ##c0c0c0;							
				}
				##patientResultTABLE tbody tr.hover { 
				    background: ##DCE3EB; 
				    color: black; 
				    cursor: pointer; 
				} 
				
				.patientAddedTABLE{
					border: 1px solid ##DCE3EB;
					margin: 0px;
					padding: 0px;					
					background: ##FFFFFF;										
				}
				.patientAddedTABLETR {
					border: 0px dotted ##green;
					margin: 0;
					padding: 5px;										
					background: ##FFFFFF;	
					text-align: left;				
				}
				.patientAddedTABLETRTH {					
					border: 0px dotted ##green;					
					margin: 0px;
					padding: 5px;
					background: ##DCE3EB;		
					font-family: Verdana;
					font-weight: bold;
					font-size: 11px;										
				}
				.patientAddedTABLETRTD {					
					border: 0px dotted ##green;					
					margin: 0px;
					padding: 5px;	
					font-family: Verdana;
					font-weight: normal;
					font-size: 11px;											
				}
				##patientAddedTABLE tbody tr.hover { 
				    background: ##DCE3EB; 
				    color: ##black; 
				    cursor: pointer; 
				} 
				
				tr.even {
					background-color: ##F4F2F2;
				}				
				tr.odd {
					background-color: ##ffffff;
				}

			</style>
				
			<script language="JavaScript">
				
				var addedARRAY_INDEX = new Array();
				var addedARRAY_PATIENTID = new Array();
				var addedARRAY_FULLNAME = new Array();
				var addedARRAY_FNAME = new Array();
				var addedARRAY_LNAME = new Array();
				var addedARRAY_DOB = new Array();
				var addedARRAY_SSN = new Array();
				var addedARRAY_POLICYNUMBER = new Array();
				var addedARRAY_FROMDATE = new Array();
				var addedARRAY_TODATE = new Array();
				
				function showPageError(hide, scroll, msg){
					//alert(hide);
					//alert(scroll);
					if(!hide){
						$("##pageError").html(msg);
						$('##pageError').show(400);
						if(scroll){alert('inside scroll to by');
							scrollToByID('pageError');
						};
					}else{
						$('##pageError').hide();
					};
				};
								
				function validateForm(){				
					
					var patientID = 0;					
					showPageError(true, false, '');
					sp_errorMsg.innerHTML = "";
					tr_errorMsg.style.display = 'none';			
					
					if($("##insuranceCompanyID").val() == ""){		
						var msg = "*NOTE: You must define an Insurance Company by ID.";	
						showPageError(false, false, msg);					
						return false;
					};						
					
					if($("##FName").val() == "" && $("##LName").val() == "" && $("##SSN").val() == "" && $("##patientID").val() == "" && $("##InsurancePolicyID").val() == ""){		
						var blankSearch = confirm("NOTE: At least one field must be filled in order to search.");						
						return false;
					};	
															
					if($("##SSN").val() != "" && $("##SSN").val().length < 3){
						msg = "You must provide at least 3 characters of the SSN to search on.";
						sp_errorMsg.innerHTML = msg;
						tr_errorMsg.style.display = 'inline';						
						return false;						
					};
					
					if($("##patientID").val() != ''){
						patientID = $("##patientID").val();
					}
										
					wsSearchPatients(#trim(session.ClientID)#, #trim(session.User.getUsersID())#, $("##FName").val(), $("##LName").val(), $("##SSN").val(), patientID, $("##InsurancePolicyID").val(), $("##insuranceCompanyID").val());
																						
				};

				function wsSearchPatients(data1, data2, data3, data4, data5, data9, data10, data11){							
					//showPageError(true, false, '');
				
					$.get("#trim(request.urlReconstructed)#/ws/wsPatient.cfc", 
						{ 
							method: "wsSearchPatientsPlainXML",
							dataType: "xml",
							Data1: escape(data1), 
							Data2: escape(data2), 
							Data3: escape(data3), 
							Data4: escape(data4), 
							Data5: escape(data5), 
							Data9: escape(data9), 
							Data10: escape(data10),
							Data11: escape(data11), 							
							rand: escape(randNum_JS()) 
						},
					   	function(data){									
							//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
							if (window.ActiveXObject){
								var doc=new ActiveXObject("Microsoft.XMLDOM");
							  	doc.async="false";
							  	doc.loadXML(data);
							}				
							var x=doc.documentElement;			
							
							createPatientResultTable();
													
							$(x).find('PATIENT').each(function(){								
								var $PATIENT = $(this);
								var dob = $PATIENT.find('DOB').text();	
								var entityID = $PATIENT.find('ENTITYID').text();
								var fname = $PATIENT.find('FNAME').text();	
								var lname = $PATIENT.find('LNAME').text();	
								var mname = $PATIENT.find('MNAME').text();	
								var patientID = $PATIENT.find('PATIENTID').text();	
								var sex = $PATIENT.find('SEX').text();	
								var ssn = $PATIENT.find('SSN').text();	
								var policyNumber = $PATIENT.find('POLICYNUMBER').text();	
								addPatientSelectViewRow(entityID, patientID, fname, mname, lname, dob, ssn, sex, policyNumber);
							});		
							
							$('table.patientResultTABLE tbody tr:not([th]):odd').addClass('odd');
							$('table.patientResultTABLE tbody tr:not([th]):even').addClass('even');									
							$("##patientResultTABLE tbody tr").hover( 
							    function(){ 							        
							        $(this).addClass('hover'); 
							    },  
							    function(){ 
							    	$(this).removeClass('hover'); 
							    } 
							); 	
												
					//ends the callback function.										
					});
				}
													
				function createPatientResultTable(){
					showPageError(true, false, '');
					var oTable = document.createElement('table');			
					var oTBody = document.createElement('tbody');
					oTable.setAttribute("id","patientResultTABLE");		
					oTable.setAttribute("cellPadding","0px");
					oTable.setAttribute("cellSpacing","0px");
					oTable.setAttribute("className","patientResultTABLE");											
					var oTR = document.createElement('tr');
					oTR.setAttribute("className","patientResultTABLETR");
					var oTH = document.createElement('th');	
					oTH.setAttribute("className","patientResultTABLETRTH");		
					oTH.appendChild(document.createTextNode('ID'));							
					oTR.appendChild(oTH);
					var oTH = document.createElement('th');	
					oTH.setAttribute("className","patientResultTABLETRTH");				
					oTH.appendChild(document.createTextNode('FULL NAME'));				
					oTR.appendChild(oTH);
					var oTH = document.createElement('th');		
					oTH.setAttribute("className","patientResultTABLETRTH");			
					oTH.appendChild(document.createTextNode('DOB'));			
					oTR.appendChild(oTH);
					var oTH = document.createElement('th');		
					oTH.setAttribute("className","patientResultTABLETRTH");
					oTH.appendChild(document.createTextNode('SSN'));			
					oTR.appendChild(oTH);
					oTBody.appendChild(oTR);
					oTable.appendChild(oTBody);										
					$('##patientTableResultDIV').empty();
					$('##patientTableResultDIV').append($(oTable));					
				};
				
				function checkRequirementstoAdd(ENTITYID, PATIENTID, FNAME, MNAME, LNAME, DOB, SSN, SEX, POLICYNUMBER){
					var validInsuranceCheck = "";
					
					if(#trim(InsuranceCompanyID)# == 44584){//specifically rules to Texas Medicaid 44584
						validInsuranceCheck = "*Cannot add patient, patient must contain one of the following combinations:<ol><li>Policy Number</li><li>Or SSN and Last Name</li><li>Or SSN and Date of Birth</li><li>Or DOB and Last Name and First Name</li></ol>";
						if(POLICYNUMBER != "" || (SSN != "" && LNAME != "") || (SSN != "" && DOB != "") || (DOB != "" && LNAME != "" && FNAME != "") ){//medicaidID
							validInsuranceCheck = "";
						}						
					}						
					
					//test
					<cfif ListFindNoCase("dev,sta", request.cfservername)>
						if(PATIENTID == 71948){
							validInsuranceCheck = "*Cannot add patient, patient must contain one of the following combinations:<ol><li>Policy Number</li><li>Or SSN and Last Name</li><li>Or SSN and Date of Birth</li><li>Or DOB and Last Name and First Name</li></ol>";
						};
					</cfif>
										
					return validInsuranceCheck;
				};				
				
				function addPatientSelectViewRow(ENTITYID, PATIENTID, FNAME, MNAME, LNAME, DOB, SSN, SEX, POLICYNUMBER){
					var FULLNAME = FNAME + ' ' + MNAME + ' ' + LNAME;					
					var linkErrorString = checkRequirementstoAdd(ENTITYID, PATIENTID, FNAME, MNAME, LNAME, DOB, SSN, SEX, POLICYNUMBER);
					if(linkErrorString == ""){
						var onclickFunction = "showPageError(true, false, '');addPatient(this.parentNode, '" + PATIENTID + "', '" + FULLNAME + "', '" + FNAME + "', '" + LNAME + "', '" + DOB + "', '" + SSN + "', '" + POLICYNUMBER + "');";	
						var thisTDClass = "patientResultTABLETRTD";				
					} else{
						var onclickFunction = "showPageError(false, true, linkErrorString);";	
						var thisTDClass = "patientResultTABLETRTD_Error";
					};
					var oTR = document.createElement('tr');					
					oTR.setAttribute("className","patientResultTABLETR");	
					oTR.onclick = function(){eval(onclickFunction);};							
					var oTD = document.createElement('td');	
					oTD.setAttribute("className",thisTDClass);					
					oTD.appendChild(document.createTextNode(PATIENTID));							
					oTR.appendChild(oTD);
					var oTD = document.createElement('td');
					oTD.setAttribute("className",thisTDClass);				
					oTD.appendChild(document.createTextNode(FULLNAME));				
					oTR.appendChild(oTD);
					var oTD = document.createElement('td');
					oTD.setAttribute("className",thisTDClass);				
					oTD.appendChild(document.createTextNode(DOB));			
					oTR.appendChild(oTD);
					var oTD = document.createElement('td');
					oTD.setAttribute("className",thisTDClass);				
					oTD.appendChild(document.createTextNode(SSN));			
					oTR.appendChild(oTD);					
					$('##patientResultTABLE').append(oTR);						
				};
				
				function checkAddedarray(PATIENTID){
					for (i = 0; i < addedARRAY_INDEX.length; i++){				
						if(addedARRAY_PATIENTID[i] == PATIENTID){
							return true;
						};	
					};
					return false;
				};
				
				function addPatient(row, PATIENTID, FULLNAME, FNAME, LNAME, DOB, SSN, POLICYNUMBER){					
					if(!checkAddedarray(PATIENTID)){
						var i = addedARRAY_INDEX.length;
						date = new Date();
						mon = new String(date.getMonth() + 1);
						if(mon.length == 1)mon = "0" + mon;
						day = new String(date.getDate());
						if(day.length == 1)day = "0" + day;							
						fromDateCreated = mon + "/01/" + date.getFullYear(); 
						toDateCreated = mon + "/" + day + "/" + date.getFullYear(); 
						var FROMDATE = fromDateCreated;
						var TODATE = toDateCreated;
						addedARRAY_INDEX[i] = i;				
						addedARRAY_PATIENTID[i] = PATIENTID;			
						addedARRAY_FULLNAME[i] = FULLNAME;
						addedARRAY_FNAME[i] = FNAME;
						addedARRAY_LNAME[i] = LNAME;
						addedARRAY_DOB[i] = DOB;
						addedARRAY_SSN[i] = SSN;
						addedARRAY_POLICYNUMBER[i] = POLICYNUMBER;
						addedARRAY_FROMDATE[i] = FROMDATE;
						addedARRAY_TODATE[i] = TODATE;						
						createPatientAddedTableComplete();
					};
				};	
				
				function patientAddedAddRows(){		
					if(addedARRAY_INDEX.length > 0){
						for (i = 0; i < addedARRAY_INDEX.length; i++){				
							addPatientAddedRow(addedARRAY_PATIENTID[i], addedARRAY_FULLNAME[i], addedARRAY_FROMDATE[i], addedARRAY_TODATE[i]);	
						};
					};		
				};			

				function createPatientAddedTable(){
					var oTable = document.createElement('table');			
					var oTBody = document.createElement('tbody');
					oTable.setAttribute("id","patientAddedTABLE");		
					oTable.setAttribute("cellPadding","0px");
					oTable.setAttribute("cellSpacing","0px");
					oTable.setAttribute("className","patientAddedTABLE");											
					
					var oTR1 = document.createElement('tr');
					oTR1.setAttribute("className","patientAddedTABLETR");
					var oTH = document.createElement('th');	
					oTH.setAttribute("className","patientAddedTABLETRTH");		
					oTH.setAttribute("colSpan","3");		
					oTH.setAttribute("align","center");				
					oTH.appendChild(document.createTextNode('PATIENTS ADDED TO REQUEST'));				
					oTR1.appendChild(oTH);
					oTBody.appendChild(oTR1);					
					
					var oTR = document.createElement('tr');
					oTR.setAttribute("className","patientAddedTABLETR");
					var oTH1 = document.createElement('th');	
					oTH1.setAttribute("className","patientAddedTABLETRTH");		
					oTH1.appendChild(document.createTextNode('ID'));							
					oTR.appendChild(oTH1);
					var oTH2 = document.createElement('th');	
					oTH2.setAttribute("className","patientAddedTABLETRTH");				
					oTH2.appendChild(document.createTextNode('NAME'));				
					oTR.appendChild(oTH2);					
					oTBody.appendChild(oTR);
					var oTH3 = document.createElement('th');	
					oTH3.setAttribute("className","patientAddedTABLETRTH");	
					oTH3.setAttribute("title","Dates to verify");				
					oTH3.appendChild(document.createTextNode('VERIFY DATES'));				
					oTR.appendChild(oTH3);					
					oTBody.appendChild(oTR);
										
					oTable.appendChild(oTBody);										
					$('##patientAddedDIV').empty();
					$('##patientAddedDIV').append($(oTable));					
				};
				
				function createPatientAddedTableSubmitRow(){					
					var oTR = document.createElement('tr');
					oTR.setAttribute("className","patientAddedTABLETR");
					var oTD = document.createElement('td');	
					oTD.setAttribute("className","patientAddedTABLETRTD");		
					oTD.setAttribute("colSpan","3");			
					oTD.setAttribute("align","center");				
					elem = document.createElement("input"); 
					elem.setAttribute("className","SiteSubmitBox");
					elem.id ='submitButton'; 
					elem.value = 'Submit Verifications'; 
					elem.type = 'button'; 
					elem.onclick = function(){submitVerification()};
					oTD.appendChild(elem);				
					oTR.appendChild(oTD);
					$('##patientAddedTABLE').append(oTR);									
				};

				function createPatientAddedTableInputIDRow(){					
					var oTR = document.createElement('tr');
					oTR.setAttribute("className","patientAddedTABLETR");				
					var oTD = document.createElement('td');	
					oTD.setAttribute("className","patientAddedTABLETRTD");												
					elem = document.createElement("input"); 
					elem.setAttribute("className","siteTextBox");
					elem.id ='dynamicID';
					elem.size = 8; 		 					
					elem.type = 'text'; 					
					oTD.appendChild(elem);				
					oTR.appendChild(oTD);					
					
					var oTD = document.createElement('td');				
					oTD.setAttribute("align","left");				
					elem = document.createElement("input"); 
					elem.setAttribute("className","SiteSubmitBox");
					elem.id ='dynamicAdd'; 												
					elem.value = 'Add ID'; 
					elem.type = 'button'; 
					elem.onclick = function(){addDynamic($("##dynamicID").val())};
					oTD.appendChild(elem);				
					oTR.appendChild(oTD);	
					
					var oTD = document.createElement('td');				
					oTD.setAttribute("align","left");				
					elem = document.createElement("input"); 
					elem.setAttribute("className","SiteSubmitBox");
					elem.id ='addNewPatient'; 												
					elem.value = 'New Patient'; 
					elem.type = 'button'; 
					elem.onclick = function(){addNewPatient('##addNewPatientContainer')};
					oTD.appendChild(elem);				
					oTR.appendChild(oTD);	
									
					$('##patientAddedTABLE').append(oTR);									
				};
				
				function addDynamic(ID){
										
					var data1 = #trim(session.ClientID)#;
					var data2 = #trim(session.User.getUsersID())#; 					
					var data9 = ID;					
					var data11 = #trim(InsuranceCompanyID)#; 			
					
					$.get("#trim(request.urlReconstructed)#/ws/wsPatient.cfc", 
						{ 
							method: "wsSearchPatientsPlainXML",
							dataType: "xml",
							Data1: escape(data1), 
							Data2: escape(data2), 							
							Data9: escape(data9), 		
							Data11: escape(data11), 							
							rand: escape(randNum_JS()) 
						},
					   	function(data){		
							
							//There must be atleast one patient returned.
							if(data.indexOf('<PATIENT>') > 0){
								processAddPatientXML(data);							
							}
							else{
								
								var msg = "*ERROR: ID (" + ID + ") could not be added.";
								showPageError(false, true, msg);
								$("##dynamicID").val('');								
							}			
															
					//ends the callback function.										
					});		
					
				};
				
				function processAddPatientXML(data){
					//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
					if (window.ActiveXObject){
						var doc=new ActiveXObject("Microsoft.XMLDOM");
					  	doc.async="false";
					  	doc.loadXML(data);
					}				
					var x=doc.documentElement;			
																								
					$(x).find('PATIENT').each(function(){								
						var $PATIENT = $(this);
						var dob = $PATIENT.find('DOB').text();	
						var entityID = $PATIENT.find('ENTITYID').text();
						var fname = $PATIENT.find('FNAME').text();	
						var lname = $PATIENT.find('LNAME').text();	
						var mname = $PATIENT.find('MNAME').text();	
						var patientID = $PATIENT.find('PATIENTID').text();	
						var sex = $PATIENT.find('SEX').text();	
						var ssn = $PATIENT.find('SSN').text();									
						var policyNumber = $PATIENT.find('POLICYNUMBER').text();	
						var FULLNAME = fname + ' ' + mname + ' ' + lname;							
						addPatient('', patientID, FULLNAME, fname, lname, dob, ssn, policyNumber);								
					});
				};
								
				function submitVerification(){
					showPageError(true, false, '');				
					if(addedARRAY_INDEX.length == 0){						
						var msg = "*ERROR: You must have at least 1 patient in the request.";
						showPageError(false, false, msg);
						return false;
					}
					
					var submitVerifications = confirm("Are you sure you want to submit these verfications?");			
					if(submitVerifications){								
						var xmlVerifyDS = createVerifyPatientsXml();
						$("##verificatinPatientXML").val(xmlVerifyDS);								
						$("##verificationForm").submit();										
					};						
				};
				
				function createVerifyPatientsXml(){
					var retXml = "<VERIFICATION><CLIENTID>#trim(session.ClientID)#</CLIENTID><USERSID>#session.User.getUsersID()#</USERSID><INSURANCECOMPANYID>#trim(InsuranceCompanyID)#</INSURANCECOMPANYID><PATIENTS>";
					for (i = 0; i < addedARRAY_INDEX.length; i++){				
						retXml = retXml + "<PATIENT>";
						retXml = retXml + "<PATIENTID>" + addedARRAY_PATIENTID[i] + "</PATIENTID>";						
						retXml = retXml + "<FNAME>" + addedARRAY_FNAME[i] + "</FNAME>";
						retXml = retXml + "<LNAME>" + addedARRAY_LNAME[i] + "</LNAME>";
						retXml = retXml + "<DOB>" + addedARRAY_DOB[i] + "</DOB>";
						retXml = retXml + "<SSN>" + addedARRAY_SSN[i] + "</SSN>";
						retXml = retXml + "<POLICYNUMBER>" + addedARRAY_POLICYNUMBER[i] + "</POLICYNUMBER>";
						retXml = retXml + "<VERIFYDATES><FROM>" + addedARRAY_FROMDATE[i] + "</FROM><TO>" + addedARRAY_TODATE[i] + "</TO></VERIFYDATES>";
						retXml = retXml + "</PATIENT>";
					};
					retXml = retXml + "</PATIENTS></VERIFICATION>";
					return retXml;
				};
				
				function addPatientAddedRow(PATIENTID, FULLNAME, FROMDATE, TODATE){									
					var onclickFunction = "removePatientRequest(PATIENTID);";
					var onclickFunction_ChangeDate = "changeDate(this);";					
					var oTR = document.createElement('tr');
					oTR.setAttribute("className","patientAddedTABLETR");											
					
					var oTD = document.createElement('td');	
					oTD.onclick = function(){eval(onclickFunction);};		
					oTD.setAttribute("className","patientAddedTABLETRTD");		
					oTD.setAttribute("id","td_PATIENTID_" + PATIENTID);					
					oTD.appendChild(document.createTextNode(PATIENTID));							
					oTR.appendChild(oTD);
					
					var oTD = document.createElement('td');
					oTD.onclick = function(){eval(onclickFunction);};		
					oTD.setAttribute("className","patientAddedTABLETRTD");				
					oTD.setAttribute("id","td_FULLNAME_" + PATIENTID);
					oTD.appendChild(document.createTextNode(FULLNAME));				
					oTR.appendChild(oTD);						
					
					fromdate = new Date(FROMDATE);
					var mon = fromdate.getMonth() + 1;					
					var day = fromdate.getDate();								
					var fromDate = mon + "/" + day; 					
					todate = new Date(TODATE);
					var mon = fromdate.getMonth() + 1;					
					var day = todate.getDate();								
					var toDate = mon + "/" + day;						
					
					var oTD = document.createElement('td');
					oTD.onclick = function(){eval(onclickFunction_ChangeDate);};		
					oTD.setAttribute("className","patientAddedTABLETRTD");				
					oTD.setAttribute("id","td_DATES_" + PATIENTID);
					oTD.setAttribute("align","center");				
					oTD.appendChild(document.createTextNode(fromDate + " - " + toDate));				
					oTR.appendChild(oTD);										
					$('##patientAddedTABLE').append(oTR);						
				};
				
				function changeDate(elm){										
					var elm_array = elm.id.split("_");								
					$(elm).removeAttr('onclick');				
					$(elm).empty();								
					elem = document.createElement("input"); 
					elem.setAttribute("className","siteTextBox");
					var fromID = 'fromdate_' + elm.id;
					elem.id = fromID;
					elem.size = 8; 		 					
					elem.type = 'text'; 		
					$(elm).append(elem);
					$(elm).append(' - ');
					elem = document.createElement("input"); 
					elem.setAttribute("className","siteTextBox");
					var toID = 'todate_' + elm.id; 
					elem.id = toID;
					elem.size = 8; 		 					
					elem.type = 'text'; 		
					$(elm).append(elem);
					elem = document.createElement("input"); 
					elem.setAttribute("className","SiteSubmitBox");
					elem.id ='dynamicAdd'; 												
					elem.value = 'Save'; 
					elem.type = 'button'; 					
					var onclickFunction = "saveNewDates(" + elm_array[2] + ", $('##" + fromID + "').val(), $('##" + toID + "').val());";					
					elem.onclick = function(){eval(onclickFunction);};
					$(elm).append(elem);								
				};
				
				function saveNewDates(PATIENTID, fromDate, toDate){
					if(isDateJS(fromDate) != true){
						alert("FROM Date: " + isDateJS(fromDate));
						return false;
					};
					if(isDateJS(toDate) != true){
						alert("TO Date: " + isDateJS(toDate));
						return false;
					};
					for (i = 0; i < addedARRAY_INDEX.length; i++){				
						if(addedARRAY_PATIENTID[i] == PATIENTID){
							addedARRAY_FROMDATE[i] = fromDate;
							addedARRAY_TODATE[i] = toDate;
						};	
					};
					createPatientAddedTableComplete();					
				};				
				
				function createPatientAddedTableComplete(){
					$('##patientAddedDIV').empty();
					createPatientAddedTable();
					patientAddedAddRows();
					$("##patientAddedTABLE tbody tr").hover( 
					    function(){ 							        
					        $(this).addClass('hover'); 
					    },  
					    function(){ 
					    	$(this).removeClass('hover'); 
					    } 
					);
					createPatientAddedTableInputIDRow();
					createPatientAddedTableSubmitRow(); 	
				};
				
				function removePatientRequest(PATIENTID){
					var indexToDel = "";
					for (i = 0; i < addedARRAY_INDEX.length; i++){				
						if(addedARRAY_PATIENTID[i] == PATIENTID){
							var indexToDel = i;
							break
						};	
					};
					remove(addedARRAY_INDEX, indexToDel, indexToDel);
					remove(addedARRAY_PATIENTID, indexToDel, indexToDel);
					remove(addedARRAY_FULLNAME, indexToDel, indexToDel);
					remove(addedARRAY_FNAME, indexToDel, indexToDel);
					remove(addedARRAY_LNAME, indexToDel, indexToDel);
					remove(addedARRAY_DOB, indexToDel, indexToDel);
					remove(addedARRAY_SSN, indexToDel, indexToDel);
					remove(addedARRAY_POLICYNUMBER, indexToDel, indexToDel);
					remove(addedARRAY_FROMDATE, indexToDel, indexToDel);
					remove(addedARRAY_TODATE, indexToDel, indexToDel);
					
					createPatientAddedTableComplete();					 					
				};
				
				function remove(array, from, to) {
					var rest = array.slice((to || from) + 1 || array.length);
					array.length = from < 0 ? array.length + from : from;
					return array.push.apply(array, rest);
				};
				
				$(document).ready(function() {	
					
					createPatientResultTable();
					createPatientAddedTable();
					createPatientAddedTableInputIDRow();
					createPatientAddedTableSubmitRow(); 					
					loopPatientSet();
				});
			
				location.hash = window.pageXOffset; 
				
				function loopPatientSet(){					
					var data1 = #trim(session.ClientID)#;
					var data2 = #trim(session.User.getUsersID())#; 					
					var data3 = "#trim(variables.presetPatientIDs)#";				
					
					if(data3 != ""){
						
						$.get("#trim(request.urlReconstructed)#/ws/wsPatient.cfc", 
						{ 
							method: "wsGetPatientGroupsXML",
							dataType: "xml",
							Data1: escape(data1), 
							Data2: escape(data2), 							
							Data3: escape(data3),							
							rand: escape(randNum_JS()) 
						},
					   	function(data){		
							//alert(trimJS(data));
							//There must be atleast one patient returned.
							if(data.indexOf('<PATIENT>') > 0){
								processAddPatientXML(data);							
							}
							else{							
								var msg = "*ERROR: ID (" + ID + ") could not be added.";
								showPageError(false, true, msg);
								$("##dynamicID").val('');								
							}			
																
						//ends the callback function.										
						});		
					
					};
					
				};
								
			</script>			
						
			<div id="mainContainer">			
						
				<div id="pageError"></div> 							
						
				<div id="searchPatientMain" align="center" class="float">				
					<table border="0" width="50%" cellpadding="0" cellspacing="0">													
						<tr id="tr_errorMsg" style="display:none">
							<td colspan="3" align="center">
								<div id="yellowAlert" class="yecerrbg" style="display:block">
									<table cellpadding="2" cellspacing="0" border="0" width="540">
										<tr valign="top">
											<td>
												<img src="images/alert.gif" alt="Alert" border="0" width="41" height="42" align="middle">
											</td>
											<td valign="top" class="siteLabel">
												<b>Please correct the following entries.</b>
												<ul>
													<span id="sp_errorMsg"></span>										
									 			</ul>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>								
						<tr>
							<td>
								<cf_gcBorderedTable	title="Search&nbsp;Patients" tablealign="left" tableWidth="100%">	
									<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">	
										<input type="Hidden" id="insuranceCompanyID" name="insuranceCompanyID" value="#trim(insuranceCompanyID)#"><!--- Medicaid (texas insuranceCompanyID) --->																							
										<table align="center" cellpadding="5" cellspacing="0" border="0">				
											<tr>					
												<td valign="top">			   
									   			
													<table cellspacing="4" cellpadding="3" border="0">															
														
														<tr>
														    <td align="right" class="siteLabel">
																First&nbsp;Name:
															</td>	
															<td class="siteLabel">
																<input type="Text" size="25" class="siteTextBox" name="FName" id="FName">
															</td>							   
														</tr>
														<tr>
														    <td align="right" class="siteLabel">
																Last&nbsp;Name:
															</td>	
															<td class="siteLabel">
																<input type="Text" size="25" class="siteTextBox" name="LName" id="LName" value="">
															</td>							   
														</tr>
														<tr>
														    <td align="right" class="siteLabel">
																SSN:
															</td>	
															<td class="siteLabel">
																<input type="Text" size="25" class="siteTextBox" name="SSN" id="SSN">
															</td>							   
														</tr>
														<tr>
														    <td align="right" class="siteLabel">
																Patient&nbsp;ID:
															</td>	
															<td class="siteLabel">
																<input type="Text" size="25" class="siteTextBox" name="patientID" id="patientID">
															</td>							   
														</tr>
														<tr>
														    <td align="right" class="siteLabel">
																Ins.&nbsp;Pol&nbsp;ID:
															</td>	
															<td class="siteLabel">
																<input type="Text" size="25" class="siteTextBox" name="InsurancePolicyID" id="InsurancePolicyID">
															</td>							   
														</tr>																																						
														<tr>
														    <td colspan="2" align="center"><input type="Button" class="SiteSubmitbox" value="Search" id="searchButton" onclick="validateForm();"></td>							   
														</tr>													
													</table>												
												</td>						
											</tr>
										</table>										
									</form>
								</cf_gcBorderedTable>
							</td>
						</tr>
					</table>	
				</div>
												
				<div id="patientTableResultDIV" class="float"></div>
				<div id="patientAddedDIV" class="float"></div>		
							
			</div>
			
			<form name="verificationForm" id="verificationForm" action="appVerificationProcess.cfm" method="post">
				<input type="Hidden" name="verificatinPatientXML" id="verificatinPatientXML" value="">
			</form>

			<cfinclude template="tagAddNewPatientMask.cfm">
			
		</cfoutput>
	
						
	</cfif>		
	
	
<!---<cfsetting showdebugoutput="No">	--->






<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationBottom.cfm";
</cfscript>





	
	