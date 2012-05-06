
<!------------------------------------------------------------------>
<!--- Set the timeout for the code to be able to run throughly.  --->
<!------------------------------------------------------------------>
	<cfsetting requestTimeOut = "900">	
	

	
<!------------------------------------------------------------------>
<!--- Gather the needed scripts that will run in the site.       --->
<!------------------------------------------------------------------>			
	<cf_gcCFScriptIncludes>
	
	

<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->
<!------------------------------------------------------------------>
	<cfparam name="attributes.PDFFilePath" default="">
	<cfset PDFFilePath = attributes.PDFFilePath>
	
	<cfparam name="attributes.fileString" default="">
	<cfset fileString = attributes.fileString>

	

<!------------------------------------------------------------------>
<!--- We have to change the path and the file name to the txt    --->
<!--- file since it comes in as a pdf extension.                 --->
<!------------------------------------------------------------------>
	<cfset fileName = ListFirst(ListLast(trim(PDFFilePath), "\"), ".") & ".txt">
	<cfset filePath = ListDeleteAt(trim(PDFFilePath), listlen(trim(PDFFilePath), "\"), "\")>	
	<cfset filePath = ListDeleteAt(trim(filePath), listlen(trim(filePath), "\"), "\") & "\EOBProcessed">
	
	
	
<!------------------------------------------------------------------>
<!--- Call the tag to create the txt from the PDF by calling     --->
<!--- the COM object.                                            --->
<!------------------------------------------------------------------>
	<cf_ei_1002_ProcessRandSReportCreateTXT 
		fileName="#trim(fileName)#" 
		filePath="#trim(filePath)#"
		pdffilepath="#trim(PDFFilePath)#">	
			
	
	
<!------------------------------------------------------------------>
<!--- Check to make sure the directory actually exists.          --->
<!------------------------------------------------------------------>
	<cfif NOT DirectoryExists("#trim(filePath)#\")>
		
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="The specified path does not exist (#trim(filePath)#).] IN ei_1002_ProcessRandSReport.cfm Line 53">		
			
		<cfexit>	
		
	</cfif>



<!------------------------------------------------------------------>
<!--- Check to make sure the file actually exists.               --->
<!------------------------------------------------------------------>
	<cfif NOT FileExists("#trim(filePath)#\#trim(fileName)#")>
		
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="The file you are trying to view is not in the specified path (#trim(filePath)#\#trim(fileName)#).] IN ei_1002_ProcessRandSReport.cfm Line 69">		
			
		<cfexit>	
		
	</cfif>



<!------------------------------------------------------------------>
<!--- Read the file that has been sent in and set it ue.         --->
<!------------------------------------------------------------------>	
	<cftry>
		
		<cffile
			action="READ"
			file="#trim(filePath)#\#trim(fileName)#" variable="fileContent">
		
		<cfcatch type="Any">
			
			<cf_db_Insert_debugTable	 		
				referenceid="115"
				note="The file you are trying to view cannot be inserted into the variable fileContent (#trim(filePath)#\#trim(fileName)#).] IN ei_1002_ProcessRandSReport.cfm Line 80">		
			
			<cfexit>	
			
		</cfcatch>
		
	</cftry>
	


<!------------------------------------------------------------------>
<!--- Every R&S report contains a string telling you what page   --->
<!--- you are on. Run through the document twice checking how    --->
<!--- many pages this one report contains and check the two      --->
<!--- numbers to make sure they match otherwise error out.       --->
<!------------------------------------------------------------------>
	<cfloop from="1" to="1000" index="i">
		<cfif NOT Find("Page #i# Of", fileContent)>
			<cfset NunberOfPages = i - 1>
			<cfbreak>
		</cfif>
	</cfloop>

	<cfloop from="1" to="1000" index="i">
		<cfif NOT Find("Page #i# Of", fileContent)>
			<cfset NunberOfPages2 = i - 1>
			<cfbreak>
		</cfif>
	</cfloop>
			
	<cfif NunberOfPages NEQ NunberOfPages2>
		
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="The file you are trying to view cannot be read correctly please submit it again. (#trim(filePath)#\#trim(fileName)#).] IN ei_1002_ProcessRandSReport.cfm. Line 110">		
			
		<cfexit>		
		
	</cfif>
	
	
	
<!------------------------------------------------------------------>
<!--- Create a temp file that will be appended to by the         --->
<!--- Gateways processing the data. This is done because         --->
<!--- of the amount of data to parse is to hard for one          --->
<!--- request.                                                   --->
<!------------------------------------------------------------------>	
	<cfset tempStartFilename = ListFirst(trim(fileName), ".")>
	<cfset tempFileName = tempStartFileName & "_TempProcessed.txt">
	
	<cffile 
		action="WRITE" 
		output="#fileString#" 
		file="#trim(filePath)#\#trim(tempFileName)#" 
		nameconflict="OVERWRITE">		

	
	
<!------------------------------------------------------------------>
<!--- Get the header information of the file including the       --->
<!--- client name and address.                                   --->
<!------------------------------------------------------------------>
	<cfinclude template="ei_1002_ProcessRandSReportHeader.cfm">
	
	
	
<!------------------------------------------------------------------>
<!--- Get the claims paid or denied information of the file      --->
<!--- including the client name and address.                     --->
<!------------------------------------------------------------------>
	<cfinclude template="ei_1002_ProcessRandSReportClaimsPaidOrDenied.cfm">

	
	
<!------------------------------------------------------------------>
<!--- Actual file that is to be written.                         --->
<!------------------------------------------------------------------>	
	<cfset startFilename = ListFirst(trim(fileName), ".")>
	<cfset fileName = startFileName & "_Processed.txt">
	
	<cffile 
		action="WRITE" 
		output="#fileString#" 
		file="#trim(filePath)#\#trim(fileName)#" 
		nameconflict="OVERWRITE">	
	
	
	

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
<!---




<cfset temp2 = FINDNOCASE("*** THIS PAGE IS INTENTIONALLY LEFT BLANK ***", fileContent, 0) + 82>

<cfset fileContent = request.delStringPart(fileContent, 1, temp2)>


<cfset tempStart = FINDNOCASE("Report Seq. Number:", fileContent, 0)>
<cfloop from="1" to="#REQUEST.FindOccurrences(fileContent, 'Report Seq. Number:')#" index="i">
	<cfset fileContent = request.delStringPart(fileContent, tempStart - 1720, tempStart + 410)><!---410 gives a little cushion after the phone number--->
	<cfset tempStart = FINDNOCASE("Report Seq. Number:", fileContent, tempStart)>
</cfloop>

<cfset tempStart = FINDNOCASE("IF YOU NEED TO APPEAL ANY CLAIM ON THIS PAGE,", fileContent, 0)>
<cfloop from="1" to="#REQUEST.FindOccurrences(fileContent, 'IF YOU NEED TO APPEAL ANY CLAIM ON THIS PAGE,')#" index="i">
	<cfset fileContent = request.delStringPart(fileContent, tempStart, tempStart + 724)>
	<!---<cfoutput>#i# [#tempStart# - #tempStart + 604#]:<!--- #mid(fileContent, tempStart, 604)#---><br></cfoutput>--->
	<cfset tempStart = FINDNOCASE("IF YOU NEED TO APPEAL ANY CLAIM ON THIS PAGE,", fileContent, tempStart)>
</cfloop>






<cfset tempStart = FINDNOCASE("PATIENT NAME         CLAIM NUMBER", fileContent, 0)>
<cfloop from="1" to="#REQUEST.FindOccurrences(fileContent, 'PATIENT NAME         CLAIM NUMBER')#" index="i">
	<cfset tempStart2 = Find("*********************************************", fileContent, tempStart)>
	<cfset fileContent = request.delStringPart(fileContent, tempStart, tempStart2)>
	<!---<cfoutput>#i# [#tempStart# - #tempStart + 604#]:<!--- #mid(fileContent, tempStart, 604)#---><br></cfoutput>--->
	<cfset tempStart = FINDNOCASE("PATIENT NAME         CLAIM NUMBER", fileContent, tempStart)>
</cfloop>


"**************************************************************************************************************************************"



<cfset header = "PATIENT NAME CLAIM NUMBER CLIENT">
<cfset header2 = "EOPS EOPS EOPS EOPS DIAGNOSIS">
<cfset header3 = "EOB EOB EOB EOB DIAGNOSIS">
<cfset header4 = "EOB EOB MOD MOD">
<cfset header5 = "EOPS EOPS MOD MOD">

<cfoutput>Found: #REQUEST.FindOccurrences(fileContent, header)#<br></cfoutput>
<cfoutput>Found2: #REQUEST.FindOccurrences(fileContent, header2)#<br></cfoutput>
<cfoutput>Found3: #REQUEST.FindOccurrences(fileContent, header3)#<br></cfoutput>
<cfoutput>Found4: #REQUEST.FindOccurrences(fileContent, header4)#<br></cfoutput>
<cfoutput>Found5: #REQUEST.FindOccurrences(fileContent, header5)#<br></cfoutput>
<cfabort>




<cfoutput>Found: #REQUEST.FindOccurrences(fileContent, "IF YOU NEED TO APPEAL ANY CLAIM ON THIS PAGE,")#<br></cfoutput>
<cfoutput>FOUND: #REQUEST.FindOccurrences(fileContent, "Texas Medicaid & Healthcare Partnership")#<br></cfoutput>

<cfset tempStart = FINDNOCASE("IF YOU NEED TO APPEAL ANY CLAIM ON THIS PAGE,", fileContent, 0)>
<cfloop from="1" to="#REQUEST.FindOccurrences(fileContent, 'IF YOU NEED TO APPEAL ANY CLAIM ON THIS PAGE,')#" index="i">
	<cfset fileContent = request.delStringPart(fileContent, tempStart, tempStart + 604)>
	<!---<cfoutput>#i# [#tempStart# - #tempStart + 604#]:<!--- #mid(fileContent, tempStart, 604)#---><br></cfoutput>--->
	<cfset tempStart = FINDNOCASE("IF YOU NEED TO APPEAL ANY CLAIM ON THIS PAGE,", fileContent, tempStart)>
</cfloop>
<cfoutput>
	[#fileContent#]
</cfoutput>
<cfset tempStart = FINDNOCASE("Texas Medicaid & Healthcare Partnership", fileContent, 0)>
<cfloop from="1" to="#REQUEST.FindOccurrences(fileContent, 'Texas Medicaid & Healthcare Partnership')#" index="i">
	<cfset fileContent = request.delStringPart(fileContent, tempStart, tempStart + 506)>
	<!---<cfoutput>#i# [#tempStart# - #tempStart + 506#]:<!--- #mid(fileContent, tempStart, 506)#---><br></cfoutput>--->
	<cfset tempStart = FINDNOCASE("Texas Medicaid & Healthcare Partnership", fileContent, tempStart)>
</cfloop>

<cfset temp7 = FINDNOCASE("THIS PAGE IS INTENTIONALLY LEFT BLANK", fileContent, 0) + 38>
<cfset lenOfFile = len(fileContent)>
<cfset fileContent = mid(fileContent, temp7, lenOfFile - temp7)>

<cfoutput>
	@@@#fileContent#@@@
</cfoutput>




<cfset tempStart = FINDNOCASE("Texas Medicaid & Healthcare Partnership", fileContent, 0)>
<cfloop from="1" to="#REQUEST.FindOccurrences(fileContent, 'Texas Medicaid & Healthcare Partnership')#" index="i">

	<cfset fileContent = request.delStringPart(fileContent, tempStart, tempStart + 506)>
	<!---<cfoutput>
		#i# [#tempStart# - #tempStart + 506#]: #mid(fileContent, tempStart, 506)#<br><br>
	</cfoutput>--->

	<cfset tempStart = FINDNOCASE("Texas Medicaid & Healthcare Partnership", fileContent, tempStart)>

</cfloop>



<cfset temp7 = FINDNOCASE("THIS PAGE IS INTENTIONALLY LEFT BLANK", fileContent, 0)>

<cfset lenOfFile = len(fileContent)>

<cfoutput>
	#lenOfFile# - #temp7#
	<br><br>
	#mid(fileContent, temp, lenOfFile - temp7)#
</cfoutput>









--->





<!---
<cfoutput>
	<form name="frm">
		<cf_gcCalendarPickADate formname="frm" fieldname="datBegin" onclickverbiage="ANY">
		&nbsp;&nbsp;
		<cf_gcCalendarPickADate formname="frm" fieldname="datBegin2" onclickverbiage="second">
	</form>
</cfoutput>
--->




