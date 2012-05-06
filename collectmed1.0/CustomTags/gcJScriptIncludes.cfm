<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcJScriptIncludes.cfm                                    --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---   &lt;cf_&gt;                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->  
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->  
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>  


<script language="JavaScript">


	
<!-------------------------------------------------------------------------------------->
<!--- /* call to ajax CF WS                                                        */--->
<!-------------------------------------------------------------------------------------->
 	function ajaxCFWS(url){				
		var packet = wddxSelectListGetFromURL(url);		
		//alert(packet);
		var wddxDes = new WddxDeserializer;				
		var result = wddxDes.deserialize(packet);						
		//alert(result);
		if (result != null) {					
			return result;
		}
		else{					
			return false;
		};						
	};	

 
<!-------------------------------------------------------------------------------------->
<!--- /* this function used by ajax.                                               */--->
<!-------------------------------------------------------------------------------------->
	function wddxSelectListGetFromURL(strURL){
    	var objHTTP, result;   
       // For Netscape 6+ (or other browsers that support XMLHttpRequest)
       	if (window.XMLHttpRequest) {
        	objHTTP=new XMLHttpRequest();	  
       	// For IE browsers under Windows    
       	} else if(window.ActiveXObject) {
       		objHTTP=new ActiveXObject("Microsoft.XMLHTTP");         	
       	}; 
	   	objHTTP.open("GET", strURL, false);  /*boolean: true (asynchronous) / false (synchronous). This must remain false */		          
		objHTTP.send(null);				  
        result=objHTTP.responseText;
       	// Return result
       	return result;
   };
	


/**********************************************************************/
/* Site Seal SSL Verification.                                        */
/**********************************************************************/																	
	function verifySealFooter(){
		var url = 'https://seal.godaddy.com:443/verifySeal?sealID=2060726648065c1de3a1271089bad249a17c700513654440';		
		window.open(url,'SealVerfication','location=yes,status=yes,resizable=yes,scrollbars=yes,width=650,height=450');
	}
				
			

/**********************************************************************/
/* clear radio value.                                                 */
/**********************************************************************/				
	function clearRadioValue(elementName){				
		var a = 'document.all.' + elementName + '.length';				
		for(var i = 0; i < eval(a); i++){				
			var b = 'document.all.' + elementName + '[' + i + '].checked = false';					
			eval(b);				   			
		}				
	};
	
	
/**********************************************************************/
/* javascript utility functions                                       */
/**********************************************************************/		
	<!---get radio value--->			
	function getRadioValue(elementName){
		
		var value = "";
		var g = 'document.all.' + elementName;
		tempObj = eval(g);
			
		if (tempObj[0]) { // if the button group is an array (one button is not an array)
			var a = tempObj.length;			
			for(var i = 0; i < eval(a); i++){
				var b = 'document.all.' + elementName + '[' + i + '].checked';
				if(eval(b)){
					var c = 'document.all.' + elementName + '[' + i + '].value';
					value = eval(c);
					return value;
				};
			}
		} 
		else{
			if (tempObj.checked){ 
				value = tempObj.value;
				return value; 
			}; 
		};
	
		return value;
		
		/*var value = "";
		var a = 'document.all.' + elementName + '.length';
		
		for(var i = 0; i < eval(a); i++){
			
			var b = 'document.all.' + elementName + '[' + i + '].checked';
			
			if(eval(b)){
				var c = 'document.all.' + elementName + '[' + i + '].value';
				value = eval(c);
				return value;
			};
		}
		
		return value;*/
		
	};	


/*****************************************************************************************************/
/* Scripts used to highlight text.                                                                   */
/*****************************************************************************************************/ 
	function highlight(){
		var oObj = event.srcElement
		oObj.style.color = "990000" ;
		oObj.style.textDecoration = "underline" ;
	};

	function lolight(){
		var oObj = event.srcElement
		oObj.style.color = "FF0000" ;
		oObj.style.textDecoration = "underline" ;
	};
	
	
