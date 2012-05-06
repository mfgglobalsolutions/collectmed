



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>

	<cfparam name="attributes.arrayName" default="aParsedHTML">
	<cfset arrayName = attributes.arrayName>
	
	<cfparam name="attributes.stringToParse" default="">
	<cfset stringToParse = attributes.stringToParse>
	
	<cfparam name="attributes.rowList" default="">
	<cfset rowList = attributes.rowList>
		
	<cfparam name="attributes.ltList" default="">
	<cfset ltList = attributes.ltList>
	
	<cfparam name="attributes.count" default="0">
	<cfset count = attributes.count>
	
	<cfparam name="attributes.thisList" default="">
	<cfset thisList = attributes.thisList>
	
	<cfparam name="attributes.bracketPairList" default="">
	<cfset bracketPairList = attributes.bracketPairList>
	
	<cfparam name="attributes.pairstoDeleteList" default="">
	<cfset pairstoDeleteList = attributes.pairstoDeleteList>
	
	<cfparam name="attributes.run" default="yes">
	<cfset run = attributes.run>
	
	
		
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="stringToParse"
		fieldnames="String to Parse">
		
		
		
<!------------------------------------------------------------------>
<!--- Replace and escaped characters into their equivelants      --->
<!--- to be able to parse.                                       --->
<!------------------------------------------------------------------>
	<cfset stringToParse = replace(stringToParse, "&lt;", "<", "ALL")>			
	<cfset stringToParse = replace(stringToParse, "&gt;", ">", "ALL")>	
	
		
<!------------------------------------------------------------------>
<!--- If the number of less than and greater than characters     --->
<!--- don't match then something is wrong so don't process.      --->
<!------------------------------------------------------------------>	
	<cfif REQUEST.FindOccurrences(stringToParse, CHR(60)) NEQ REQUEST.FindOccurrences(stringToParse, CHR(62))>
		<cf_gcGeneralErrorTemplate 
			message="The html passed in does not have matching &lt; &gt; characters to be able to process correctly. If you wish to use these characters use their escaped equivelant (& l t ;  and & g t ;   no spaces)">
	</cfif>
	

		
<!------------------------------------------------------------------>
<!--- Creat the query that will hold the exact positions of      --->
<!--- all &nbsp; occurences to be able to parse them out so      --->
<!--- they wont get translated.                                  --->
<!------------------------------------------------------------------>
	<cfset customQueryNBSP = QueryNew("openBracketInstance,closeBracketInstance")>
	<cfset loopCount = REQUEST.FindOccurrences(trim(stringToParse), "&nbsp;")>
	<cfset nbspCount = 0>	
	
		<cfloop from="1" to="#loopCount#" index="j">
			
			<cfset i = FindNoCase("&nbsp;", trim(stringToParse), nbspCount)>				
			
			<cfset tmp = QueryAddRow(customQueryNBSP)> 		
			<cfset tmp = QuerySetCell(customQueryNBSP, "openBracketInstance", trim(trim(i)))>
			<cfset tmp = QuerySetCell(customQueryNBSP, "closeBracketInstance", trim(i) + 5)>	
					
			<cfset nbspCount = i + 6>	
					
		</cfloop>
		
	
	
<!------------------------------------------------------------------>
<!--- Create the query that will hold the positions of the lt    --->
<!--- and gt brackets to pair up later.                          --->
<!------------------------------------------------------------------>
	<cfset customQuery = QueryNew("Row,Position,Character")>
	
	
	
<!------------------------------------------------------------------>
<!--- loop through the string and place any lt ang gt brackets   --->
<!--- along with their position in the temp query.               --->
<!------------------------------------------------------------------>
	<cfloop from="1" to="#len(stringToParse)#" index="i">		
		
		<cfif Mid(stringToParse, i, 1) EQ "<" OR Mid(stringToParse, i, 1) EQ ">"> 
			<cfset count = trim(count) + 1>
			<cfset tmp = QueryAddRow(customQuery)> 
			<cfset tmp = QuerySetCell(customQuery, "Row", trim(count))>
			<cfset tmp = QuerySetCell(customQuery, "Position", trim(i))>
			<cfset tmp = QuerySetCell(customQuery, "Character", Mid(stringToParse, i, 1))>	
			
			<cfif Mid(stringToParse, i, 1) EQ "<">	
				<cfset rowlist  = listAppend(rowList, count)>		
				<cfset ltlist  = listAppend(ltList, i)>			
		 	</cfif>		
					
		</cfif>
			
	</cfloop>
	
	
	
<!------------------------------------------------------------------>
<!--- EXTEREMLY IMPORTANT to sort the list in descending order.  --->
<!------------------------------------------------------------------>
	<cfset ltList = ListSort(ltList, "Numeric", "desc")>
	<cfset rowList = ListSort(rowList, "Numeric", "desc")>
	
	
	
<!------------------------------------------------------------------>
<!--- If the list are not the same length then something went    --->
<!--- wrong.                                                     --->
<!------------------------------------------------------------------>	
	<cfif ListLen(rowList) NEQ ListLen(ltList)>
		<cf_gcGeneralErrorTemplate 
			message="The string passed in has an issue please try your request again.">
	</cfif>
	
	
	
