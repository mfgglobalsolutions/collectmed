/* tagVerificationTXMedicaid.js*/

var npiUsed = "";

function new_parseXmlBuild(xml, showNum, empty) {	
	
	//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
	if (window.ActiveXObject){
		var doc=new ActiveXObject("Microsoft.XMLDOM");
	  	doc.async="false";
	  	doc.loadXML(xml);
	}				
	
	var showCount = 0;		
	var showNumArray = showNum.split(',');	
	var x=doc.documentElement;			
		
	npiUsed = $(x).find('npi').text();
	
	$(x).find('patient').each(function(){								
		var $patient = $(this);
		showCount = showCount + 1;
		if(showNumArray[0] == 0 || checkArray(showNumArray, showCount)){
			new_parseXmlBuildTBL($patient, empty);
		};	
	});	
}


function new_parseXmlBuildTBL(xml, empty) {		    		    	
	$(document).ready(function(){
		
		var patientID = xml.find('patientid').text();
		var patientAddress = "";
		var patientClientNoTraineeSSN = "";
		var patientMedicareNo = "";
		var patientGender = "";
		var patientDOB = "";
		
		var eligibilityFrom = xml.find('datetimeperiod').text().split('-')[0];
		var eligibilityThrough = xml.find('datetimeperiod').text().split('-')[1];
		
		eligibilityFrom = eligibilityFrom.split('')[4] + eligibilityFrom.split('')[5] + '/' + eligibilityFrom.split('')[6] + eligibilityFrom.split('')[7] + '/' + eligibilityFrom.split('')[0] + eligibilityFrom.split('')[1] + eligibilityFrom.split('')[2] + eligibilityFrom.split('')[3]; 
		eligibilityThrough = eligibilityThrough.split('')[4] + eligibilityThrough.split('')[5] + '/' + eligibilityThrough.split('')[6] + eligibilityThrough.split('')[7] + '/' + eligibilityThrough.split('')[0] + eligibilityThrough.split('')[1] + eligibilityThrough.split('')[2] + eligibilityThrough.split('')[3]; 
			
		$(xml).find('patient271').each(function(){
								
			$(this).children('nm1').each(function(){
				if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1){ //nm1_01 = "IL" lets us know that we are in the 2100C loop. nm1_02 = "1" Lets us know that this is a person.
					//Patient Address
					$(this).children('n3').each(function(){
						patientAddress = patientAddress + $(this).children('n3_01').text();
						if($(this).children('n3_02').text() != ""){
							patientAddress = patientAddress + $(this).children('n3_02').text();
						}	
					});					
					$(this).children('n4').each(function(){					
						patientAddress = patientAddress + ', ' + $(this).children('n4_01').text();
						patientAddress = patientAddress + ', ' + $(this).children('n4_02').text();
						patientAddress = patientAddress + ' ' + $(this).children('n4_03').text();
						
					});
					
					$(this).children('nm1_09').each(function(){					
						patientClientNoTraineeSSN = $(this).text();
						
					});
					
					$(this).children('ref').each(function(){					
						if($(this).children('ref_01').text() == "F6"){ 
							patientMedicareNo = $(this).children('ref_02').text();					
						}
					});
					
					$(this).children('dmg').each(function(){					
						if($(this).children('dmg_03').text() != ""){ 
							patientGender = $(this).children('dmg_03').text();					
						}
					});
										
					$(this).children('dmg').each(function(){					
						if($(this).children('dmg_02').text() != ""){ 
							patientDOB = $(this).children('dmg_02').text();	
							patientDOB = patientDOB.split('')[4] + patientDOB.split('')[5] + '/' + patientDOB.split('')[6] + patientDOB.split('')[7] + '/' + patientDOB.split('')[0] + patientDOB.split('')[1] + patientDOB.split('')[2] + patientDOB.split('')[3]; 
						}
					});
					
				}; //<!--- END if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1) --->
			}); //<!--- END $(this).children('nm1').each(function() --->			
			
						
			//INDIV OUTS
			var basePlan = '';	
			$(this).children('nm1').each(function(){
				if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1){ //nm1_01 = "IL" lets us know that we are in the 2100C loop. nm1_02 = "1" Lets us know that this is a person.
					$(this).children('eb').each(function(){					
						if($(this).children('eb_01').text() == "1" && $(this).children('eb_03').text() == "30"){ 				
							basePlan = $(this).children('eb_05').text();							
						}
					});						
				}; //<!--- END if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1) --->
			}); //<!--- END $(this).children('nm1').each(function() --->		
						
			
			var new_table = "<div id=\"Patient_" + patientID + "\" class=\"patientSection\">";
			
			new_table = new_table + "<div class=\"blockClearBoth sectionHeader\"><a href=\"javascript:void(0);\" id=\"showHidePatientElements_" + patientID + "\" class=\"showHidePatientElements\">" + xml.find('fname').text() + " " + xml.find('lname').text() + "</a><br>" + basePlan + "</div>";	
						
			new_table = new_table + "<div id=\"showHidePatient_" + patientID + "\" class=\"showHidePatient\">";
						
			new_table = new_table + "<div class=\"patientInformationConatiner\"><div class=\"mainContainerSectionLeft\">"
				+	"<div class=\"blockClearBoth sectionHeader\">"
				+	"	Patient Information"
				+	"</div>"	
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Client No./Trainee SSN</span>"
				+	"	<span class=\"sectionValue\">" + patientClientNoTraineeSSN + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">DOB</span>"
				+	"	<span class=\"sectionValue\">" + patientDOB + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Gender</span>"
				+	"	<span class=\"sectionValue\">" + patientGender + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">SSN</span>"
				+	"	<span class=\"sectionValue\"></span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Name</span>"
				+	"	<span class=\"sectionValue\">" + xml.find('fname').text().toUpperCase() + " " + xml.find('lname').text().toUpperCase() + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Address</span>"
				+	"	<span class=\"sectionValue smallFont\">" + patientAddress + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">County</span>"
				+	"	<span class=\"sectionValue\"></span>"
				+	"</div>	"	
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Medicare No.</span>"
				+	"	<span class=\"sectionValue\">" + patientMedicareNo + "</span>"
				+	"</div>	"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Base Plan</span>"
				+	"	<span class=\"sectionValue\">" + basePlan + "</span>"
				+	"</div>	"					
			+	"</div>";
	
			new_table = new_table
			+	"<div class=\"mainContainerSectionRight\">"
				+	"<div class=\"blockClearBoth sectionHeader\">"
				+	"	Inquiry Information"
				+	"</div>	"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">NPI/API</span>"
				+	"	<span class=\"sectionValue\">" + npiUsed + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Eligibility From</span>"
				+	"	<span class=\"sectionValue\">" + eligibilityFrom + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Eligibility Through</span>"
				+	"	<span class=\"sectionValue\">" + eligibilityThrough + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Medicaid / Client No.</span>"
				+	"	<span class=\"sectionValue\">" + xml.find('id').text() + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Social Security Number</span>"
				+	"	<span class=\"sectionValue\">" + xml.find('ssn').text() + "</span>"
				+	"</div>"	
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Date of Birth</span>"
				+	"	<span class=\"sectionValue\">" + xml.find('dob').text() + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">Last Name</span>"
				+	"	<span class=\"sectionValue\">" + xml.find('lname').text() + "</span>"
				+	"</div>"
				+	"<div class=\"blockClearBoth\">"
				+	"	<span class=\"sectionLabel\">First Name</span>"
				+	"	<span class=\"sectionValue\">" + xml.find('fname').text() + "</span>"
				+	"</div>"									
			+	"</div></div>";
			
			$(this).children('nm1').each(function(){
				if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1){ //nm1_01 = "IL" lets us know that we are in the 2100C loop. nm1_02 = "1" Lets us know that this is a person.

					new_table = new_table
					+	"<div>&nbsp;</div>"
					+	"<div id=\"eligibilityDiv\" class=\"blockClearBoth\">"
						+	"<div class=\"blockClearBoth sectionHeader\">"
						+	"	Eligibility Segments"
						+	"</div>	"
						+	"<table id=\"eligibilityTable\">"
						+	"<tr>"
						+	"	<th >Segment Dates</th>"
						+	"	<th>Medical Coverage</th>"
						+	"	<th>Program Type</th>"
						+	"	<th>Program</th>"
						+	"	<th>Benefit Plan</th>"
						+	"	<th>Spend-down Indicator</th>"						
						+	"</tr>";
					
					//EB Eligibility Segments
					$(this).children('eb').each(function(){	
						
					//MEDICAID
						if($(this).children('eb_01').text() == "1" && $(this).children('eb_04').text() == "MC"){ 				
						//if($(this).children('eb_04').text() != "MB" && $(this).children('eb_04').text() != "MA"){ 	
							var addedDate;
							var eligibilityBegin;
							var eligibilityEnd;
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "318"){
									addedDate = $(this).children('dtp_03').text();	
									addedDate = addedDate.split('')[4] + addedDate.split('')[5] + '/' + addedDate.split('')[6] + addedDate.split('')[7] + '/' + addedDate.split('')[0] + addedDate.split('')[1] + addedDate.split('')[2] + addedDate.split('')[3];
								}
							})
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "356"){
									eligibilityBegin = $(this).children('dtp_03').text();	
									eligibilityBegin = eligibilityBegin.split('')[4] + eligibilityBegin.split('')[5] + '/' + eligibilityBegin.split('')[6] + eligibilityBegin.split('')[7] + '/' + eligibilityBegin.split('')[0] + eligibilityBegin.split('')[1] + eligibilityBegin.split('')[2] + eligibilityBegin.split('')[3];
								}
							})
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "357"){
									eligibilityEnd = $(this).children('dtp_03').text();	
									eligibilityEnd = eligibilityEnd.split('')[4] + eligibilityEnd.split('')[5] + '/' + eligibilityEnd.split('')[6] + eligibilityEnd.split('')[7] + '/' + eligibilityEnd.split('')[0] + eligibilityEnd.split('')[1] + eligibilityEnd.split('')[2] + eligibilityEnd.split('')[3];
								}
							})							
							
							var eligibilityMedicalCoverage = "&nbsp;";
							$(this).children('msg').each(function(){
								if($(this).children('msg_01').text().indexOf('SSI') > 0){
									eligibilityMedicalCoverage = $(this).children('msg_01').text();	
								}
							})
					
							var eligibilitySpendDown = "&nbsp;";
							$(this).children('msg').each(function(){
								if($(this).children('msg_01').text().length == 1){
									eligibilitySpendDown = $(this).children('msg_01').text();	
								}
							})							
							
							var eligibilityProgram = "&nbsp;";
							var eligibilityProgramType = "&nbsp;";
							$(this).children('msg').each(function(){
								if($(this).children('msg_01').text().indexOf('REGULAR') > 0){
									eligibilityPro = $(this).children('msg_01').text().split(" ");	
									eligibilityProgram = eligibilityPro[0];
									eligibilityProgramType = eligibilityPro[1];
								}
							})							
							
							new_table = new_table
								+	"<tr>"
								+	"	<td>EFF : " + eligibilityBegin + "<br>TRM : " + eligibilityEnd + "<br>ADD : " + addedDate + "</td>"
								+	"	<td>" + eligibilityMedicalCoverage + "</td>"
								+	"	<td>" + eligibilityProgramType + "</td>"
								+	"	<td>" + eligibilityProgram + "</td>"
								+	"	<td>" + $(this).children('eb_05').text() + "</td>"
								+	"	<td>" + eligibilitySpendDown + "</td>"
								+	"</tr>";
						}
					});	
					
					new_table = new_table
								+	"</table>"
							+	"</div>";
					
					
					
					
					//MEDICARE SEGMENT
					new_table = new_table
					+	"<div>&nbsp;</div>"
					+	"<div id=\"medicareDiv\" class=\"blockClearBoth\">"
						+	"<div class=\"blockClearBoth sectionHeader\">"
						+	"	Medicare Segments"
						+	"</div>	"
						+	"<table id=\"medicareTable\">"
						+	"<tr>"
						+	"	<th>Segment Dates</th>"
						+	"	<th>Medicare Type</th>"
						+	"	<th>Contract ID</th>"
						+	"	<th>Contract ID Link</th>"		
						+	"</tr>";
					
					//MEDICARE PART A
					$(this).children('eb').each(function(){					
						if($(this).children('eb_01').text() == "R" && $(this).children('eb_04').text() == "MA"){ 				
							var addedDate;
							var medicareBegin;
							var medicareEnd;
							var medicareType = "&nbsp;";
							var medicareContractID = "&nbsp;";
							var medicareContractIDLink = "&nbsp;";							
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "318"){
									addedDate = $(this).children('dtp_03').text();	
									addedDate = addedDate.split('')[4] + addedDate.split('')[5] + '/' + addedDate.split('')[6] + addedDate.split('')[7] + '/' + addedDate.split('')[0] + addedDate.split('')[1] + addedDate.split('')[2] + addedDate.split('')[3];
								}
							})
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "356"){
									medicareBegin = $(this).children('dtp_03').text();	
									medicareBegin = medicareBegin.split('')[4] + medicareBegin.split('')[5] + '/' + medicareBegin.split('')[6] + medicareBegin.split('')[7] + '/' + medicareBegin.split('')[0] + medicareBegin.split('')[1] + medicareBegin.split('')[2] + medicareBegin.split('')[3];
								}
							})
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "357"){
									medicareEnd = $(this).children('dtp_03').text();	
									medicareEnd = medicareEnd.split('')[4] + medicareEnd.split('')[5] + '/' + medicareEnd.split('')[6] + medicareEnd.split('')[7] + '/' + medicareEnd.split('')[0] + medicareEnd.split('')[1] + medicareEnd.split('')[2] + medicareEnd.split('')[3];
								}
							})							
							new_table = new_table							
							+	"<tr>"
							+	"	<td>EFF : " + medicareBegin + "<br>TRM : " + medicareEnd + "<br>ADD : " + addedDate + "</td>"
							+	"	<td>A</td>"
							+	"	<td>" + medicareContractID + "</td>"
							+	"	<td>" + medicareContractIDLink + "</td>"
							+	"</tr>";
						}
					});						
					
					//MEDICARE PART B
					$(this).children('eb').each(function(){					
						if($(this).children('eb_01').text() == "R" && $(this).children('eb_04').text() == "MB"){ 							
							var addedDate;
							var medicareBegin;
							var medicareEnd;
							var medicareType = "&nbsp;";
							var medicareContractID = "&nbsp;";
							var medicareContractIDLink = "&nbsp;";							
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "318"){
									addedDate = $(this).children('dtp_03').text();	
									addedDate = addedDate.split('')[4] + addedDate.split('')[5] + '/' + addedDate.split('')[6] + addedDate.split('')[7] + '/' + addedDate.split('')[0] + addedDate.split('')[1] + addedDate.split('')[2] + addedDate.split('')[3];
								}
							})
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "356"){
									medicareBegin = $(this).children('dtp_03').text();	
									medicareBegin = medicareBegin.split('')[4] + medicareBegin.split('')[5] + '/' + medicareBegin.split('')[6] + medicareBegin.split('')[7] + '/' + medicareBegin.split('')[0] + medicareBegin.split('')[1] + medicareBegin.split('')[2] + medicareBegin.split('')[3];
								}
							})
							$(this).children('dtp').each(function(){
								if($(this).children('dtp_01').text() == "357"){
									medicareEnd = $(this).children('dtp_03').text();	
									medicareEnd = medicareEnd.split('')[4] + medicareEnd.split('')[5] + '/' + medicareEnd.split('')[6] + medicareEnd.split('')[7] + '/' + medicareEnd.split('')[0] + medicareEnd.split('')[1] + medicareEnd.split('')[2] + medicareEnd.split('')[3];
								}
							})							
							new_table = new_table							
							+	"<tr>"
							+	"	<td>EFF : " + medicareBegin + "<br>TRM : " + medicareEnd + "<br>ADD : " + addedDate + "</td>"
							+	"	<td>B</td>"
							+	"	<td>" + medicareContractID + "</td>"
							+	"	<td>" + medicareContractIDLink + "</td>"
							+	"</tr>";
						}
					});						
					
				new_table = new_table
					+	"</table>"
				+	"</div>";

				
				
				//TPR SEGMENTS				
				new_table = new_table
				+	"<div>&nbsp;</div>"
				+	"<div id=\"tprDiv\" class=\"blockClearBoth\">"					
					+	"<div class=\"blockClearBoth sectionHeader\">"
					+	"	TPR Segments"
					+	"</div>	"
					+	"<table id=\"tprTable\">"
					+	"<tr>"
					+	"	<th>Segment Dates</th>"
					+	"	<th>Name</th>"
					+	"	<th>Address</th>"
					+	"	<th>Phone</th>"		
					+	"	<th>Additional Information</th>"
					+	"</tr>";
				
				
				$(this).children('eb').each(function(){					
					if($(this).children('eb_01').text() == "R" && $(this).children('eb_04').text() == "OT" && $(this).children('nm1').children('nm1_01').text() == "IL"){
						var periodStart = '&nbsp;';
						var periodEnd = '&nbsp;';
						var tprName = '&nbsp;';
						var tprAddress = '&nbsp;';
						var tprPhone = '&nbsp;';
						var tprAddinfo = '&nbsp;';
						var infoInsuranceName = '&nbsp;';
						var infoInsuredId = '&nbsp;';
						var infoRelation = 'Employee';
						var infoEmployer = '&nbsp;';
						var infoGroup = '&nbsp;';
						var infoCoverageCode = '&nbsp;';
						
						tprName = $(this).children('nm1').children('nm1_04').text() + " " + $(this).children('nm1').children('nm1_03').text();
						infoCoverageCode = $(this).children('eb_05').text();
						infoInsuredId = $(this).children('nm1').children('nm1_09').text();
						
						//This ref
						$(this).children('ref').each(function(){
							if($(this).children('ref_01').text() == "6P"){
								infoGroup = $(this).children('ref_02').text();
							}
						})						
												
						$(this).parent().children('eb').each(function(){					
							if($(this).children('eb_01').text() == "R" && $(this).children('eb_04').text() == "OT" && $(this).children('nm1').children('nm1_01').text() == "PR"){
								var innerGroupNumber = '123';
								$(this).children('ref').each(function(){
									if($(this).children('ref_01').text() == "6P"){
										innerGroupNumber = $(this).children('ref_02').text();
										if(innerGroupNumber == infoGroup){
											infoInsuranceName = $(this).parent().children('nm1').children('nm1_03').text();											
											infoEmployer = $(this).children('ref_03').text();	
											var infoZipCode = $(this).parent().children('n4').children('n4_03').text();	
											if(infoZipCode.length == 9){
												infoZipCode = infoZipCode.split('')[0] + infoZipCode.split('')[1] + infoZipCode.split('')[2] + infoZipCode.split('')[3] + infoZipCode.split('')[4]  + '-' +  infoZipCode.split('')[5] + infoZipCode.split('')[6] + infoZipCode.split('')[7] + infoZipCode.split('')[8];
											}
											else{
												infoZipCode = infoZipCode.split('')[0] + infoZipCode.split('')[1] + infoZipCode.split('')[2] + infoZipCode.split('')[3] + infoZipCode.split('')[4];
											};
											tprAddress = $(this).parent().children('n3').children('n3_01').text() + "</br>" + $(this).parent().children('n4').children('n4_01').text() + ", "  + $(this).parent().children('n4').children('n4_02').text() + " " + infoZipCode;
											$(this).parent().children('per').each(function(){	
												if($(this).children('per_03').text() == "FX" || $(this).children('per_03').text() == "TE" || $(this).children('per_03').text() == "WP"){
													tprPhoneText = ($(this).children('per_04').text());
													tprPhone = tprPhone + "(" + tprPhoneText.split('')[0] + tprPhoneText.split('')[1] + tprPhoneText.split('')[2] + ") " + tprPhoneText.split('')[3] + tprPhoneText.split('')[4] + tprPhoneText.split('')[5] + "-" + + tprPhoneText.split('')[6] + tprPhoneText.split('')[7] + tprPhoneText.split('')[8] + tprPhoneText.split('')[9] + "</br>";
												}
												else{
													tprPhone = tprPhone + ($(this).children('per_04').text()) + "</br>";													
												}
											});	
										}
									}
								})	
								
							}							
						});	
						
						$(this).children('dtp').each(function(){
							if($(this).children('dtp_01').text() == "193"){
								periodStart = $(this).children('dtp_03').text();	
								periodStart = periodStart.split('')[4] + periodStart.split('')[5] + '/' + periodStart.split('')[6] + periodStart.split('')[7] + '/' + periodStart.split('')[0] + periodStart.split('')[1] + periodStart.split('')[2] + periodStart.split('')[3];
							}
						})
						$(this).children('dtp').each(function(){
							if($(this).children('dtp_01').text() == "194"){
								periodEnd = $(this).children('dtp_03').text();	
								periodEnd = periodEnd.split('')[4] + periodEnd.split('')[5] + '/' + periodEnd.split('')[6] + periodEnd.split('')[7] + '/' + periodEnd.split('')[0] + periodEnd.split('')[1] + periodEnd.split('')[2] + periodEnd.split('')[3];
							}
						})	
						
						tprAddinfo = "Insurance Company: " + infoInsuranceName + "</br>Insured's ID No. / SSN: " + infoInsuredId + "</br>Relation: " + infoRelation + "</br>Employer: " + infoEmployer + "</br>Group: " + infoGroup + "</br>Coverage Code: " + infoCoverageCode; 
						
						new_table = new_table							
						+	"<tr>"
						+	"	<td>EFF : " + periodStart + "<br>TRM : " + periodEnd + "</td>"
						+	"	<td>" + tprName + "</td>"
						+	"	<td>" + tprAddress + "</td>"
						+	"	<td>" + tprPhone + "</td>"
						+	"	<td>" + tprAddinfo + "</td>"
						+	"</tr>";
					}
				});						
								
				new_table = new_table
					+	"</table>"
				+	"</div>";

				
				
				
				
				//LIMITATIONS
				$(this).children('eb').each(function(){						
					if($(this).children('eb_01').text() == "F"){ 				
						
						var tempLimitation = "";
						var limitationDate = "";
						var limitationDental = "";
						var limitationHearing = "";
						var limitationEyeExam = "";
						var limitationEyeGlasses = "";
						var limitationMedical = "";
						
						$(this).children('dtp').each(function(){
							if($(this).children('dtp_01').text() == "304"){
								limitationDate = $(this).children('dtp_03').text();	
								limitationDate = limitationDate.split('')[4] + limitationDate.split('')[5] + '/' + limitationDate.split('')[6] + limitationDate.split('')[7] + '/' + limitationDate.split('')[0] + limitationDate.split('')[1] + limitationDate.split('')[2] + limitationDate.split('')[3];
							}
						})
						
						var code = $(this).children('eb_03').text();
						if(code == "AL"){
							limitationEyeExam = limitationDate;
						}
						else if(code == "AM"){
							limitationEyeGlasses = limitationDate;
						}
						else{
							tempLimitation = " Code: " + code + " Date:" + limitationDate;
						}
						
						new_table = new_table
						+	"<div>&nbsp;</div>"
						+	"<div id=\"limitationDiv\" class=\"blockClearBoth\">"
							+	"<div class=\"blockClearBoth sectionHeader\">"
							+	"	Limits Segments" + tempLimitation
							+	"</div>	"
							+	"<table id=\"limitationTable\">"
							+	"<tr>"
							+	"	<th>Dental</th>"
							+	"	<th>Hearing Aid</th>"
							+	"	<th>Eye Exam</th>"
							+	"	<th>Eye Glasses</th>"
							+	"	<th>Medical</th>"				
							+	"</tr>"
							+	"<tr>"
							+	"	<td>" + limitationDental + "</td>"
							+	"	<td>" + limitationHearing + "</td>"
							+	"	<td>" + limitationEyeExam + "</td>"
							+	"	<td>" + limitationEyeGlasses + "</td>"
							+	"	<td>" + limitationMedical + "</td>"
							+	"</tr>"
							+	"</table>"
						+	"</div>";
					}
				});					
				
				
				
				
					
				}; //<!--- END if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1) --->
			}); //<!--- END $(this).children('nm1').each(function() --->
			
			
			new_table = new_table + "</div>"; //showHidePatient_ close			
			
			new_table = new_table + "</div><p></p>"; //patientSection close.
			
			
			if(empty){
				$('#mainContainer').empty();
			};
			$('#mainContainer').append(new_table);  												    		
					    		
		}); //<!--- END $(xml).find('patient271').each(function() --->
		
	});
};