/*****************************************************************************************************/
/* run this script everytime the user needs to confirm the deletion. you can call like this          */
/* <a href="javascript:VerifyDeleteAction('appAdminDeleteSitePage.cfm?PageID=#PageID#');">Delete</a> */
/*****************************************************************************************************/	
	function VerifyDeleteAction(loc, msg){
		if (confirm(msg)) { location = loc; } 
	}	


	
/*****************************************************************************************************/	
/* This script will popup the definitions on a page or any other page you decide                     */
/*****************************************************************************************************/		
	function popUp(url, width, height, scrolls){	           
	
		winwidth = width; // width of the new window 
		winheight = height; // height of the new window 
		winleft   = 200; // just dummie values
		wintop    = 200; // just dummie values
		
		if(parseInt(navigator.appVersion)>=4){
			winleft = (screen.width / 2) - (winwidth / 2); // center the window right to left 
	 		wintop = (screen.height / 2) - (winheight / 2); // center the window top to bottom 
	 		// the values get inserted into the features parameter of the window.open command... 
		}
		
		winOptions = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=" + scrolls + ",resizable=yes,copyhistory=no,width=" + width + ",height=" + height + ",top=" + wintop + ",left=" + winleft;
		
		var win = window.open(url, 'NewWindow', winOptions);
		if (!win.opener) win.opener = self; // For JS1.0
		if (win.focus) win.focus();
	}
	

/*****************************************************************************************************/	
/* This script will format a phone number into a U.S. number.                                        */
/*****************************************************************************************************/	
	function formatPhoneUS(phone) {    	
		var show1 = "";
        if (typeof(phone) != "undefined" && phone != "" && phone != " ") {
           
			 if(phone.substr(0,1) == 1 && phone.length > 10){	
			 	show1 = "1 ";		 	
				phone = phone.substr(1);
			 }
			 phone = phone.replace(/\s|\(|\-|\)|\.|x|:|\*/g, "");
             area = "(" + phone.substr(0,3) + ") ";
             pre = phone.substr(3,3) + "-";             
			 main = phone.substr(6)
             phone = show1 + area + pre + main; 			          
        }
		else if(typeof(phone) == "undefined"){
			phone = "";
		}; 
		
		return phone; 
	}
	
	function formatPhoneUS_JS(phone) {    	
		var show1 = "";
		var ext = "";
		
        if (typeof(phone) != "undefined" && phone != "" && phone != " ") {
           
		     phone = cleanNumericStringJS(phone);
			 if(phone.substr(0,1) == 1 && phone.length > 10){	
			 	show1 = "1 ";		 	
				phone = phone.substr(1);
			 }
			 
             area = "(" + phone.substr(0,3) + ") ";
             pre = phone.substr(3,3) + "-";             
			 main = phone.substr(6,4);     		 
			 if(phone.length > 9){
			 	ext = " ext. " + phone.substr(10);
			 }
			 phone = show1 + area + pre + main + ext; 			
                       
        }
		else if(typeof(phone) == "undefined"){
			phone = "";
		}; 
		
		return phone; 
	}
	
	
	function formatPhoneUSNoExt_JS(phone) {    	
		var show1 = "";		
		
        if (typeof(phone) != "undefined" && phone != "" && phone != " ") {
           
		     phone = cleanNumericStringJS(phone);
			 if(phone.substr(0,1) == 1 && phone.length > 10){	
			 	show1 = "1 ";		 	
				phone = phone.substr(1);
			 }
			 
             area = "(" + phone.substr(0,3) + ") ";
             pre = phone.substr(3,3) + "-";             
			 main = phone.substr(6,4);     		 
			 phone = show1 + area + pre + main; 			
                       
        }
		else if(typeof(phone) == "undefined"){
			phone = "";
		}; 
		
		return phone; 
	}	
	
