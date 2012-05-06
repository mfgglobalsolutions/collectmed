/* tagFormPatientIntakeForm.js*/

var insurances = new Array();
insurances[0] = "primary";	
insurances[1] = "secondary";	
insurances[2] = "tertiary";	
insurances[3] = "quaternary";	
insurances[4] = "quinary";	
insurances[5] = "senary";	
insurances[6] = "septenary";	
insurances[7] = "octonary";	
insurances[8] = "nonary";	
insurances[9] = "denary";	


var PhoneIDs = new Array();
var phoneNumberDBID = new Array();
var phoneNumberTypeID = new Array();			
var phoneNumber = new Array();
var phoneExtension = new Array();					
var phoneNumberIsDefault = new Array();			
PhoneIDs[0] = "";		
phoneNumberDBID[0] = "";
phoneNumberTypeID[0] = "";
phoneNumber[0] = "Select Phone Number";	
phoneExtension[0] = "";					
phoneNumberIsDefault[0] = ""; 

var AddressIDs = new Array();
var AddressDBID = new Array();
var AddressTypeID = new Array();
var AddressLine1 = new Array();
var AddressLine2 = new Array();
var AddressCity = new Array();
var AddressStateID = new Array();
var AddressZipCode = new Array();
var AddressIsDefault = new Array();
var AddressActive = new Array();			
AddressIDs[0] = "";		
AddressDBID[0] = "";
AddressTypeID[0] = "";
AddressLine1[0] = "Select Address";	
AddressLine2[0] = "";	
AddressCity[0] = "";
AddressStateID[0] = "";		
AddressZipCode[0] = "";
AddressIsDefault[0] = ""; 	
AddressActive[0] = ""; 	

function addVerificationRow(id, vpid, dateVerified, timeVerified, verifiedBy, repName, effectDateFrom, effectDateTo){
	
	if(dateVerified == "@@"){dateVerified = "";};
	if(timeVerified == "@@"){timeVerified = "";};
	if(verifiedBy == "@@"){verifiedBy = "";};
	if(repName == "@@"){repName = "";};
	if(repName == "@@" || repName == "@@ @@"){repName = "";};
	if(effectDateFrom == "@@"){effectDateFrom = "";};
	if(effectDateTo == "@@"){effectDateTo = "";}; 
	
	var tbody = document.getElementById(id + 'VerificationsTable').getElementsByTagName("tbody")[0];	
	
	var tbl = document.getElementById(id + 'VerificationsTable');			
	var len = tbl.tBodies[0].rows.length;			
	
	var row = document.createElement("tr");	
	var onclickFunction = "resetVerification" + id;
	row.onclick = function(){eval(onclickFunction)(vpid);};
	row.setAttribute('onmouseover',function cursor(){this.style.cursor="hand";this.style.backgroundColor="DCE3EB";});						
	
	if(len % 2){
		row.setAttribute('bgColor', 'FFFFFF');	
		row.setAttribute('onmouseout',function cursor(){this.style.backgroundColor="ffffff";});		
	}
	else{	
		row.setAttribute('bgColor', 'F4F2F2');		
		row.setAttribute('onmouseout',function cursor(){this.style.backgroundColor="F4F2F2";});						
	};			
				
	var tdCell0 = document.createElement("td");
	thisText = document.createTextNode(vpid);	
	tdCell0.setAttribute("className","SiteLabel");
	tdCell0.setAttribute("noWrap","true");	
	tdCell0.appendChild(thisText);		
	row.appendChild(tdCell0);					
				
	var tdCell1 = document.createElement("td");
	thisText = document.createTextNode(dateVerified);	
	tdCell1.setAttribute("className","SiteLabel");
	tdCell1.setAttribute("noWrap","true");	
	tdCell1.appendChild(thisText);		
	row.appendChild(tdCell1);				
	
	var tdCell2 = document.createElement("td");
	thisText = document.createTextNode(timeVerified);	
	tdCell2.setAttribute("className","SiteLabel");
	tdCell2.setAttribute("noWrap","true");	
	tdCell2.setAttribute("align","center");	
	tdCell2.appendChild(thisText);		
	row.appendChild(tdCell2);				
	
	var tdCell3 = document.createElement("td");
	thisText = document.createTextNode(verifiedBy);	
	tdCell3.setAttribute("className","SiteLabel");
	tdCell3.setAttribute("noWrap","true");	
	tdCell3.setAttribute("align","center");	
	tdCell3.appendChild(thisText);		
	row.appendChild(tdCell3);			
	
	var tdCell4 = document.createElement("td");
	thisText = document.createTextNode(repName);	
	tdCell4.setAttribute("className","SiteLabel");
	tdCell4.setAttribute("noWrap","true");	
	tdCell4.appendChild(thisText);		
	row.appendChild(tdCell4);			
	
	var tdCell5 = document.createElement("td");
	thisText = document.createTextNode(effectDateFrom);	
	tdCell5.setAttribute("className","SiteLabel");
	tdCell5.setAttribute("noWrap","true");	
	tdCell5.setAttribute("align","center");	
	tdCell5.appendChild(thisText);		
	row.appendChild(tdCell5);			
	
	var tdCell6 = document.createElement("td");
	thisText = document.createTextNode(effectDateTo);	
	tdCell6.setAttribute("className","SiteLabel");
	tdCell6.setAttribute("noWrap","true");	
	tdCell6.setAttribute("align","center");	
	tdCell6.appendChild(thisText);		
	row.appendChild(tdCell6);
	
	tbody.appendChild(row);	
};
	
function changePatientPhoneID(sel){				
	document.getElementById("PatientPhoneID").value = document.getElementById("patientPhoneIDSelect").options[sel].value;	
};		

function changePatientAddressID(sel){
	document.getElementById("PatientAddressID").value = document.getElementById("patientAddressIDSelect").options[sel].value;
};			

function loadPhoneNumberArrayDisplay(viewPhoneID, patientphoneid){												
	var selectBoxLength = 0;				
	document.getElementById("patientPhoneIDSelect").options.length = 0;
	if(PhoneIDs.length > 0){					
		for (i = 0; i < PhoneIDs.length; i++){					
			if(i > 0){							
				thisPhoneID = PhoneIDs[i];
				thisPhoneNumberDBID = phoneNumberDBID[i];						
				thisPhoneNumber = formatPhoneUS_JS(phoneNumber[i]);						
				thisPhoneTypeID = phoneNumberTypeID[i];				
				thisPhoneNumberIsDefault = phoneNumberIsDefault[i];
				thisPhoneNumberTypeID = phoneNumberTypeID[i];																													
				if(thisPhoneNumberDBID != ""){
					thisPhone = "";						
					if(thisPhoneNumber != "@@" && thisPhoneNumber != ""){thisPhone = trimJS(thisPhoneNumber)};
					document.getElementById("patientPhoneIDSelect").options[i] = new Option(thisPhone, thisPhoneNumberDBID);		
				};	
			}
			else{
				thisPhone = "Select Phone";
				thisPhoneID = "";
				thisPhoneNumberDBID = "";
				document.getElementById("patientPhoneIDSelect").options[i] = new Option(thisPhone, thisPhoneNumberDBID);		
			};																
						
			if(i > 0 && thisPhoneNumberIsDefault == 1){						
				document.getElementById("patientPhoneIDSelect").options[i].selected = true;	
				document.getElementById("PatientPhoneID").value = document.getElementById("patientPhoneIDSelect").options[i].value;	
			};	
																	
		};		
	};			
					
	if(PhoneIDs.length < 1){					
		document.getElementById("patientPhoneIDSelect").options[0] = new Option('No phones on file', '');					
		document.getElementById("patientPhoneIDSelect").options[0].selected = true;								
	}
						
	if(IsNumeric_JS(patientphoneid) == true){
		for (i = 0; i < PhoneIDs.length; i++){
			if(patientphoneid == phoneNumberDBID[i]){
				document.getElementById("patientPhoneIDSelect").options[i].selected = true;	
				document.getElementById("PatientPhoneID").value = document.getElementById("patientPhoneIDSelect").options[i].value;	
			}
		}					
	}
	
	if(viewPhoneID != 0){						
		for (i = 0; i < PhoneIDs.length; i++){
			if(viewPhoneID == phoneNumberDBID[i]){
				document.getElementById("patientPhoneIDSelect").options[i].selected = true;		
				document.getElementById("PatientPhoneID").value = document.getElementById("patientPhoneIDSelect").options[i].value;
			};
		};	
	};
	
	//debugPhones();								
};
						
function loadAddressArrayDisplay(viewAddressID, patientaddressid){												
	var selectBoxLength = 0;				
	document.getElementById("patientAddressIDSelect").options.length = 0;
	
	if(AddressIDs.length > 0){		
		for (i = 0; i < AddressIDs.length; i++){					
			if(i > 0){							
				thisAddressID = AddressIDs[i];
				thisAddressDBID = AddressDBID[i];
				thisAddressTypeID = AddressTypeID[i];
				thisAddressLine1 = AddressLine1[i];				
				thisAddressLine2 = AddressLine2[i];
				thisAddressCity = AddressCity[i];
				thisAddressStateID = AddressStateID[i];
				thisAddressZipCode = AddressZipCode[i];
				thisAddressIsDefault = AddressIsDefault[i];
				thisAddressActive = AddressActive[i];																											
				if(thisAddressDBID != ""){
					thisAddress = "";						
					if(thisAddressLine1 != "@@" && thisAddressLine1 != ""){thisAddress = capitalizeString_JS(trimJS(thisAddressLine1))};
					if(thisAddressLine2 != "@@" && thisAddressLine2 != ""){thisAddress = thisAddress + ' ' + capitalizeString_JS(trimJS(thisAddressLine2))};
					if(thisAddressCity != "@@" && thisAddressCity != ""){thisAddress = thisAddress + ' ' +  capitalizeString_JS(trimJS(thisAddressCity))};
					if(thisAddressStateID != "@@" && thisAddressStateID != ""){thisAddress = thisAddress + ', ' + getState(thisAddressStateID)};
					if(thisAddressZipCode != "@@" && thisAddressZipCode != ""){thisAddress = thisAddress + ' ' + trimJS(thisAddressZipCode)};
					document.getElementById("patientAddressIDSelect").options[i] = new Option(thisAddress, thisAddressDBID);		
				};	
			}
			else{
				thisAddress = "Select Address";
				thisAddressID = "";
				thisAddressDBID = "";
				document.getElementById("patientAddressIDSelect").options[i] = new Option(thisAddress, thisAddressDBID);		
			};																
						
			if(i > 0 && thisAddressIsDefault == 1){						
				document.getElementById("patientAddressIDSelect").options[i].selected = true;		
				document.getElementById("PatientAddressID").value = document.getElementById("patientAddressIDSelect").options[i].value;
			};	
								
			if(thisAddress.length > selectBoxLength){
				selectBoxLength = thisAddress.length;							
			}												
		};					
	};
					
	if(AddressIDs.length < 1){					
		document.getElementById("patientAddressIDSelect").options[0] = new Option('No addresses on file', '');					
		document.getElementById("patientAddressIDSelect").options[0].selected = true;								
	}
	
	var finalLength = eval(selectBoxLength * 5.7 + 20);				
	document.getElementById("patientAddressIDSelect").style.width = finalLength;
	
	if(IsNumeric_JS(patientaddressid)){
		for (i = 0; i < AddressIDs.length; i++){
			if(patientaddressid == AddressDBID[i]){
				document.getElementById("patientAddressIDSelect").options[i].selected = true;		
				document.getElementById("PatientAddressID").value = document.getElementById("patientAddressIDSelect").options[i].value;
			}
		}					
	}
	
	if(viewAddressID != 0){						
		for (i = 0; i < AddressIDs.length; i++){
			if(viewAddressID == AddressDBID[i]){
				document.getElementById("patientAddressIDSelect").options[i].selected = true;	
				document.getElementById("PatientAddressID").value = document.getElementById("patientAddressIDSelect").options[i].value;	
			};
		};	
	};
	
	//debugAddresses();								
};	

