<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.selectedColor" default="DCE3EB">
	<cfset selectedColor = attributes.selectedColor>



<cfoutput>
	
	<script type="text/javascript">		
		
		var pSearchARRAY_INDEX = new Array();
		var pSearchARRAY_DOBMONTH = new Array();
		var pSearchARRAY_DOBDAY = new Array();
		var pSearchARRAY_DOBYEAR = new Array();
		var pSearchARRAY_ENTITYID = new Array();
		var pSearchARRAY_FNAME = new Array();
		var pSearchARRAY_HEIGHTININCHES = new Array();
		var pSearchARRAY_LNAME = new Array();
		var pSearchARRAY_MARITALSTATUS = new Array();
		var pSearchARRAY_MNAME = new Array();
		var pSearchARRAY_PATIENTID = new Array();
		var pSearchARRAY_PREFIXNAME = new Array();
		var pSearchARRAY_SEX = new Array();
		var pSearchARRAY_SSN = new Array();
		var pSearchARRAY_WEIGHT = new Array();
		var pSearchARRAY_FULLNAME = new Array();
		
		var pSearchARRAY_PHONEIDS = new Array();
		var pSearchARRAY_PHONENUMBERDBID = new Array();
		var pSearchARRAY_PHONENUMBERTYPEID = new Array();			
		var pSearchARRAY_PHONENUMBER = new Array();
		var pSearchARRAY_PHONEEXTENSION = new Array();					
		var pSearchARRAY_PHONENUMBERISDEFAULT = new Array();			
				
		var pSearchARRAY_ADDRESSIDS = new Array();
		var pSearchARRAY_ADDRESSDBID = new Array();
		var pSearchARRAY_ADDRESSTYPEID = new Array();
		var pSearchARRAY_ADDRESSLINE1 = new Array();
		var pSearchARRAY_ADDRESSLINE2 = new Array();
		var pSearchARRAY_ADDRESSCITY = new Array();
		var pSearchARRAY_ADDRESSSTATEID = new Array();
		var pSearchARRAY_ADDRESSZIPCODE = new Array();
		var pSearchARRAY_ADDRESSISDEFAULT = new Array();
		var pSearchARRAY_ADDRESSACTIVE = new Array();			
		
		
		function pSearchARRAY_PHONEReset(){
			for(var q=1; q < pSearchARRAY_PHONEIDS.length;q++) {pSearchARRAY_PHONEIDS[q]="";};
			for(var q=1; q < pSearchARRAY_PHONENUMBERDBID.length;q++) {pSearchARRAY_PHONENUMBERDBID[q]="";};
			for(var q=1; q < pSearchARRAY_PHONENUMBERTYPEID.length;q++) {pSearchARRAY_PHONENUMBERTYPEID[q]="";};
			for(var q=1; q < pSearchARRAY_PHONENUMBER.length;q++) {pSearchARRAY_PHONENUMBER[q]="";};
			for(var q=1; q < pSearchARRAY_PHONEEXTENSION.length;q++) {pSearchARRAY_PHONEEXTENSION[q]="";};
			for(var q=1; q < pSearchARRAY_PHONENUMBERISDEFAULT.length;q++) {pSearchARRAY_PHONENUMBERISDEFAULT[q]="";};
		};
		
		function pSearchArray_ADDRESSReset(){
			for(var q=1; q < pSearchARRAY_ADDRESSIDS.length;q++) {pSearchARRAY_ADDRESSIDS[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSDBID.length;q++) {pSearchARRAY_ADDRESSDBID[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSTYPEID.length;q++) {pSearchARRAY_ADDRESSTYPEID[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSLINE1.length;q++) {pSearchARRAY_ADDRESSLINE1[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSLINE2.length;q++) {pSearchARRAY_ADDRESSLINE2[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSCITY.length;q++) {pSearchARRAY_ADDRESSCITY[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSSTATEID.length;q++) {pSearchARRAY_ADDRESSSTATEID[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSZIPCODE.length;q++) {pSearchARRAY_ADDRESSZIPCODE[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSISDEFAULT.length;q++) {pSearchARRAY_ADDRESSISDEFAULT[q]="";};
			for(var q=1; q < pSearchARRAY_ADDRESSACTIVE.length;q++) {pSearchARRAY_ADDRESSACTIVE[q]="";};
		};
		
		function searchPatientOpenClose(){
			domStyle = document.getElementById('#trim(caller.mainSearchContainer)#').style;				
			if(domStyle.top != "0px"){				
				searchViewInput();
				mainOpen('#trim(caller.mainSearchContainer)#', #trim(caller.mainSearchContainerHeight)#, #trim(caller.mainSearchContainerWidth)#);
			}
			else{
				#trim(caller.mainSearchContainer)#.innerHTML = "";
				if(document.getElementById("sp_errorMsgPSearch")){sp_errorMsgPSearch.innerHTML = "";};
				mainClose('#trim(caller.mainSearchContainer)#', #trim(caller.mainSearchContainerHeight)#, #trim(caller.mainSearchContainerWidth)#);
			}
		};
						
		function searchFunc(){
			
			if(document.getElementById('FirstNamePSearch').value == "" && document.getElementById('LastNamePSearch').value == "" && document.getElementById('ssnPSearch').value == "" && document.getElementById('patientDOBMMPSearch').value == "" && document.getElementById('patientDOBDDPSearch').value == "" && document.getElementById('patientDOBYYPSearch').value == ""){		
				msg = "At least one field must be filled in order to search.";
				sp_errorMsgPSearch.innerHTML = msg;
				div_errorMsgPSearch.style.display = 'inline';
				return false;
			};	
			
			if(document.getElementById('patientDOBMMPSearch').value != "" || document.getElementById('patientDOBDDPSearch').value != "" || document.getElementById('patientDOBYYPSearch').value != "" ){
				if(document.getElementById('patientDOBMMPSearch').value == "" || document.getElementById('patientDOBDDPSearch').value == "" || document.getElementById('patientDOBYYPSearch').value == "" ){
					msg = "You must provide the full date of birth.";
					sp_errorMsgPSearch.innerHTML = msg;
					div_errorMsgPSearch.style.display = 'inline';
					return false;
				};	
			};
			
			if(document.getElementById('SSNPSearch').value != "" && document.getElementById('SSNPSearch').value.length < 3){
				msg = "You must provide at least 3 characters of the SSN to search on.";
				sp_errorMsgPSearch.innerHTML = msg;
				div_errorMsgPSearch.style.display = 'inline';
				return false;						
			};
			
			div_errorMsgPSearch.style.display = 'none';
			wsSearchPatients(#trim(session.ClientID)#, #trim(session.User.getUsersID())#, document.getElementById('FirstNamePSearch').value, document.getElementById('LastNamePSearch').value, document.getElementById('ssnPSearch').value, document.getElementById('patientDOBMMPSearch').value, document.getElementById('patientDOBDDPSearch').value, document.getElementById('patientDOBYYPSearch').value);
						
		};
				
		/*function wsSearchPatients(data1, data2, data3, data4, data5, data6, data7, data8){				
			var url = "#trim(request.urlReconstructed)#/ws/wsPatient.cfc?method=wsSearchPatientsXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&Data3=" + escape(data3) + "&Data4=" + escape(data4) + "&Data5=" + escape(data5) + "&Data6=" + escape(data6) + "&Data7=" + escape(data7) + "&Data8=" + escape(data8) + "&" + escape(randNum_JS());				 
			var packet = _wddxSelectListGetFromURL(url);												
			var wddxDes = new WddxDeserializer;				
			var result = wddxDes.deserialize(packet);			
			if (result != null) {	
				if(result != "true"){						
					createPatientSelectView(result);					
				}					
				return result;
			}
			else{					
				return false;
			}		
		}*/
		
		function wsSearchPatients(data1, data2, data3, data4, data5, data6, data7, data8){
					
			$.get("#trim(request.urlReconstructed)#/ws/wsPatient.cfc", 
				{ 
					method: "wsSearchPatientsPlainXML",
					dataType: "xml",
					Data1: escape(data1),
					Data2: escape(data2),
					Data3: escape(data3),
					Data4: escape(data4),
					Data5: escape(data5),
					Data6: escape(data6),
					Data7: escape(data7),
					Data8: escape(data8),	
					rand: escape(randNum_JS()) 
				},
			   	function(data){		
					createPatientSelectView(data);																						
			//ends the callback function.										
			});		
			
		}
		
		function wsPatientAddressPhone(data1, data2, data3){				
			var url = "#trim(request.urlReconstructed)#/ws/wsEntity.cfc?method=wsGetEntityAddPhoXML&Data1=" + escape(data1) + "&Data2=" + escape(data2) + "&" + escape(randNum_JS());				 
			var packet = _wddxSelectListGetFromURL(url);												
			var wddxDes = new WddxDeserializer;				
			var result = wddxDes.deserialize(packet);						
			if (result != null) {	
				if(result != "true"){						
					populateAddPhoArray(result, data3);					
				}					
				return result;
			}
			else{					
				return false;
			}		
		}
		
		function addPatientSelectViewRows(){		
			if(pSearchARRAY_INDEX.length > 0){
				for (i = 0; i < pSearchARRAY_INDEX.length; i++){				
					addPatientSelectViewRow(pSearchARRAY_INDEX[i], pSearchARRAY_DOBMONTH[i], pSearchARRAY_DOBDAY[i], pSearchARRAY_DOBYEAR[i], pSearchARRAY_ENTITYID[i], pSearchARRAY_FNAME[i], pSearchARRAY_HEIGHTININCHES[i], pSearchARRAY_LNAME[i], pSearchARRAY_MARITALSTATUS[i], pSearchARRAY_MNAME[i], pSearchARRAY_PATIENTID[i], pSearchARRAY_PREFIXNAME[i], pSearchARRAY_SEX[i], pSearchARRAY_SSN[i], pSearchARRAY_WEIGHT[i], pSearchARRAY_FULLNAME[i]);	
				};
			};		
		};
		
		function addPatientSelectViewRow(INDEX, DOBMONTH, DOBDAY, DOBYEAR, ENTITYID, FNAME, HEIGHTININCHES, LNAME, MARITALSTATUS, MNAME, PATIENTID, PREFIXNAME, SEX, SSN, WEIGHT, FULLNAME){
			var tbody = document.getElementById('selectViewData').getElementsByTagName("tbody")[0];	
			
			var tbl = document.getElementById('selectViewData');			
			var len = tbl.tBodies[0].rows.length;			
				
			var row = document.createElement("tr");	
			row.id = PATIENTID;		
			
			if(DOBMONTH != "" && DOBDAY != "" && DOBYEAR != ""){					
				var thisDOB = DOBMONTH + "/" + DOBDAY + "/" + DOBYEAR;
			}
			else{
				var thisDOB = ""; 				
			};
			
			var onclickFunction = 'openRow(this.parentNode, #trim(session.ClientID)#, ' + ENTITYID + ', ' + PATIENTID + ')';				
			var onDoubleclickFunction = "selectPatient(this.parentNode, '" + PATIENTID + "', '" + FNAME + "', '" + MNAME + "', '" + LNAME + "', '" + DOBMONTH + "', '" + DOBDAY + "', '" + DOBYEAR + "', '" + SSN + "', '" + SEX + "', '" + WEIGHT + "', '" + HEIGHTININCHES + "', " + ENTITYID + ", '" + MARITALSTATUS + "');";
													
			for (var j=0; j<5; j++){
				var oTD = document.createElement('td');
				if(j == 0){
					oTD.onclick = function(){eval(onclickFunction);};	
					oTD.appendChild(document.createTextNode(' '));						
				}
				else if(j == 1){							
					oTD.ondblclick = function(){eval(onDoubleclickFunction);};
					oTD.appendChild(document.createTextNode(PATIENTID));			
				}
				else if(j == 2){						
					oTD.ondblclick = function(){eval(onDoubleclickFunction);};
					oTD.appendChild(document.createTextNode(FULLNAME));			
				}
				else if(j == 3){						
					oTD.ondblclick = function(){eval(onDoubleclickFunction);};
					oTD.appendChild(document.createTextNode(thisDOB));				
				}
				else if(j == 4){						
					oTD.ondblclick = function(){eval(onDoubleclickFunction);};
					oTD.appendChild(document.createTextNode(SSN));			
				};
				
				row.appendChild(oTD);
			}
			tbody.appendChild(row);
			
			/*Second Row added here.*/
			var row2 = document.createElement('tr');
			
			var oTD = document.createElement('td');				
			var oSelAddress = document.createElement("select");
			oSelAddress.setAttribute("name", "EntityAddress_"+PATIENTID);
			oSelAddress.setAttribute("id", "EntityAddress_"+PATIENTID);
			oSelAddress.className = "SiteSelectBox";
			oTD.appendChild(oSelAddress);
			/*var blank = document.createElement('option');
			blank.innerText = 'No Address on File';
			oSelAddress.appendChild(blank);*/
			oTD.setAttribute("colSpan","3");	
			oTD.setAttribute("align","center");
			row2.appendChild(oTD);	
			
			var oTD = document.createElement('td');				
			var oSelPhone = document.createElement("select");
			oSelPhone.setAttribute("name", "EntityPhone_"+PATIENTID);
			oSelPhone.setAttribute("id", "EntityPhone_"+PATIENTID);
			oSelPhone.className = "SiteSelectBox";
			oTD.appendChild(oSelPhone);
			/*var blank = document.createElement('option');
			blank.innerText = 'No Phone on File';
			oSelPhone.appendChild(blank);*/
			oTD.setAttribute("colSpan","2");	
			oTD.setAttribute("align","center");
			row2.appendChild(oTD);					
				
			tbody.appendChild(row2);
			
			//alert(INDEX + " : " + DOBMONTH + " : " + DOBDAY + " : " + DOBYEAR + " : " + ENTITYID + " : " + FNAME + " : " + HEIGHTININCHES + " : " + LNAME + " : " + MARITALSTATUS + " : " + MNAME + " : " + PATIENTID + " : " + PREFIXNAME + " : " + SEX + " : " + SSN + " : " + WEIGHT + " : " + FULLNAME);		
		};
			
		function populateAddPhoArray(xml, patientID){
			
			if (window.ActiveXObject){
				var doc=new ActiveXObject("Microsoft.XMLDOM");
			  	doc.async="false";
			  	doc.loadXML(xml);
			}				
			var x=doc.documentElement;	
			
			for(var a = 0; a < x.getElementsByTagName("ADDRESSES").length; a++){			
				
				for(var b = 0; b < x.getElementsByTagName("ADDRESS")[a].childNodes.length; b++){		
					if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ACTIVE"){
						var thisActive = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSID"){
						var thisAddressID = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSLINE1"){
						var thisAddressLine1 = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSLINE2"){
						var thisAddressLine2 = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSTYPE"){
						var thisAddressType = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ADDRESSTYPEID"){
						var thisAddressTypeID = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "CITY"){
						var thisCity = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ISDEFAULT"){
						var thisIsDefault = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "STATEABBR"){
						var thisStateAbbr = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "STATEFULL"){
						var thisStateFull = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "STATEID"){
						var thisStateID = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("ADDRESS")[a].childNodes[b].nodeName == "ZIPCODE"){
						var thisZipCode = x.getElementsByTagName("ADDRESS")[a].childNodes[b].text;	
					}
				};
				
				//alert(thisActive + " : " + thisAddressID + " : " + thisAddressLine1 + " : " + thisAddressLine2 + " : " + thisAddressType + " : " + thisAddressTypeID + " : " + thisCity + " : " + thisIsDefault + " : " + thisStateAbbr + " : " + thisStateFull + " : " + thisStateID + " : " + thisZipCode);
				pSearchARRAY_ADDRESSIDS[a] = a;
		 		pSearchARRAY_ADDRESSDBID[a] = thisAddressID;
				pSearchARRAY_ADDRESSTYPEID[a] = thisAddressTypeID;
				pSearchARRAY_ADDRESSLINE1[a] = thisAddressLine1;
				pSearchARRAY_ADDRESSLINE2[a] = thisAddressLine2;
				pSearchARRAY_ADDRESSCITY[a] = thisCity;
				pSearchARRAY_ADDRESSSTATEID[a] = thisStateID;
				pSearchARRAY_ADDRESSZIPCODE[a] = thisZipCode;
				pSearchARRAY_ADDRESSISDEFAULT[a] = thisIsDefault;
				pSearchARRAY_ADDRESSACTIVE[a] = thisActive;			
				
			};
			
			pSearchARRAY_ADDRESSLoad(patientID, 0, 0);				
			
			//**************** ADDRESS END *******************//
			
						
			for(var a = 0; a < x.getElementsByTagName("PHONES").length; a++){			
				
				for(var b = 0; b < x.getElementsByTagName("PHONE")[a].childNodes.length; b++){		
					if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONEID"){
						var thisPHONENUMBERDBID = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONETYPEID"){
						var thisPHONENUMBERTYPEID = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONENUMBER"){
						var thisPHONENUMBER = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "PHONEEXTENSION"){
						var thisPHONEEXTENSION = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
					}
					else if(x.getElementsByTagName("PHONE")[a].childNodes[b].nodeName == "ISDEFAULT"){
						var thisPHONENUMBERISDEFAULT = x.getElementsByTagName("PHONE")[a].childNodes[b].text;	
					}
					
				};
				
				//alert(thisActive + " : " + thisPHONEID + " : " + thisPHONELine1 + " : " + thisPHONELine2 + " : " + thisPHONEType + " : " + thisPHONETypeID + " : " + thisCity + " : " + thisIsDefault + " : " + thisStateAbbr + " : " + thisStateFull + " : " + thisStateID + " : " + thisZipCode);
				//alert(thisPHONENUMBERDBID);			
				
				pSearchARRAY_PHONEIDS[a] = a;
		 		pSearchARRAY_PHONENUMBERDBID[a] = thisPHONENUMBERDBID;
				pSearchARRAY_PHONENUMBERTYPEID[a] = thisPHONENUMBERTYPEID;
				pSearchARRAY_PHONENUMBER[a] = thisPHONENUMBER;
				pSearchARRAY_PHONEEXTENSION[a] = thisPHONEEXTENSION;
				pSearchARRAY_PHONENUMBERISDEFAULT[a] = thisPHONENUMBERISDEFAULT;
					
			};
			
			pSearchARRAY_PHONELoad(patientID, 0, 0);
			
			//****************** PHONE END *******************//
			
		};
		
		function pSearchARRAY_PHONELoad(PATIENTID, viewPhoneID, patientPhoneid){												
			var selectBoxLength = 0;	
			var selectBoxName = "EntityPhone_"+PATIENTID;			
			document.getElementById(selectBoxName).options.length = 0;
			if(pSearchARRAY_PHONEIDS.length == 1){
				thisPhone = "Select Phone";
			}
			else{thisPhone = "No Phone On File";};
			thisPhoneID = "";
			thisPhoneDBID = "";
			document.getElementById(selectBoxName).options[0] = new Option(thisPhone, thisPhoneDBID);	
			for (i = 0; i < pSearchARRAY_PHONEIDS.length; i++){											
				thisPhoneID = pSearchARRAY_PHONEIDS[i];
				thisPhoneDBID = pSearchARRAY_PHONENUMBERDBID[i];
				thisPHONENUMBERTYPEID = pSearchARRAY_PHONENUMBERTYPEID[i];
				thisPHONENUMBER = pSearchARRAY_PHONENUMBER[i];				
				thisPHONEEXTENSION = pSearchARRAY_PHONEEXTENSION[i];
				thisPHONENUMBERISDEFAULT = pSearchARRAY_PHONENUMBERISDEFAULT[i];
																													
				if(thisPhoneDBID != ""){
					thisPhone = "";						
					if(thisPHONENUMBER != "@@" && thisPHONENUMBER != ""){thisPhone = formatPhoneUS_JS(thisPHONENUMBER)};
					//if(thisPHONEEXTENSION != "@@" && thisPHONEEXTENSION != ""){thisPhone = thisPhone + ' x ' + trimJS(thisPHONEEXTENSION)};
					document.getElementById(selectBoxName).options[i+1] = new Option(thisPhone, thisPhoneDBID);		
				};	
									
				if(i > 0 && thisPHONENUMBERISDEFAULT == 1){						
					document.getElementById(selectBoxName).options[i].selected = true;		
					//document.getElementById("PatientPhoneID").value = document.getElementById(selectBoxName).options[i].value;
				}
				else if(pSearchARRAY_PHONEIDS.length == 1){
					document.getElementById(selectBoxName).options[i+1].selected = true;	
				};	
									
				//if(thisPhone != "" && thisPhone.length > selectBoxLength){
					//selectBoxLength = thisPhone.length;							
				//}												
			};					
							
			if(pSearchARRAY_PHONEIDS.length < 1){					
				document.getElementById(selectBoxName).options[0] = new Option('No addresses on file', '');					
				document.getElementById(selectBoxName).options[0].selected = true;								
			}
			
			var finalLength = eval(selectBoxLength * 5.7 + 20);				
			if(finalLength > 100){
				finalLength = 100;
			}
			else if(finalLength < 50){
				finalLength = 100;
			};
						
			document.getElementById(selectBoxName).style.width = finalLength;
			
			if(IsNumeric_JS(patientPhoneid)){
				for (i = 0; i < pSearchARRAY_PHONEIDS.length; i++){
					if(patientPhoneid == pSearchARRAY_PHONENUMBERDBID[i]){
						document.getElementById(selectBoxName).options[i].selected = true;		
						//document.getElementById("PatientPhoneID").value = document.getElementById(selectBoxName).options[i].value;
					}
				}					
			}
			
			if(viewPhoneID != 0){						
				for (i = 0; i < pSearchARRAY_PHONEIDS.length; i++){
					if(viewPhoneID == pSearchARRAY_PHONENUMBERDBID[i]){
						document.getElementById(selectBoxName).options[i].selected = true;	
						//document.getElementById("PatientPhoneID").value = document.getElementById(selectBoxName).options[i].value;	
					};
				};	
			};
			
			//debugPhonees();								
		};
		
		function pSearchARRAY_ADDRESSLoad(PATIENTID, viewAddressID, patientaddressid){												
			var selectBoxLength = 0;	
			var selectBoxName = "EntityAddress_"+PATIENTID;			
			document.getElementById(selectBoxName).options.length = 0;
			if(pSearchARRAY_ADDRESSIDS.length == 1){
				thisAddress = "Select Address";
			}
			else{thisAddress = "No Address On File";};
			thisAddressID = "";
			thisAddressDBID = "";
			document.getElementById(selectBoxName).options[0] = new Option(thisAddress, thisAddressDBID);	
			for (i = 0; i < pSearchARRAY_ADDRESSIDS.length; i++){											
				thisAddressID = pSearchARRAY_ADDRESSIDS[i];
				thisAddressDBID = pSearchARRAY_ADDRESSDBID[i];
				thisAddressTypeID = pSearchARRAY_ADDRESSTYPEID[i];
				thisAddressLine1 = pSearchARRAY_ADDRESSLINE1[i];				
				thisAddressLine2 = pSearchARRAY_ADDRESSLINE2[i];
				thisAddressCity = pSearchARRAY_ADDRESSCITY[i];
				thisAddressStateID = pSearchARRAY_ADDRESSSTATEID[i];
				thisAddressZipCode = pSearchARRAY_ADDRESSZIPCODE[i];
				thisAddressIsDefault = pSearchARRAY_ADDRESSISDEFAULT[i];
				thisAddressActive = pSearchARRAY_ADDRESSACTIVE[i];																										
				if(thisAddressDBID != ""){
					thisAddress = "";						
					if(thisAddressLine1 != "@@" && thisAddressLine1 != ""){thisAddress = capitalizeString_JS(trimJS(thisAddressLine1))};
					if(thisAddressLine2 != "@@" && thisAddressLine2 != ""){thisAddress = thisAddress + ' ' + capitalizeString_JS(trimJS(thisAddressLine2))};
					if(thisAddressCity != "@@" && thisAddressCity != ""){thisAddress = thisAddress + ' ' +  capitalizeString_JS(trimJS(thisAddressCity))};
					if(thisAddressStateID != "@@" && thisAddressStateID != ""){thisAddress = thisAddress + ', ' + getState(thisAddressStateID)};
					if(thisAddressZipCode != "@@" && thisAddressZipCode != ""){thisAddress = thisAddress + ' ' + trimJS(thisAddressZipCode)};
					document.getElementById(selectBoxName).options[i+1] = new Option(thisAddress, thisAddressDBID);		
				};	
									
				if(i > 0 && thisAddressIsDefault == 1){						
					document.getElementById(selectBoxName).options[i].selected = true;		
					//document.getElementById("PatientAddressID").value = document.getElementById(selectBoxName).options[i].value;
				}
				else if(pSearchARRAY_ADDRESSIDS.length == 1){
					document.getElementById(selectBoxName).options[i+1].selected = true;	
				};	
									
				if(thisAddress.length > selectBoxLength){
					selectBoxLength = thisAddress.length;							
				}												
			};					
							
			if(pSearchARRAY_ADDRESSIDS.length < 1){					
				document.getElementById(selectBoxName).options[0] = new Option('No addresses on file', '');					
				document.getElementById(selectBoxName).options[0].selected = true;								
			}
			
			var finalLength = eval(selectBoxLength * 5.7 + 20);				
			if(finalLength > 250){
				finalLength = 250;
			};
			document.getElementById(selectBoxName).style.width = finalLength;
			
			if(IsNumeric_JS(patientaddressid)){
				for (i = 0; i < pSearchARRAY_ADDRESSIDS.length; i++){
					if(patientaddressid == pSearchARRAY_ADDRESSDBID[i]){
						document.getElementById(selectBoxName).options[i].selected = true;		
						//document.getElementById("PatientAddressID").value = document.getElementById(selectBoxName).options[i].value;
					}
				}					
			}
			
			if(viewAddressID != 0){						
				for (i = 0; i < pSearchARRAY_ADDRESSIDS.length; i++){
					if(viewAddressID == pSearchARRAY_ADDRESSDBID[i]){
						document.getElementById(selectBoxName).options[i].selected = true;	
						//document.getElementById("PatientAddressID").value = document.getElementById(selectBoxName).options[i].value;	
					};
				};	
			};
			
			//debugAddresses();								
		};	
		
	

			
		function createPatientSelectView(xml){				
			
			if (window.ActiveXObject){
				var doc=new ActiveXObject("Microsoft.XMLDOM");
			  	doc.async="false";
			  	doc.loadXML(xml);
			}				
			var x=doc.documentElement;																		    
			
			editableArea.innerHTML = "";		
			
			var oTable = document.createElement('table');			
			var oTBody = document.createElement('tbody');
			oTable.setAttribute("id","selectViewData");			
			oTable.setAttribute("cellPadding","0px");
			oTable.setAttribute("cellSpacing","0px");
			oTable.setAttribute("border","0");				
			
			var oTR = document.createElement('tr');
			oTR.setAttribute("className","selectViewHeaderTR");	
			var oTD = document.createElement('td');			
			oTD.appendChild(document.createTextNode(' '));			
			oTR.appendChild(oTD);
			var oTD = document.createElement('td');			
			oTD.appendChild(document.createTextNode('ID'));			
			oTD.setAttribute("align","center");	
			oTR.appendChild(oTD);
			var oTD = document.createElement('td');			
			oTD.appendChild(document.createTextNode('FULL NAME'));				
			oTR.appendChild(oTD);
			var oTD = document.createElement('td');			
			oTD.appendChild(document.createTextNode('DOB'));			
			oTR.appendChild(oTD);
			var oTD = document.createElement('td');			
			oTD.appendChild(document.createTextNode('SSN'));			
			oTR.appendChild(oTD);
			oTBody.appendChild(oTR);
			
			var i = 0;
				
			$(x).find('PATIENT').each(function(){	
								
				var $PATIENT = $(this);
				var thisPREFIXNAME = $PATIENT.find('PREFIXNAME').text();	
				var dob = $PATIENT.find('DOB').text();	
				var thisENTITYID = $PATIENT.find('ENTITYID').text();
				var thisFNAME = $PATIENT.find('FNAME').text();	
				var thisLNAME = $PATIENT.find('LNAME').text();	
				var thisMNAME = $PATIENT.find('MNAME').text();	
				var thisPATIENTID = $PATIENT.find('PATIENTID').text();	
				var thisSEX = $PATIENT.find('SEX').text();	
				var thisSSN = $PATIENT.find('SSN').text();	
				var thisWEIGHT = $PATIENT.find('WEIGHT').text();	
				var thisHEIGHTININCHES = $PATIENT.find('HEIGHTININCHES').text();			
				var thisMARITALSTATUS = $PATIENT.find('MARITALSTATUS').text();
				var thisDOB = $PATIENT.find('DOB').text();			
				if(thisDOB != ""){					
					var date = new Date(thisDOB);							 								
					var thisDOBMONTH = new String(date.getMonth() + 1)
					if(thisDOBMONTH.length == 1)thisDOBMONTH = "0" + thisDOBMONTH;
					var thisDOBDAY = new String(date.getDate())
					if(thisDOBDAY.length == 1)thisDOBDAY = "0" + thisDOBDAY;							
					var thisDOBYEAR = date.getFullYear();
					var thisDOB = thisDOBMONTH + "/" + thisDOBDAY + "/" + thisDOBYEAR; 
				}
				else{
					var thisDOB = ""; 
					var thisDOBMONTH = "";
					var thisDOBDAY = "";
					var thisDOBYEAR = "";
				}
				
				if(thisMNAME != ""){
					var thisFULLNAME = thisFNAME + ' ' + thisMNAME + ' ' + thisLNAME;
				}	
				else{
					var thisFULLNAME = thisFNAME + ' ' + thisLNAME;
				}					
				
				pSearchARRAY_INDEX[i] = i;
				pSearchARRAY_DOBMONTH[i] = thisDOBMONTH;
				pSearchARRAY_DOBDAY[i] = thisDOBDAY;
				pSearchARRAY_DOBYEAR[i] = thisDOBYEAR;
				pSearchARRAY_ENTITYID[i] = thisENTITYID;
				pSearchARRAY_FNAME[i] = thisFNAME;
				pSearchARRAY_HEIGHTININCHES[i] = thisHEIGHTININCHES;
				pSearchARRAY_LNAME[i] = thisLNAME;
				pSearchARRAY_MARITALSTATUS[i] = thisMARITALSTATUS;
				pSearchARRAY_MNAME[i] = thisMNAME;
				pSearchARRAY_PATIENTID[i] = thisPATIENTID;
				pSearchARRAY_PREFIXNAME[i] = thisPREFIXNAME;
				pSearchARRAY_SEX[i] = thisSEX;
				pSearchARRAY_SSN[i] = thisSSN;
				pSearchARRAY_WEIGHT[i] = thisWEIGHT;
				pSearchARRAY_FULLNAME[i] = thisFULLNAME;
				
				i = i+ 1;
					
			});	
										
			oTable.appendChild(oTBody);
			document.getElementById('editableArea').appendChild(oTable);			
			
			if(x.childNodes.length > 0){
				addPatientSelectViewRows();			
			};	
			
			initializeSearchTable();			
			
		};		
		
		function initializeSearchTable(){
			var table = document.getElementById("selectViewData");   
			var rows = table.getElementsByTagName("tr"); 	
			var cla = "even";
			for(var i=1; i<rows.length; i++){	
				if(rows[i].childNodes.length == 5){	
					if(cla == "odd"){				
						removeClassName(rows[i], "even");
						addClass(rows[i],"odd selectViewDataTR");						
						rows[i].onmouseover = function(){							
							this.style.cursor="hand";
							if(this.className.indexOf("selectViewDataSelectedTR") == -1){	
								this.className = "selectViewDataTR onMouseOverTR";		
							};						
						};
						rows[i].onmouseout = function(){								
							if(this.className.indexOf("selectViewDataSelectedTR") == -1){	
								this.className = "odd selectViewDataTR";	
							};	
						};
						cla = "even";					
					}
					else{					
						removeClassName(rows[i], "odd");
						addClass(rows[i],"even selectViewDataTR");						
						rows[i].onmouseover = function(){							
							this.style.cursor="hand";
							if(this.className.indexOf("selectViewDataSelectedTR") == -1){	
								this.className = "selectViewDataTR onMouseOverTR";	
							};										
						};
						rows[i].onmouseout = function(){						
							if(this.className.indexOf("selectViewDataSelectedTR") == -1){	
								this.className = "even selectViewDataTR"; 	
							};	
						};
						cla = "odd";				
					};				
					rows[i].childNodes[0].className = "selectViewImageTD";						
				}
				else{
					rows[i].className = "selectViewDataTR selectViewDataClosedTR";	
				};						
			};			
		};
							
		function openRow(obj, clientID, entityID, patientID){			
			if(!document.getElementsByTagName) return false;				
			var openClose = 0;
			if(obj.childNodes.length > 0 && obj.childNodes[0].className.indexOf("selectViewImageTD") != -1){
				openClose = 1;
			};	
			initializeSearchTable();		
			var SiblingNode = obj.nextSibling;			
			if(openClose){	
				SiblingNode.className = "selectViewDataOpenTR selectViewDataSelectedTR";			
				obj.className = "selectViewDataOpenTR selectViewDataSelectedTR";
				if(obj.childNodes.length > 0){	
					obj.childNodes[0].className = "selectViewImageMinusTD";		
				};	
			};
			pSearchARRAY_PHONEReset();
			pSearchArray_ADDRESSReset();	
			wsPatientAddressPhone(clientID, entityID, patientID);	
		};	
		
		function selectPatient(obj, PATIENTID, FName, MInitial, LName, MM, DD, YY, SSN, Sex, Weight, Height, entityID, MaritalStatus){														
			if(!document.getElementsByTagName) return false;							
			var selectBoxNameAddress = "EntityAddress_"+PATIENTID;		
			var selectBoxNamePhone = "EntityPhone_"+PATIENTID;			
			AddressID = document.getElementById(selectBoxNameAddress).value;
			PhoneID = document.getElementById(selectBoxNamePhone).value;
			setPatient(PATIENTID, FName, MInitial, LName, MM, DD, YY, SSN, Sex, Weight, Height, AddressID, PhoneID, entityID, MaritalStatus, PhoneID, AddressID, #trim(session.clientID)#);					
			searchPatientOpenClose();							
		};	
		
		function addClass(element,value){
			if(!element.className){
		    	element.className = value;
		  	} 
			else{
		    	newClassName = element.className;
		    	newClassName+= " ";
		    	newClassName+= value;
		    	element.className = uniqueList(newClassName);
		  	};
		};
										
		function removeClassName(objElm, strClassName){
			var oClassToRemove = new RegExp((strClassName + "\s?"), "i");
			newClassName = objElm.className.replace(oClassToRemove, "").replace(/^\s?|\s?$/g, "");
			objElm.className = uniqueList(newClassName);
		};
		
		function removeAllClasses(objElm){			
			objElm.className = "";
		};
			
	</script>
	
	<style type="text/css">	
		##div_errorMsgPSearch{
			float: left;
			width: 100%;
			background-color: ffffcc; 
			display: none; 			
			border: 1px solid ccc889;		
			padding: 5px; 			
		}
		##sp_errorMsgPSearch{			
			vertical-align: bottom; 	
			text-align: left;		
			font-weight: bold; 
			font-family: Arial, sans-serif; 
			font-size: x-small; 
			color: FF0000;
			padding: 0px 5px 0px 0px; 
		}			
		div.mainContainer{
			top: -#trim(caller.mainSearchContainerHeight)#px; 
			z-index: 100; 
			position: absolute; 
			width: #trim(caller.mainSearchContainerWidth)#px; 
			height: #trim(caller.mainSearchContainerHeight)#px; 
			background: ##fff; 
			border-top: 0px solid ##c0c0c0;			
			border-right: 2px solid ##c0c0c0; 			
			border-bottom: 2px solid ##c0c0c0;		
			border-left: 2px solid ##c0c0c0; 				
		}				
		.editableArea{			
			overflow: auto;
			width: #evaluate(caller.mainSearchContainerWidth - 5)#px; 
			height: #evaluate(caller.mainSearchContainerHeight - 5)#px; 
			border: 0px ff0000 dashed; 		
		}	
		.inputForm{
			float: left; 
			width: 311px; 
			border: 0px dotted; 			
			padding: 10px; 
			font-size: 11px; 
			color: ##666; 
			font-family: Arial,Helvetica,Sans-serif; 	
			margin-left: auto;
			margin-right: auto;
		}			
		.inputForm .mediumInput{
			float: left; 
			margin-right: 1px;
		}
		.mediumInput INPUT{
			width: 135px;
		}
		.inputButton BUTTON{
			width: 100px;
		}		
		.smallInput INPUT{
			width: 35px;
		}	
		###trim(caller.mainSearchContainer)#HeaderTitle{
			float: left;
			width: 100%; 
			margin: 0;
			padding: 0;
			list-style: none;
			background: ##CBD9E9; 					
		}
		###trim(caller.mainSearchContainer)#Title{
			float: left;
			margin: 0; 			
			padding: 5px 5px; 		
			font-weight: bold; 				
			font-family: Arial, sans-serif; 
			font-size: x-small; 
			text-align: left;			
		}			
		###trim(caller.mainSearchContainer)#CloseImage{
			float: right;
			margin: 0; 			
			padding: 5px 5px; 			
		}	
		.selectViewHeaderTR {
			margin: 0px;	
			padding: 5px;		
			background: ##CBD9E9; 		
			background-color: c0cddc; 
			font-weight: 700; 
			color: ffffff; 
			font-family: Arial,sans-serif,MS Sans Serif,Verdana; 
			font-size: x-small; 
			font-variant: small-caps; 
			text-align: center;			
		}			
		.selectViewDataTR {				
			background-color: ffffff;
			font: normal 10px "Verdana","Arial", "Helvetica";		
			padding: 5px 5px 5px 5px; 	
			border: 0px ff0000 dashed; 			
		}	
		.selectViewImageTD {	
			width: 10px;		
			background-image: url(images/plus.gif);
			background-repeat: no-repeat;
			background-position: 50% 50%;
		}
		.selectViewImageMinusTD {	
			width: 10px;		
			background-image: url(images/minus.gif);
			background-repeat: no-repeat;
			background-position: 50% 50%;
		}		
		.selectViewDataClosedTR {					
			display: none;
			padding: 5px 5px 5px 5px; 			
			font: normal 10px "Verdana","Arial", "Helvetica";			
		}		
		.selectViewDataOpenTR {					
			display: inline;
			padding: 5px 5px 5px 5px; 				
			font: normal 10px "Verdana","Arial", "Helvetica";			
		}	
		.selectViewDataSelectedTR {					
			background-color: #trim(selectedColor)#;
		}	
		.onMouseOverTR {					
			background-color: #trim(selectedColor)#;
		}		
		tr.even{
			background: ##FFFFFF;
		};
				
		tr.odd{
			background: ##F4F2F2;
		};
		
		tr.highlight{
			background: ##DCE3EB;
		};
		tr.selected{
			background: ##DCE3EB;
			color: ##fff;
		};	
	</style>
		
			
	<script language="JavaScript">
		function searchViewInput(){
			inputPage = "";
			inputPage = inputPage + '<ul id="#trim(caller.mainSearchContainer)#HeaderTitle">';
			inputPage = inputPage + '	<li id="#trim(caller.mainSearchContainer)#Title">Search Patients</li>';
			inputPage = inputPage + '	<li id="#trim(caller.mainSearchContainer)#CloseImage"><img src="images/hd_btn_close.gif" onclick="searchPatientOpenClose();"></li>';
			inputPage = inputPage + '</ul>';		
			inputPage = inputPage + '<DIV id="div_errorMsgPSearch" class="mediumInput">';
			inputPage = inputPage + '	<ul style="list-style: none;">';
			inputPage = inputPage + '		<li style="float: left;"><img src="images/alert.gif" alt="Alert" border="0" align="middle"></li>';
			inputPage = inputPage + '		<li style="float: right;"><span id="sp_errorMsgPSearch"></span></li>';
			inputPage = inputPage + '	</ul>';					 
			inputPage = inputPage + '</DIV>';	
			inputPage = inputPage + '<DIV id="editableArea" class="editableArea">';
			inputPage = inputPage + '	<DIV id="inputForm" class="inputForm">';			
			inputPage = inputPage + '		<DIV>';
			inputPage = inputPage + '			<DIV class="mediumInput">';
			inputPage = inputPage + '				<ol style="list-style: none;">';
			inputPage = inputPage + '					<li style="float: left; width: 65px; text-align: right;"><LABEL for="firstname" class="siteLabel">First Name:</LABEL></li>';
			inputPage = inputPage + '					<li><INPUT class="siteTextBox" maxLength="30" name="FirstNamePSearch"></li>';
			inputPage = inputPage + '				</ol>';					 
			inputPage = inputPage + '			</DIV>';				
			inputPage = inputPage + '		</DIV>';
			inputPage = inputPage + '		<DIV>';
			inputPage = inputPage + '			<DIV class="mediumInput">';
			inputPage = inputPage + '				<ol style="list-style: none;">';
			inputPage = inputPage + '					<li style="float: left; width: 65px; text-align: right;"><LABEL for="lastname" class="siteLabel">Last Name:</LABEL></li>';
			inputPage = inputPage + '					<li><INPUT class="siteTextBox" maxLength="30" name="LastNamePSearch" value=""></li>';
			inputPage = inputPage + '				</ol>';					 
			inputPage = inputPage + '			</DIV>';				
			inputPage = inputPage + '		</DIV>';
			inputPage = inputPage + '		<DIV>';
			inputPage = inputPage + '			<DIV class="mediumInput">';
			inputPage = inputPage + '				<ol style="list-style: none;">';
			inputPage = inputPage + '					<li style="float: left; width: 65px; text-align: right;"><LABEL for="ssn" class="siteLabel">SSN:</LABEL></li>';
			inputPage = inputPage + '					<li><INPUT class="siteTextBox" maxLength="30" name="ssnPSearch"></li>';
			inputPage = inputPage + '				</ol>';					 
			inputPage = inputPage + '			</DIV>';				
			inputPage = inputPage + '		</DIV>';
			inputPage = inputPage + '		<DIV>';
			inputPage = inputPage + '			<DIV class="smallInput">';
			inputPage = inputPage + '				<ol style="list-style: none;">';
			inputPage = inputPage + '					<li style="float: left; width: 65px; text-align: right;"><LABEL for="dob" class="siteLabel">DOB:</LABEL></li>';
			inputPage = inputPage + '					<li style="text-align: left;"><input type="Text" name="patientDOBMMPSearch" onkeyup="this.value=this.value.replace(/[^\d]+/g,\'\');" size="2" maxlength="2" class="siteTextBox" onblur="checkMonth_JS(this);">&nbsp;/&nbsp;<input type="Text" name="patientDOBDDPSearch" onkeyup="this.value=this.value.replace(/[^\d]+/g,\'\');" size="2" maxlength="2" class="siteTextBox" onblur="checkDay_JS(this);">&nbsp;/&nbsp;<input tabindex="30" type="Text" name="patientDOBYYPSearch" onkeyup="this.value=this.value.replace(/[^\d]+/g,\'\');" size="4" maxlength="4" class="siteTextBox" onblur="checkYear_JS(this);"></li>';
			inputPage = inputPage + '				</ol>';					 
			inputPage = inputPage + '			</DIV>';				
			inputPage = inputPage + '		</DIV>';						
			inputPage = inputPage + '		<DIV>';
			inputPage = inputPage + '			<DIV class="inputButton">';
			inputPage = inputPage + '				<ol style="list-style: none;">';
			inputPage = inputPage + '					<li style="text-align: center;">';
			inputPage = inputPage + '						<input type="Button" name="submitButton" class="SiteSubmitBox" value="Search" onclick="searchFunc();">';
			inputPage = inputPage + '					</li>';
			inputPage = inputPage + '				</ol>';					 
			inputPage = inputPage + '			</DIV>';				
			inputPage = inputPage + '		</DIV>';																					
			inputPage = inputPage + '	</DIV>';
			inputPage = inputPage + '</div>';
			//alert(inputPage);
			#trim(caller.mainSearchContainer)#.innerHTML = inputPage;	
		};
	</script>	
		
	<div id="#trim(caller.mainSearchContainer)#" name="#trim(caller.mainSearchContainer)#" class="mainContainer"></div>	
	

		
</cfoutput>	
	
	

<!--- <cfsetting showdebugoutput="No"> --->


