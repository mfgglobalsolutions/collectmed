<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@Name@@                                                   --->
<!--- gcCFScriptIncludes.cfm                                     --->
<!--- @@Name@@                                                   --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!--- General                                                    --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!--- Guillermo Cruz                                             --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               ---> 
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag will include any cfscripts that can be used       --->
<!--- throughout an application. just to it if you come up with  --->
<!--- a great cfscript that more than your own page can use.     ---> 
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!--- &lt;cf_gcCFScriptIncludes&gt;                              --->
<!--- @@ExampleCall@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!--- [None]                                                     --->
<!--- @@RequiredParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!--- [None]                                                     --->
<!--- @@OptionalParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!--- [None]                                                     --->  
<!--- @@ReturnedParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---  Created 06/18/2004                                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all CFscripts.                                  --->      
<!------------------------------------------------------------------>

	<!------------------------------------------------------------------>
	<!--- Change single quotes to double to insert in MS SQL.        --->
	<!------------------------------------------------------------------>	
	<cfscript>
		function mssqlReplaceSingleQuote(theString){				
			var newString = "";				
			newString = Replace(theString, "'", "''", "ALL");								
			return newString;	
		}
		
		REQUEST.mssqlReplaceSingleQuote = mssqlReplaceSingleQuote;
	</cfscript>




	<!------------------------------------------------------------------>
	<!--- insert at a certain index in a string.                     --->
	<!------------------------------------------------------------------>	
	<cfscript>
		function InsertAt(theString, newSubString, at){	
			var strLength = len(trim(theString)); 
			var firstPart = "";
			var lastPart = "";
			to = at;
			from = at - 1;
			
			firstPart = mid(trim(theString), 1, trim(from));
			lastPart = mid(trim(theString), trim(to), trim(strLength));
			  
			temp = firstPart & newSubString & lastPart;
					
			return temp;	
		}
		
		REQUEST.InsertAt = InsertAt;
	</cfscript>

	
	<!------------------------------------------------------------------>
	<!--- replace a certain index in a string.                       --->
	<!------------------------------------------------------------------>	
	<cfscript>
		function ReplaceAt(theString, newSubString, startIndex){	
			tempArray = ArrayNew(1);	
			for(i=1; i LTE len(theString); i=i + 1){		
				if (i EQ startIndex){
				tempArray[i] = newSubString;
				}
				else{tempArray[i] = mid(theString, i, 1);}					
			}
			
			temp = arraytoList(tempArray, '');
					
			return temp;	
		}
		
		REQUEST.ReplaceAt = ReplaceAt;
	</cfscript>
	
		
	<!------------------------------------------------------------------>
	<!--- Get everything on one line based on part of the line       --->
	<!--- being sent in.                                             --->
	<!------------------------------------------------------------------>	
	<cfscript>
		function getSpecificLine(searchString, fileContent) {
			
			foundStr = FindNoCase(trim(searchString), fileContent);		
			
			for(index=foundStr; index GT evaluate(foundStr - 1000); index=index - 1){
				if(MID(trim(fileContent), index, 1) EQ chr(10)){
					lineStart = trim(index) + 1;
					break;
				}			
			}
	
			for(index=foundStr; index LT evaluate(foundStr + 1000); index=index + 1){
				if(MID(trim(fileContent), index, 1) EQ chr(10)){
					lineEnd = trim(index) - 1;
					break;
				}			
			}		
			
			return mid(fileContent, lineStart, trim(lineEnd) - trim(lineStart));
			
		}
		
		REQUEST.getSpecificLine = getSpecificLine;
	</cfscript>	
	
	
	
	<cfscript>
		function getSpecificLineStart(searchString, fileContent, start) {
			
			foundStr = FindNoCase(trim(searchString), fileContent, start);		
			
			for(index=foundStr; index LT evaluate(foundStr + 1000); index=index + 1){
				if(MID(trim(fileContent), index, 1) EQ chr(10)){
					lineEnd = trim(index) - 1;
					break;
				}			
			}		
			
			return trim(lineEnd);
			
		}
		
		REQUEST.getSpecificLineStart = getSpecificLineStart;
	</cfscript>
	
	
	<cfscript>
		function getSpecificLineEnd(searchString, fileContent, start) {
			
			foundStr = FindNoCase(trim(searchString), fileContent, start);		
			
			for(index=foundStr; index GT evaluate(foundStr - 1000); index=index - 1){
				if(MID(trim(fileContent), index, 1) EQ chr(10)){
					lineStart = trim(index) + 1;
					break;
				}			
			}		
			
			return trim(lineStart);
			
		}
		
		REQUEST.getSpecificLineEnd = getSpecificLineEnd;
	</cfscript>	
	
	
	
	<!------------------------------------------------------------------>
	<!--- Return string with initial letter capitalized.             --->
	<!------------------------------------------------------------------>
	<cfscript>
		function capitalizeFirstLetter(word) {			
			return UCase(Mid(word,1, 1)) & LCase(mid(word, 2, len(word)));			
		}
		
		REQUEST.capitalizeFirstLetter = capitalizeFirstLetter;
	</cfscript>
	
	
	<!------------------------------------------------------------------>
	<!--- Return string with every word initial letter capitalized.  --->
	<!------------------------------------------------------------------>
	<cfscript>
		function capitalizeEveryFirstLetter(str) {			
			var finalStr = "";
			
			if(listlen(str, " ") LTE 1){
				finalStr = REQUEST.capitalizeFirstLetter(str);
			}
			else{
				for (i = 1; i lte listlen(str, " "); i = i + 1){
					word = REQUEST.capitalizeFirstLetter(listgetat(str, i, " "));
					finalStr = finalStr & " " & word;
				}	
			};
			
			return finalStr;
		}
		
		REQUEST.capitalizeEveryFirstLetter = capitalizeEveryFirstLetter;
	</cfscript>
	
	
	<!------------------------------------------------------------------>
	<!--- If you want the beginnning of a newlineGC then use this    --->
	<!--- function.                                                  --->
	<!------------------------------------------------------------------>
	<cfscript>
		function newLineGC(start, fileContent) {
			tempCR = CHR(13) & CHR(10);
			return find(tempCR, fileContent, start);			
		}
		
		REQUEST.newLineGC = newLineGC;
	</cfscript>
		
	
	
	<!------------------------------------------------------------------>
	<!--- If you want the content of a newline then use this         --->
	<!--- function.                                                  --->
	<!------------------------------------------------------------------>
	<cfscript>
		function newLineContent(start, fileContent) {			
			return LEFT(fileContent, start - 1);			
		}
		
		REQUEST.newLineContent = newLineContent;
	</cfscript>
	
		
	
	<!------------------------------------------------------------------>
	<!--- If you want the index of the next space then use this      --->
	<!--- function.                                                  --->
	<!------------------------------------------------------------------>
	<cfscript>
		function nextSpace(start, fileContent) {
			return find(CHR(32), fileContent, start);			
		}
			
		REQUEST.nextSpace = nextSpace;
	</cfscript>
	
	
	<!---			
		<cfoutput>
			firstSpace: #REQUEST.nextSpace(0, fileContent)# 
			<br>
			findNewLine: #REQUEST.newLine(0, fileContent)#
			<br> 
			newLine: [#REQUEST.newLineContent(REQUEST.newLine(0, fileContent), fileContent)#]
		</cfoutput>	
		
		<cfabort>	
	--->
	
	
	
		
	<!------------------------------------------------------------------>
	<!--- This function will tell you whether or not a sent in       --->
	<!--- variable is compatible with a float or money type.         --->
	<!------------------------------------------------------------------>
	<cfscript>
		function isFloat(val) {
			return (find(".",val) gt 0) and isNumeric(val);
		}
		
		REQUEST.isFloat = isFloat;
	</cfscript>
	
	
	<!------------------------------------------------------------------>
	<!--- This function will take out any non numeric characters     --->
	<!--- from a string.                                             --->
	<!------------------------------------------------------------------>
	<cfscript>
		function cleanNumericString(number){
			return ReReplaceNoCase(number, '[^0123456789]', '', 'ALL'); 
		}
		
		REQUEST.cleanNumericString = cleanNumericString;
	</cfscript>
	
	
	<!------------------------------------------------------------------>
	<!--- This function will take out any characters that are non    --->
	<!--- alphanumeric (A-Z a-z 0-9) from a string.                  --->
	<!------------------------------------------------------------------>
	<cfscript>
		function cleanAlphaNumeric(str){
			return ReReplaceNoCase(str, '[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789]', '', 'ALL'); 
		}	
		REQUEST.cleanAlphaNumeric = cleanAlphaNumeric;
	</cfscript>
	
	
	
	<!------------------------------------------------------------------>
	<!--- This function will take a string formatted and will        --->
	<!--- find the value of it.                                      --->
	<!------------------------------------------------------------------>	
	<cfscript>
		function midstring(string,from,to) {
			var start="";
			var end="";
			var lenstart="";		
			
			if(arrayLen(arguments) gte 3) to = arguments[3];		
			start = refind(from,string);
			end = refind(to,string,len(from)+start);
			lenstart = len(from);
			return mid(string,start+lenstart,max(end-start-lenstart,0));		
		}
		
		REQUEST.midstring = midstring;
	</cfscript>
	
	
	
	<!------------------------------------------------------------------>
	<!--- This function will get at a specific space.                --->
	<!------------------------------------------------------------------>	
	<cfscript>
		function getAt(string,at) {
			return mid(string, at, 1);			
		}	
		REQUEST.getAt = getAt;
	</cfscript>
	
	
		
	<!------------------------------------------------------------------>
	<!--- Find an occurance in a string.                             --->
	<!------------------------------------------------------------------>	
	<cfscript>		
		function FindOccurrences(searchString, searchFor){
			if(not len(searchString) OR not len(searchFor)) return 0;
			else {				
				return ((len(searchString) - len(replaceNoCase(searchString, searchFor, "", "ALL"))) / len(searchFor));
			}
		}		
		REQUEST.FindOccurrences = FindOccurrences;			
	</cfscript>		
	
	
	
<!------------------------------------------------------------------>
<!--- Delete part of a string a string.                          --->
<!------------------------------------------------------------------>	
	<cfscript>			
		function delStringPart(Str, from, to){  
		  var strLength = len(trim(Str)); 
		  var firstPart = "";
		  var lastPart = "";
		  to = to + 1;
		  from = from - 1;
		  
		  //Error Checking for lengths and sent variables.  
		  if(Not IsNumeric(trim(from))) return "Error, variable (trim(from)) must be numeric";
		  if(Not IsNumeric(trim(to))) return "Error, variable (trim(to)) must be numeric";
		  if(trim(to) GT trim(strLength)) return "Error, variable to(" & trim(to) & ") cannot be greater than the length (" & trim(strLength) & ") of your string";
		  if(trim(from) LT 0) return "Error, variable from(" & trim(from) & ") cannot be less than the length (" & trim(strLength) & ") of your string";
		  if(trim(from) GT trim(to)) return "Error, variable from(" & trim(from) & ") cannot be greater than variable to(" & trim(to) & ")";
		    
		  firstPart = mid(trim(Str), 1, trim(from));
		  lastPart = mid(trim(Str), trim(to), trim(strLength));
		  
		  //newStr = "[" & from & "-" & to & "]" & firstPart & lastPart;
		  newStr = firstPart & lastPart;
		  
		  return trim(newStr);
		 } 		 
		 REQUEST.delStringPart = delStringPart;
		
	</cfscript>
	
	
<!------------------------------------------------------------------>
<!--- Strip all HTML from string.                                --->
<!------------------------------------------------------------------>		
	<cfscript>			
			
		function stripHTML(str) {		
			newStr = ReReplaceNoCase(str, "<[^>]*>", "", "ALL");
			return newStr;
		}
		
		REQUEST.stripHTML = stripHTML;
		
	</cfscript>	
	
			
			
<!---------------------------------------------------------------------------------------------------->
<!--- An enhanced version of left() that doesn't cut words off in the middle.                      --->
<!--- Minor edits by Rob Brooks-Bilson (rbils@amkor.com) and Raymond Camden (ray@camdenfamily.com) --->
<!--- @author Marc Esher (jonnycattt@aol.com)                                                      --->
<!--- @version 2, April 16, 2002                                                                   --->
<!---------------------------------------------------------------------------------------------------->	
	<cfscript>						
		
		function fullLeft(str, count) {
			if (not refind("[[:space:]]", str) or (count gte len(str)))
				return Left(str, count);
			else if(reFind("[[:space:]]",mid(str,count+1,1))) {
			  	return left(str,count);
			} else { 
				if(count-refind("[[:space:]]", reverse(mid(str,1,count)))) return Left(str, (count-refind("[[:space:]]", reverse(mid(str,1,count))))); 
				else return(left(str,1));
			}
		}
		
		REQUEST.fullLeft = fullLeft;
		
	</cfscript>			
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Format U.S Phone                                                               --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		function formatPhoneUS(phone) {    	
			
			var show1 = "";
	      
		    if (phone NEQ "" AND LEN(phone) GTE 10) {
	          
				if(LEFT(phone,1) EQ 1){	
			   		show1 = "1 ";						
					phone = RIGHT(phone, len(phone) - 1);
			   	}
				 
				phone = ReReplaceNoCase(phone, '[^0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]', '', 'ALL');
	            area = "(" & LEFT(phone, 3) & ") ";	             
				pre = MID(phone, 4, 3) & "-";             
				main = MID(phone, 7, 4);	
				ext = MID(phone, 11, 5);	
				           
				phone = show1 & area & pre & main;   
							
				if(ext NEQ ""){				 	
					phone = phone & " ext." & ext;   
				} 
						          
	        }; 
			
			return phone; 
		}
		
		REQUEST.formatPhoneUS = formatPhoneUS;	
	</cfscript>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Format Phone  Hyphen                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		function formatPhoneHyphen(phone) {    	
			
			var show1 = "";
	      
		    if (phone NEQ "" AND LEN(phone) GTE 10) {
	          
				if(LEFT(phone,1) EQ 1){	
			   		show1 = "1 ";						
					phone = RIGHT(phone, len(phone) - 1);
			   	}
				 
				phone = ReReplaceNoCase(phone, '[^0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]', '', 'ALL');
	            area = LEFT(phone, 3) & "-";	             
				pre = MID(phone, 4, 3) & "-";             
				main = MID(phone, 7, 4);	
				ext = MID(phone, 11, 5);	
				           
				phone = show1 & area & pre & main;   
							
				if(ext NEQ ""){				 	
					phone = phone & " ext." & ext;   
				} 
						          
	        }; 
			
			return phone; 
		}
		
		REQUEST.formatPhoneHyphen = formatPhoneHyphen;	
	</cfscript>	
	
	

	
<!-------------------------------------------------------------------------------------->
<!--- Parse U.S Phone                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		function parsePhoneUS(phone, pext) {    	
				      
		    if (phone NEQ "" AND LEN(phone) GTE 10) {
	          
				if(LEFT(phone,1) EQ 1){				   					
					phone = RIGHT(phone, len(phone) - 1);
			   	}
				 
				phone = ReReplaceNoCase(phone, '[^0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]', '', 'ALL');
	            if(pext EQ 1){
					area = LEFT(phone, 3);	             
					pre = MID(phone, 4, 3);             
					main = MID(phone, 7, 4);		
					phone = area & pre & main;   
					return phone;
				}
				else if(pext EQ 2){				         
					ext = "";
					if(LEN(phone) GT 10){		
						ext = MID(phone, 11, LEN(phone));	
					}; 
					return ext;
				};						          
	        }; 			
		}
		
		REQUEST.parsePhoneUS = parsePhoneUS;	
	</cfscript>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- StringGlobalFooterE                                                            --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		
		function StringGlobalFooterE(str, ds){
		
			globalFooterCFC = createObject("component","com.common.gcGlobalFooter");
  			strE = globalFooterCFC.GlobalFooterE(trim(str), trim(ds));    
			
			return strE;
		}	
		
		REQUEST.StringGlobalFooterE = StringGlobalFooterE;			
	</cfscript>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- StringGlobalFooterD                                                            --->
<!-------------------------------------------------------------------------------------->
	<cfscript>		
		function StringGlobalFooterD(str, ds){		
		
			globalFooterCFC = application.beanFactory.getBean('globalFooter');
  			strE = globalFooterCFC.GlobalFooterD(trim(str));    
			
			return strE;
		}	
		
		REQUEST.StringGlobalFooterD = StringGlobalFooterD;			
	</cfscript>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Format SSN                                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		function formatSSN(ssn) {    	
			      
		    if (ssn NEQ "" AND LEN(ssn) EQ 9) {
	          
				ssn = ReReplaceNoCase(ssn, '[^0123456789]', '', 'ALL');
	            first = LEFT(ssn, 3);	             
				second = MID(ssn, 4, 2);             
				third = RIGHT(ssn, 4);	           
				ssn = first & "-" & second & "-" & third;   
						          
	        }; 
			
			return ssn; 
		}
		
		REQUEST.formatSSN = formatSSN;	
	</cfscript>	
	
	

<!-------------------------------------------------------------------------------------->
<!--- Format U.S Phone                                                               --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		function returnPhonePartsList(phone) {    	
			
			var show1 = " ";
	      	var area = " ";
			var pre = " ";
			var main = " ";
			
			phone = ReReplaceNoCase(phone, '[^0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]', '', 'ALL');
			
		   	if (phone NEQ "") {
	          
				if(LEFT(phone,1) EQ 1){	
					show1 = "1 ";						
					phone = RIGHT(phone, len(phone) - 1);
			   	};				
				if(LEN(phone) GTE 10){ 
					area = LEFT(phone, 3);	             
				};		
				if(LEN(phone) GTE 8){ 
					pre = MID(phone, 4, 3);      
				};			
				if(LEN(phone) GTE 8){ 
					main = RIGHT(phone, len(phone) - 6);	  
				};			         
				phone = show1 & "," & area & "," & pre & "," & main;					          
	        }; 
			
			return phone; 
		}
		
		REQUEST.returnPhonePartsList = returnPhonePartsList;
	
	</cfscript>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify email is valid                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		function IsEmail(str) {
			/**
			 * Tests passed value to see if it is a valid e-mail address (supports subdomain nesting and new top-level domains).
			 * Update by David Kearns to support '
			 * SBrown@xacting.com pointing out regex still wasn't accepting ' correctly.
			 * 
			 * @param str 	 The string to check. (Required)
			 * @return Returns a boolean. 
			 * @author Jeff Guillaume (jeff@kazoomis.com) 
			 * @version 2, August 15, 2002 
			 */
			
			//supports new top level tlds
			//("^['_a-z0-9-]+(\.['_a-z0-9-]+)*@[ GC took out the single qoute allowed in the regex.
			if (REFindNoCase("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|coop|info|museum|name))$",str)) return true;
			else return false;
		}
		
		REQUEST.IsEmail = IsEmail;

	</cfscript>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Calculate percentages.                                                         --->
<!--- Calculate The Value Of A Percentage Of A Value FIRST FUNCTION                  --->
<!--- Calculate The Percentage Of Value To A Value  SECOND FUNCTION                  --->
<!-------------------------------------------------------------------------------------->				
	<cfscript>
		
		function percentagev(a, b) {
	 		a = a / 100;
	 		b = a * b;
	 		return b;
	 	}
		
		REQUEST.percentagev = percentagev;
		
		function percentagep(c, d) {
			a = c;
			b = d;
	 		c = a / b;
	 		d = c * 100;
	 		return d;
	 	}	
		
		REQUEST.percentagep = percentagep;
	
	</cfscript>	
	
	
	
<!------------------------------------------------------------------>
<!--- Verify a datatype functions.                               --->
<!------------------------------------------------------------------>
	<cfscript>	
		
		/*-----------------------------------------------------------------*/
		/*--- NUMERIC                                                   ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isNumericDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
		REQUEST.isNumericDataType = isNumericDataType;	
		
		
		/*-----------------------------------------------------------------*/
		/*--- DECIMAL                                                   ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isDecimalDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
		REQUEST.isDecimalDataType = isDecimalDataType;	
				
						
		/*-----------------------------------------------------------------*/
		/*--- FLOAT                                                     ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isFloatDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
		REQUEST.isFloatDataType = isFloatDataType;	
		
		
		/*-----------------------------------------------------------------*/
		/*--- REAL                                                      ---*/
		/*--- Upon entry to the database all get truncated BUT the      ---*/
		/*--- decimal, negative and numbers.                            ---*/
		/*-----------------------------------------------------------------*/
		function isRealDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-.1234567890]","","all"))){
				return true;
			}		
			else 
				return false; 	
		}	
		
		REQUEST.isRealDataType = isRealDataType;	
		
		
		/*-----------------------------------------------------------------*/
		/*--- SMALL MONEY                                               ---*/
		/*--- Althought the comma is accepted it will be truncated      ---*/
		/*--- upon insertion. Only numbers, comma, negative and         ---*/
		/*--- decimal point are allowed. Must be between                ---*/
		/*--- -214,748.3648 and +214,748.3647                           ---*/
		/*-----------------------------------------------------------------*/	
		function isSmallMoneyDataType(val) {		  
			if (len(val) EQ len(rereplace(val,"[^-,.1234567890]","","all")) AND rereplace(val,"[^-.1234567890]","","all") GTE -214748.3648 AND rereplace(val,"[^-.1234567890]","","all") LTE 214748.3647){
				return true;
			}		
			else 
				return false; 	
		}
		
		REQUEST.isSmallMoneyDataType = isSmallMoneyDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- MONEY                                                     ---*/
		/*--- Althought the comma is accepted it will be truncated      ---*/
		/*--- upon insertion. Only numbers, comma, negative and         ---*/
		/*--- decimal point are allowed. Must be between                ---*/
		/*--- -922,337,203,685,477.5808 and +922,337,203,685,477.5807   ---*/
		/*-----------------------------------------------------------------*/	
		function isMoneyDataType(val) {		  
			if (len(val) EQ len(rereplace(val,"[^-,.1234567890]","","all")) AND rereplace(val,"[^-.1234567890]","","all") GTE -922337203685477.5808 AND rereplace(val,"[^-.1234567890]","","all") LTE 922337203685477.5807){
				return true;
			}		
			else 
				return false; 	
		}
		
		REQUEST.isMoneyDataType = isMoneyDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- SMALLINT                                                  ---*/
		/*--- small int can only be called with commas, negative,       ---*/
		/*--- numbers and decimal point. Integer from (-32,768)         ---*/
		/*--- through 2^15 - 1 (32,767).                                ---*/
		/*-----------------------------------------------------------------*/		
		function isSmallIntDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-,.1234567890]","","all")) AND rereplace(val,"[^-.1234567890]","","all") GTE -32768 AND rereplace(val,"[^-.1234567890]","","all") LTE 32768){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isSmallIntDataType = isSmallIntDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- TINY INT                                                  ---*/
		/*--- Tiny Int can only accept the values from 0 to 255.        ---*/		
		/*-----------------------------------------------------------------*/ 		
		function isTinyIntDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^1234567890]","","all")) AND val GTE 0 AND val LTE 255){
				return true;
			}		
			else 
				return false; 	
		}
		
		REQUEST.isTinyIntDataType = isTinyIntDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- INT                                                       ---*/
		/*--- int can only be called with commas, negative, numbers.    ---*/	
		/*--- Integer (whole number) from (-2,147,483,648) through      ---*/
		/*--- (2,147,483,647).                                          ---*/
		/*-----------------------------------------------------------------*/		
		function isIntDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^-,1234567890]","","all")) AND rereplace(val,"[^-1234567890]","","all") GTE -2147483648 AND rereplace(val,"[^-1234567890]","","all") LTE 2147483647){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isIntDataType = isIntDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- BIG INT                                                   ---*/
		/*--- int can only be called with commas, negative, numbers.    ---*/
		/*--- Integer (whole number) from (-9223372036854775808)        ---*/
		/*--- through (9223372036854775807).	                        ---*/ 
		/*-----------------------------------------------------------------*/		
		function isBigIntDataType(val) {
			if (len(val) NEQ len(rereplace(val,"[^-,1234567890]","","all")) OR rereplace(val,"[^-1234567890]","","all") LTE -9223372036854775808 OR rereplace(val,"[^-1234567890]","","all") GTE 9223372036854775807){
				return false;
			}		
			else {
				return true; 	
			}	
		}	
		
		REQUEST.isBigIntDataType = isBigIntDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- BIT                                                       ---*/
		/*--- int can only be called with 1 or 0.                       ---*/	
		/*-----------------------------------------------------------------*/		
		function isBitDataType(val) {
			if (len(val) EQ len(rereplace(val,"[^10]","","all"))){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isBitDataType = isBitDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- DateTime                                                  ---*/
		/*--- Date and time data from January 1, 1753, through          ---*/
		/*--- December 31, 9999, with an accuracy of three-hundredths   ---*/
		/*--- of a second, or 3.33 milliseconds.                        ---*/	
		/*-----------------------------------------------------------------*/			
		function isDateTimeDataType(val) {
			if (IsDate(val) AND DateCompare(val, '1753-01-1 00:00:01') GTE 0 AND DateCompare(val, '9999-12-31 11:59:59') LTE 0){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isDateTimeDataType = isDateTimeDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- SmallDateTime                                             ---*/
		/*--- Date and time data from January 1, 1900, through          ---*/ 
		/*--- June 6, 2079, with an accuracy of one minute.             ---*/	
		/*-----------------------------------------------------------------*/			
		function isSmallDateTimeDataType(val) {
			if (IsDate(val) AND DateCompare(val, '1900-01-01 00:00:00') GTE 0 AND DateCompare(val, '2079-06-06 11:59:59') LTE 0){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isSmallDateTimeDataType = isSmallDateTimeDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- char                                                      ---*/
		/*--- length cannot exceed 8,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isCharDataType(val) {
			if (len(val) LTE 8000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isCharDataType = isCharDataType;
		
				
		/*-----------------------------------------------------------------*/
		/*--- varchar                                                   ---*/
		/*--- length cannot exceed 8,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isVarcharDataType(val) {
			if (len(val) LTE 8000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isVarcharDataType = isVarcharDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- text                                                      ---*/
		/*--- length cannot exceed 2,147,483,647 characters.            ---*/	
		/*-----------------------------------------------------------------*/			
		function isTextDataType(val) {
			if (len(val) LTE 2147483647){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isTextDataType = isTextDataType;		
		
		
		/*-----------------------------------------------------------------*/
		/*--- nchar                                                     ---*/
		/*--- length cannot exceed 4,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isNCharDataType(val) {
			if (len(val) LTE 4000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isNCharDataType = isNCharDataType;

		
		/*-----------------------------------------------------------------*/
		/*--- nvarchar                                                  ---*/
		/*--- length cannot exceed 4,000 characters.                    ---*/	
		/*-----------------------------------------------------------------*/			
		function isNVarcharDataType(val) {
			if (len(val) LTE 4000){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isNVarcharDataType = isNVarcharDataType;
		
		
		/*-----------------------------------------------------------------*/
		/*--- ntext                                                     ---*/
		/*--- length cannot exceed 1,073,741,823 characters.            ---*/	
		/*-----------------------------------------------------------------*/			
		function isNTextDataType(val) {
			if (len(val) LTE 1073741823){
				return true;
			}		
			else {
				return false; 	
			}	
		}	
		
		REQUEST.isNTextDataType = isNTextDataType;	
		
			
			
		
	</cfscript>	
	
	
	
	