function debugAddresses(){
	
	var addresses = "";
	
	for (i = 0; i < AddressIDs.length; i++){
		thisAddressID = AddressIDs[i];
		thisAddressTypeID = AddressTypeID[i];
		thisAddressDBID = AddressDBID[i];
		thisAddressLine1 = AddressLine1[i];				
		thisAddressLine2 = AddressLine2[i];
		thisAddressCity = AddressCity[i];
		thisAddressStateID = AddressStateID[i];
		thisAddressZipCode = AddressZipCode[i];
		thisAddressIsDefault = AddressIsDefault[i];
		
		if(thisAddressLine2 == ''){
			thisAddressLine2= "@@";
		};
		
		thisAddress =  thisAddressID + " : " + thisAddressDBID + " : " + thisAddressTypeID + " : " + thisAddressIsDefault + " : " + thisAddressLine1 + " : " + thisAddressLine2 + " : " + thisAddressCity + " : " + thisAddressStateID + " : " + thisAddressZipCode;						
								
		addresses = addresses + thisAddress + "\n\n";	
							
	};
	
	alert(addresses);
		
};					
					

function submitFunction(obj, Active, formName){
	if(Active == 0){
		restoreIntake_JS();
	}
	else{
		obj.style.display='none';					
		//var indicator = 'document.getElementById(\"spSubmitButton' + obj.id + '\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		//eval(indicator);
		showHideSubmitButtons(1);
		if(document.getElementById("patientFNameTBox").value == '' || document.getElementById("patientLNameTBox").value == '' || document.getElementById("patientDOBMM").value == '' || document.getElementById("patientDOBDD").value == '' || document.getElementById("patientDOBYY").value == ''){
			obj.disabled = false;
			alert('You must have at a minimum the patient\'s\n\nFirst Name\nLast Name\nDate of Birth\n\nin order to save this page.');
			showHideSubmitButtons(0);
			//obj.style.display='inline'; 						
			//var innertext = 'spSubmitButton' + obj.id + '.innerText=\'\'';
			//eval(innertext);				
		}
		else{
			var testForm = validateForm();						
			if(testForm == true){							
				formName.submit();
			};					
		};	
	};
	
};	

function showHideSubmitButtons(show){
	if(show == 1){
		document.getElementById("Delivery").style.display='none';				
		var indicator1 = 'document.getElementById(\"spSubmitButtonDelivery\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator1);	
		document.getElementById("Customer").style.display='none';				
		var indicator2 = 'document.getElementById(\"spSubmitButtonCustomer\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator2);	
		document.getElementById("HCPCInformation").style.display='none';				
		var indicator3 = 'document.getElementById(\"spSubmitButtonHCPCInformation\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator3);	
		document.getElementById("InsuranceInformation").style.display='none';		
		var indicator4 = 'document.getElementById(\"spSubmitButtonInsuranceInformation\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator4);	
		document.getElementById("Physician").style.display='none';	
		var indicator5 = 'document.getElementById(\"spSubmitButtonPhysician\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator5);	
		document.getElementById("SameOrSimiliar").style.display='none';	
		var indicator6 = 'document.getElementById(\"spSubmitButtonSameOrSimiliar\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator6);	
		document.getElementById("OtherQualifying").style.display='none';	
		var indicator7 = 'document.getElementById(\"spSubmitButtonOtherQualifying\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator7);	
		document.getElementById("LabData").style.display='none';	
		var indicator8 = 'document.getElementById(\"spSubmitButtonLabData\").innerHTML = \"<img src=\'images/indicator.gif\'>\";';		
		eval(indicator8);	
	}
	else{
		document.getElementById("Delivery").style.display='inline';				
		var innertext = 'spSubmitButtonDelivery.innerText=\'\'';
		eval(innertext);			
		document.getElementById("Customer").style.display='inline';				
		var innertext = 'spSubmitButtonCustomer.innerText=\'\'';
		eval(innertext);			
		document.getElementById("HCPCInformation").style.display='inline';				
		var innertext = 'spSubmitButtonHCPCInformation.innerText=\'\'';
		eval(innertext);			
		document.getElementById("InsuranceInformation").style.display='inline';		
		var innertext = 'spSubmitButtonInsuranceInformation.innerText=\'\'';
		eval(innertext);		
		document.getElementById("Physician").style.display='inline';	
		var innertext = 'spSubmitButtonPhysician.innerText=\'\'';
		eval(innertext);		
		document.getElementById("SameOrSimiliar").style.display='inline';	
		var innertext = 'spSubmitButtonSameOrSimiliar.innerText=\'\'';
		eval(innertext);		
		document.getElementById("OtherQualifying").style.display='inline';	
		var innertext = 'spSubmitButtonOtherQualifying.innerText=\'\'';
		eval(innertext);		
		document.getElementById("LabData").style.display='inline';	
		var innertext = 'spSubmitButtonLabData.innerText=\'\'';
		eval(innertext);		
	};						
};		

function createTask(){				
	leftVal = (screen.width - 640) / 2;
	topVal = (screen.height - 425) / 2;				
	assign=window.open('appTaskCreate.cfm?objectid=8&instanceid=' + intakeID ,'create','dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=425,left='+leftVal+',top='+topVal);
};
		