/*****************************************************************************************************/	
/* This script will format a Social Security Number.                                                 */
/*****************************************************************************************************/	
	function formatSSN_JS(ssn) {    	
		var ssnReturn = "";
		if(typeof(ssn) != "undefined" && ssn != "" && ssn != " " && ssn.length > 2 && ssn.substr(0,3) != "PEN" && ssn.substr(0,3) != "Pen" && ssn.substr(0,3) != "pen") {
           			 
			 ssn = cleanNumericStringJS(ssn);
			 ssnReturn = ssn.substr(0,3);
			 if(ssn.length > 3){
			 	ssnReturn = ssnReturn + "-" + ssn.substr(3,2);
			 }
			 if(ssn.length > 5){             
			 	ssnReturn = ssnReturn + "-" + ssn.substr(5,4);
			 }	             
				 			          
        }
		else if(typeof(ssn) == "undefined"){
			ssnReturn = "";
		}
		else{
			if(ssn.substr(0,1) != "P" && ssn.substr(0,1) != "p"){
				ssn = cleanNumericStringJS(ssn);
			}
			ssnReturn = ssn;		
		}; 
		
		return ssnReturn; 
	}			
	
	

/*****************************************************************************************************/	
/* This script will format a zip-code.                                                               */
/*****************************************************************************************************/	
	function formatZipCode(zip){  		
       
		if (typeof(zip) != "undefined" && zip != "" && zip.length > 8) {				
			zip = zip.replace(/\s|\(|\-|\)|\.|x|:|\*/g, "");
            first = zip.substr(0,5);
            last = zip.substr(5,zip.length);    	
            zip = first + "-" + last; 			          
        } 
		else if(typeof(zip) == "undefined"){
			zip = "";
		}; 			
		return zip; 
	}	
	
	
	
/*****************************************************************************************************/	
/* This script will clean a string only numerics.                                                    */
/*****************************************************************************************************/	
	function cleanNumericStringJS(str) {    			
      
	    if (str != "") {
			str = str.replace(/[^\d]+/g,'');    
        }; 
		
		return str; 
	}	
		
	
	
/*****************************************************************************************************/	
/* This script will check to make sure the value sent is a date.                                     */
/*****************************************************************************************************/		
	function isDateJS(dtStr){
	
		var dtCh= "/";
		var minYear=1900;
		var maxYear=2100;
		var daysInMonth = DaysArray(12)
		var pos1=dtStr.indexOf(dtCh)
		var pos2=dtStr.indexOf(dtCh,pos1+1)
		var strMonth=dtStr.substring(0,pos1)
		var strDay=dtStr.substring(pos1+1,pos2)
		var strYear=dtStr.substring(pos2+1)
		strYr=strYear
		if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
		if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
		for (var i = 1; i <= 3; i++) {
			if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
		}
		month=parseInt(strMonth)
		day=parseInt(strDay)
		year=parseInt(strYr)
		if (pos1==-1 || pos2==-1){
			msg = "The date format should be : mm/dd/yyyy";
			return msg;
		}
		if (strMonth.length<1 || month<1 || month>12){
			msg = "Please enter a valid month";
			return msg;
		}
		if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
			msg = "Please enter a valid day";
			return msg;
		}
		if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
			msg = "Please enter a valid 4 digit year between "+minYear+" and "+maxYear;
			return msg;
		}
		if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
			msg = "Please enter a valid date";
			return msg;
		}
	
		return true
	
	}
		
	function isInteger(s){
		var i;
	    for (i = 0; i < s.length; i++){   	       
	        var c = s.charAt(i);
	        if (((c < "0") || (c > "9"))) return false;
	    }	    
	    return true;
	}
	
	function stripCharsInBag(s, bag){
		var i;
	    var returnString = "";
	    // Search through string's characters one by one. If character is not in bag, append to returnString.
	    for (i = 0; i < s.length; i++){   
	        var c = s.charAt(i);
	        if (bag.indexOf(c) == -1) returnString += c;
	    }
	    return returnString;
	}
	
	function daysInFebruary (year){
		// February has 29 days in any year evenly divisible by four, EXCEPT for centurial years which are not also divisible by 400.
	    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
	}
	
	function DaysArray(n) {
		for (var i = 1; i <= n; i++) {
			this[i] = 31
			if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
			if (i==2) {this[i] = 29}
	   } 
	   return this
	}
	
	
/*****************************************************************************************************/	
/* This script will check the date but also black the field out.                                     */
/*****************************************************************************************************/	
	function checkIsDate(formName, field, val){									
		if(isDateJS(val) != true){
			alert(isDateJS(val));
			var temp = 'document.' + formName + '.' + field + '.value = ""';
			eval(temp);
			//var temp2 = 'document.#formName#.' + field + '.focus()';										
			//eval(temp2);
		};									
	};	

	
	
	
