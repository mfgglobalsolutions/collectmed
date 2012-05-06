<!---- appGoogleApi.cfm ---->

<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.textString" default="">
	<cfset textString = attributes.textString>
	
	<cfparam name="attributes.identifier" default="">
	<cfset identifier = attributes.identifier>
	
	<cfif IsDefined("form.identifier") AND form.identifier NEQ "">
		<cfset identifier = form.identifier>
	<cfelseif IsDefined("url.identifier") AND url.identifier NEQ "">
		<cfset identifier = url.identifier>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="identifier"
		fieldnames="HTML Editor Identifier"
		datatypes="numeric">	
	
	
		
<!------------------------------------------------------------------>
<!--- The page starts here with the page not being submitted     --->
<!--- so it is the first screen that the user will see.          --->
<!------------------------------------------------------------------>	
	<cfif NOT IsDefined("form.Submitted")>			
	
		
		<cfoutput>			
			
			<form name="tempForm" method="post">
				<input type="hidden" name="Submitted" value="yes">
			</form> 
			
			<script language="JavaScript">		
				
				if (document.getElementById){
				    var input = document.createElement('INPUT');
				    if (document.all) { 		       
						input.type = 'hidden';
				        input.name = 'tempVal';
				        input.value = window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.innerHTML;
				      }
				      else if (document.getElementById) { 		        
					    input.setAttribute('type', 'hidden');
				        input.setAttribute('name', 'tempVal');
				        input.setAttribute('value', window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.innerHTML);
				    }					
					var formElement=document.getElementById('tempForm');						
					formElement.appendChild(input);					
				}	
								
				tempForm.submit();					
			</script>	
								
		</cfoutput>
		

<!-------------------------------------------------------------------------------------->
<!--- Process the string that is to checked.                                         --->
<!-------------------------------------------------------------------------------------->		
	<cfelse>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- We have to make any LT GT characters to have space next to them so the words   --->
		<!--- adjacent will be picked up by Spell Checker. Also replace all the spaces with  --->
		<!--- tildas so that the array wont loose your spaces.                               --->
		<!-------------------------------------------------------------------------------------->				
		<cfset stringTempVal = replace(form.tempVal, "#CHR(62)#", "#CHR(62)##CHR(32)#", "ALL")>		
		<cfset stringTempVal = replace(stringTempVal, "#CHR(60)#", "#CHR(32)##CHR(60)#", "ALL")>	
		<cfset stringTempVal = replace(stringTempVal, "#CHR(62)##CHR(32)##CHR(32)#", "#CHR(62)##CHR(32)#", "ALL")>		
		<cfset stringTempVal = replace(stringTempVal, "#CHR(32)##CHR(32)##CHR(60)#", "#CHR(32)##CHR(60)#", "ALL")>		
		<cfset stringTempVal = replace(stringTempVal, CHR(32), "~", "ALL")>		
		<cfset new_aParsedHTML = Arraynew(1)>	
		<cfset htmlList = "">			
			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We need to send the string and parse out the HTML tags from the text. Since    --->
		<!--- our spell checker does not accept HTML tags we need to replace the html        --->
		<!--- with something.                                                                --->
		<!-------------------------------------------------------------------------------------->			
		<cf_gcParseHTMLIntoArray stringToParse="#trim(stringTempVal)#">	
						
		<cfloop from="1" to="#arraylen(aParsedHTML)#" index="i">
						
			<cfif NOT find("<",trim(aParsedHTML[i])) AND trim(aParsedHTML[i]) GT "">			
					
				<cfset temp = ArraySet(new_aParsedHTML, i,i, "#trim(aParsedHTML[i])#")>						
			
			<cfelse>
				
				<cfset thisString = "">
				<cfloop from="1" to="#len(trim(aParsedHTML[i]))#" index="g">
					<cfset thisString = thisString & "0">
				</cfloop>										
				<cfset temp = ArraySet(new_aParsedHTML, i,i, "#trim(thisString)#")>				
				<cfset htmlList = ListAppend(htmlList, i)>					
			
			</cfif>			
		
		</cfloop>		
		
			
		
		<!-------------------------------------------------------------------------------------->
		<!--- The array hs been processed so list it and send to spellcheck.                 --->
		<!--------------------------------------------------------------------------------------> 
		<cfset newString = "#ArrayToList(new_aParsedHTML,'')#">	
		<cfset innerHTMLString = "#ArrayToList(aParsedHTML,'')#">			
		
		<cfset newString = replace(newString, "#CHR(126)##CHR(46)#", "#CHR(46)#", "ALL")>	
		<cfset newString = replace(newString, "#CHR(126)#", "#CHR(32)#", "ALL")>	
		
		<cfset innerHTMLString = replace(innerHTMLString, "#CHR(126)##CHR(46)#", "#CHR(46)#", "ALL")>	
		<cfset innerHTMLString = replace(innerHTMLString, "#CHR(126)#", "#CHR(32)#", "ALL")>		
		
		
		
		<!--------------------------------------------------------------------------------------->
		<!--- Because of some formatting due to the HTML tags we must update the target with  --->
		<!--- what will be sent out to our spell checker to make sure the character           --->
		<!--- position matches.                                                               --->
		<!--------------------------------------------------------------------------------------->		
		<cfoutput>
			<script language="JavaScript">
				window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.innerHTML = "#innerHTMLString#";
			</script>	
		</cfoutput>
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Call the spellchecker with the replaced HTMl in it.                            --->
		<!--- Tag	Description                                                              --->
		<!--- o	    the offset from the start of the text of the word                        --->
		<!--- l     length of misspelled word                                                --->
		<!--- s     Confidence of the suggestion                                             --->
		<!--- text  tab delimited list of suggestions                                        --->
		<!-------------------------------------------------------------------------------------->			
		<cfsetting showdebugoutput="false">
		<cfsavecontent variable="xmlpacket"><?xml version="1.0"?><spellrequest textalreadyclipped="0" ignoredups="0" ignoredigits="1" ignoreallcaps="1"><text><cfoutput>#tostring(trim(newString))#</cfoutput></text></spellrequest></cfsavecontent>
		<cfhttp method="post" url="https://www.google.com/tbproxy/spell?lang=en" result="xmlresult">
		   <cfhttpparam value="#tostring(xmlpacket)#" type="body">
		</cfhttp>
		


		<!-------------------------------------------------------------------------------------->
		<!--- If error found in xml then ask them to try again.                              --->
		<!-------------------------------------------------------------------------------------->
		<cfif FindNoCase('<spellresult error="1"/>', xmlresult.filecontent, 0) GTE 1>
			<cf_gcGeneralErrorTemplate message="There was an issue with Spell Checker. Please try again.<p>#xmlresult.filecontent#</p>" back="no">
		</cfif>
		
