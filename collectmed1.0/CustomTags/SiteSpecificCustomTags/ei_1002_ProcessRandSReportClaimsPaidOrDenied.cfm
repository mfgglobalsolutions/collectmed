


<!------------------------------------------------------------------>
<!--- Set the number of times the code will get the              --->
<!--- Claims PAID OR DENIED information.                         --->
<!------------------------------------------------------------------>
	<cfset claimsPorD = REQUEST.FindOccurrences(trim(fileContent), '* CLAIMS - PAID OR DENIED *')>

	<cfif NOT isNumeric(claimsPorD) OR trim(claimsPorD) LTE 0>
		
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="The String ""* CLAIMS - PAID OR DENIED *"" cannot be found in this report. <p>Report Path: (#trim(filePath)#\#trim(fileName)#).">		
		
	</cfif>

	<cfset midStart = 0>
	<cfset midEnd = 0>

	<cfloop from="1" to="#trim(claimsPorD)#" index="i"><!---#trim(claimsPorD)#--->

		<cfset midStart = REQUEST.getSpecificLineStart('* CLAIMS - PAID OR DENIED *', trim(fileContent), trim(midStart))>
		<cfset midEnd = REQUEST.getSpecificLineEnd('*************************************************************************************', fileContent, midEnd)>
		<cfset currentFileContent = MID(trim(fileContent), trim(midStart), evaluate(trim(midEnd) - trim(midStart)))>

		<cfset arrayThisPage = ArrayNew(1)>

		<cfloop list="#trim(currentFileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
			<cfset temp = arrayAppend(arrayThisPage, i)>
		</cfloop>

		<cfloop from="1" to="#arraylen(arrayThisPage)#" index="i">

			<cfset tempString = arrayThisPage[i]>
			<cfset newString = "">			
			
			<cfloop from="1" to="#len(arrayThisPage[i])#" index="j">

				<cfset count = 0>

				<cfloop from="1" to="127" index="c">
					<cfif MID(tempString, j, 1) EQ chr(c)>
						<cfset count = c>
						<cfbreak>
					</cfif>
				</cfloop>

				<cfif count EQ 32>
					<cfset tempString = REQUEST.ReplaceAt(tempString, "|", j)>
				</cfif>

				<cfset newString = newString & MID(tempString, j, 1)>

			</cfloop>
			
			<cfset lineList = "">
			
			<cfloop list="#newString#" delimiters="|" index="i">
				<cfset lineList = listAppend(LineList, trim(i), CHR(124))>
			</cfloop>
			
			<cf_ei_1002_Gateway_ProcessRandSReportClaimsPaidOrDenied
				filepath="#trim(filePath)#"
				filename="#trim(tempFileName)#"
				string="#trim(lineList)#">
				
					
			<cfset fileString = fileString & '
			#trim(lineList)#
			'>

		</cfloop>	

		<cfset midEnd = midEnd + 86>

	</cfloop>
	
	