/*****************************************************************************************************/	
/* This script will allow the tool tips to show.                                                     */
/*****************************************************************************************************/
	// adjust horizontal and vertical offsets here
	// (distance from mouseover event which activates tooltip)
	Tooltip.offX = 4;  
	Tooltip.offY = 4;
	Tooltip.followMouse = false;  // must be turned off for hover-tip
		
	function doTooltip(strong, ob, e, msg) {
	  
	  if (typeof ob != "undefined" && strong == 1){
	  	ob.style.color = 'blue';
	  	ob.style.fontWeight = 'BOLD';
	  };
	  
	  if ( typeof Tooltip == "undefined" || !Tooltip.ready ) return;
	  Tooltip.clearTimer();
	  var tip = document.getElementById? document.getElementById(Tooltip.tipID): null;
	  if ( tip && tip.onmouseout == null ) {
	      tip.onmouseout = Tooltip.tipOutCheck;
	      tip.onmouseover = Tooltip.clearTimer;
	  }
	  Tooltip.show(e, msg);
	}


	function doTooltipNew(strong, ob, e, msg, wid) {
	  Tooltip.boxWidth = wid;
	  if (typeof ob != "undefined" && strong == 1){
	  	ob.style.color = 'blue';
	  	ob.style.fontWeight = 'BOLD';
	  };
	  
	  if ( typeof Tooltip == "undefined" || !Tooltip.ready ) return;
	  Tooltip.clearTimer();
	  var tip = document.getElementById? document.getElementById(Tooltip.tipID): null;
	  if ( tip && tip.onmouseout == null ) {
	      tip.onmouseout = Tooltip.tipOutCheck;
	      tip.onmouseover = Tooltip.clearTimer;
	  }
	  Tooltip.show(e, msg);
	}
	
	function hideTip(ob) {
	  
	 if (typeof ob != "undefined"){  
	   ob.style.color = ob.style.color.value;
	   ob.style.fontWeight = 'normal';
	 };  
	   
	  if ( typeof Tooltip == "undefined" || !Tooltip.ready ) return;
	  Tooltip.timerId = setTimeout("Tooltip.hide()", 300);
	}
	
	Tooltip.tipOutCheck = function(e) {
	  e = dw_event.DOMit(e);
	  // is element moused into contained by tooltip?
	  var toEl = e.relatedTarget? e.relatedTarget: e.toElement;
	  if ( this != toEl && !contained(toEl, this) ) Tooltip.hide();
	}
	
	// returns true of oNode is contained by oCont (container)
	function contained(oNode, oCont) {
	  if (!oNode) return; // in case alt-tab away while hovering (prevent error)
	  while ( oNode = oNode.parentNode ) if ( oNode == oCont ) return true;
	  return false;
	}
	
	Tooltip.timerId = 0;
	Tooltip.clearTimer = function() {
	  if (Tooltip.timerId) { clearTimeout(Tooltip.timerId); Tooltip.timerId = 0; }
	}
	
	Tooltip.unHookHover = function () {
	    var tip = document.getElementById? document.getElementById(Tooltip.tipID): null;
	    if (tip) {
	        tip.onmouseover = null; 
	        tip.onmouseout = null;
	        tip = null;
	    }
	}
	
	dw_event.add(window, "unload", Tooltip.unHookHover, true);		
	

	
/*****************************************************************************************************/	
/* These functionswill show a popup with a little lip on it.                                         */
/*****************************************************************************************************/	
	function showPopupLayer(text){
		document.getElementById('divPopup').style.visibility="visible";
		document.getElementById('divPopup').style.top=event.clientY+18;
		document.getElementById('divPopup').style.left=event.clientX-8;
		document.getElementById("divTextPopup").innerHTML=text;
	}
	
	function hidePopupLayer(){
		document.getElementById('divPopup').style.visibility="hidden";
	}		
		
		
			