function getEntityAddressesXML(data1,data2){				
	var url = urlReconstructed + "/ws/wsEntity.cfc?method=wsGetEntityAddressesXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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

function resetAddressArrays(){
	for(var q=1; q < AddressIDs.length;q++) {AddressIDs[q]="";};
	for(var q=1; q < AddressDBID.length;q++) {AddressDBID[q]="";};
	for(var q=1; q < AddressTypeID.length;q++) {AddressTypeID[q]="";};
	for(var q=1; q < AddressLine1.length;q++) {AddressLine1[q]="";};
	for(var q=1; q < AddressLine2.length;q++) {AddressLine2[q]="";};
	for(var q=1; q < AddressCity.length;q++) {AddressCity[q]="";};
	for(var q=1; q < AddressStateID.length;q++) {AddressStateID[q]="";};
	for(var q=1; q < AddressZipCode.length;q++) {AddressZipCode[q]="";};
	for(var q=1; q < AddressIsDefault.length;q++) {AddressIsDefault[q]="";};
	for(var q=1; q < AddressActive.length;q++) {AddressActive[q]="";};
};

function resetPatientAddresses(entityID, viewAddressID, patientaddressid, clientid){			

	var textXML = getEntityAddressesXML(clientid, entityID);	
	
	if (window.ActiveXObject){
		var doc=new ActiveXObject("Microsoft.XMLDOM");
	  	doc.async="false";
	  	doc.loadXML(textXML);
	}				
	var x=doc.documentElement;			
	
	resetAddressArrays();

	var count = 0;
	$(x).find('ADDRESS').each(function(){								
		var $ADDRESS = $(this);
		j = eval(count + 1);
		AddressIDs[j] = j;
		AddressDBID[j] = $ADDRESS.find('ADDRESSID').text();
		AddressTypeID[j] = $ADDRESS.find('ADDRESSTYPEID').text();	
		AddressLine1[j] = $ADDRESS.find('ADDRESSLINE1').text();	
		AddressLine2[j] = $ADDRESS.find('ADDRESSLINE2').text();	
		AddressCity[j] = $ADDRESS.find('CITY').text();	
		AddressStateID[j] = $ADDRESS.find('STATEID').text();	
		AddressZipCode[j] = $ADDRESS.find('ZIPCODE').text();			
		AddressIsDefault[j] = $ADDRESS.find('ISDEFAULT').text();			
		AddressActive[j] = $ADDRESS.find('ACTIVE').text();									
	});		
			
	loadAddressArrayDisplay(viewAddressID, patientaddressid);			  						
}; 

function getEntityPhonesXML(data1,data2){				
	var url = urlReconstructed + "/ws/wsEntity.cfc?method=wsGetEntityPhonesXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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

function resetPhoneArrays(){
	for(var q=1; q < PhoneIDs.length;q++) {PhoneIDs[q]="";};
	for(var q=1; q < phoneNumberDBID.length;q++) {phoneNumberDBID[q]="";};
	for(var q=1; q < phoneNumberTypeID.length;q++) {phoneNumberTypeID[q]="";};
	for(var q=1; q < phoneNumber.length;q++) {phoneNumber[q]="";};
	for(var q=1; q < phoneNumberIsDefault.length;q++) {phoneNumberIsDefault[q]="";};					
};

function resetPatientPhones(entityID, viewPhoneID, patientphoneid, clientid){			

	var textXML = getEntityPhonesXML(clientid, entityID);	
	
	if (window.ActiveXObject){
		var doc=new ActiveXObject("Microsoft.XMLDOM");
	  	doc.async="false";
	  	doc.loadXML(textXML);
	}				
	var x=doc.documentElement;			
	
	resetPhoneArrays();
					    
	for(var i = 0; i < x.childNodes.length; i++){					
		j = eval(i + 1);
		PhoneIDs[j] = j;
		phoneNumberDBID[j] = x.getElementsByTagName("PHONEID")[i].childNodes[0].text;							
		phoneNumberTypeID[j] = x.getElementsByTagName("PHONETYPEID")[i].childNodes[0].text;
		phoneNumber[j] = x.getElementsByTagName("PHONENUMBER")[i].childNodes[0].text;						
		phoneNumberIsDefault[j] = x.getElementsByTagName("ISDEFAULT")[i].childNodes[0].text;																												
    };	
			
	loadPhoneNumberArrayDisplay(viewPhoneID, patientphoneid);			  						
};
			
function launchDXPage(linkToGoTo){			
	var rand_no = Math.floor(Math.random()*101)
	var winName = 'loginwindow_' + rand_no;  			
	var wOpen;
   	var sOptions;			   		
   	sOptions = 'status=yes,hotkeys=no,menubar=no,scrollbars=yes,resizable=yes,toolbar=no,width=650,height=400,screenX=0,screenY=0,left=0,top=0';
   	wOpen = window.open( '', winName, sOptions );
   	wOpen.location = linkToGoTo;
   	wOpen.focus();			   	
    return wOpen;
}		

function keyUp(obj, diag){				
  		
	if(obj.value.indexOf('?') > -1){
		launchDXPage('appDXCodeSearch.cfm?callerformname=' + formName + '&callerfieldName='+obj.name+'&callerdiagName='+diag);
		re = /\$|,|@|~|`|\%|\*|\^|\&|\(|\)|\+|\=|\[|\-|\_|\]|\[|\}|\{|\;|\:|\'|\"|\<|\>|\?|\||\\|\!|\$/g;
		newVar = obj.value.replace(re, "");					
		x = 'document.getElementById("' + obj.name + '").value = newVar;'
		eval(x);
   		};				
};

function keyUpUpin(obj, diag){				
  		
	if(obj.value.indexOf('?') > -1){
		launchDXPage('appDoctorSearch.cfm?callerformname=' + formName + '&callerfieldName='+obj.name+'&callerdiagName='+diag);
		x = 'document.getElementById("' + obj.name + '").value = "";'
		eval(x);
		y = 'document.getElementById("' + diag + '").value = "";'
		eval(y);
   		};			
	
};	

function allowSave(){};		

function keyUpPatient(obj){				
  		
	if(obj.value.indexOf('?') > -1){
		launchDXPage('appPatientSearchIntake.cfm?callerformname=' + formName);
		x = 'document.getElementById("patientFNameTBox").value = "";'
		eval(x);
		y = 'document.getElementById("patientLNameTBox").value = "";'
		eval(y);
   		};			
	
};
			
function showChange(){				
	var res = document.getElementById("changePatient");						  
	if(res.style.visibility == 'hidden'){res.style.visibility = 'visible';}
	else{res.style.visibility = 'hidden';};
};

function getPatient(data1,data2){				
	var url = urlReconstructed + "/ws/wsPatient.cfc?method=wsGetPatient&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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

function resetPatientInfo(data1, data2){
	/*DOB|ENTITYID|FNAME|HEIGHTININCHES|LNAME|MARITALSTATUS|MNAME|PATIENTID|SEX|SSN|WEIGHT*/			
	var patientInfo = getPatient(data1, data2);								
	if(patientInfo != "false"){
		var infoArray = patientInfo.split("|");
		var mm = "";
		var dd = "";
		var yy = "";
		if(infoArray.length > 1){					
			if(infoArray[0] != ''){
				var dobArray = infoArray[0].split("/");
				mm = dobArray[0];
				dd = dobArray[1];
				yy = dobArray[2];
			};	
			PatientID = infoArray[7];
			MaritalStatus = infoArray[5];
			FName = infoArray[2];
			MInitial = infoArray[6];
			LName = infoArray[4];
			MM = mm;
			DD = dd;
			YY = yy;
			SSN = infoArray[9];
			Sex = infoArray[8];
			Weight = infoArray[10];
			Height = infoArray[3];
			AddressID = patientAddressID;
			PhoneID = patientPhoneID;							
			setPatient(PatientID, FName, MInitial, LName, MM, DD, YY, SSN, Sex, Weight, Height, AddressID, PhoneID, 0, MaritalStatus, PhoneID, 0, data1);				
		};
	};			
};
		
function getEntityAddressPhoneString(data1,data2){				
	var url = urlReconstructed + "/ws/wsEntity.cfc?method=wsGetEntityAddressPhoneString&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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

function setPhysician(FName, MInitial, LName, Phone, Upin, Fax, Address, City, State, Zip){
	document.getElementById("orderingPhysicianFNameTBox").value = FName;
	document.getElementById("orderingPhysicianMInitialTBox").value = MInitial;
	document.getElementById("orderingPhysicianLNameTBox").value = LName;
	document.getElementById("orderingPhysicianPhoneTBox").value = Phone;
	document.getElementById("orderingPhysicianUPINTBox").value = Upin;
	document.getElementById("orderingPhysicianFaxTBox").value = Fax;
	document.getElementById("orderingPhysicianAddressTBox").value = Address;
	document.getElementById("orderingPhysicianCityTBox").value = City;
	document.getElementById("orderingPhysicianStateTBox").value = State;
	for (ii = 0; ii < document.getElementById("orderingPhysicianStateTBox").length; ii++){							
		if(document.getElementById("orderingPhysicianStateTBox").options[ii].value == State){							
			document.getElementById("orderingPhysicianStateTBox").options[ii].selected = true;
		};							
	};	
	document.getElementById("orderingPhysicianZipTBox").value = Zip;
};



function getPatientInsuranceCompanies(data1,data2){
	var url = urlReconstructed + "/ws/wsPatient.cfc?method=wsGetPatientInsComXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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
	
function setInsurance(patientID){
					
	var textXML = getPatientInsuranceCompanies(clientid, patientID);			
	
	if (window.ActiveXObject){
		var doc=new ActiveXObject("Microsoft.XMLDOM");
	  	doc.async="false";
	  	doc.loadXML(textXML);
	}				
	
	var x=doc.documentElement;			
	
	if(x == null){		
		return false;
	};
	
	
	$(x).find('INSURANCE').each(function(){								
		var $INSURANCE = $(this);
		var primsecterPosition = $INSURANCE.find('PRIMSECTER').text();	
		if(primsecterPosition == 1){
			primsecter = 'primary';}
		else if(primsecterPosition == 2){
			primsecter = 'secondary';
		}
		else if(primsecterPosition == 3){
			primsecter = 'tertiary';
		};			
		var insName = $INSURANCE.find('INSURANCECOMPANYNAME').text();				
		if(insName != ""){						
			eval('document.getElementById("' + primsecter + 'InsuranceNameTBox").value = insName;');
			//Why is this not working?
			if(i == 0){
				tabPrimaryVerbage.innerHTML = insName.toUpperCase();	
			}
			else if(i == 1){
				tabSecondaryVerbage.innerHTML = insName.text.toUpperCase();	
			}
			else if(i == 2){
				tabTertiaryVerbage.innerHTML = insName.text.toUpperCase();	
			};
		};
		var polNum = $INSURANCE.find('POLICYNUMBER').text();
		eval('document.getElementById("' + primsecter + 'PolicyNumberTBox").value = polNum;');
		var groupNum = $INSURANCE.find('GROUPNUMBER').text();
		if(groupNum != ""){
			eval('document.getElementById("' + primsecter + 'GroupNumberTBox").value = groupNum;');
		}; 		
		var insComID = $INSURANCE.find('INSURANCECOMPANYID').text();
		if(insComID != ""){
			eval('document.getElementById("hidden_' + primsecter + 'InsuranceID").value = insComID;');
			eval('document.getElementById("hidden_' + primsecter + '_InsuranceNameApproval").value = "approved"');
		};	
		var recID = $INSURANCE.find('RECORDID').text();
		if(recID != ""){
			eval('document.getElementById("hidden_' + primsecter + 'PICID").value = recID;');
		};	
		var polHolEmpSchoolName = $INSURANCE.find('POLICYHOLDERSEMPLOYERSCHOOLNAME').text();
		if(polHolEmpSchoolName != ""){
			eval('document.getElementById("' + primsecter + 'PolicyHolderEmployerTBox").value = polHolEmpSchoolName;');
		}	
		var polHolFName = $INSURANCE.find('POLICYHOLDERSFIRSTNAME').text();
		if(polHolFName != "@@"){
			eval('document.getElementById("' + primsecter + 'PolicyHolderFNameTBox").value = polHolFName;');
		};  
		var polHolLName = $INSURANCE.find('POLICYHOLDERSLASTNAME').text();
		if(polHolLName != "@@"){
			eval('document.getElementById("' + primsecter + 'PolicyHolderLNameTBox").value = polHolLName;');
		}  
		var polHolMName = $INSURANCE.find('POLICYHOLDERSMIDDLEINITIAL').text();
		if(polHolMName != ""){
			eval('document.getElementById("' + primsecter + 'PolicyHolderMInitialTBox").value = polHolMName;');
		};	
		var polHolDOB = $INSURANCE.find('POLICYHOLDERSDOB').text();				
		if(polHolDOB != ""){						
			PolicyHoldersDOB = polHolDOB;						
			if(PolicyHoldersDOB != ""){							
				var date = new Date(PolicyHoldersDOB);							
				eval('document.getElementById("' + primsecter + 'HoldersDOBYY").value = date.getFullYear();');								
				mon = new String(date.getMonth() + 1)
				if(mon.length == 1)mon = "0" + mon;
				day = new String(date.getDate())
				if(day.length == 1)day = "0" + day;							
				eval('document.getElementById("' + primsecter + 'HoldersDOBMM").value = mon;');								
				eval('document.getElementById("' + primsecter + 'HoldersDOBDD").value = day;');								
			};
		};					
		var zID = $INSURANCE.find('Z_ICENTITYID').text();				
		if(insComID != "" && zID != ""){						
			var addressPhone = getEntityAddressPhoneString(clientid, zID);							
			var addressPhoneArray = addressPhone.split("|");
			if(addressPhoneArray.length > 1){								
				if(addressPhoneArray[12] != ""){eval('document.getElementById("' + primsecter + 'PhoneNumberTBox").value = formatPhoneUS_JS(addressPhoneArray[12]);');}
				if(addressPhoneArray[13] != ""){eval('document.getElementById("' + primsecter + 'FaxNumberTBox").value = formatPhoneUS_JS(addressPhoneArray[13]);');}
				if(addressPhoneArray[4] != ""){eval('document.getElementById("' + primsecter + 'SendToAddress1TBox").value = addressPhoneArray[4];');}
				if(addressPhoneArray[5] != "@@"){eval('document.getElementById("' + primsecter + 'SendToAddress2TBox").value = addressPhoneArray[5];');}
				if(addressPhoneArray[6] != ""){eval('document.getElementById("' + primsecter + 'SendToCityTBox").value = addressPhoneArray[6];');}
				if(addressPhoneArray[10] != ""){eval('document.getElementById("' + primsecter + 'SendToZipcodeTBox").value = addressPhoneArray[10];');}
				if(addressPhoneArray[7] != ""){									
					for (ii = 0; ii < eval('document.getElementById("' + primsecter + 'SendToStateTBox").length'); ii++){							
						if(eval('document.getElementById("' + primsecter + 'SendToStateTBox").options[ii].value') == addressPhoneArray[7]){							
							eval('document.getElementById("' + primsecter + 'SendToStateTBox").options[ii].selected = true');
						};				
					};	
				};								
				
				if(addressPhoneArray[4] == "" || addressPhoneArray[6] == "" || addressPhoneArray[10] == "" || addressPhoneArray[7] == ""){
					document.all.badAddress.value = 1;
				};							
			};	
		};
		
		var currentNumberOfverifications = 0;
		$INSURANCE.find('VERIFICATIONSXML').find('VERIFICATIONS').find('VERIFICATION').each(function(){				
			currentNumberOfverifications = eval(currentNumberOfverifications + 1);					
			var $VERIFICATION = $(this);
			var VERIFICATIONPATIENTINSURANCEID = $VERIFICATION.find('VERIFICATIONPATIENTINSURANCEID').text();
			var DATECREATED = $VERIFICATION.find('DATECREATED').text();
			var VERIFICATIONDATE = $VERIFICATION.find('VERIFICATIONDATE').text();
			var VERIFICATIONTIME = $VERIFICATION.find('VERIFICATIONTIME').text();
			var FULLNAME = $VERIFICATION.find('FULLNAME').text();
			var VERIFICATIONREPFNAME = $VERIFICATION.find('VERIFICATIONREPFNAME').text();
			var VERIFICATIONREPLNAME = $VERIFICATION.find('VERIFICATIONREPLNAME').text();
			var VERIFICATIONHAVEINSFROMDATE = $VERIFICATION.find('VERIFICATIONHAVEINSFROMDATE').text();
			var VERIFICATIONHAVEINSTODATE = $VERIFICATION.find('VERIFICATIONHAVEINSTODATE').text();
			$("#" + primsecter + "VerificationsTable > tbody").append("<tr onclick='resetVerification" + primsecter + "(" + VERIFICATIONPATIENTINSURANCEID + ");' style='cursor:hand' onmouseover=this.style.backgroundColor='DCE3EB' onmouseout=this.style.backgroundColor='FFFFFF'><td class=siteLabel>" + VERIFICATIONPATIENTINSURANCEID + "</td><td class=siteLabel>" + VERIFICATIONDATE + "</td><td class=siteLabel align=center>" + VERIFICATIONTIME + "</td><td class=siteLabel>" + FULLNAME + "</td><td class=siteLabel>" + VERIFICATIONREPFNAME + " " + VERIFICATIONREPLNAME + "</td><td class=siteLabel align=center>" + VERIFICATIONHAVEINSFROMDATE + "</td><td class=siteLabel align=center>" + VERIFICATIONHAVEINSTODATE + "</td></tr>"); 
		});			
		
		if(currentNumberOfverifications > 0){
			$("input[name='allowClearVerify']").val(1); 
		};		
	});		
	
	//Dont remove this it breaks. TODO																    
	for(var i = 0; i < x.childNodes.length; i++){}								
}; 

function addRowVerificationsTable(id, primsecter){				
	
	var textXML = getVerificationXML(clientid, id);	
	
	if (window.ActiveXObject){
		var doc=new ActiveXObject("Microsoft.XMLDOM");
	  	doc.async="false";
	  	doc.loadXML(textXML);
	}				
	var x=doc.documentElement;				
					
	for(var i = 0; i < x.childNodes.length; i++){
		
		if(x.getElementsByTagName("DATECREATED")[i].childNodes[0].text != "@@"){
			verificationDate = x.getElementsByTagName("DATECREATED")[i].childNodes[0].text;
			var date = new Date(verificationDate);							 								
			mon = new String(date.getMonth() + 1)
			if(mon.length == 1)mon = "0" + mon;
			day = new String(date.getDate())
			if(day.length == 1)day = "0" + day;							
			thisDateCreated = mon + "/" + day + "/" + date.getFullYear(); 
		};									
		var repName = x.getElementsByTagName("VERIFICATIONREPFNAME")[i].childNodes[0].text + " " + x.getElementsByTagName("VERIFICATIONREPLNAME")[i].childNodes[0].text;	
		var thisVerificationDate = "";
		if(x.getElementsByTagName("VERIFICATIONDATE")[i].childNodes[0].text != "@@"){
			verificationDate = x.getElementsByTagName("VERIFICATIONDATE")[i].childNodes[0].text;
			var date = new Date(verificationDate);													
			mon = new String(date.getMonth() + 1)
			if(mon.length == 1)mon = "0" + mon;
			day = new String(date.getDate())
			if(day.length == 1)day = "0" + day;							
			thisVerificationDate = mon + "/" + day + "/" + date.getFullYear(); 
		};	
		var thisVerificationHaveInsFromDate = "";
		if(x.getElementsByTagName("VERIFICATIONHAVEINSFROMDATE")[i].childNodes[0].text != "@@"){
			verificationHaveInsFromDate = x.getElementsByTagName("VERIFICATIONHAVEINSFROMDATE")[i].childNodes[0].text;
			var date = new Date(verificationHaveInsFromDate);															
			mon = new String(date.getMonth() + 1)
			if(mon.length == 1)mon = "0" + mon;
			day = new String(date.getDate())
			if(day.length == 1)day = "0" + day;							
			thisVerificationHaveInsFromDate = mon + "/" + day + "/" + date.getFullYear(); 
		};
		var thisVerificationHaveInsToDate = "";
		if(x.getElementsByTagName("VERIFICATIONHAVEINSTODATE")[i].childNodes[0].text != "@@"){
			verificationHaveInsToDate = x.getElementsByTagName("VERIFICATIONHAVEINSTODATE")[i].childNodes[0].text;
			var date = new Date(verificationHaveInsToDate);													
			mon = new String(date.getMonth() + 1)
			if(mon.length == 1)mon = "0" + mon;
			day = new String(date.getDate())
			if(day.length == 1)day = "0" + day;							
			thisVerificationHaveInsToDate = mon + "/" + day + "/" + date.getFullYear();						
		};	
		
		addVerificationRow(primsecter, id, thisVerificationDate, x.getElementsByTagName("VERIFICATIONTIME")[i].childNodes[0].text, x.getElementsByTagName("VERIFIEDBYNAME")[i].childNodes[0].text, repName, thisVerificationHaveInsFromDate, thisVerificationHaveInsToDate)			
	};					
};
		
function clearPatient(){
	spPatient.innerHTML = 'PATIENT';
	document.getElementById("PatientID").value = "";	
	document.getElementById("PatientAddressID").value = "";	
	document.getElementById("PatientPhoneID").value = "";
	document.getElementById("OPTION_3a_CBox_PatientSexMale").disabled = false;
	document.getElementById("OPTION_3a_CBox_PatientSexFemale").disabled = false;								
	document.getElementById("patientFNameTBox").value = "";					
	document.getElementById("patientMInitialTBox").value = "";					
	document.getElementById("patientLNameTBox").value = "";
	document.getElementById("patientDOBMM").value = "";
	document.getElementById("patientDOBDD").value = "";
	document.getElementById("patientDOBYY").value = "";
	document.getElementById("patientSSNTBox").value = "";	
	document.getElementById("patientWeightTBox").value = "";
	document.getElementById("patientHeightInches").value = "";
	checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', '');				
	document.getElementById("patientFNameTBox").style.backgroundColor = 'fffbb8';
	document.getElementById("patientLNameTBox").style.backgroundColor = 'fffbb8';
	document.getElementById("patientSSNTBox").style.backgroundColor = 'fffbb8';				
	document.getElementById("patientDOBMM").style.backgroundColor = 'fffbb8';
	document.getElementById("patientDOBDD").style.backgroundColor = 'fffbb8';
	document.getElementById("patientDOBYY").style.backgroundColor = 'fffbb8';
	document.getElementById("patientHeightInches").style.backgroundColor = 'fffbb8';
	document.getElementById("patientWeightTBox").style.backgroundColor = 'fffbb8';
	td_patientSex.style.backgroundColor = 'fffbb8';												
	clearPatientAddress();
	clearPatientPhone();					
};
			
function changePatient(){				
	launchDXPage('appPatientSearchIntake.cfm?callerformname=' + formName);
};

function disablePatient(dis){
	if(dis == 1){endis = true}else(endis = false);
	document.getElementById("patientFNameTBox").disabled = endis;
	document.getElementById("patientMInitialTBox").disabled = endis;
	document.getElementById("patientLNameTBox").disabled = endis;
	document.getElementById("patientDOBMM").disabled = endis;
	document.getElementById("patientDOBDD").disabled = endis;
	document.getElementById("patientDOBYY").disabled = endis;
	document.getElementById("patientSSNTBox").disabled = endis;
	document.getElementById("patientWeightTBox").disabled = endis;
	document.getElementById("patientHeightInches").disabled = endis;
	document.getElementById("OPTION_3a_CBox_PatientSexMale").disabled = endis;
	document.getElementById("OPTION_3a_CBox_PatientSexFemale").disabled = endis;		
	document.getElementById("patientMaritalStatus").disabled = endis;
};

function setPatientAddress(AddressID){
	var address = getAddress(clientid, AddressID);
	var addressArray = address.split("|");
	if(addressArray.length > 1){
		document.getElementById("patientAddressTBox").value = addressArray[2];
		document.getElementById("patientCityTBox").value = addressArray[4];
		for (ii = 0; ii < document.getElementById("patientAddressStateID").length; ii++){						
			if(document.getElementById("patientAddressStateID").options[ii].value == addressArray[5]){							
				document.getElementById("patientAddressStateID").options[ii].selected = true;
			};							
		};								
		document.getElementById("patientZipTBox").value = addressArray[6];					
	};											
};

function clearPatientAddress(){				
	document.getElementById("patientAddressTBox").value = "";
	document.getElementById("patientCityTBox").value = "";
	document.getElementById("patientAddressStateID").options[0].selected = true;		
	document.getElementById("patientZipTBox").value = "";														
};

function disablePatientAddress(dis){
	if(dis == 1){endis = true}else(endis = false);
	document.getElementById("patientPhoneTBox").disabled = endis;
	document.getElementById("patientAddressTBox").disabled = endis;
	document.getElementById("patientCityTBox").disabled = endis;
	document.getElementById("patientAddressStateID").disabled = endis;
	document.getElementById("patientZipTBox").disabled = endis;				
};

function getAddress(data1,data2){						
	var url = urlReconstructed + "/ws/wsEOB.cfc?method=wsGetAddress&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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

function setPatientPhone(PhoneID){				
	var phone = getPhone(clientid, PhoneID);
	var phoneArray = phone.split("|");
	if(phoneArray.length > 1){
		document.getElementById("patientPhoneTBox").value = formatPhoneUS_JS(phoneArray[2]);							
	}									
};

function clearPatientPhone(){				
	document.getElementById("patientPhoneTBox").value = "";								
};

function disablePatientPhone(dis){
	if(dis == 1){endis = true}else(endis = false);
	document.getElementById("patientPhoneTBox").disabled = endis;
};		

function getPhone(data1,data2){						
	var url = urlReconstructed + "/ws/wsEOB.cfc?method=wsGetPhone&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
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
			
// Utility function to fetch text from a URL
   // A wrapper around the appropriate objects exposed by Netscape 6 or IE
   function _wddxSelectListGetFromURL(strURL) {
       var objHTTP, result;
   
       // For Netscape 6+ (or other browsers that support XMLHttpRequest)
       if (window.XMLHttpRequest) {
         objHTTP=new XMLHttpRequest();
         objHTTP.open("GET", strURL, false);  
         objHTTP.send(null);
         result=objHTTP.responseText;
   
       // For IE browsers under Windows    
       } else if (window.ActiveXObject) {
         objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
         objHTTP.open("GET", strURL, false);  
         objHTTP.send(null);
         result=objHTTP.responseText;
       }
 
       // Return result
       return result;
   };	  			

function getDXDescription(data1){						
	var url = urlReconstructed + "/ws/wsDXDescription.cfc?method=wsDXDescription&Data1=" + escape(data1) + "&" + escape(randNum_JS());				 
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
			
function dxOnBlur(obj, diag){					
	if(obj.value != '' && obj.value.indexOf('?') < 0){												
		desc = getDXDescription(obj.value);	
		if(desc != "false"){				
			x = 'document.getElementById("' + diag + '").value = desc';
			eval(x);
		}
		else{
			alert("The code you typed in (" + obj.value + ") cannot be found. Please check the code and try again.")
			obj.value = "";						
			x = 'document.getElementById("' + diag + '").value = ""';
			y = 'document.getElementById("' + obj.name + '").focus()';
			eval(x);
			eval(y);
		}				
   		};		
};		

function keyUpHCPC(obj, prod, foc){		    		
	if(obj.value.indexOf('?') > -1){
		y = 'document.getElementById("' + foc + '").focus()';
		eval(y);
		launchDXPage('appHCPCCodeSearch.cfm?callerformname=' + formName + '&callerfieldName='+obj.name+'&callerprodName='+prod);
		re = /\$|,|@|~|`|\%|\*|\^|\&|\(|\)|\+|\=|\[|\-|\_|\]|\[|\}|\{|\;|\:|\'|\"|\<|\>|\?|\||\\|\!|\$|\./g;
		newVar = obj.value.replace(re, "");					
		x = 'document.getElementById("' + obj.name + '").value = newVar;'
		eval(x);													
   		};				
};

function getHCPCDescription(data1){								
	var url = urlReconstructed + "/ws/wsHCPCDescription.cfc?method=wsHCPCDescription&Data1=" + escape(data1) + "&" + escape(randNum_JS());				 
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

function hcpcOnBlur(obj, prod){					
	if(obj.value != '' && obj.value.indexOf('?') < 0){												
		desc = Left(getHCPCDescription(obj.value),100);	
		if(desc != "false"){				
			x = 'document.getElementById("' + prod + '").value = desc';
			eval(x);
		}
		else{
			alert("The code you typed in (" + obj.value + ") cannot be found. Please check the code and try again.")
			obj.value = "";						
			x = 'document.getElementById("' + prod + '").value = ""';
			y = 'document.getElementById("' + obj.name + '").focus()';
			eval(x);
			eval(y);
		}				
   		};						
};			
						
function createNote(){				
	if(tr_newIntakeNote.style.display == "none"){				
		tr_newIntakeNote.style.display = "inline";
		DHTMLEditor100.focus();
	}
	else{
		tr_newIntakeNote.style.display = "none";
	};				
};
			
function createViewNotes(){
	leftVal = (screen.width - 600) / 2;
	topVal = (screen.height - 350) / 2;
	claimnote=window.open('appIntakeNote.cfm?objectid=8&instanceid=' + intakeID, 'claimnote', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=600,height=350,left='+leftVal+',top='+topVal); claimnote.focus(0);
};			

function updateStep(num){
	//alert(document.all.hidden_Step_OLD.value);
	if(num == 2){
		document.all.hidden_Step_OLD.value = document.all.hidden_Step_OLD.value + '2|' + dateNow + '|' + timeNow + '|' + usersID + '|' + usersFName + ' ' + usersLName + '~';
	}				
	else if(num == 3){
		document.all.hidden_Step_OLD.value = document.all.hidden_Step_OLD.value + '3|' + dateNow + '|' + timeNow + '|' + usersID + '|' + usersFName + ' ' + usersLName + '~';
	}
	else if(num == 4){
		document.all.hidden_Step_OLD.value = document.all.hidden_Step_OLD.value + '4|' + dateNow + '|' + timeNow + '|' + usersID + '|' + usersFName + ' ' + usersLName + '~';
	}
	else if(num == 5){
		document.all.hidden_Step_OLD.value = document.all.hidden_Step_OLD.value + '5|' + dateNow + '|' + timeNow + '|' + usersID + '|' + usersFName + ' ' + usersLName + '~';
	}					
	//alert(document.all.hidden_Step_OLD.value);
				
};		

if(clearedStepList >= 5){
	function intakeAutoAssignToManager(){					
		
		var reassignIntake = confirm("Are you sure you want to re-assign this intake?\n\nIf you want to re-assign this Intake click \"OK\" otherwise click \"Cancel\"");
				
		if(reassignIntake){	
			var url = urlReconstructed + "/ws/wsIntake.cfc?method=wsAutoAssignToManager&Data1=" + clientid + "&Data2=" + intakeID + "&" + escape(randNum_JS());	
			var truefalse = ajaxCFWS(url);					
			if(truefalse == "true" || truefalse == true){
				 //window.location.reload(true);
				 window.location.href = 'appPatientIntakeSearch.cfm?clear=1&msg=Intake was re-assigned.';
			};				
		};												
						
	};
};


function checkBoxRadio(elementOB, elementName, checkValue){
	/*if(checkValue != ''){	var cv = 'document.all.'+ checkValue +'.disabled'; alert(eval(cv)); }*/	
	var uncheckAll = true;
	if((checkValue != '' && eval('document.all.'+ checkValue +'.disabled') != true) || checkValue == ''){
									
		for(var i = 0; i < document.images.length; i++){				
			if(document.images[i].name == elementName){	
				if(document.images[i].name == elementName && document.images[i].alt == checkValue){
					array = eval('document.images['+ i +'].src.split("/")');					
					if(array[array.length-1] == 'Checkbox2.gif'){
						uncheckAll = false;
					};									
				};								
				if(elementOB != ""){
					//var thisEl = elementOB + '.style.backgroundColor = \'fffbb8\';';
					eval(thisEl);
				};
				document.images[i].src='images/Checkbox1.gif';
				altName = document.images[i].alt;
				temp = eval('document.all.'+ altName +'.value = ""');									
			};			
		};
		
		if(uncheckAll){
			for(var i = 0; i < document.images.length; i++){				
				if(document.images[i].name == elementName && document.images[i].alt == checkValue){					
					array = eval('document.images['+ i +'].src.split("/")');					
					if(array[array.length-1] == 'Checkbox1.gif'){				
						if(elementOB != ""){	
							var thisEl = elementOB + '.style.backgroundColor = \'ffffff\';';
							eval(thisEl);
						};	
						document.images[i].src='images/Checkbox2.gif';		
						temp = eval('document.all.'+ checkValue +'.value = 1');											
					};				
				};						
			};
		};						
	};
};
		
function validateForm(){
	
	if(IsNumeric_JS(intakeID) == false){
		beforeSubmit();
	};
															
	var msg  = "";							 							
	
	if(document.getElementById("patientFNameTBox").value == "" || document.getElementById("patientLNameTBox").value == "" || document.getElementById("patientDOBMM").value == "" || document.getElementById("patientDOBDD").value == "" || document.getElementById("patientDOBYY").value == ""){
		msg = msg + "<li>You must provide at a minimum the patients <br>&nbsp;&nbsp;First Name,<br>&nbsp;&nbsp;Last Name,<br>&nbsp;&nbsp;and Date of Birth.</strong></li>";			
	};
		
	if(msg.length >= 1){
		sp_errorMsg.innerHTML = msg;
		tr_errorMsg.style.display = 'inline';
		location.hash=1;
		showHideSubmitButtons(0);
		return false;
	}
	else{						
		
		var insName = checkInsuranceNames();
		if(!insName){
			showHideSubmitButtons(0);
			return false;
		}
		else{
			return true;
		};				
	};	
		
};			
				 
function displayAutoSaveStatus() {      
	var res = document.getElementById("last_auto");				
	res.innerHTML = "Last AutoSave: "+showtime();
	res.style.visibility = "visible";            
    	}; 

function showtime() {
	var now = new Date();
	var hours = now.getHours();
	var minutes = now.getMinutes();
	var seconds = now.getSeconds()
	var timeValue = "" + ((hours >12) ? hours -12 :hours)
	if (timeValue == "0") timeValue = 12;
	timeValue += ((minutes < 10) ? ":0" : ":") + minutes
	timeValue += ((seconds < 10) ? ":0" : ":") + seconds
	timeValue += (hours >= 12) ? " P.M." : " A.M."
	return timeValue;
};	


if(IsNumeric_JS(intakeID) == false){	
	function autoSaveForm(){				
		if((document.forms[0].patientFNameTBox.value != "" && document.getElementById("patientLNameTBox").value != "" && document.getElementById("patientDOBMM").value != "" && document.getElementById("patientDOBDD").value != "" && document.getElementById("patientDOBYY").value != "") || document.getElementById("autoSaveOn").value == 1){
			if(document.getElementById("intakeID").value == ""){
				var newIntakeID = getNewIntakeID(clientid, document.getElementById("patientFNameTBox").value, document.getElementById("patientLNameTBox").value, document.getElementById("patientDOBMM").value, document.getElementById("patientDOBDD").value, document.getElementById("patientDOBYY").value, usersID);
				document.getElementById("intakeID").value = newIntakeID;
				sp_IntakeID.innerHTML = "ID: " + newIntakeID;
			};
			if(document.getElementById("intakeID").value != ""){										
				if(window.autoSaveFrame.addFormFields){							  
					beforeSubmit();				
					autoSaveFrame.addFormFields();							
					document.frames('autoSaveFrame').document.autoSaveIframe.submit();	
					document.getElementById("autoSaveOn").value = 1;
					displayAutoSaveStatus();
				};						
			};														
		};						
	};		
		
	var ourInterval = setInterval('autoSaveForm()', 120000); //120000 every 2 minutes			
	
};
			
function checkIntakeExists(){				
	if(document.getElementById("patientFNameTBox").value != "" && document.getElementById("patientLNameTBox").value != "" && document.getElementById("patientDOBMM").value != "" && document.getElementById("patientDOBDD").value != "" && document.getElementById("patientDOBYY").value != ""){
						
		var exists = checkIntakeWS(document.getElementById("patientFNameTBox").value, document.getElementById("patientLNameTBox").value, document.getElementById("patientDOBMM").value, document.getElementById("patientDOBDD").value, document.getElementById("patientDOBYY").value, document.getElementById("intakeID").value);
						
		if(exists != "true"){
			
			var idsArray = exists.split(",");	
			var eligible = true;	
			for ( i=0; i<idsArray.length; i++){					
				if(idsArray[i] == document.getElementById("intakeID").value){
					eligible = false;
					break;
				};						  
			};

			if(eligible){
				spCheckIntakeExists.innerHTML = '<span style=\"cursor:hand\" onclick=\"existsOnclick();\">Please check the available intake(s) [' + exists + '] before continuing.</span>';
			};
									
		} 
		else {
			spCheckIntakeExists.innerHTML = '';
		};								
	};				
};	

function existsOnclick(){
	var linkTo = 'appIntakeDisplayPatientExisting.cfm?fname=' + document.getElementById("patientFNameTBox").value + '&lname=' + document.getElementById("patientLNameTBox").value + '&dobmm=' + document.getElementById("patientDOBMM").value + '&dobdd=' + document.getElementById("patientDOBDD").value + '&dobyy=' + document.getElementById("patientDOBYY").value;
	existsIntake=window.open(linkTo, 'existsIntake', 'top=0,left=0,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=775,height=500'); 
	existsIntake.focus(0);									
}			

function getNewIntakeID(clientid, fname, lname, mm, dd, yy, userid){				
	var url = urlReconstructed + "/ws/wsEOB.cfc?method=wsGetNewIntakeID&Data1=" + escape(clientid) + "&Data2=" + escape(fname) + "&Data3=" + escape(lname) + "&Data4=" + escape(mm) + "&Data5=" + escape(dd) + "&Data6=" + escape(yy) + "&Data7=" + escape(userid) + "&" + escape(randNum_JS());				 
	var packet = _wddxSelectListGetFromURL(url);												
	var wddxDes = new WddxDeserializer;				
	var result = wddxDes.deserialize(packet);				
	if (result != null) {					
		return result;
	}
	else{					
		return false;
	};	
};

function checkIntakeWS(fname, lname, mm, dd, yy, id){				
	var url = urlReconstructed + "/ws/wsEOB.cfc?method=wsCheckIntakeExists&Data1=" + clientid + "&Data2=" + escape(fname) + "&Data3=" + escape(lname) + "&Data4=" + escape(mm) + "&Data5=" + escape(dd) + "&Data6=" + escape(yy) + "&Data7=" + escape(id) + "&" + escape(randNum_JS());				 
	var packet = _wddxSelectListGetFromURL(url);												
	var wddxDes = new WddxDeserializer;				
	var result = wddxDes.deserialize(packet);				
	
	if (result != null) {					
		return result;
	}
	else{					
		return false;
	};	
};



if(IsNumeric_JS(intakeID) == true){
	function cancelQuote_JS(){						
		
		var cancelIntake = confirm("Are you sure you want to cancel this intake?\n\nIf you want to cancel this Intake click \"OK\" otherwise click \"Cancel\"");

		if(cancelIntake){	
			launchCancelPage('appIntakeCancel.cfm?intakeid=' + intakeID);						
		};						
	};
	
	function restoreIntake_JS(){						
		
		var restoreIntake = confirm("Are you sure you want to restore this intake?\n\nIf you want to restore this Intake click \"OK\" otherwise click \"Cancel\"");

		if(restoreIntake){	
			launchCancelPage('appIntakeRestore.cfm?intakeid=' + intakeID);						
		};						
	};
	
	function launchCancelPage(linkToGoTo){			
		<!-------------------------------------------------------------------------------------->
		<!--- Issue with multiple windows for login is right here. while this script will    --->
		<!--- work fine it opens another window while the is two other windows open. when    --->
		<!--- you get back to this script all windows should probably close and only the     --->
		<!--- login window stay open. Quasi fixed 3/1/06 GC COPIED FROM appHeader.cfm        --->
		<!-------------------------------------------------------------------------------------->				
		var rand_no = Math.floor(Math.random()*101)
		var winName = 'loginwindow_' + rand_no; 							
		var wOpen;
	    var sOptions;			   		
	    sOptions = 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=300,height=275,left=150,top=150';
	    wOpen = window.open( '', winName, sOptions );
	    wOpen.location = linkToGoTo;
	    wOpen.focus();			  
	    return wOpen;
	};
	
	function printIntake_JS(){						
		
		var hardCopyIntake = confirm("You are about to print a hard copy of this intake.\nThe information printed will come from the saved data.\nIf you have changed this intake save your changes and retry printing. \n\nIf you want to continue this print job click \"OK\" otherwise click \"Cancel\"");

		if(hardCopyIntake){	
			launchPrintPage('appIntakeHardCopyPrint.cfm?intakeid=' + intakeID);
		};
		
	};	

	function printQuote_JS(){						
		var tempVar = 0;
		
		for(i = 1; i <= 10; i++){

			tempProduct = 'document.all.hcpcProduct' + i + 'TBox.value';	
			tempQty = 'document.all.hcpcQty' + i + 'TBox.value';	
			tempCost = 'document.all.hcpcCost' + i + 'TBox.value';	
							
			if (eval(tempProduct) != "" && (eval(tempCost) == "" || cleanNumericStringJS(eval(tempQty)) == "")){															
				tempVar = 1;
				break;
			}; 
		};						
		
		if(tempVar == 1){
			alert("One or more of the HCPC Cost textboxes with products in them are blank \n\nOR the Quantity is blank and will cause the quote to print incorrectly.\n\nPlease fix this and click on \"Print Quote\" again.");
		}
		else{
			launchPrintPage('appIntakeQuotePrint.cfm?intakeid=' + intakeID);
		};
	};	
	
	function launchPrintPage(linkToGoTo){			
		<!-------------------------------------------------------------------------------------->
		<!--- Issue with multiple windows for login is right here. while this script will    --->
		<!--- work fine it opens another window while the is two other windows open. when    --->
		<!--- you get back to this script all windows should probably close and only the     --->
		<!--- login window stay open. Quasi fixed 3/1/06 GC COPIED FROM appHeader.cfm        --->
		<!-------------------------------------------------------------------------------------->				
		var rand_no = Math.floor(Math.random()*101)
		var winName = 'loginwindow_' + rand_no;  			
		f_open_printwindow_max(linkToGoTo, winName);
	};
	
	function f_open_printwindow_max(aURL, aWinName){
	   var wOpen;
	   var sOptions;			   		
	   sOptions = 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=' + screenWidth + ',height=' + screenHeight + ',left=0,top=0';
	   wOpen = window.open( '', aWinName, sOptions );
	   wOpen.location = aURL;
	   wOpen.focus();			  
	   return wOpen;
	}

};

function orderingPhysicianVerification(){
	
	var thisMsg = "The following fields are necessary in order to clear this step.\n\n";
	
	if(document.getElementById("orderingPhysicianFNameTBox").value == ""){
		td_orderingPhysicianNameTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians First Name\n\n";							   
	};				
	if(document.getElementById("orderingPhysicianLNameTBox").value == ""){
		td_orderingPhysicianNameTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians Last Name\n\n";							   
	};				
	if(document.getElementById("orderingPhysicianPhoneTBox").value == ""){
		td_orderingPhysicianPhoneTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians Phone Number\n\n";							   
	};
	if(document.getElementById("orderingPhysicianUPINTBox").value == ""){
		td_orderingPhysicianUPINTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians UPIN Number\n\n";								   
	};
	if(document.getElementById("orderingPhysicianFaxTBox").value == ""){
		td_orderingPhysicianFaxTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians Fax Number\n\n";								   
	};
	if(document.getElementById("orderingPhysicianAddressTBox").value == ""){
		td_orderingPhysicianAddressTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians Address\n\n";							   
	};
	if(document.getElementById("orderingPhysicianCityTBox").value == ""){
		td_orderingPhysicianCityTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians City\n\n";							   
	};				
	if(document.getElementById("orderingPhysicianStateTBox").value == ""){
		td_orderingPhysicianStateTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians State\n\n";							   
	};				
	if(document.getElementById("orderingPhysicianZipTBox").value == ""){
		td_orderingPhysicianZipTBox.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Ordering Physicians Zip Code\n\n";							   
	};
	
	if(thisMsg != "The following fields are necessary in order to clear this step.\n\n"){						
		document.getElementById("clearStepPhysician").checked = false;	
		alert(thisMsg);
	}
	else{
		updateStep(4);
	};				
	
};

function hcpcVerification(){						
	var tempVar = 0;
	
	for(i = 1; i <= 40; i++){
		
		tempCode = 'document.all.hcpcCode' + i + 'TBox.value';		
		tempQty = 'document.all.hcpcQty' + i + 'TBox.value';	
		tempProduct = 'document.all.hcpcProduct' + i + 'TBox.value';						
		tempDiagnosis = 'document.all.hcpcDiagnosis' + i + 'TBox.value';						
											
		if (eval(tempProduct) != "" && (eval(tempCode) == "" || cleanNumericStringJS(eval(tempQty)) == "" || eval(tempDiagnosis) == "")){															
			tempVar = i;
			break;
		}; 
	};						
	
	if(tempVar > 0){						
		document.getElementById("clearStepHCPC").checked = false;	
		alert("One or more text boxes are empty on row: " + tempVar + " in the HCPC section.\n\nPlease fix this issue and try to clear HCPC Codes Step again.");
	}
	else{
		updateStep(5);
	};
};


function insuranceVerification(){								
	if(document.all.allowClearVerify.value == 1){
		updateStep(3);
	}
	else{				
		document.getElementById("clearStepVerify").checked = false;	
		if(document.all.badAddress.value == 1){
			alert("You may not clear the \"Clear Insurance Verification Step\" until all insurances have valid send claims to addresses (Address Line 1, City , State, Zip Code).");
		}
		else{
			alert("You may not clear the \"Clear Insurance Verification Step\" until the primary insurance has at least one verification.");
		};	
	};			
};

function sameEquipment(){
	
	var thisMsg = "The following fields are necessary in order to clear this step.\n\n";
	
	if(document.getElementById("OPTION_13_CBox_PastEquipmentYes").value == "" && document.getElementById("OPTION_13_CBox_PastEquipmentNo").value == ""){
		td_OPTION_13_CBox_PastEquipment.style.backgroundColor = 'fffbb8';					
		thisMsg = thisMsg + "      Has patient ever had medical equipment in the past\n\n";							   
	};		
	
	tempVar = 0;
	
	if(document.getElementById("OPTION_13_CBox_PastEquipmentYes").value != ""){
		
		for(i = 1; i <= 5; i++){					
			tempList = "";
			tempType = 'document.all.Equipment' + i + 'TypeTBox.value';		
			tempRentPurchase = 'document.all.Equipment' + i + 'RentPurchasedSelect.value';		
			tempFromMM = 'document.all.Equipment' + i + 'FromMM.value';		
			tempFromDD = 'document.all.Equipment' + i + 'FromDD.value';		
			tempFromYY = 'document.all.Equipment' + i + 'FromYY.value';		
			tempToMM = 'document.all.Equipment' + i + 'ToMM.value';		
			tempToDD = 'document.all.Equipment' + i + 'ToDD.value';		
			tempToYY = 'document.all.Equipment' + i + 'ToYY.value';		
			tempSupplierName = 'document.all.Equipment' + i + 'SupplierNameTBox.value';		
			tempSupplierTelephone = 'document.all.Equipment' + i + 'SupplierTelephoneTBox.value';		
			
			if(eval(tempType) != "" || eval(tempRentPurchase) != "" || eval(tempFromMM) != "" || eval(tempFromDD) != "" || eval(tempFromYY) != "" || eval(tempToMM) != "" || eval(tempToDD) != "" || eval(tempToYY) != "" || eval(tempSupplierName) != "" || eval(tempSupplierTelephone) != ""){
				if(eval(tempType) != ""){tempList = tempList + "," + eval(tempType)}		
				if(eval(tempRentPurchase) != ""){tempList = tempList + "," + eval(tempRentPurchase)}		
				if(eval(tempFromMM) != ""){tempList = tempList + "," + eval(tempFromMM)}		
				if(eval(tempFromDD) != ""){tempList = tempList + "," + eval(tempFromDD)}		
				if(eval(tempFromYY) != ""){tempList = tempList + "," + eval(tempFromYY)}		
				if(eval(tempToMM) != ""){tempList = tempList + "," + eval(tempToMM)}		
				if(eval(tempToDD) != ""){tempList = tempList + "," + eval(tempToDD)}		
				if(eval(tempToYY) != ""){tempList = tempList + "," + eval(tempToYY)}		
				if(eval(tempSupplierName) != ""){tempList = tempList + "," + eval(tempSupplierName)}		
				if(eval(tempSupplierTelephone) != ""){tempList = tempList + "," + eval(tempSupplierTelephone)}								
				if (tempList.split(",").length < 10){															
					tempVar = i;
					break;
				}; 
			};	
		};
	};
	
	if(tempVar > 0){						
		document.getElementById("clearStepEquipment").checked = false;	
		thisMsg = thisMsg + "      One or more text boxes are empty in row: " + tempVar + " in the \"Same Or Similiar Equipemnt\" section.\n\n";		
		//alert("One or more text boxes are empty on row: " + tempVar + " in the \"Same Or Similiar Equipemnt\" section.\n\nPlease fix this issue and try to clear the Step again.");
	}
	
	if(thisMsg != "The following fields are necessary in order to clear this step.\n\n"){						
		document.getElementById("clearStepEquipment").checked = false;	
		alert(thisMsg);
	}
	else{
		updateStep(2);
	};				
	
};			
	
function addLine(){
	for(var i=1; i <= 40; i++){										
		tempTRRow = 'document.all.tr_hcpc' + i + '.style.display';
		if(eval(tempTRRow) == 'none'){
			temp = 'document.all.tr_hcpc' + i + '.style.display = \'inline\''
			eval(temp);
			foc = 'document.all.hcpcCode' + i + 'TBox.focus();'
			eval(foc);												
			break;
		};												
	};								
};
			
			
			
				






function setPatient(PatientID, FName, MInitial, LName, MM, DD, YY, SSN, Sex, Weight, Height, AddressID, PhoneID, entityID, MaritalStatus, patientphoneid, patientaddressid, clientid){			
	//alert(PatientID + "[1], " + FName + "[2], " + MInitial + "[3], " + LName + "[4], " + MM + "[5], " + DD + "[6], " + YY + "[7], " + SSN + "[8], " + Sex + "[9], " + Weight + "[10], " + Height + "[11], " + AddressID + "[12], " + PhoneID + "[13], " + entityID + "[14], " + MaritalStatus + "[15], " + patientphoneid + "[16], " + patientaddressid + "[17], " + clientid + "[18]");		
	clearPatient();			
	document.getElementById("PatientID").value = PatientID;				
	document.getElementById("patientFNameTBox").value = FName;					
	document.getElementById("patientMInitialTBox").value = MInitial;					
	document.getElementById("patientLNameTBox").value = LName;
	document.getElementById("patientDOBMM").value = MM;
	document.getElementById("patientDOBDD").value = DD;
	document.getElementById("patientDOBYY").value = YY;
	document.getElementById("patientSSNTBox").value = SSN;	
	document.getElementById("patientWeightTBox").value = Weight;
	document.getElementById("patientHeightInches").value = Height;																				
	
	if(Sex == 0){
		checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale');
	}
	else if(Sex == 1){
		checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexFemale');
	};					
	if(MaritalStatus != ""){						
		for (i = 0; i < document.getElementById("patientMaritalStatus").options.length; i++){
			if(MaritalStatus == document.getElementById("patientMaritalStatus").options[i].value){
				document.getElementById("patientMaritalStatus").options[i].selected = true;		
			};
		};	
	};
	if(FName != ""){
		document.getElementById("patientFNameTBox").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientFNameTBox");
		elem.className = "nb";
	}
	if(LName != ""){
		document.getElementById("patientLNameTBox").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientLNameTBox");
		elem.className = "nb";
	}
	if(SSN != ""){
		document.getElementById("patientSSNTBox").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientSSNTBox");
		elem.className = "nb";
	}		
	if(MM != ""){
		document.getElementById("patientDOBMM").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientDOBMM");
		elem.className = "nb";
	}
	if(DD != ""){
		document.getElementById("patientDOBDD").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientDOBDD");
		elem.className = "nb";
	}
	if(YY != ""){
		document.getElementById("patientDOBYY").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientDOBYY");
		elem.className = "nb";
	}				
	if(Height != ""){
		document.getElementById("patientHeightInches").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientHeightInches");
		elem.className = "nb";
	}
	if(Weight != ""){
		document.getElementById("patientWeightTBox").style.backgroundColor = 'ffffff';
		elem = document.getElementById("patientWeightTBox");
		elem.className = "nb";
	}
					
	disablePatient(1);
	//showChange();		
					
	tr_patientAddressPhoneSelect.style.display = "inline";
	tr_patientAddress.style.display = "none";	
	tr_patientAddressPhone.style.display = "none";	
	
	resetPatientAddresses(entityID, AddressID, patientaddressid, clientid);
	resetPatientPhones(entityID, PhoneID, patientphoneid, clientid);							
				
	setInsurance(PatientID);
	checkIntakeExists();
						
	spPatient.innerHTML = '<u style=cursor:hand onclick=\"editPatient=window.open(\'appPatient.cfm?reload=no&patientid=' + PatientID + '&resetA=1&resetP=1&func=resetPatientInfo(' + clientid + ',' + PatientID + ')\',\'editPatient\',\'top=' + newWindowGetY(600) + ',left=' + newWindowGetX(825) + ',dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=825,height=600\'); editPatient.focus(0);\">PATIENT</u>';
																																	
};






function allowClose(){		
	var thisMsg = "The following fields are necessary in order to close with invoice number or re-assign this intake.<br><br>";
	var err = 0;
	if(document.getElementById("callerFNameTBox").value == ""){								
		err = 1;
		thisMsg = thisMsg + "      Caller First Name<br>";							   
	};		
	if(document.getElementById("callerLNameTBox").value == ""){								
		err = 1;
		thisMsg = thisMsg + "      Caller Last Name<br>";							   
	};							
	if(document.getElementById("callerPhoneTBox").value == ""){									
		err = 1;
		thisMsg = thisMsg + "      Caller Phone Number<br>";							   
	};								
	if(document.getElementById("patientFNameTBox").value == ""){	
		err = 1;					
		thisMsg = thisMsg + "      Patient First Name<br>";							   
	};				
	if(document.getElementById("patientLNameTBox").value == ""){	
		err = 1;						
		thisMsg = thisMsg + "      Patient Last Name<br>";							   
	};					
	if(document.getElementById("patientDOBMM").value == ""){	
		err = 1;							
		thisMsg = thisMsg + "     Patient DOB Month<br>";							   
	};
	if(document.getElementById("patientDOBDD").value == ""){								
		err = 1;
		thisMsg = thisMsg + "     Patient DOB Day<br>";							   
	};
	if(document.getElementById("patientDOBYY").value == ""){								
		err = 1;
		thisMsg = thisMsg + "     Patient DOB Year<br>";							   
	};				
	if(document.getElementById("patientSSNTBox").value == ""){								
		err = 1;
		thisMsg = thisMsg + "      Patient SSN<br>";							   
	};									
	if(document.getElementById("OPTION_3a_CBox_PatientSexMale").value == "" && document.getElementById("OPTION_3a_CBox_PatientSexFemale").value == ""){								
		err = 1;
		thisMsg = thisMsg + "      Patient Sex<br>";							   
	};	
	if(document.getElementById("patientMaritalStatus").value == ""){								
		err = 1;
		thisMsg = thisMsg + "      Patient Marital Status<br>";							   
	};				
	if(document.getElementById("patientAddressIDSelect").value == ""){									
		err = 1;
		thisMsg = thisMsg + "      Patient Address<br>";							   
	};								
	if(document.getElementById("patientPhoneIDSelect").value == ""){							
		err = 1;
		thisMsg = thisMsg + "      Patient Phone<br>";							   
	};	
	if(document.getElementById("alternateContactFNameTBox").value == ""){					
		err = 1;
		thisMsg = thisMsg + "      Alternate Contact First Name<br>";							   
	};											
	if(document.getElementById("alternateContactLNameTBox").value == ""){							
		err = 1;
		thisMsg = thisMsg + "      Alternate Contact Last Name<br>";							   
	};	
	if(document.getElementById("alternateContactRelationshipTBox").value == ""){								
		err = 1;
		thisMsg = thisMsg + "      Alternate Contact Relationship<br>";							   
	};				
	if(document.getElementById("alternateContactPhoneTBox").value == ""){						
		err = 1;
		thisMsg = thisMsg + "      Alternate Contact Home Phone<br>";							   
	};												
	/*if(document.getElementById("alternateContactWorkPhoneTBox").value == ""){								
		err = 1;
		thisMsg = thisMsg + "      Alternate Contact Work Phone<br>";							   
	};*/
	
	if(err == 1){
		sp_errorMsg.innerHTML = thisMsg;
		tr_errorMsg.style.display = 'inline';
		//resetSubmitButtons();						
		return false;
	}
	else{						
		return true;
	};	
};

function clearInsuranceName(insuranceFieldName){	
	$('#'+insuranceFieldName+'InsuranceNameTBox').val('');		
	$('#hidden_'+insuranceFieldName+'_AutoSuggestInsuranceID').val('');			
	$("input[name="+insuranceFieldName+"SendToAddress1TBox]").val('').attr("disabled","");			
	$("input[name="+insuranceFieldName+"SendToAddress2TBox]").val('').attr("disabled","");												
	$("input[name="+insuranceFieldName+"SendToCityTBox]").val('').attr("disabled","");		
	$("input[name="+insuranceFieldName+"SendToZipcodeTBox]").val('').attr("disabled","");		
	$("input[name="+insuranceFieldName+"PhoneNumberTBox]").val('').attr("disabled","");		
	$("input[name="+insuranceFieldName+"FaxNumberTBox]").val('').attr("disabled","");		
	$("select[name="+insuranceFieldName+"SendToStateTBox] option[value='']").attr('selected', 'selected');	
	$("select[name="+insuranceFieldName+"SendToStateTBox]").attr("disabled","");	
};

function checkInsuranceNames(){
	var temp = "";
	var retMsg = "";	

	for (i = 0; i < insurances.length; i++){		
		insuranceName = insurances[i];	
		//alert("insuranceName: " + insuranceName);		
		var tempInsuranceName = $('#'+insuranceName+'InsuranceNameTBox').val();
		//alert("tempInsuranceName: " + tempInsuranceName);
		if(tempInsuranceName != ''){
			var tempAutoSuggestInsuranceID = $('#hidden_'+insuranceName+'_AutoSuggestInsuranceID').val();	
			var tempInsuranceNameApproval = $('#hidden_'+insuranceName+'_InsuranceNameApproval').val();	
			if(tempAutoSuggestInsuranceID == "" && tempInsuranceNameApproval != "approved"){						
				var errorName = insuranceNameContains(tempInsuranceName);
				$('#hidden_'+insuranceName+'_InsuranceNameApproval').val("");
				//alert("errorName: " + errorName);
				if(errorName != "false"){							
					$('#hidden_'+insuranceName+'_InsuranceNameApproval').val("working");
					openMask('#managerApprovalContainer', insuranceName, errorName);	
					return false;	
				};								
			};
		};
	};		
	return true;								
};	

function checkInsuranceName(id){
	
	var insInputName = $('#'+id+'InsuranceNameTBox').val();		
	var nameApproval = $('#hidden_'+id+'_InsuranceNameApproval').val();		
	if(insInputName != "" && nameApproval != "approved"){
		var errorName = insuranceNameContains(insInputName);
		if(errorName != "" && errorName != "false"){
			alert("\"" + insInputName + "\" insurance cannot have \"" + errorName + "\" in the name. You will need approval from a Manager/Supervisor before submission.");			
		};
	};	
							
};	

function insuranceNameContains(name){	
	
	var retMsg = "false";
	//alert("name.toUpperCase(): " + name.toUpperCase());
	if(name.toUpperCase().indexOf('MEDICAID') >= 0){
		retMsg = "Medicaid";					
	};
	if(name.toUpperCase().indexOf('MEDICARE') >= 0){
		retMsg = "Medicare";					
	};			
	
	return retMsg;
			
};	



function openMask(elemId, pos, insName){
	
	//Get the A tag
	var id = elemId;

	//Get the screen height and width
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	
	msg = "Insurance name (" + pos + ") cannot have \"" + insName + "\" in the name. Please contact an Administrator or Supervisor and have them enter their password to approve the use of this name or close this window and change the insurance name.";			
	//msg = "Insurance name (" + pos + ") cannot have \"" + insName + "\" in the name. Please have one of the following individuals enter their password to continue using this name or close this window and change the insurance name.";			
	//getManagersToSignOff(); // call to show the users with administrator / supervisor status
	sp_errorMsgManagerApproval.innerHTML = msg;
	div_errorMsgManagerApproval.style.display = 'inline';

	//Set heigth and width to mask to fill up the whole screen
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	
	//transition effect		
	$('#mask').fadeIn(500);	
	$('#mask').fadeTo("slow",0.8);	

	//Get the window height and width
	var winH = $(window).height();
	var winW = $(window).width();
             
	//Set the popup window to center
	$(id).css('top',  getElementYAxisPos('tabPrimary') + 20);
	$(id).css('left', winW/2-$(id).width()/2);

	//transition effect
	$(id).fadeIn(500); 
	
	window.scrollTo(0, getElementYAxisPos('tabPrimary')); 
	
	$('#ManagerEntry').focus();
	
};

function submitPassFunc(){
	
	var pass = $('#ManagerEntry').val();
	var userID = $('#userID').val();		
	var clientID = $('#clientID').val();			
	var urlReconstructed = $('#urlReconstructed').val();		
							
	$.get(urlReconstructed+"/ws/wsEntity.cfc", 
		{ 
			method: "wsBooleanEntityPass",
			dataType: "xml",
			Data1: escape(clientID), 
			Data2: escape(userID),
			Data3: escape(pass),
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
			var passed = 'false';													
			$(x).find('BOOLEANPASS').each(function(index){								
				var $BOOLEANPASS = $(this);
				passed = $BOOLEANPASS.find('BOOL').text();								
			});	
			
			//Admin has entered their pass and has been verified.			
			if(passed == "true"){	
				for (i = 0; i < insurances.length; i++){		
					insuranceName = insurances[i];			
					if($('#hidden_'+insuranceName+'_InsuranceNameApproval').val() == "working"){
						$('#hidden_'+insuranceName+'_InsuranceNameApproval').val("approved");
						closeMask();
					};	
				};
			};
						
	//ends the callback function.										
	});
		
};

function getManagersToSignOff(){
	
	var userID = $('#userID').val();		
	var clientID = $('#clientID').val();			
	var urlReconstructed = $('#urlReconstructed').val();			
	$('#managersList_UL').empty();				
	$.get(urlReconstructed+"/ws/wsEntity.cfc", 
		{ 
			method: "wsGetEntityWithRoleXML",
			dataType: "xml",
			Data1: escape(clientID), 
			Data2: escape(userID),
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
														
			$(x).find('ENTITY').each(function(index){								
				var $ENTITY = $(this);
				var EntityID = $ENTITY.find('ENTITYID').text();	
				var FNAME = $ENTITY.find('FNAME').text();	
				var LNAME = $ENTITY.find('LNAME').text();		
				var fullName = FNAME + " " + LNAME;							
				
				$("<li></li>").text(fullName).appendTo("#managersList_UL");					
						
			});	
					
	//ends the callback function.										
	});  
				
};

function closeMask(){
	$('#mask').hide();
	$('.window').hide();
};


