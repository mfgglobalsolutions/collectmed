



<!------------------------------------------------------------------>
<!--- Get the Report Date.                                       --->
<!------------------------------------------------------------------>
	<cfset ReportDateIndex = Find("Date:", fileContent) + 5>
	<cfset ReportDateIndex2 = Find("Mail original claim to:", fileContent) - 1>
	<cfset ReportDateString = mid(fileContent, ReportDateIndex, ReportDateIndex2 - ReportDateindex)>
	<cfset ReportDateString = Replace(ReportDateString, CHR(32), "", "ALL")>
	<cfset ReportDateString = Replace(ReportDateString, CHR(10), "", "ALL")>
	<cfset ReportDate = Replace(ReportDateString, CHR(13), "", "ALL")>

	<cfif NOT IsDefined("ReportDate") OR ReportDate EQ "">
		
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="Report Date Could not be extracted. Report Path: (#trim(PDFFilePath)#\#trim(fileName)#).">			
		
	<cfelseif NOT IsDate(ReportDate)>
		
		<cf_db_Insert_debugTable	 		
			referenceid="115"
			note="Report Date Could not be extracted. <p>Current value: [#trim(ReportDate)# <p>Report Path: (#trim(PDFFilePath)#\#trim(fileName)#).">	
		
	</cfif>



<!------------------------------------------------------------------>
<!--- Get the R&S number for this report.                        --->
<!------------------------------------------------------------------>
	<cfset RandSIndex = Find("R&S Number:", fileContent) + 11>
	<cfset RandSIndex2 = Find("(800)", fileContent) - 1>
	<cfset RandSString = mid(fileContent, RandSIndex, RandSIndex2 - RandSindex)>
	<cfset RandSString = Replace(RandSString, CHR(32), "", "ALL")>
	<cfset RandSString = Replace(RandSString, CHR(10), "", "ALL")>
	<cfset RandSNumber = Replace(RandSString, CHR(13), "", "ALL")>



<!------------------------------------------------------------------>
<!--- Get the Report Seq. Number for this report.                --->
<!------------------------------------------------------------------>
	<cfset RSnumberIndex = Find("Report Seq. Number:", fileContent) + 19>
	<cfset RSnumberIndex2 = Find("Austin, Texas 78727-6422                                    R&S Number:", fileContent, RSnumberIndex) - 1>
	<cfset RSnumberString = mid(fileContent, RSnumberIndex, RSnumberIndex2 - RSnumberindex)>
	<cfset RSnumberString = Replace(RSnumberString, CHR(32), "", "ALL")>
	<cfset RSnumberString = Replace(RSnumberString, CHR(10), "", "ALL")>
	<cfset ReportSequenceNumber = Replace(RSnumberString, CHR(13), "", "ALL")>



<!------------------------------------------------------------------>
<!--- Get the ProviderID.                                        --->
<!------------------------------------------------------------------>
	<cfset ProviderIndex = Find("Provider ID:", fileContent) + 12>
	<cfset ProviderIndex2 = Find("12357-B Riata Trace Parkway                                 Report Seq. Number:", fileContent) - 1>
	<cfset ProviderString = mid(fileContent, ProviderIndex, ProviderIndex2 - Providerindex)>
	<cfset ProviderString = Replace(ProviderString, CHR(32), "", "ALL")>
	<cfset ProviderString = Replace(ProviderString, CHR(10), "", "ALL")>
	<cfset ProviderID = Replace(ProviderString, CHR(13), "", "ALL")>



<!------------------------------------------------------------------>
<!--- Get the Provider Name.                                     --->
<!------------------------------------------------------------------>
	<cfset FirstIndex = Find("Texas Medicaid & Healthcare Partnership", fileContent) + 39>
	<cfset ProviderNameIndex = Find("Mail original claim to:", fileContent) + 23>
	<cfset ProviderNameIndex2 = Find("Texas Medicaid & Healthcare Partnership", fileContent, FirstIndex) - 1>
	<cfset ProviderNameString = mid(fileContent, ProviderNameIndex, ProviderNameIndex2 - ProviderNameindex)>
	<cfset ProviderNameString = Replace(ProviderNameString, CHR(10), "", "ALL")>
	<cfset ProviderName = Replace(ProviderNameString, CHR(13), "", "ALL")>
	<cfset ProviderName = trim(ProviderName)>



<!------------------------------------------------------------------>
<!--- Get the Provider Line1 Address.                            --->
<!------------------------------------------------------------------>
	<cfset ProviderAddressLine1Index = Find("Texas Medicaid & Healthcare Partnership", fileContent, FirstIndex) + 39>
	<cfset ProviderAddressLine1Index2 = Find("e.O. Box 200555", fileContent) - 1>
	<cfset ProviderAddressLine1String = mid(fileContent, ProviderAddressLine1Index, ProviderAddressLine1Index2 - ProviderAddressLine1index)>
	<cfset ProviderAddressLine1String = Replace(ProviderAddressLine1String, CHR(10), "", "ALL")>
	<cfset ProviderAddressLine1 = Replace(ProviderAddressLine1String, CHR(13), "", "ALL")>
	<cfset ProviderAddressLine1 = trim(ProviderAddressLine1)>



<!------------------------------------------------------------------>
<!--- Get the Provider Line2 Address.                            --->
<!------------------------------------------------------------------>
	<cfset ProviderAddressLine2Index = Find("e.O. Box 200555", fileContent) + 15>
	<cfset ProviderAddressLine2Index2 = Find("Austin, Texas 78720-0555                                    (", fileContent) - 1>
	<cfset ProviderAddressLine2String = mid(fileContent, ProviderAddressLine2Index, ProviderAddressLine2Index2 - ProviderAddressLine2index)>
	<cfset ProviderAddressLine2String = Replace(ProviderAddressLine2String, CHR(10), "", "ALL")>
	<cfset ProviderAddressLine2 = Replace(ProviderAddressLine2String, CHR(13), "", "ALL")>
	<cfset ProviderAddressLine2 = trim(ProviderAddressLine2)>



<!------------------------------------------------------------------>
<!--- Get the Provider Phone Number.                             --->
<!------------------------------------------------------------------>
	<cfset ProviderPhoneNumberIndex = Find("Austin, Texas 78720-0555                                    (", fileContent) + 25><!--- -1 because we want to include the paranthesis--->
	<cfset ProviderPhoneNumberIndex2 = Find("Mail all other correspondence to:", fileContent) - 1>
	<cfset ProviderPhoneNumberString = mid(fileContent, ProviderPhoneNumberIndex, ProviderPhoneNumberIndex2 - ProviderPhoneNumberindex)>
	<cfset ProviderPhoneNumberString = Replace(ProviderPhoneNumberString, CHR(10), "", "ALL")>
	<cfset ProviderPhoneNumber = Replace(ProviderPhoneNumberString, CHR(13), "", "ALL")>
	<cfset ProviderPhoneNumber = trim(ProviderPhoneNumber)>
	
	
	
<!------------------------------------------------------------------>
<!--- Add the parsed data to the file.                           --->
<!------------------------------------------------------------------>
<cfset fileString = fileString & '
Report Date: #trim(ReportDate)#
R&S Number: #trim(RandSNumber)#
Number Of Pages: #trim(NunberOfPages)#
Report Sequence Number: #trim(ReportSequenceNumber)#
Provider ID: #trim(ProviderID)#
Provider Name: #trim(ProviderName)#
Provider Address Line 1: #trim(ProviderAddressLine1)#
Provider Address Line 2: #trim(ProviderAddressLine2)#
Provider Phone Number: #trim(ProviderPhoneNumber)#
'>
	
	
	
	
	