/*****************************************************************************************************/	
/* This script will allow this site to format a table for EOB.                                       */
/*****************************************************************************************************/	
	function hasClass(obj) {
	     var result = false;
	     if (obj.getAttributeNode("class") != null) {
	         result = obj.getAttributeNode("class").value;
	     }
	     return result;
	  }   
	
	 function EOBstripe(id) {
	
	    var even = false;    
	    var evenColor = arguments[1] ? arguments[1] : "#fff";
	    var oddColor = arguments[2] ? arguments[2] : "#f9f9f9";  /* ALT ROW COLOR */
	    var table = document.getElementById(id);
	    
		if (! table) { return; }   
	   
	    var tbodies = table.getElementsByTagName("tbody");
	  
	    for (var h = 0; h < tbodies.length; h++) {    
	     
	      var trs = tbodies[h].getElementsByTagName("tr");      
	      
	      for (var i = 0; i < trs.length; i++) {
		  
		    if (!hasClass(trs[i]) && ! trs[i].style.backgroundColor) { 
	        
	          var tds = trs[i].getElementsByTagName("td");        
	        
	          for (var j = 0; j < tds.length; j++) {
	        
	            var mytd = tds[j];
	            
		        if (! hasClass(mytd) && ! mytd.style.backgroundColor) {
	        
			      mytd.style.backgroundColor = even ? evenColor : oddColor;
	              
	            }
	          }
	        }       
	        even =  ! even;
	      }
	    }
	  }	
	
	

	  
/*****************************************************************************************************/	
/* This script will format the phone in US standard.                                                 */
/*****************************************************************************************************/		  
	function formatPhoneUS_JS(p){
	
		var pp = p;
		
		if(typeof(pp) != "undefined" && pp != "" && pp != " " && pp.length > 1 && pp.substr(0,2) != "NA" && pp.substr(0,2) != "Na" && pp.substr(0,2) != "na") {
        		
			pp = cleanNumericStringJS(pp);	
			cp = cleanNumericStringJS(p);
			
			if(cp.substring(0,1) == 1){
				cp = cp.substring(1,cp.length);	
			}	
				
			if(cp.length > 3){	
				area = cp.substring(0,3);		
				exchange = cp.substring(3,6);		
				number = cp.substring(6,10);	
				ext = cp.substring(10,cp.length);	
				pp = "(" + area + ") " + exchange + "-" + number;
				
				if(ext.length > 0){
					pp = pp + " ext." + ext;
				}			
			}		
		}
		else if(typeof(pp) == "undefined"){
			pp = "";
		}
		else{
			if(pp.substr(0,1) != "N" && pp.substr(0,1) != "n"){
				pp = cleanNumericStringJS(pp);
			}				
		}; 
			
		return pp;
		
	}


/*****************************************************************************************************/	
/* This script will check if string is numeric.                                                      */
/*****************************************************************************************************/		  
	function IsNumeric_JS(sText){
   		var ValidChars = "0123456789.";
   		var IsNumber = true;
   		var Char;
		
		if(sText == "" || typeof(sText) == "undefined"){			
			return false;
		};
		
		for (i = 0; i < sText.length && IsNumber == true; i++){ 
      		Char = sText.charAt(i); 
      		if (ValidChars.indexOf(Char) == -1){
         		IsNumber = false;				
         	};
      	}
   		return IsNumber;
   };
   	
	
