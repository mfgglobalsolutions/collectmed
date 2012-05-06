<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcBlockComment.cfm                                       --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---  Strings                                                   --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---    Guillermo Cruz                                          --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!---    This tag will take a string and break it up into        --->
<!---  formatted cold fusion comments                            --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!---   &lt;cf_gcBlockComment                                    --->
<!---   text="Your text goes here."                              --->
<!---   returnVarName="Description"&gt;                          --->
<!---@@ExampleCall@@                                             --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!---    Text                                                    --->  
<!---@@RequiredParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!---    returnVarName (default formattedText)                   --->  
<!--- @@OptionalParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!---    formattedText                                           --->  
<!---@@ReturnedParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---   Created 03/04/04                                         --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.Text" default="">
	<cfset Text = attributes.Text> 
	
	<cfparam name="attributes.returnVarName" default="formattedText">
	<cfset returnVarName = attributes.returnVarName>   
		
	<cfparam name="attributes.count" default="78">
	<cfset count = attributes.count>
	
	<cfparam name="attributes.j" default="0">
	<cfset j = attributes.j>

	<cfparam name="attributes.recordID" default="0">
	<cfset recordID = attributes.recordID>

	<cfparam name="attributes.fileString" default="">
	<cfset fileString = attributes.fileString>
	
	<cfparam name="attributes.spacesNeeded" default="">
	<cfset spacesNeeded = attributes.spacesNeeded>

	<cfset textLength = len(text)>

	<cfset stringQuery = QueryNew("recordID,rowString,length")>
	
	

<!------------------------------------------------------------------>
<!--- Verify the needed parameters were sent in.                 --->
<!------------------------------------------------------------------>
	<cfif Text EQ "">
		<cfset text = " ">
	</cfif>
		
		
<!------------------------------------------------------------------>
<!--- Start the processing of this page.                         --->
<!------------------------------------------------------------------>  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>  
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>  
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>  
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>  
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>  
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
  
  <cfif textLength GTE count>  
   <cfloop from="#count#" to="1" step="-1" index="i">   
    <cfif Mid(text,i,1) EQ CHR(32)>
     <cfset currentString = left(text,i)>
     <cfset j = Evaluate(textLength - ABS(i))>    
     <cfset text = right(text,j)>
     <cfset textLength = len(text)> 
     <cfset recordID = Evaluate(recordID + 1)>
     <cfset resultQuery = QueryAddRow(stringQuery)> 
     <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
     <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))>    
     <cfbreak>
    </cfif>      
   </cfloop>  
  <cfelseif textLength GT 0 AND textLength LT count>
   <cfset textLength = 0>
   <cfset currentString = text>
   <cfset recordID = Evaluate(recordID + 1)>
   <cfset resultQuery = QueryAddRow(stringQuery)> 
   <cfset resultQuery = QuerySetCell(stringQuery,"recordID",trim(recordID))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"rowString",trim(currentstring))> 
   <cfset resultQuery = QuerySetCell(stringQuery,"length",len(trim(currentstring)))> 
  </cfif>
 
  
   
<!------------------------------------------------------------------>
<!--- Now that the text is formatted into query you can loop     --->
<!--- over it and add the commensts as needed. With the spaces   --->
<!--- also being added. Remember DO NOT MOVE anything in the     --->
<!--- code below.                                                --->
<!------------------------------------------------------------------>  
<cfloop query="stringQuery">  
 <cfloop from="0" to="#Evaluate(count - length)#" index="space">
 	<cfset spacesNeeded = spacesNeeded & CHR(32)>
 </cfloop>	
 <cfset fileString = fileString & '<!--- #rowString##spacesNeeded#--->
'>   
<cfset spacesNeeded = "">
</cfloop>  
  
		
<!------------------------------------------------------------------>
<!--- Set the variable name that will be returned to the         --->
<!--- calling template.                                          --->
<!------------------------------------------------------------------>
	<cfset "caller.#returnVarName#" = trim(fileString)>
		
		