<!------------------------------------------------------------------>
<!--- If the user just passed in a string then the code should   --->
<!--- not run leaving the non html in tact and return the        --->
<!--- query as usual.                                            --->
<!------------------------------------------------------------------>
	<cfif ListLen(trim(rowList)) EQ 0 AND ListLen(trim(ltList)) EQ 0>
		
		<cfset run = "no">
	
	</cfif>	
	
	
	
<!------------------------------------------------------------------>
<!--- Only run this code if there is html in the string to       --->
<!--- parse sent in.                                             --->
<!------------------------------------------------------------------>
	<cfif run EQ "yes">
		
	
		<!------------------------------------------------------------------>
		<!--- Create the query that will hold the value pairs for        --->
		<!--- opening and closing brackets.                              --->
		<!------------------------------------------------------------------>
			<cfset tempBrackets = QueryNew("openBracketInstance,closeBracketInstance")>
		
			
		
		<!------------------------------------------------------------------>
		<!--- Now that you have the places that the brackets are         --->
		<!--- placed loop through the lists and add them to the temp     --->
		<!--- query so that we know what bracket corresponds to its      --->
		<!--- closing bracket by position.                               --->
		<!------------------------------------------------------------------>
			<cfloop from="1" to="#ListLen(rowList)#" index="i">
				
				<cfset row = ListGetAt(rowList, i)>
				<cfset openBracketInstance = ListGetAt(ltList, i)>
						
				<cfloop query="customQuery" startrow="#row#">
					
					<cfif trim(character) EQ ">">				
						
						<cfset tmp = QueryAddRow(tempBrackets)> 
						<cfset tmp = QuerySetCell(tempBrackets, "openBracketInstance", trim(openBracketInstance))>
						<cfset tmp = QuerySetCell(tempBrackets, "closeBracketInstance", trim(position))>	
						 
						<cfloop from="#row - 1#" to="#currentRow#" index="i">
							<cfset tmp = QuerySetCell(customQuery, "Row", "-", trim(i))>
							<cfset tmp = QuerySetCell(customQuery, "Position", "-", trim(i))>
							<cfset tmp = QuerySetCell(customQuery, "Character", "-", trim(i))>	
						</cfloop>
						 
						<cfbreak>	
								 			 
					 </cfif>
					 
				</cfloop>
				
			</cfloop>	
		
			
				
		<!------------------------------------------------------------------>
		<!--- Create the query that will hold the value pairs for        --->
		<!--- opening and closing delimeters for the array. includes     --->
		<!--- &nbsp; Loop through both queries and add the rows then     --->
		<!--- sort them desc by openBracketInstance                      --->
		<!------------------------------------------------------------------>
			<cfset tempBrackets1 = QueryNew("openBracketInstance,closeBracketInstance")>	
				
			<cfloop query="tempBrackets">			
				
				<cfset tmp = QueryAddRow(tempBrackets1)> 
				<cfset tmp = QuerySetCell(tempBrackets1, "openBracketInstance", trim(openBracketInstance))>
				<cfset tmp = QuerySetCell(tempBrackets1, "closeBracketInstance", trim(closeBracketInstance))>				
							
			</cfloop>	
			
			<cfloop query="customQueryNBSP">			
				
				<cfset tmp = QueryAddRow(tempBrackets1)> 
				<cfset tmp = QuerySetCell(tempBrackets1, "openBracketInstance", trim(openBracketInstance))>
				<cfset tmp = QuerySetCell(tempBrackets1, "closeBracketInstance", trim(closeBracketInstance))>				
							
			</cfloop>				
			
			<cfquery name="tempBrackets1" dbtype="query">
				SELECT openBracketInstance, closeBracketInstance
				FROM tempBrackets1
				ORDER BY openBracketInstance DESC
			</cfquery> 

			
						
		<!------------------------------------------------------------------>
		<!--- Now that we have all the open brackets with their          --->
		<!--- corresponding closing brackets in a query we have to       --->
		<!--- take out the records that fall inside other records.       --->
		<!------------------------------------------------------------------>
			<cfloop query="tempBrackets1">
				
				<cfset bracketPairList = listAppend(bracketPairList, trim(openBracketInstance & "|" & closeBracketInstance))>
					
			</cfloop>
			
			<cfloop query="tempBrackets1">		
				
				<cfloop from="#trim(openBracketInstance) + 1#" to="#trim(closeBracketInstance) - 1#" index="i">
					<cfset thisList = ListAppend(trim(thisList), trim(i))>				
				</cfloop>
				
				<cfset pairListCount = "0">
				
				<cfloop list="#trim(bracketPairList)#" index="i">
					
					<cfset pairListCount = pairListCount + 1> 
					
					<cfloop list="#trim(i)#" delimiters="|" index="j">
						
						<cfif ListFind(trim(thisList), trim(j))> 
							<cfset pairstoDeleteList = ListAppend(pairstoDeleteList,pairListCount)>				
							<cfbreak>							
						</cfif>	
						
					</cfloop>	
					 	
				</cfloop>
				 
				<cfset thisList = "">	
						
			</cfloop>
		
		
			
		<!------------------------------------------------------------------>
		<!--- Create the query that will hold the value pairs for        --->
		<!--- opening and closing brackets.                              --->
		<!------------------------------------------------------------------>
			<cfset tempBrackets2 = QueryNew("openBracketInstance, closeBracketInstance")>
			
			<cfloop query="tempBrackets1">
				<cfif listFind(pairsToDeleteList, currentRow) EQ 0>
					<cfset tmp = QueryAddRow(tempBrackets2)> 
					<cfset tmp = QuerySetCell(tempBrackets2, "openBracketInstance", trim(openBracketInstance))>
					<cfset tmp = QuerySetCell(tempBrackets2, "closeBracketInstance", trim(closeBracketInstance))>		
				</cfif>
			</cfloop>	
		
		
				
		<!------------------------------------------------------------------>
		<!--- Create the query that will hold the value pairs for        --->
		<!--- opening and closing brackets.                              --->
		<!------------------------------------------------------------------>
			<cfset tempBrackets3 = QueryNew("openBracketInstance, closeBracketInstance")>
			
			<cfloop from="#tempBrackets2.RecordCount#" to="1" step="-1" index="i">			
				<cfset tmp = QueryAddRow(tempBrackets3)> 
				<cfset tmp = QuerySetCell(tempBrackets3, "openBracketInstance", trim(tempBrackets2.openBracketInstance[i]))>
				<cfset tmp = QuerySetCell(tempBrackets3, "closeBracketInstance", trim(tempBrackets2.closeBracketInstance[i]))>	
			</cfloop>
				
				
				
		<!------------------------------------------------------------------>
		<!--- Create the query that will hold the value pairs for        --->
		<!--- opening and closing brackets.                              --->
		<!------------------------------------------------------------------>
			<cfset qBrackets = QueryNew("openBracketInstance, closeBracketInstance")>
			
								
			<cfloop query="tempBrackets3">
			
				<cfif currentRow EQ 1 AND openBracketInstance NEQ 1>			
						
					<cfset tmp = QueryAddRow(qBrackets)> 
					<cfset tmp = QuerySetCell(qBrackets, "openBracketInstance", 1)>
					<cfset tmp = QuerySetCell(qBrackets, "closeBracketInstance", trim(openBracketInstance) - 1)>	
					
				<cfelseif IsDefined("newBegining") AND isnumeric(trim(newBegining)) AND trim(newBegining) LT trim(openBracketInstance)>
					
					<cfset tmp = QueryAddRow(qBrackets)> 
					<cfset tmp = QuerySetCell(qBrackets, "openBracketInstance", trim(newBegining))>
					<cfset tmp = QuerySetCell(qBrackets, "closeBracketInstance", trim(openBracketInstance) - 1)>	
					
				</cfif>
				
				<cfset tmp = QueryAddRow(qBrackets)> 
				<cfset tmp = QuerySetCell(qBrackets, "openBracketInstance", trim(openBracketInstance))>
				<cfset tmp = QuerySetCell(qBrackets, "closeBracketInstance", trim(closeBracketInstance))>	
				
				<cfset newBegining = trim(closeBracketInstance) + 1>
				
				<cfif currentRow EQ tempBrackets3.RecordCount AND closeBracketInstance NEQ Len(stringToParse)>	
					<cfset tmp = QueryAddRow(qBrackets)> 
					<cfset tmp = QuerySetCell(qBrackets, "openBracketInstance", trim(closeBracketInstance) + 1)>
					<cfset tmp = QuerySetCell(qBrackets, "closeBracketInstance", Len(trim(stringToParse)))>	
				</cfif>
					
			</cfloop>				
				
				
		<!------------------------------------------------------------------>
		<!--- Loop through the query with the open and close bracket     --->
		<!--- intances and place the MID value in an array.              --->
		<!------------------------------------------------------------------>		
			<cfset stringArray = Arraynew(1)>		
			
			<cfloop query="qBrackets">
				
				<cfif closeBracketInstance NEQ openBracketInstance>
					
					<cfset numOfCharacters = closeBracketInstance - openBracketInstance + 1>
					<cfset currentHTML = MID(stringToParse,openBracketInstance,numOfCharacters)>		
					
					<cfif currentHTML GT "" AND currentHTML NEQ CHR(32)>
						<cfset tmp = ArrayAppend(stringArray, currentHTML)>					
					</cfif>		
				
				</cfif>
				
			</cfloop>
	
	
<!------------------------------------------------------------------>
<!--- No html in the string to parse so do this instead.         --->
<!------------------------------------------------------------------>
	<cfelse>	
		
		<!------------------------------------------------------------------>
		<!--- Create an Arrray to place all parsed strings.              --->
		<!------------------------------------------------------------------>		
			<cfset stringArray = Arraynew(1)>		
					
			<cfset tmp = ArrayAppend(stringArray, trim(stringToParse))>	
	
	</cfif>	
		

		
<!------------------------------------------------------------------>
<!--- Return the array based on what they named it.              --->
<!------------------------------------------------------------------>
	<cfset "caller.#arrayName#" = stringArray>
	
	