/*****************************************************************************************************/	
/* This script will capitalize the first letter in a sentence.                                       */
/*****************************************************************************************************/	
	function capitalizeMe(obj){
        val = obj.value;
        newVal = '';
        val = val.split(' ');
        for(var c=0; c < val.length; c++) {
            newVal += val[c].substring(0,1).toUpperCase() + val[c].substring(1,val[c].length).toLowerCase();
			if(c != val.length){
				newVal += ' ';
			};	
        };
		if(newVal == ' '){
			newVal = "";
		};
       
	    obj.value = trimJS(newVal);
		
	};
	
	function capitalizeString_JS(str){
        val = str
        newVal = '';
        val = val.split(' ');
        for(var c=0; c < val.length; c++) {
            newVal += val[c].substring(0,1).toUpperCase() + val[c].substring(1,val[c].length).toLowerCase();
			if(c != val.length){
				newVal += ' ';
			};	
        };
		if(newVal == ' '){
			newVal = "";
		};
       
	    return trimJS(newVal);
		
	};

	
	function randNum_JS(){
		var dataNum = Math.floor(Math.random() * 1014352);
		return dataNum;
	};
	

	function decimalFormat_JS(x){
	  		
		x = x.replace(/[^\d+.]+/g,'');     	  	
		var len = x.toString().length;				
		var numOfPeriods = 0;
		for(z=0;z<=len;z++){
			if(x.charAt(z) == "."){
				numOfPeriods = numOfPeriods + 1;				
			}
		};
		
		if(numOfPeriods > 1){
			return("");	
		}
		else if(numOfPeriods == 0){
			x=x+".00"; 
			return(x);	
		}
		else{
			return(x);
		};	  
	};
	
	
	
	
	function ListAppend_JS(fieldValue, item){
		if (fieldValue.length == 0){
			fieldValue = item;
		}	
		else{			
			var currentValuesArray = fieldValue.split(",");							
			var eligible = true;
			for (i = 0; i < currentValuesArray.length; i++){						
				if(currentValuesArray[i] == item){
					eligible = false;	
					break;				
				}						  
			}
			
			if(eligible){
				fieldValue = fieldValue + ',' + item;
			};	
		}	
			
		return fieldValue;	
	}	
	
	


	function checkMonth_JS(thisobj){
		if(thisobj.value != "" && thisobj.value > 12){
			thisobj.value = ''; 
			alert("Month cannot exceed 12.");
			thisobj.focus();
		};	
	};
	
	function checkDay_JS(thisobj){
		if(thisobj.value != "" && thisobj.value > 31){
			thisobj.value = ''; 
			alert("Day cannot exceed 31.");
			thisobj.focus();
		};	
	};
	
	function checkYear_JS(thisobj){
		if(thisobj.value != "" && (thisobj.value > 2020 || thisobj.value < 1875)){
			thisobj.value = ''; 
			alert("Year must ba a valid number.");
			thisobj.focus();
		};	
	};
	
	
	function newWindowGetX(width){
	    x = (640 - width)/2;			
	    if (screen) {			       
	        x = (screen.availWidth - width)/2;
	    }	
		return x;		
	}
	
	function newWindowGetY(height){
	    y = (480 - height)/2;			
	    if (screen) {
	        y = (screen.availHeight - height)/2;			       
	    }
		return y;			
	};
	
	
	// Removes leading whitespaces
	function LTrim(value) {		
		var re = /\s*((\S+\s*)*)/;
		return value.replace(re, "$1");		
	};
	
	// Removes ending whitespaces
	function RTrim(value) {		
		var re = /((\s*\S+)*)\s*/;
		return value.replace(re, "$1");		
	};
	
	// Removes leading and ending whitespaces
	function trimJS(value) {		
		return LTrim(RTrim(value));		
	};

	function ListGetAt_JS(list, pos, del){		
		if(!del){del = ",";}
		return list.split(del)[pos]; //pos - 1 Decided to leave as javascript 0 based array
	};


	function uniqueList(list){
		var arrList = list.split(" ");
		var arrNewList = [];
		var seenList = {};
		for(var i=0;i<arrList.length;i++) {
			if (!seenList[arrList[i]]) {
				seenList[arrList[i]]=true;
				arrNewList.push(arrList[i]);
			}
		}
		return arrNewList.join(" ");
	}

	




function checkCapsLock( e ) {
	var myKeyCode=0;
	var myShiftKey=false;
	var myMsg='Caps Lock is On.\n\nTo prevent entering your password incorrectly,\nyou should press Caps Lock to turn it off.';

	// Internet Explorer 4+
	if ( document.all ) {
		myKeyCode=e.keyCode;
		myShiftKey=e.shiftKey;

	// Netscape 4
	} else if ( document.layers ) {
		myKeyCode=e.which;
		myShiftKey=( myKeyCode == 16 ) ? true : false;

	// Netscape 6
	} else if ( document.getElementById ) {
		myKeyCode=e.which;
		myShiftKey=( myKeyCode == 16 ) ? true : false;

	}

	// Upper case letters are seen without depressing the Shift key, therefore Caps Lock is on
	if ( ( myKeyCode >= 65 && myKeyCode <= 90 ) && !myShiftKey ) {
		alert( myMsg );

	// Lower case letters are seen while depressing the Shift key, therefore Caps Lock is on
	} else if ( ( myKeyCode >= 97 && myKeyCode <= 122 ) && myShiftKey ) {
		alert( myMsg );

	}
}