/********************************************************* OLD CODE BELOW **********************************************************************************/


























function parseXmlBuild(xml, showNum, empty) {	
	
	//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
	if (window.ActiveXObject){
		var doc=new ActiveXObject("Microsoft.XMLDOM");
	  	doc.async="false";
	  	doc.loadXML(xml);
	}				
	
	var showCount = 0;		
	var showNumArray = showNum.split(',');	
	var x=doc.documentElement;			
											
	$(x).find('patient').each(function(){								
		var $patient = $(this);
		showCount = showCount + 1;
		if(showNumArray[0] == 0 || checkArray(showNumArray, showCount)){
			parseXmlBuildTBL($patient, empty);
		};	
	});	
}

function checkArray(arr, ind){
	for (i=0; i<arr.length; i++){					
		if(arr[i] == ind){
			return true;
		};						  
	};	
	return false
};

function parseXmlBuildTBL(xml, empty) {		    		    	
	$(document).ready(function(){
		
		var patientID = xml.find('patientid').text();
		var table = $("#patientTable");
		
		$(xml).find('patient271').each(function(){
			
			//<!--- Main table 2000C  --->
			var Main2000Cloop_CONTAINER_TBL = $("<table id='Main2000Cloop_CONTAINER_TBL_" + patientID + "'></table>"); 
					
			//<!--- PAT 2000C loop  --->
			var PAT2000Cloop_CONTAINER_TBL = $("<table id='PAT2000Cloop_CONTAINER_TBL_" + patientID + "'></table>"); 
			PAT2000Cloop_CONTAINER_TBL.append('<tr></tr>');
			var tr = $('tr:last', PAT2000Cloop_CONTAINER_TBL);									
			tr.append('<td></td>');	
			
			var PAT2000Cloop_TBL = $("<table id='PAT2000Cloop_TBL_" + patientID + "'></table>"); 
			PAT2000Cloop_TBL.append('<tr id="PAT2000Cloopheader_' + patientID + '" class="tbl_trBG"></tr>');
			var tr = $('tr:last', PAT2000Cloop_TBL);	
			tr.append('<td colspan="13" class="tbl_fontSize tdPaddingTitle">PATIENT&nbsp;INFORMATION</td>');
			
			PAT2000Cloop_TBL.append('<tr></tr>');
			var tr = $('tr:last', PAT2000Cloop_TBL);									
			tr.append('<td class="tbl_fontSize tbl_trBG">PATIENT ID: </td>');
			tr.append('<td class="tbl_fontSize tbl_dataCellBG">' + patientID + '</td>');
			tr.append('<td class="tbl_fontSize tbl_trBG">FIRST NAME: </td>');
			tr.append('<td class="tbl_fontSize tbl_dataCellBG">' + (xml.find('fname').text() || "&nbsp;") + '</td>');
			tr.append('<td class="tbl_fontSize tbl_trBG">LAST NAME: </td>');
			tr.append('<td class="tbl_fontSize tbl_dataCellBG">' + (xml.find('lname').text() || "&nbsp;") + '</td>');
			tr.append('<td class="tbl_fontSize" colspan="9">&nbsp;</td>');
			
			PAT2000Cloop_TBL.append('<tr></tr>');
			var tr = $('tr:last', PAT2000Cloop_TBL);					
			tr.append('<td class="tbl_fontSize tbl_trBG">SSN: </td>');
			tr.append('<td class="tbl_fontSize tbl_dataCellBG">' + (xml.find('ssn').text() || "&nbsp;") + '</td>');
			tr.append('<td class="tbl_fontSize tbl_trBG">DOB: </td>');
			tr.append('<td class="tbl_fontSize tbl_dataCellBG">' + (xml.find('dob').text() || "&nbsp;") + '</td>');
			tr.append('<td class="tbl_fontSize" colspan="11">&nbsp;</td>');
											
			//<!--- NM1 2100C loop  --->
			var NM12100Cloop_CONTAINER_TBL = $("<table class='text' id='NM12100Cloop_CONTAINER_TBL_" + patientID + "'></table>"); 
			NM12100Cloop_CONTAINER_TBL.append('<tr></tr>');
			var tr = $('tr:last', NM12100Cloop_CONTAINER_TBL);									
			tr.append('<td></td>');									
			var NM12100Cloop_count = 0;
			
			$(this).children('nm1').each(function(){
				if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1){ //nm1_01 = "IL" lets us know that we are in the 2100C loop. nm1_02 = "1" Lets us know that this is a person.
			 							
					NM12100Cloop_count = NM12100Cloop_count + 1;
							
					var NM12100Cloop_TBL = $("<table class='tblCellBorder' id='NM12100Cloop_TBL_" + NM12100Cloop_count + "'></table>"); 
							
					NM12100Cloop_TBL.append('<tr class="tbl_trBG" id="NM12100Cloopheader_' + NM12100Cloop_count + '"></tr>');
					var tr = $('tr:last', NM12100Cloop_TBL);	
					tr.append('<td colspan="13" class="tbl_fontSize oneHundredWidth">SUBSCRIBER&nbsp;NAME&nbsp;INFORMATION</td>');
					
					NM12100Cloop_TBL.append('<tr></tr>');
					var tr = $('tr:last', NM12100Cloop_TBL);
					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'NM1 - SUBSCRIBER NAME<br>X12 Segment Name: Individual or Organizational Name\');" onmouseout="hideTip(this);">NM1:</td>');									
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Entity Identifier Code<br>IL - Insured or Subscriber\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_01').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Entity Type Qualifier<br>1 - Person\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_02').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Name Last or Organization Name\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_03').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Name First\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_04').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Name Middle\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_05').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Name Prefix\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_06').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Name Suffix\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_07').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Identification Code Qualifier<br>MI - Member Identification Number<br>ZZ - Mutually Defined\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_08').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Identification Code\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_09').text() || "&nbsp;") + '</td>');
					tr.append('<td class="tbl_fontSize" colspan="3">&nbsp;</td>');
					
					$(this).children('ref').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);									
    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'REF - REF - SUBSCRIBER ADDITIONAL IDENTIFICATION<br>X12 Segment Name: Reference Information\');" onmouseout="hideTip(this);">REF:</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ref_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ref_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ref_03').text() || "&nbsp;") + '</td>');								
						tr.append('<td class="tbl_fontSize" colspan="9">&nbsp;</td>');
					});
					
					$(this).children('n3').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);									
    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'N3 - SUBSCRIBER ADDRESS<br>X12 Segment Name: Party Location\');" onmouseout="hideTip(this);">N3:</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" colspan="5" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n3_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" colspan="4" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n3_02').text() || "&nbsp;") + '</td>');														
						tr.append('<td class="tbl_fontSize" colspan="1">&nbsp;</td>');
					});
					
					$(this).children('n4').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);									
						tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'N4 - SUBSCRIBER CITY, STATE, ZIP CODE<br>X12 Segment Name: Geographic Location\');" onmouseout="hideTip(this);">N4:</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_03').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_04').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_05').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_06').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_07').text() || "&nbsp;") + '</td>');												
						tr.append('<td class="tbl_fontSize" colspan="5">&nbsp;</td>');
					});
					
					$(this).children('aaa').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);									
						tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'AAA - SUBSCRIBER REQUEST VALIDATION<br>X12 Segment Name: Request Validation\');" onmouseout="hideTip(this);">AAA:</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('aaa_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('aaa_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('aaa_03').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('aaa_04').text() || "&nbsp;") + '</td>');												
						tr.append('<td class="tbl_fontSize" colspan="8">&nbsp;</td>');
					});
					
					$(this).children('prv').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);									
						tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'PRV - PROVIDER INFORMATION<br>X12 Segment Name: Provider Information\');" onmouseout="hideTip(this);">PRV:</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('prv_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('prv_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('prv_03').text() || "&nbsp;") + '</td>');										
						tr.append('<td class="tbl_fontSize" colspan="9">&nbsp;</td>');
					});
					
					$(this).children('dmg').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);									
						tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'DMG - SUBSCRIBER DEMOGRAPHIC INFORMATION<br>X12 Segment Name: Demographic Information\');" onmouseout="hideTip(this);">DMG:</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Use this code to indicate the format of the date of birth that follows in DMG02.\');" onmouseout="hideTip(this);">' + ($(this).children('dmg_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'IMPLEMENTATION NAME: Subscriber Birth Date Use this date for the date of birth of the subscriber.\');" onmouseout="hideTip(this);">' + ($(this).children('dmg_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Subscriber Gender Code<br>F - Female<br>M - Male<br>U - Unknown\');" onmouseout="hideTip(this);">' + ($(this).children('dmg_03').text() || "&nbsp;") + '</td>');										
						tr.append('<td class="tbl_fontSize" colspan="9">&nbsp;</td>');
					});	
					
					$(this).children('ins').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);									
						tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'INS - SUBSCRIBER RELATIONSHIP<br>X12 Segment Name: Insured Benefit\');" onmouseout="hideTip(this);">INS:</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ins_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ins_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ins_03').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ins_04').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ins_17').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize" colspan="7">&nbsp;</td>');
					});
					
					$(this).children('hi').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);
    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'HI - SUBSCRIBER HEALTH CARE DIAGNOSIS CODE<br>X12 Segment Name: Health Care Information Codes\');" onmouseout="hideTip(this);">HI:</td>');									
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_03').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_04').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_05').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_06').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_07').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hi_08').text() || "&nbsp;") + '</td>');												
						tr.append('<td class="tbl_fontSize" colspan="5">&nbsp;</td>');
					});		
					
					$(this).children('dtp').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);
    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'DTP - SUBSCRIBER DATE<br>X12 Segment Name: Date or Time or Period\');" onmouseout="hideTip(this);">DTP:</td>');									
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('dtp_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('dtp_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('dtp_03').text() || "&nbsp;") + '</td>');										
						tr.append('<td class="tbl_fontSize" colspan="9">&nbsp;</td>');
					});	
					
					$(this).children('mpi').each(function(){
						NM12100Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', NM12100Cloop_TBL);
    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'MPI - SUBSCRIBER MILITARY PERSONNEL INFORMATION<br>X12 Segment Name: Military Personnel Information\');" onmouseout="hideTip(this);">MPI:</td>');									
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('mpi_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('mpi_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('mpi_03').text() || "&nbsp;") + '</td>');										
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('mpi_04').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('mpi_05').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('mpi_06').text() || "&nbsp;") + '</td>');										
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('mpi_07').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize" colspan="6">&nbsp;</td>');
					});					
					
					var tr = $('tr:last', NM12100Cloop_CONTAINER_TBL);
   					var td = $('td:last', tr);
					td.append(NM12100Cloop_TBL);
													
					//<!--- EB 2110C loop  --->
					var EB2110Cloop_CONTAINER_TBL = $("<table class='text' id='EB2110Cloop_CONTAINER_TBL_" + patientID + "'></table>"); 																
					var EB2110Cloop_count = 0;
					
					$(this).children('eb').each(function(){
						
						EB2110Cloop_count = EB2110Cloop_count + 1;
							
						var EB2110Cloop_TBL = $("<table class='tblCellBorder' id='EB2110Cloop_TBL_" + EB2110Cloop_count + "'></table>"); 
								
						EB2110Cloop_TBL.append('<tr class="tbl_trBG" id="EB2110Cloopheader_' + EB2110Cloop_count + '"></tr>');
   						var tr = $('tr:last', EB2110Cloop_TBL);	
						tr.append('<td colspan="25" class="tbl_fontSize oneHundredWidth">SUBSCRIBER&nbsp;ELIGIBILITY&nbsp;OR&nbsp;BENEFIT&nbsp;INFORMATION</td>');
														
						EB2110Cloop_TBL.append('<tr></tr>');
    					var tr = $('tr:last', EB2110Cloop_TBL);
    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'EB - SUBSCRIBER ELIGIBILITY OR BENEFIT INFORMATION<br>X12 Segment Name: Eligibility or Benefit Information\');" onmouseout="hideTip(this);">EB:</td>');									
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Eligibility or Benefit Information Code<br>1 - Active Coverage<br>2 - Active - Full Risk Capitation<br>3 - Active - Services Capitated<br>4 - Active - Services Capitated to Primary Care Physician<br>5 - Active - Pending Investigation<br>6 - Inactive<br>7 - Inactive - Pending Eligibility Update<br>8 - Inactive - Pending Investigation<br>A - Co-Insurance<br>B - Co-Payment<br>C - Deductible<br>CB - Coverage Basis<br>D - Benefit Description<br>E - Exclusions<br>F - Limitations<br>G - Out of Pocket (Stop Loss)<br>H - Unlimited<br>I - Non-Covered<br>J - Cost Containment<br>K - Reserve<br>L - Primary Care Provider<br>M - Pre-existing Condition<br>MC - Managed Care Coordinator<br>N - Services Restricted to Following Provider<br>O - Not Deemed a Medical Necessity<br>P - Benefit Disclaimer<br>Q - Second Surgical Opinion Required<br>R - Other or Additional Payor<br>S - Prior Year(s) History<br>T - Card(s) Reported Lost/Stolen<br>U - Contact Following Entity for Eligibility or Benefit Information<br>V - Cannot Process<br>W - Other Source of Data<br>X - Health Care Facility<br>Y - Spend Down\');" onmouseout="hideTip(this);">' + ($(this).children('eb_01').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Coverage Level Code<br>CHD - Children Only<br>DEP - Dependents Only<br>ECH - Employee and Children<br>EMP - Employee Only<br>ESP - Employee and Spouse<br>FAM - Family<br>IND - Individual<br>SPC - Spouse and Children<br>SPO - Spouse Only\');" onmouseout="hideTip(this);">' + ($(this).children('eb_02').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Service Type Code<br>1 - Medical Care<br>2 - Surgical<br>3 - Consultation<br>4 - Diagnostic X-Ray<br>5 - Diagnostic Lab<br>6 - Radiation Therapy<br>7 - Anesthesia<br>8 - Surgical Assistance<br>9 - Other Medical<br>10 - Blood Charges<br>11 - Used Durable Medical Equipment<br>12 - Durable Medical Equipment Purchase<br>13 - Ambulatory Service Center Facility<br>14 - Renal Supplies in the Home<br>15 - Alternate Method Dialysis<br>16 - Chronic Renal Disease (CRD) Equipment<br>17 - Pre-Admission Testing<br>18 - Durable Medical Equipment Rental<br>19 - Pneumonia Vaccine<br>20 - Second Surgical Opinion<br>21 - Third Surgical Opinion<br>22 - Social Work<br>23 - Diagnostic Dental<br>24 - Periodontics<br>25 - Restorative<br>26 - Endodontics<br>27 - Maxillofacial Prosthetics<br>28 - Adjunctive Dental Services<br>30 - Health Benefit Plan Coverage<br>32 - Plan Waiting Period<br>33 - Chiropractic<br>34 - Chiropractic Office Visits<br>35 - Dental Care<br>36 - Dental Crowns<br>37 - Dental Accident<br>38 - Orthodontics<br>39 - Prosthodontics<br>40 - Oral Surgery<br>41 - Routine (Preventive) Dental<br>42 - Home Health Care<br>43 - Home Health Prescriptions<br>44 - Home Health Visits<br>45 - Hospice<br>46 - Respite Care<br>47 - Hospital<br>48 - Hospital - Inpatient<br>49 - Hospital - Room and Board<br>50 - Hospital - Outpatient<br>51 - Hospital - Emergency Accident<br>52 - Hospital - Emergency Medical<br>53 - Hospital - Ambulatory Surgical<br>54 - Long Term Care<br>55 - Major Medical<br>56 - Medically Related Transportation<br>57 - Air Transportation<br>58 - Cabulance<br>59 - Licensed Ambulance<br>60 - General Benefits<br>61 - In-vitro Fertilization<br>62 - MRI/CAT Scan<br>63 - Donor Procedures<br>64 - Acupuncture<br>65 - Newborn Care<br>66 - Pathology<br>67 - Smoking Cessation<br>68 - Well Baby Care<br>69 - Maternity<br>70 - Transplants<br>71 - Audiology Exam<br>72 - Inhalation Therapy<br>73 - Diagnostic Medical<br>74 - Private Duty Nursing<br>75 - Prosthetic Device<br>76 - Dialysis<br>77 - Otological Exam<br>78 - Chemotherapy<br>79 - Allergy Testing<br>80 - Immunizations<br>81 - Routine Physical<br>82 - Family Planning<br>83 - Infertility<br>84 - Abortion<br>85 - AIDS<br>86 - Emergency Services<br>87 - Cancer<br>88 - Pharmacy<br>89 - Free Standing Prescription Drug<br>90 - Mail Order Prescription Drug<br>91 - Brand Name Prescription Drug<br>92 - Generic Prescription Drug<br>93 - Podiatry<br>94 - Podiatry - Office Visits<br>95 - Podiatry - Nursing Home Visits<br>96 - Professional (Physician)<br>97 - Anesthesiologist<br>98 - Professional (Physician) Visit - Office<br>99 - Professional (Physician) Visit - Inpatient<br>A0 - Professional (Physician) Visit - Outpatient<br>A1 - Professional (Physician) Visit - Nursing Home<br>A2 - Professional (Physician) Visit - Skilled Nursing Facility<br>A3 - Professional (Physician) Visit - Home<br>A4 - Psychiatric<br>A5 - Psychiatric - Room and Board<br>A6 - Psychotherapy<br>A7 - Psychiatric - Inpatient<br>A8 - Psychiatric - Outpatient<br>A9 - Rehabilitation<br>AA - Rehabilitation - Room and Board<br>AB - Rehabilitation - Inpatient<br>AC - Rehabilitation - Outpatient<br>AD - Occupational Therapy<br>AE - Physical Medicine<br>AF - Speech Therapy<br>AG - Skilled Nursing Care<br>AH - Skilled Nursing Care - Room and Board<br>AI - Substance Abuse<br>AJ - Alcoholism<br>AK - Drug Addiction<br>AL - Vision (Optometry)<br>AM - Frames<br>AN - Routine Exam<br>AO - Lenses<br>AQ - Nonmedically Necessary Physical<br>AR - Experimental Drug Therapy<br>B1 - Burn Care<br>B2 - Brand Name Prescription Drug - Formulary<br>B3 - Brand Name Prescription Drug - Non-Formulary<br>BA - Independent Medical Evaluation<br>BB - Partial Hospitalization (Psychiatric)<br>BC - Day Care (Psychiatric)<br>BD - Cognitive Therapy<br>BE - Massage Therapy<br>BF - Pulmonary Rehabilitation<br>BG - Cardiac Rehabilitation<br>BH - Pediatric<br>BI - Nursery<br>BJ - Skin<br>BK - Orthopedic<br>BL - Cardiac<br>BM - Lymphatic<br>BN - Gastrointestinal<br>BP - Endocrine<br>BQ - Neurology<br>BR - Eye<br>BS - Invasive Procedures<br>BT - Gynecological<br>BU - Obstetrical<br>BV - Obstetrical/Gynecological<br>BW - Mail Order Prescription Drug: Brand Name<br>BX - Mail Order Prescription Drug: Generic<br>BY - Physician Visit - Office: Sick<br>BZ - Physician Visit - Office: Well<br>C1 - Coronary Care<br>CA - Private Duty Nursing - Inpatient<br>CB - Private Duty Nursing - Home<br>CC - Surgical Benefits - Professional (Physician)<br>CD - Surgical Benefits - Facility<br>CE - Mental Health Provider - Inpatient<br>CF - Mental Health Provider - Outpatient<br>CG - Mental Health Facility - Inpatient<br>CH - Mental Health Facility - Outpatient<br>CI - Substance Abuse Facility - Inpatient<br>CJ - Substance Abuse Facility - Outpatient<br>CK - Screening X-ray<br>CL - Screening laboratory<br>CM - Mammogram, High Risk Patient<br>CN - Mammogram, Low Risk Patient<br>CO - Flu Vaccination<br>CP - Eyewear and Eyewear Accessories<br>CQ - Case Management<br>DG - Dermatology<br>DM - Durable Medical Equipment<br>DS - Diabetic Supplies<br>GF - Generic Prescription Drug - Formulary<br>GN - Generic Prescription Drug - Non-Formulary<br>GY - Allergy<br>IC - Intensive Care<br>MH - Mental Health<br>NI - Neonatal Intensive Care<br>ON - Oncology<br>PT - Physical Therapy<br>PU - Pulmonary<br>RN - Renal<br>RT - Residential Psychiatric Treatment<br>TC - Transitional Care<br>TN - Transitional Nursery Care<br>UC - Urgent Care\');" onmouseout="hideTip(this);">' + ($(this).children('eb_03').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Insurance Type Code<br>12 - Medicare Secondary Working Aged Beneficiary or Spouse with Employer Group Health Plan<br>13 - Medicare Secondary End-Stage Renal Disease Beneficiary in the Mandated Coordination Period with an Employer’s Group Health Plan<br>14 - Medicare Secondary, No-fault Insurance including Auto is Primary<br>15 - Medicare Secondary Worker’s Compensation<br>16 - Medicare Secondary Public Health Service (PHS)or Other Federal Agency<br>41 - Medicare Secondary Black Lung<br>42 - Medicare Secondary Veteran’s Administration<br>43 - Medicare Secondary Disabled Beneficiary Under Age 65 with Large Group Health Plan (LGHP)<br>47 - Medicare Secondary, Other Liability Insurance is Primary<br>AP - Auto Insurance Policy<br>C1 - Commercial<br>CO - Consolidated Omnibus Budget Reconciliation Act (COBRA)<br>CP - Medicare Conditionally Primary<br>D - Disability<br>DB - Disability Benefits<br>EP - Exclusive Provider Organization<br>FF - Family or Friends<br>GP - Group Policy<br>HM - Health Maintenance Organization (HMO)<br>HN - Health Maintenance Organization (HMO) - Medicare Risk<br>HS - Special Low Income Medicare Beneficiary<br>IN - Indemnity<br>IP - Individual Policy<br>LC - Long Term Care<br>LD - Long Term Policy<br>LI - Life Insurance<br>LT - Litigation<br>MA - Medicare Part A<br>MB - Medicare Part B<br>MC - Medicaid<br>MH - Medigap Part A<br>MI - Medigap Part B<br>MP - Medicare Primary<br>OT - Other<br>PE - Property Insurance - Personal<br>PL - Personal<br>PP - Personal Payment (Cash - No Insurance)<br>PR - Preferred Provider Organization (PPO)<br>PS - Point of Service (POS)<br>QM - Qualified Medicare Beneficiary<br>RP - Property Insurance - Real<br>SP - Supplemental Policy<br>TF - Tax Equity Fiscal Responsibility Act (TEFRA)<br>WC - Workers Compensation<br>WU - Wrap Up Policy\');" onmouseout="hideTip(this);">' + ($(this).children('eb_04').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Plan Coverage Description\');" onmouseout="hideTip(this);">' + ($(this).children('eb_05').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Time Period Qualifier<br>6 Hour<br>7 - Day<br>13 - 24 Hours<br>21 - Years<br>22 - Service Year<br>23 - Calendar Year<br>24 - Year to Date<br>25 - Contract<br>26 - Episode<br>27 - Visit<br> 28 - Outlier<br>29 - Remaining<br>30 - Exceeded<br>31 - Not Exceeded<br>32 - Lifetime<br>33 - Lifetime Remaining<br>34 - Month<br>35 - Week<br>36 - Admission\');" onmouseout="hideTip(this);">' + ($(this).children('eb_06').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Monetary Amount\');" onmouseout="hideTip(this);">' + ($(this).children('eb_07').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Percentage as Decimal\');" onmouseout="hideTip(this);">' + ($(this).children('eb_08').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Quantity Qualifier<br>8H - Minimum<br>99 - Quantity Used<br>CA - Covered - Actual<br>CE - Covered - Estimated<br>D3 - Number of Co-insurance Days<br>DB - Deductible Blood Units<br>DY - Days<br>HS - Hours<br>LA - Life-time Reserve - Actual<br>LE - Life-time Reserve - Estimated<br>M2 - Maximum<br>MN - Month<br>P6 - Number of Services or Procedures<br>QA - Quantity Approved<br>S7 - Age, High Value<br>S8 - Age, Low Value<br>VS - Visits<br>YY - Years\');" onmouseout="hideTip(this);">' + ($(this).children('eb_09').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Quantity\');" onmouseout="hideTip(this);">' + ($(this).children('eb_10').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Yes/No Condition or Response Code<br>N - No<br>U - Unknown<br>Y - Yes\');" onmouseout="hideTip(this);">' + ($(this).children('eb_11').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Yes/No Condition or Response Code<br>N - No<br>U - Unknown<br>W - Not Applicable<br>Y - Yes\');" onmouseout="hideTip(this);">' + ($(this).children('eb_12').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'COMPOSITE MEDICAL PROCEDURE IDENTIFIER\');" onmouseout="hideTip(this);">' + ($(this).children('eb_13').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('eb_14').text() || "&nbsp;") + '</td>');
						tr.append('<td class="tbl_fontSize" colspan="6">&nbsp;</td>');
						
						$(this).children('hsd').each(function(){
							EB2110Cloop_TBL.append('<tr></tr>');
	    					var tr = $('tr:last', EB2110Cloop_TBL);									
	    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'HSD - HEALTH CARE SERVICES DELIVERY<br>X12 Segment Name: Health Care Services Delivery\');" onmouseout="hideTip(this);">HSD:</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_01').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_02').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_03').text() || "&nbsp;") + '</td>');								
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_04').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_05').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_06').text() || "&nbsp;") + '</td>');								
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_07').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('hsd_08').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize" colspan="12">&nbsp;</td>');
						});
						
						$(this).children('ref').each(function(){
							EB2110Cloop_TBL.append('<tr></tr>');
	    					var tr = $('tr:last', EB2110Cloop_TBL);									
	    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'REF - SUBSCRIBER ADDITIONAL IDENTIFICATION<br>X12 Segment Name: Reference Information\');" onmouseout="hideTip(this);">REF:</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ref_01').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ref_02').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ref_03').text() || "&nbsp;") + '</td>');								
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('ref_04').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" colspan="16">&nbsp;</td>');
						});
						
						$(this).children('dtp').each(function(){
							EB2110Cloop_TBL.append('<tr></tr>');
	    					var tr = $('tr:last', EB2110Cloop_TBL);									
	    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'DTP - SUBSCRIBER ELIGIBILITY/BENEFIT DATE<br>X12 Segment Name: Date or Time or Period\');" onmouseout="hideTip(this);">DTP:</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Date/Time Qualifier<br>096 Discharge<br>193 - Period Start<br>194 - Period End<br>198 - Completion<br>290 - Coordination of Benefits<br>292 Benefit<br>295 - Primary Care Provider<br>304 - Latest Visit or Consultation<br>307 - Eligibility<br>318 - Added<br>348 - Benefit Begin<br>349 - Benefit End<br>356 - Eligibility Begin<br>357 - Eligibility End<br>435 - Admission<br>472 - Service<br>636 - Date of Last Update<br>771 - Status\');" onmouseout="hideTip(this);">' + ($(this).children('dtp_01').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Date Time Period Format Qualifier<br>D8 - Date Expressed in Format CCYYMMDD<br>RD8 - Range of Dates Expressed in Format CCYYMMDDCCYYMMDD\');" onmouseout="hideTip(this);">' + ($(this).children('dtp_02').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'Date Time Period\');" onmouseout="hideTip(this);">' + ($(this).children('dtp_03').text() || "&nbsp;") + '</td>');								
							tr.append('<td class="tbl_fontSize" colspan="17">&nbsp;</td>');
						});									
						
						$(this).children('aaa').each(function(){
							EB2110Cloop_TBL.append('<tr></tr>');
	    					var tr = $('tr:last', EB2110Cloop_TBL);									
	    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'AAA - SUBSCRIBER REQUEST VALIDATION<br>X12 Segment Name: Request Validation\');" onmouseout="hideTip(this);">AAA:</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('aaa_01').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('aaa_02').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('aaa_03').text() || "&nbsp;") + '</td>');								
							tr.append('<td class="tbl_fontSize" colspan="17">&nbsp;</td>');
						});										
						
						$(this).children('msg').each(function(){
							EB2110Cloop_TBL.append('<tr></tr>');
	    					var tr = $('tr:last', EB2110Cloop_TBL);									
	    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'MSG - MESSAGE TEXT<br>X12 Segment Name: Message Text\');" onmouseout="hideTip(this);">MSG:</td>');
							tr.append('<td colspan="10" class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('msg_01').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize" colspan="10">&nbsp;</td>');
						});
															
						EB2110Cloop_CONTAINER_TBL.append('<tr></tr>');
     					var tr = $('tr:last', EB2110Cloop_CONTAINER_TBL);									
						tr.append('<td></td>');										
						var tr = $('tr:last', EB2110Cloop_CONTAINER_TBL);
       					var td = $('td:last', tr);
						td.append(EB2110Cloop_TBL);															
														
						//<!--- II 2115C loop  --->
						var III2115Cloop_CONTAINER_TBL = $("<table class='text' id='III2115Cloop_CONTAINER_TBL_" + patientID + "'></table>"); 																
						var III2115Cloop_count = 0;
						
						$(this).children('iii').each(function(){
							
							III2115Cloop_count = III2115Cloop_count + 1;
								
							var III2115Cloop_TBL = $("<table class='tblCellBorder' id='III2115Cloop_TBL_" + III2115Cloop_count + "'></table>"); 
									
							III2115Cloop_TBL.append('<tr class="tbl_trBG" id="III2115Cloopheader_' + III2115Cloop_count + '"></tr>');
       						var tr = $('tr:last', III2115Cloop_TBL);	
							tr.append('<td colspan="25" class="tbl_fontSize oneHundredWidth">SUBSCRIBER&nbsp;ELIGIBILITY&nbsp;OR&nbsp;BENEFIT&nbsp;ADDITIONAL&nbsp;INFORMATION</td>');									
							
							III2115Cloop_TBL.append('<tr></tr>');
	    					var tr = $('tr:last', III2115Cloop_TBL);
	    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'SUBSCRIBER ELIGIBILITY OR BENEFIT ADDITIONAL INFORMATION\');" onmouseout="hideTip(this);">III:</td>');									
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('iii_01').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('iii_02').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('iii_03').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('iii_04').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize" colspan="16">&nbsp;</td>');
							
																	
							III2115Cloop_CONTAINER_TBL.append('<tr></tr>');
	     					var tr = $('tr:last', III2115Cloop_CONTAINER_TBL);									
							tr.append('<td></td>');										
							var tr = $('tr:last', III2115Cloop_CONTAINER_TBL);
	       					var td = $('td:last', tr);
							td.append(III2115Cloop_TBL);
							
						}); //<!--- END $(this).children('iii').each(function() --->
														
						EB2110Cloop_TBL.append("<tr><td id='III2115Cloop_CONTAINER_TD_" + patientID + "' colspan='13'></td></tr>");
       					var tr = $('tr:last', EB2110Cloop_TBL);
       					var td = $('td:last', tr);
						td.append(III2115Cloop_CONTAINER_TBL);
															
						//<!--- NM1 2120C loop  --->
						var NM12120Cloop_CONTAINER_TBL = $("<table class='text' id='NM12120Cloop_CONTAINER_TBL_" + patientID + "'></table>"); 																
						var NM12120Cloop_count = 0;
						
						$(this).children('nm1').each(function(){
							
							NM12120Cloop_count = NM12120Cloop_count + 1;
								
							var NM12120Cloop_TBL = $("<table class='tblCellBorder' id='NM12120Cloop_TBL_" + NM12120Cloop_count + "'></table>"); 
									
							NM12120Cloop_TBL.append('<tr class="tbl_trBG" id="NM12120Cloopheader_' + NM12120Cloop_count + '"></tr>');
       						var tr = $('tr:last', NM12120Cloop_TBL);	
							tr.append('<td colspan="25" class="tbl_fontSize oneHundredWidth">SUBSCRIBER&nbsp;BENEFIT&nbsp;RELATED&nbsp;ENTITY&nbsp;NAME</td>');									
							
							NM12120Cloop_TBL.append('<tr></tr>');
	    					var tr = $('tr:last', NM12120Cloop_TBL);
	    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'NM1 - SUBSCRIBER BENEFIT RELATED ENTITY NAME<br>X12 Segment Name: Individual or Organizational Name\');" onmouseout="hideTip(this);">NM1:</td>');									
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_01').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_02').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_03').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('nm1_04').text() || "&nbsp;") + '</td>');
							tr.append('<td class="tbl_fontSize" colspan="16">&nbsp;</td>');
							
							$(this).children('N3').each(function(){
								NM12120Cloop_TBL.append('<tr></tr>');
		    					var tr = $('tr:last', NM12120Cloop_TBL);									
		    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'N3 - SUBSCRIBER BENEFIT RELATED ENTITY ADDRESS<br>X12 Segment Name: Party Location\');" onmouseout="hideTip(this);">N3:</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n3_01').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n3_02').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize" colspan="10">&nbsp;</td>');
							});							
							
							$(this).children('N4').each(function(){
								NM12120Cloop_TBL.append('<tr></tr>');
		    					var tr = $('tr:last', NM12120Cloop_TBL);									
		    					tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'N4 - SUBSCRIBER BENEFIT RELATED ENTITY CITY, STATE, ZIP CODE<br>X12 Segment Name: Geographic Location\');" onmouseout="hideTip(this);">N4:</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_01').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_02').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_03').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_04').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_05').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_06').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('n4_07').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize" colspan="10">&nbsp;</td>');
							});		

							$(this).children('per').each(function(){
								NM12120Cloop_TBL.append('<tr></tr>');
		    					var tr = $('tr:last', NM12120Cloop_TBL);									
								tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'PER - SUBSCRIBER BENEFIT RELATED ENTITY CONTACT INFORMATION<br>X12 Segment Name: Administrative Communications Contact\');" onmouseout="hideTip(this);">PER:</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('per_01').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('per_02').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('per_03').text() || "&nbsp;") + '</td>');										
								tr.append('<td nowrap class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + (formatPhoneUS_JS($(this).children('per_04').text()) || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('per_05').text() || "&nbsp;") + '</td>');
								tr.append('<td nowrap class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + (formatPhoneUS_JS($(this).children('per_06').text()) || "&nbsp;") + '</td>');												
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('per_07').text() || "&nbsp;") + '</td>');
								tr.append('<td nowrap class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + (formatPhoneUS_JS($(this).children('per_08').text()) || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize" colspan="11">&nbsp;</td>');
							});
																	
							$(this).children('prv').each(function(){
								NM12120Cloop_TBL.append('<tr></tr>');
		    					var tr = $('tr:last', NM12120Cloop_TBL);									
								tr.append('<td class="tbl_fontSize tbl_trBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'PRV - SUBSCRIBER BENEFIT RELATED PROVIDER INFORMATION<br>X12 Segment Name: Provider Information\');" onmouseout="hideTip(this);">PRV:</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('prv_01').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('prv_02').text() || "&nbsp;") + '</td>');
								tr.append('<td class="tbl_fontSize tbl_dataCellBG" style="cursor: hand;" onmouseover="doTooltip(0, this, event, \'\');" onmouseout="hideTip(this);">' + ($(this).children('prv_03').text() || "&nbsp;") + '</td>');										
								tr.append('<td class="tbl_fontSize" colspan="12">&nbsp;</td>');
							});
																											
							NM12120Cloop_CONTAINER_TBL.append('<tr></tr>');
	     					var tr = $('tr:last', NM12120Cloop_CONTAINER_TBL);									
							tr.append('<td></td>');										
							var tr = $('tr:last', NM12120Cloop_CONTAINER_TBL);
	       					var td = $('td:last', tr);
							td.append(NM12120Cloop_TBL);
							
						}); //<!--- END $(this).children('nm1').each(function() --->
														
						EB2110Cloop_TBL.append("<tr><td id='NM12120Cloop_CONTAINER_TD_" + patientID + "' colspan='13'></td></tr>");
       					var tr = $('tr:last', EB2110Cloop_TBL);
       					var td = $('td:last', tr);
						td.append(NM12120Cloop_CONTAINER_TBL);
									
					}); //<!--- END $(this).children('eb').each(function() --->
					
					NM12100Cloop_TBL.append("<tr><td id='EB2110Cloop_CONTAINER_TD_" + patientID + "' colspan='13'></td></tr>");
   					var tr = $('tr:last', NM12100Cloop_TBL);
   					var td = $('td:last', tr);
					td.append(EB2110Cloop_CONTAINER_TBL);
														
				}; //<!--- END if($(this).children('nm1_01').text() == "IL" && $(this).children('nm1_02').text() == 1) --->
			}); //<!--- END $(this).children('nm1').each(function() --->
																									
			PAT2000Cloop_TBL.append("<tr><td id='NM12100Cloop_CONTAINER_TD_" + patientID + "' colspan='13'></td></tr>");
			var tr = $('tr:last', PAT2000Cloop_TBL);
			var td = $('td:last', tr);
			td.append(NM12100Cloop_CONTAINER_TBL);
									
			PAT2000Cloop_CONTAINER_TBL.append("<tr><td id='PAT2000Cloop_CONTAINER_TD_" + patientID + "' class='tblBorder'></td></tr>");
			var tr = $('tr:last', PAT2000Cloop_CONTAINER_TBL);
			var td = $('td:last', tr);
			td.append(PAT2000Cloop_TBL);
			
			Main2000Cloop_CONTAINER_TBL.append("<tr><td id='PAT2000Cloop_CONNER_TD_" + patientID + "'></td></tr>");
			var tr = $('tr:last', Main2000Cloop_CONTAINER_TBL);
			var td = $('td:last', tr);
			td.append(PAT2000Cloop_CONTAINER_TBL);
			
			if(empty){
				$('#div1').empty();
			};
			$('#div1').append(Main2000Cloop_CONTAINER_TBL);  			
			$('#div1').append("<p>");  														    		
					    		
		}); //<!--- END $(xml).find('patient271').each(function() --->
		
	});
};
