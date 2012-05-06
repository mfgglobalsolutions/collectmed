<!------------------------------------------------------------------------------------------------------------------------------------------->
<!--- +InsuranceCompanyName@ (1)Page_Number, (2)Start_Box_Left, (3)700, (4)End_Box_Right, (5)Up_Down, (6)Font_Type, (7)Font_Size =[value] --->
<!------------------------------------------------------------------------------------------------------------------------------------------->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.HearingRequestFormPath" default="#trim(request.driveLetter)#:\#trim(request.applicationPathMainFolder)#\misc\HearingRequest.pdf">
	<cfset HearingRequestFormPath = attributes.HearingRequestFormPath>

	<cfparam name="attributes.fileName" default="TestLeftAlign.pdf">
	<cfset fileName = attributes.fileName>

	<cfparam name="attributes.saveFilePath" default="#request.fmsPath#\trim(request.tempDocsFolder)">
	<cfset saveFilePath = attributes.saveFilePath>



<!-------------------------------------------------------------------------------------->
<!--- Create the Control File that will be used to give the pdf tool the arguments.  --->
<!-------------------------------------------------------------------------------------->
<cfoutput>
<cfsavecontent variable="fileData">

<!---***************************************************** CODE BELOW ***********************************************************--->


+HearingRequest_NameOfPatient@1,334,615,474,625,4,9=Guillermo Cruz

+HearingRequest_HICN@1,337,575,474,585,4,9=12345678901234567890

+HearingRequest_PatientState@1,525,575,550,585,4,9=TX

+HearingRequest_SupplierNameAndAddressName@1,85,540,295,550,4,9=1234567890123456789012345678901234567890

+HearingRequest_SupplierNameAndAddressAddress1@1,85,522,295,532,4,9=1234567890123456789012345678901234567890

+HearingRequest_SupplierNameAndAddressCity@1,85,504,200,514,4,9=1234567890123456789012345678901234567890

+HearingRequest_SupplierNameAndAddressState@1,205,504,225,514,4,9=1234567890123456789012345678901234567890

+HearingRequest_SupplierNameAndAddressState@1,230,504,295,514,4,9=1234567890123456789012345678901234567890

+HearingRequest_SupplierNumber@1,334,538,545,548,4,9=1234567890123456789012345678901234567890

+HearingRequest_SupplierTelephoneNumberAreaCode@1,334,504,545,514,4,9=1234567890123456789012345678901234567890

+HearingRequest_TypeOfHearingRequest_OnTheRecord@1,275,480,282,490,4,9=XXXX

+HearingRequest_TypeOfHearingRequest_OnTheRecord@1,386,480,394,490,4,9=XXXX

+HearingRequest_TypeOfHearingRequest_OnTheRecord@1,478,480,486,490,4,9=XXXX



+HearingRequest_DOS_1_From@1,95,420,150,430,4,9=01/01/20061234567890

+HearingRequest_DOS_1_To@1,172,420,227,430,4,9=01/01/20061234567890

+HearingRequest_CCN1@1,245,420,365,430,4,9=123456789012345678901234567890

+HearingRequest_DCN1@1,375,420,485,430,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode1@1,495,420,569,430,4,9=123456789012345678901234567890



+HearingRequest_DOS_2_From@1,95,400,150,410,4,9=01/01/20061234567890

+HearingRequest_DOS_2_To@1,172,400,227,410,4,9=01/01/20061234567890

+HearingRequest_CCN2@1,245,400,365,410,4,9=123456789012345678901234567890

+HearingRequest_DCN2@1,375,400,485,410,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode2@1,495,400,569,410,4,9=123456789012345678901234567890


+HearingRequest_DOS_3_From@1,95,380,150,390,4,9=01/01/20061234567890

+HearingRequest_DOS_3_To@1,172,380,227,390,4,9=01/01/20061234567890

+HearingRequest_CCN3@1,245,380,365,390,4,9=123456789012345678901234567890

+HearingRequest_DCN3@1,375,380,485,390,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode3@1,495,380,569,390,4,9=123456789012345678901234567890


+HearingRequest_DOS_4_From@1,95,360,150,370,4,9=01/01/20061234567890

+HearingRequest_DOS_4_To@1,172,360,227,370,4,9=01/01/20061234567890

+HearingRequest_CCN4@1,245,360,365,370,4,9=123456789012345678901234567890

+HearingRequest_DCN4@1,375,360,485,370,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode4@1,495,360,569,370,4,9=123456789012345678901234567890


+HearingRequest_DOS_5_From@1,95,340,150,350,4,9=01/01/20061234567890

+HearingRequest_DOS_5_To@1,172,340,227,350,4,9=01/01/20061234567890

+HearingRequest_CCN5@1,245,340,365,350,4,9=123456789012345678901234567890

+HearingRequest_DCN5@1,375,340,485,350,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode5@1,495,340,569,350,4,9=123456789012345678901234567890


+HearingRequest_DOS_6_From@1,95,320,150,330,4,9=01/01/20061234567890

+HearingRequest_DOS_6_To@1,172,320,227,330,4,9=01/01/20061234567890

+HearingRequest_CCN6@1,245,320,365,330,4,9=123456789012345678901234567890

+HearingRequest_DCN6@1,375,320,485,330,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode6@1,495,320,569,330,4,9=123456789012345678901234567890


+HearingRequest_DOS_7_From@1,95,300,150,310,4,9=01/01/20061234567890

+HearingRequest_DOS_7_To@1,172,300,227,310,4,9=01/01/20061234567890

+HearingRequest_CCN7@1,245,300,365,310,4,9=123456789012345678901234567890

+HearingRequest_DCN7@1,375,300,485,310,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode7@1,495,300,569,310,4,9=123456789012345678901234567890


+HearingRequest_DOS_8_From@1,95,280,150,290,4,9=01/01/20061234567890

+HearingRequest_DOS_8_To@1,172,280,227,290,4,9=01/01/20061234567890

+HearingRequest_CCN8@1,245,280,365,290,4,9=123456789012345678901234567890

+HearingRequest_DCN8@1,375,280,485,290,4,9=123456789012345678901234567890

+HearingRequest_HCPCSCode8@1,495,280,569,290,4,9=123456789012345678901234567890


+HearingRequest_ClaimantSignature@1,190,245,380,270,4,9=123456789012345678901234567890123456789012345678901234567890

+HearingRequest_Date@1,445,245,500,270,4,9=123456789012345678901234567890123456789012345678901234567890

+HearingRequest_PrintClaimantName@1,190,227,380,237,4,9=123456789012345678901234567890123456789012345678901234567890





<!---***************************************************** CODE ABOVE ***********************************************************--->

</cfsavecontent>
</cfoutput>



<!-------------------------------------------------------------------------------------->
<!--- Write the control file to the system.                                          --->
<!-------------------------------------------------------------------------------------->
	<cffile
		action="write"
		nameconflict="OVERWRITE"
		file="#trim(savefilepath)#\#ListFirst(trim(fileName), ".")#.txt"
		output="#fileData#">



<!-------------------------------------------------------------------------------------->
<!--- Creat the pdf with the parameters added to it.                                 --->
<!-------------------------------------------------------------------------------------->
	<cfexecute
		name="C:\EOBManager\pdf-tools\bin\pdformp.exe"
		arguments="#trim(HearingRequestFormPath)# #trim(savefilepath)#\#trim(fileName)# @#trim(savefilepath)#\#ListFirst(trim(fileName), ".")#.txt"
		timeout="60"></cfexecute>