<!---<cffile action="READ" file="c:\temp\Untitled1.xml" variable="xmlresult.filecontent">--->

		<!-------------------------------------------------------------------------------------->
		<!--- We need to bring it into CF XML readable content.                              --->
		<!-------------------------------------------------------------------------------------->		
		<cfset spellCheckXML = XMLParse(xmlresult.filecontent)>		
		
		<cfif StructKeyExists(spellCheckXML.spellresult, 'c')>
			<cfset numberOfErrors = Arraylen(spellCheckXML.spellresult.c)>
		<cfelse>
			<cfset  numberOfErrors = 0>	
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- No errors found in the text so show a no errors message and close button.      --->
		<!-------------------------------------------------------------------------------------->				
		<cfif numberOfErrors LTE 0>
			<cfoutput>			
				<div align="left">
					<table border="0" width="265" cellpadding="0" cellspacing="10"><tr><td>
						<cf_gcBorderedTable	title="No Errors Found" tablealign="left">					
							<table border="0" width="100%" cellpadding="0" cellspacing="10">	
								<tr>			
									<td class="SiteRequiredLabel" nowrap align="center">No erorrs were found in text.</td>			
								</tr>						
								<tr><td colspan="2">&nbsp;</td></tr>					
								<tr>
									<td align="center"><input type="Button" class="SiteSubmitbox" value="Close" onclick="self.close();"></td>
								</tr>						
							</table>				
						</cf_gcBorderedTable>
					</td></tr></table>	
				</div>					
			</cfoutput>	<cfabort>	
		</cfif>
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- We need to create an array that wil hold the position of words in the text.    --->
		<!-------------------------------------------------------------------------------------->		
		<cfset ordinalPosition = Arraynew(2)>	
		<cfset arrayCount = 1>
		<cfset count = 0>		
		<cfset start = "">
		<cfset end = "">
		<cfset specialCharacter = "?|.|,|:|;|-|_">
				
		<cfset arrayLoopTo = len(trim(newString))> 
		<cfset i = 1>
		<cfset countOneUp = 1>
		
		<cfloop condition="i LTE arrayLoopTo">
			
			<cfset thisChar = MID(newString, i, 1)>				
								
			<cfif thisChar NEQ CHR(32) AND start EQ "" AND NOT ListFind(specialCharacter, thisChar, "|")>
				<cfset start = i>
			</cfif>			
			
			<cfif (thisChar EQ CHR(32) AND start NEQ "") OR (start NEQ "" AND i EQ len(trim(newString))) OR ListFind(specialCharacter, thisChar, "|")>
				
				<cfif IsNumeric(start) AND ListFind(specialCharacter, thisChar, "|")>						
					<cfset end = i-1>					
					<cfset i = i>
					<cfset countOneUp = 0>						
				<cfelseif ListFind(specialCharacter, thisChar, "|")>					
					<cfset start = i>
					<cfset end = i>							 
				<cfelseif i EQ len(trim(newString))>					
					<cfset end = i>
				<cfelse>					
					<cfset end = i - 1>
				</cfif>
								
			</cfif>			
			
			<cfif IsNumeric(start) AND IsNumeric(end)>						
				<!---DEBUG <cfoutput><cfset st = start - 1><cfset en = end + 1><cfset diff = en - st><font size="1">[#arrayCount# : #start# : #end# : #MID(newString, start, diff)#] </font><br></cfoutput>--->
				<cfset ordinalPosition[arrayCount][1] = "#trim(start)#">
				<cfset ordinalPosition[arrayCount][2] = "#trim(end)#">			
				<cfset arrayCount = arrayCount + 1>				
				<cfset start = "">
				<cfset end = "">
			</cfif> 
			
			<cfif countOneUp>
				<cfset i = i + 1>
			</cfif>
			<cfset countOneUp = 1>
			
		</cfloop>
		
		
						
		<!-------------------------------------------------------------------------------------->
		<!--- Start the javascript needed for this page.                                     --->
		<!-------------------------------------------------------------------------------------->
		<cfoutput>
			
			<script type="text/javascript" language="JavaScript1.1">
				<!--
				var confirmAfterReplace=false;
				var currentError=0;
				var errCount=0;
				var errors=new Object();
				var validWords=new Array();
				
				function Error(position,word){
					this.word=word;
					this.position=position;
					this.addSuggestion=addSuggestion;
					this.suggestions=new Object();
					this.suggCount=0;
				};
				
				function addSuggestion(s){
					this.suggestions[this.suggCount]=s;
					this.suggCount++; 
				};										
				//-->
			</script>
		
		</cfoutput>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Now we must loop the errors.                                                   --->
		<!-------------------------------------------------------------------------------------->		
		<cfloop from="1" to="#trim(numberOfErrors)#" index="i">
						
			<cfset thisSuggestions = ListChangeDelims(spellCheckXML.spellresult.c[i].xmlText, "|", CHR(9))>
			<cfset thisStart = spellCheckXML.spellresult.c[i].xmlattributes.o + 1>
			<cfset thisLength = spellCheckXML.spellresult.c[i].xmlattributes.l>
			<cfset thisConfidence = spellCheckXML.spellresult.c[i].xmlattributes.s>
			<!---DEBUG <cfoutput>#thisSuggestions#<br>o: #thisStart#<br>l: #thisLength#<br>at: #MID(innerHTMLString, thisStart, thisLength)#<br><br></cfoutput>	--->
			
			<cfloop from="1" to="#arrayLen(ordinalPosition)#" index="j">				
				<cfif thisStart GTE ordinalPosition[j][1] AND thisStart LTE	ordinalPosition[j][2]>
					<cfset position = j - 1>
					<cfbreak>
				</cfif>	
			</cfloop>			
			
			<cfoutput>							
				<script language="JavaScript">
					errors[errCount]=new Error(#trim(position)#,"#MID(innerHTMLString, thisStart, thisLength)#");
					<cfloop list="#thisSuggestions#" delimiters="|" index="k">
						<cfif NOT FindNoCase(CHR(32), trim(k)) AND NOT FindNoCase("-", trim(k))> 
							errors[errCount].addSuggestion(new Option("#trim(k)#"));	
							validWords[validWords.length]="#trim(k)#";
						</cfif>
					</cfloop>					
					errCount++;
				</script>	
			</cfoutput>
						
		</cfloop>
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Start the output of the page that the user will see using Spell Check module.  --->
		<!-------------------------------------------------------------------------------------->		
		<cfoutput>
			<div align="left">
				<table border="0" width="248" cellpadding="0" cellspacing="10" bgcolor="F0F8FF">
					<tr>
						<td>
							<cf_tagSpellCheck>
						</td>
					</tr>
				</table>	
			</div>	
		</cfoutput>	
		
		
		
		
		
	</cfif>
	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
<!-------------------------------------------------------------------------------------->
<!--- Now the string must get back its HTML                                          --->
<!-------------------------------------------------------------------------------------->		
<!---<cfloop list="#htmlList#" index="j">			
	<cfset temp = ArraySet(new_aParsedHTML, j,j, "#trim(aParsedHTML[j])#")>
</cfloop>			
<cfset innerHTMLString = "#ArrayToList(new_aParsedHTML,' ')#">--->	
			
<!---
<cfcontent reset="true" type="text/xml"><cfoutput>#xmlresult.filecontent#</cfoutput>
--->	
	
<!---<cfoutput>
			
	<cfset changeto = ReplaceNoCase(xmlresult.filecontent, CHR(34), "", "ALL")>
	<cfset changeto = Replace(changeto, CHR(10), "", "ALL")>	
	<cfset changeto = Replace(changeto, CHR(13), "", "ALL")>						
		#changeto#		
</cfoutput>--->			
				