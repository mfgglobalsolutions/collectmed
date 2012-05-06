
<cfoutput>
	
	<script type="text/javascript" language="JavaScript1.1">
		var parseText;
		
		function highlight2(position) {		
			var range=window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.createTextRange();
			range.move("word",position);
			range.moveEnd("word",1);
			text=range.text;
			text=text.replace(/\W+$/,''); 
			if(text.length==range.text.length-1){
				range.moveEnd("character",-1);
			}
			range.select();
		}
		
		function replaceWithWord(word,position,validreplacement){
			var range=window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.createTextRange();
			range.move("word",position);
			range.moveEnd("word",1);
			text=range.text;
			text=text.replace(/\W+$/,''); // strip spaces
			if(text.length==range.text.length-1){
				range.moveEnd("character",-1);
			}
			range.text=word;
		}
		
		function replaceWithAll(word,position,errorWord,validReplacement){
			var range=window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.createTextRange();
			range.move("word",position);
			var moved=range.moveEnd("word",1);
			var count=0;
			while(moved>0){
				text=range.text;
				text=text.replace(/\W+$/,''); // strip spaces
				if(text.length==range.text.length-1){
					range.moveEnd("character",-1);
				}
				if(range.text==errorWord){
					range.text=word;
					count++;
				}
		
				range.moveStart("word",1);
				moved=range.moveEnd("word",1);
			}
			return count;
		}
		
		function nohighlight(){
			var range = window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.createTextRange();
			range.move("word",0);
			range.select();
			window.opener.document.frames('DHTMLEditor#trim(identifier)#').focus();
		}
		
		function parse(position){
			var range = window.opener.document.frames('DHTMLEditor#trim(identifier)#').document.body.createTextRange();
			range.move("word",position);
			var moved=range.moveEnd("word",1);
			// moves word by word
			var count=position;
			parseText="";
			var specialcase;
			if(position==0)
				specialcase=" T";
			else
				specialcase=" F";
			if(moved>0){
				text=range.text;
				text=text.replace(/[\ \n\r]+$/,'');	// trim trailing spaces.
				if(text=="." || text=="!" || text=="?")
					specialcase=" T";
				else
				{
					if(moved!=0 && text.match("[A-Za-z]"))
						parseText+=" "+count+" "+text+specialcase; // extracts the words
					specialcase=" F";
				}
				while(true)
				{
					range.moveStart("word",1);
					moved=range.moveEnd("word",1);
					count++;
					text=range.text;
					text=text.replace(/[\ \n\r]+$/,'');	// trim trailing spaces.
					if(text=="." || text=="!" || text=="?")
						specialcase=" T";
					else
					{
						if(moved!=0 && text.match("[A-Za-z]"))
							parseText+=" "+count+" "+text+specialcase; // extracts the words
						specialcase=" F";
					}
					if(moved==0)
						break;
				}	
			}
		}
	
	</script>

	<script type="text/javascript" language="JavaScript1.1">
		<!--
		/*function right(e) {
		  if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)) return false;
		  else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) {
		    alert('Copyright 2007 PA Inc. All Rights Reserved.');
			window.event.cancelBubble=true;
		    return false;
		  }	
		  return true;
		}
		document.onmousedown=right;
		if (document.layers) window.captureEvents(Event.MOUSEDOWN);
		window.onmousedown=right;*/
		
		
		var currentError=0;
		var ignored=new Array();			
		
		function search(array,item){
			for(i=0;i<array.length;i++) {
				if(array[i]==item)
					return true;
			}
			return false;
		}
				
		function getNextError(){
			var result=null;
			while(currentError!=errCount)
			{
				result=errors[currentError++];
				//alert(search(ignored,result.word) + " : " + result.word);
				if(!search(ignored,result.word))
					return result;
				else
					result=null;
			}
			return result;
		}

		function runSpellCheck(){
			
			// Get the error information and populate the form also callback to the editor and highlight the incorrect text
			
			var error=getNextError();
			if(error!=null){				
				
				while (results.suggestions.options.length) results.suggestions.options[0] = null;

				results.notFound.value=error.word;
				for(i=0;i<error.suggCount;i++)
					results.suggestions.options[i]=error.suggestions[i];
				if(error.suggCount>0){
					results.replace.value=error.suggestions[0].text;
					results.suggestions.options[0].selected=true;
				} 
				else{
					results.replace.value=error.word;
				}

				if(error.suggCount > 0 && error.suggestions[0].text.charAt(0) == '*'){
					results.replace.disabled=true;
					results.ignorebutton.disabled=true;
					results.ignoreallbutton.disabled=true;					
				} 
				else{
					if(results.replace.disabled){
						results.replace.disabled=false;
						results.ignorebutton.disabled=false;
						results.ignoreallbutton.disabled=false;								
					}
				}
				highlight2(error.position);
			} 
			else{
				finish();
			}
		}

		function replaceWord(){
			var validreplacement=search(validWords,results.replace.value);
			// check for space in replacement word. If there is a space in the replacement then recheck the text.
			var compound=results.replace.value.indexOf(" ");
			replaceWithWord(results.replace.value,errors[currentError-1].position,validreplacement && compound==-1);
			if(validreplacement && compound==-1)
				runSpellCheck();
			else{
				parse(0);				
			}
		}

		function replaceAll(){
			var validreplacement=search(validWords,results.replace.value);
			// check for space in replacement word. If there is a space in the replacement then recheck the text.
			var compound=results.replace.value.indexOf(" ");			
			var replacecount = replaceWithAll(results.replace.value,errors[currentError-1].position,errors[currentError-1].word,validreplacement && compound==-1);
			ignored[ignored.length]=errors[currentError-1].word;
			if(validreplacement && replacecount >= 1 && compound==-1){				
				runSpellCheck();	
			}				
			else{
				parse(0);				
			}
		}

		function finish(){
			nohighlight();
			self.close();
		}
		function ignore(){
			runSpellCheck();
		}
		function ignoreAll(){
			ignored[ignored.length]=errors[currentError-1].word;
			runSpellCheck();
		}
		function updateReplacement(){
			document.forms["results"].replace.value=document.forms["results"].suggestions.options[document.forms["results"].suggestions.selectedIndex].text;
		}

		function autoUpdate(){
			if(document.forms["results"].suggestions.selectedIndex!=-1){
				document.forms["results"].replace.value=document.forms["results"].suggestions.options[document.forms["results"].suggestions.selectedIndex].text;
				replaceWord();
			}
		}
		
		//-->
	</script>

	<form name=results>
		<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td align=center valign=center>
					<table align=center height="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align=center>
							  <table cellspacing="0" cellpadding="0" border="0" style="font: 8pt verdana, arial, sans-serif">
								 <tr><td>Not Found:</td></tr>
								 <tr><td>&nbsp;<input class="siteTextBox" type=text readonly name="notFound" size=20 style="width:150px"></td></tr> 
								 <tr><td>Replace With:</td>
								 <tr><td>&nbsp;<input class="siteTextBox" type=text name="replace" size=20 style="width:150px"></td>
								 <tr><td>Suggestions:</td></tr>
								 <tr><td>&nbsp;<SELECT class="siteSelectBox" name="suggestions" SIZE="4" width="300" style="width:150px" ondblclick='autoUpdate();'  onchange='updateReplacement();'>
								 </SELECT></td></tr>
								</table>
							</td>
							<td>&nbsp;&nbsp;</td>
							<td align=center>						
								<table cellspacing="3" cellpadding="0" border="0">
									<tr>
									    <td><input type="Button" style="width:80" class="SiteSubmitbox" onclick="replaceWord();" value="Replace"></td>
									</tr>
									<tr>
									    <td><input type="Button" style="width:80" class="SiteSubmitbox" onclick="replaceAll();" value="Replace All"></td>
									</tr>
									<tr>
									    <td><input type="Button" style="width:80" class="SiteSubmitbox" name="ignorebutton" onclick="ignore();" value="Ignore"></td>
									</tr>
									<tr>
									    <td><input type="Button" style="width:80" class="SiteSubmitbox" name="ignoreallbutton" onclick="ignoreAll();" value="Ignore All"></td>
									</tr>
									<tr>
									    <td><br><input type="Button" style="width:80" class="SiteSubmitbox" onclick="finish();" value="Done"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>


	<SCRIPT type="text/javascript">
		<!--
		document.open();
		document.write(" ");
		document.close();
		runSpellCheck();
		-->
	</SCRIPT>

</cfoutput>
	