// onKeyPress="checkCapsLock( event )"



function getState(id){						
	var url = urlReconstructed + "/ws/wsState.cfc?method=wsGetState&id=" + escape(id) + "&" + escape(randNum_JS());				 
	var packet = _wddxSelectListGetFromURL(url);												
	var wddxDes = new WddxDeserializer;				
	var result = wddxDes.deserialize(packet);				
	
	if (result != null) {					
		return result;
	}
	else{					
		return id;
	}	
};	

	

function mainOpenClose(elementID, h, w, interval, slideDelay){    
	domStyle = document.getElementById(elementID).style;						
	if(domStyle.top != "0px"){//this will open the element				
		fX = 0; cX = -h; 		
		slideMenu(cX,fX,interval,slideDelay);					
	}
	else{//this will close the element
		fX = -h; cX = 0;
    	slideMenu(cX,fX,interval,slideDelay);		
	}	    
}	
						
						

function slideMenu(pointDistance,pointFinal,interval,slideDelay){
    //pointDistance distance to travel neg or pos
	//pointFinal final point 0 to show and neg to hide from view.
	//interval number of rows to show at each interval. 20 will get a good motion drop down based on a 400 height.
	//slideDelay time to wait after showing the last interval. 
	if (pointDistance != pointFinal){
        if (navigator.appName == "Microsoft Internet Explorer"){        	
			if (pointDistance > pointFinal){
            	pointDistance -= interval;
            }else{
            	pointDistance += interval;
            }          
        }
        domStyle.top = pointDistance;
     	//alert("pointDistance: " + pointDistance + " - domStyle.top: " + top + " \npointFinal: " + pointFinal);
		setTimeout('slideMenu(' + pointDistance + ',' + pointFinal + ',' + interval + ',' + slideDelay +')', slideDelay);  
	}
    return;
}
	

function getElementWidth(elementID){//width in pixels
	x = document.getElementById(elementID);
	return x.offsetWidth;	
}

function getElementHeight(elementID){//height in pixels
	x = document.getElementById(elementID);
	return x.offsetHeight;	
}	
	
function getElementLeft(elementID){//distance of paragraph from the left, in pixels
	x = document.getElementById(elementID);
	return x.offsetLeft;	
}		
	
function getElementTop(elementID){//distance of paragraph from the top, in pixels
	x = document.getElementById(elementID);
	return x.offsetTop;	
}	
	
function Left(str, n){
   if (n <= 0)
         return "";
   else if (n > String(str).length)
         return str;
   else
         return String(str).substring(0,n);
}
	

function reloadMain(){				
	var tempOpener = 'window.opener';		
	if (typeof(eval(tempOpener)) != "undefined"){	
		//window.opener.location.reload();
		window.opener.location.href = window.opener.location.href;
	};		
}	
	

function getElementYAxisPos(id){		
	var YAxis = 0;
	var obj = document.getElementById(id);
	var objcopy = document.getElementById(id);
	if(obj.offsetParent){ 
		while(obj.offsetParent){				
			YAxis += obj.offsetTop;
			obj = obj.offsetParent;
		}
	}
	else if(obj.x){			
		YAxis += obj.y;
	}				
	return YAxis;	
}	

function getElementXAxisPos(id){		
	var XAxis = 0;
	var obj = document.getElementById(id);
	var objcopy = document.getElementById(id);
	if(obj.offsetParent){ 
		while(obj.offsetParent){				
			XAxis += obj.offsetTop;
			obj = obj.offsetParent;
		}
	}
	else if(obj.x){			
		XAxis += obj.y;
	}				
	return XAxis;	
}


function scrollToByID(trgt){
	var target_offset = $("#"+trgt).offset();
	var target_top = target_offset.top;
	$('html, body').animate({scrollTop:target_top}, 10);
}	
	
</script>

	
