<!------------------------------------------------------------------------------------------------------------------------------------------->
<!--- +InsuranceCompanyName@ (1)Page_Number, (2)Start_Box_Left, (3)700, (4)End_Box_Right, (5)Up_Down, (6)Font_Type, (7)Font_Size =[value] --->
<!------------------------------------------------------------------------------------------------------------------------------------------->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.RedeterminationRequestFormPath" default="#trim(request.fmsPath)#\misc\RedeterminationRequestForm.pdf">
	<cfset RedeterminationRequestFormPath = attributes.RedeterminationRequestFormPath>
		
	<cfparam name="attributes.fileName" default="">
	<cfset fileName = attributes.fileName>
	
	<cfparam name="attributes.saveFilePath" default="">
	<cfset saveFilePath = attributes.saveFilePath>	
		
	<cfparam name="attributes.errorMessageCode_CBox_MA130Yes" default="">
	<cfset errorMessageCode_CBox_MA130Yes = attributes.errorMessageCode_CBox_MA130Yes>
	
	<cfparam name="attributes.errorMessageCode_CBox_MA130No" default="">
	<cfset errorMessageCode_CBox_MA130No = attributes.errorMessageCode_CBox_MA130No>
	
	<cfparam name="attributes.date" default="">
	<cfset date = attributes.date>
	
	<cfparam name="attributes.from" default="">
	<cfset from = attributes.from>
	
	<cfparam name="attributes.patientName" default="">
	<cfset patientName = attributes.patientName>
	
	<cfparam name="attributes.HICN" default="">
	<cfset HICN = attributes.HICN>
	
	<cfparam name="attributes.nscSupplierNumber" default="">
	<cfset nscSupplierNumber = attributes.nscSupplierNumber>
	
	<cfparam name="attributes.contactPerson" default="">
	<cfset contactPerson = attributes.contactPerson>
	
	<cfparam name="attributes.telephoneNumber" default="">
	<cfset telephoneNumber = attributes.telephoneNumber>
	
	<cfparam name="attributes.reasonForRequest_CBox_ClaimDenied" default="">
	<cfset reasonForRequest_CBox_ClaimDenied = attributes.reasonForRequest_CBox_ClaimDenied>
	
	<cfparam name="attributes.reasonForRequest_CBox_ClaimPaymentReduced" default="">
	<cfset reasonForRequest_CBox_ClaimPaymentReduced = attributes.reasonForRequest_CBox_ClaimPaymentReduced>
	
	<cfparam name="attributes.reasonForRequest_CBox_ClaimCorrection" default="">
	<cfset reasonForRequest_CBox_ClaimCorrection = attributes.reasonForRequest_CBox_ClaimCorrection>
	
	<cfparam name="attributes.reasonForRequest_CBox_ClaimReopened" default="">
	<cfset reasonForRequest_CBox_ClaimReopened = attributes.reasonForRequest_CBox_ClaimReopened>
	
	<cfparam name="attributes.ClaimNumber_TBox_Line1" default="">
	<cfset ClaimNumber_TBox_Line1 = attributes.ClaimNumber_TBox_Line1>
	
	<cfparam name="attributes.ClaimDateOfService_TBox_Line1" default="">
	<cfset ClaimDateOfService_TBox_Line1 = attributes.ClaimDateOfService_TBox_Line1>
	
	<cfparam name="attributes.ClaimHCPCS_TBox_Line1" default="">
	<cfset ClaimHCPCS_TBox_Line1 = attributes.ClaimHCPCS_TBox_Line1>
	
	<cfparam name="attributes.ClaimRemittanceDate_TBox_Line1" default="">
	<cfset ClaimRemittanceDate_TBox_Line1 = attributes.ClaimRemittanceDate_TBox_Line1>
	
	<cfparam name="attributes.ClaimNumber_TBox_Line2" default="">
	<cfset ClaimNumber_TBox_Line2 = attributes.ClaimNumber_TBox_Line2>
	
	<cfparam name="attributes.ClaimDateOfService_TBox_Line2" default="">
	<cfset ClaimDateOfService_TBox_Line2 = attributes.ClaimDateOfService_TBox_Line2>
	
	<cfparam name="attributes.ClaimHCPCS_TBox_Line2" default="">
	<cfset ClaimHCPCS_TBox_Line2 = attributes.ClaimHCPCS_TBox_Line2>
	
	<cfparam name="attributes.ClaimRemittanceDate_TBox_Line2" default="">
	<cfset ClaimRemittanceDate_TBox_Line2 = attributes.ClaimRemittanceDate_TBox_Line2>
	
	<cfparam name="attributes.ClaimNumber_TBox_Line3" default="">
	<cfset ClaimNumber_TBox_Line3 = attributes.ClaimNumber_TBox_Line3>
	
	<cfparam name="attributes.ClaimDateOfService_TBox_Line3" default="">
	<cfset ClaimDateOfService_TBox_Line3 = attributes.ClaimDateOfService_TBox_Line3>
	
	<cfparam name="attributes.ClaimHCPCS_TBox_Line3" default="">
	<cfset ClaimHCPCS_TBox_Line3 = attributes.ClaimHCPCS_TBox_Line3>
	
	<cfparam name="attributes.ClaimRemittanceDate_TBox_Line3" default="">
	<cfset ClaimRemittanceDate_TBox_Line3 = attributes.ClaimRemittanceDate_TBox_Line3>
	
	<cfparam name="attributes.ClaimNumber_TBox_Line4" default="">
	<cfset ClaimNumber_TBox_Line4 = attributes.ClaimNumber_TBox_Line4>
	
	<cfparam name="attributes.ClaimDateOfService_TBox_Line4" default="">
	<cfset ClaimDateOfService_TBox_Line4 = attributes.ClaimDateOfService_TBox_Line4>
		
	<cfparam name="attributes.ClaimHCPCS_TBox_Line4" default="">
	<cfset ClaimHCPCS_TBox_Line4 = attributes.ClaimHCPCS_TBox_Line4>
	
	<cfparam name="attributes.ClaimRemittanceDate_TBox_Line4" default="">
	<cfset ClaimRemittanceDate_TBox_Line4 = attributes.ClaimRemittanceDate_TBox_Line4>
	
	<cfparam name="attributes.Explanation_TBox_Line1" default="">
	<cfset Explanation_TBox_Line1 = attributes.Explanation_TBox_Line1>
	
	<cfparam name="attributes.Explanation_TBox_Line2" default="">
	<cfset Explanation_TBox_Line2 = attributes.Explanation_TBox_Line2>
	
	<cfparam name="attributes.Explanation_TBox_Line3" default="">
	<cfset Explanation_TBox_Line3 = attributes.Explanation_TBox_Line3>
	
	<cfparam name="attributes.Explanation_TBox_Line4" default="">
	<cfset Explanation_TBox_Line4 = attributes.Explanation_TBox_Line4>
	
	<cfparam name="attributes.Explanation_TBox_Line5" default="">
	<cfset Explanation_TBox_Line5 = attributes.Explanation_TBox_Line5>
	
	<cfparam name="attributes.Explanation_TBox_Line6" default="">
	<cfset Explanation_TBox_Line6 = attributes.Explanation_TBox_Line6>
		
	<cfparam name="attributes.Attachment_CBox_ClaimCopy" default="">
	<cfset Attachment_CBox_ClaimCopy = attributes.Attachment_CBox_ClaimCopy>
	
	<cfparam name="attributes.Attachment_CBox_RemittanceAdviceCopy" default="">
	<cfset Attachment_CBox_RemittanceAdviceCopy = attributes.Attachment_CBox_RemittanceAdviceCopy>
	
	<cfparam name="attributes.Attachment_CBox_CMN" default="">
	<cfset Attachment_CBox_CMN = attributes.Attachment_CBox_CMN>
	
	<cfparam name="attributes.Attachment_CBox_Medical" default="">
	<cfset Attachment_CBox_Medical = attributes.Attachment_CBox_Medical>
	
	<cfparam name="attributes.Attachment_CBox_PhysicianDocumentation" default="">
	<cfset Attachment_CBox_PhysicianDocumentation = attributes.Attachment_CBox_PhysicianDocumentation>
	
	<cfparam name="attributes.Attachment_CBox_CheckCopies" default="">
	<cfset Attachment_CBox_CheckCopies = attributes.Attachment_CBox_CheckCopies>
	
	<cfparam name="attributes.Attachment_CBox_OtherCarrier" default="">
	<cfset Attachment_CBox_OtherCarrier = attributes.Attachment_CBox_OtherCarrier>
	
	<cfparam name="attributes.Attachment_CBox_Other" default="">
	<cfset Attachment_CBox_Other = attributes.Attachment_CBox_Other>
	
	<cfparam name="attributes.OtherExplanation_TBox" default="">
	<cfset OtherExplanation_TBox = attributes.OtherExplanation_TBox>
	

	
<!-------------------------------------------------------------------------------------->
<!--- Create the Control File that will be used to give the pdf tool the arguments.  --->
<!-------------------------------------------------------------------------------------->	
<cfoutput>
<cfsavecontent variable="fileData">

+errorMessageCode_CBox_MA130Yes@1,156,631,174,650,4,10=#trim(errorMessageCode_CBox_MA130Yes)#

+errorMessageCode_CBox_MA130No@1,156,611,174,621,4,10=#trim(errorMessageCode_CBox_MA130No)#

+date@1,170,556,230,566,4,8=#trim(date)#

+from@1,170,535,300,545,4,8=#trim(from)#

+patientName@1,420,535,560,545,4,8=#trim(patientName)#

+HICN@1,420,514,560,524,4,8=#trim(HICN)#

+nscSupplierNumber@1,170,502,300,512,4,8=#trim(nscSupplierNumber)#

+contactPerson@1,170,481,300,491,4,8=#trim(contactPerson)#

+telephoneNumber@1,170,464,300,474,4,8=#trim(telephoneNumber)#

+reasonForRequest_CBox_ClaimDenied@1,79,406,110,430,1,13=#trim(reasonForRequest_CBox_ClaimDenied)#

+reasonForRequest_CBox_ClaimPaymentReduced@1,196,406,225,430,1,13=#trim(reasonForRequest_CBox_ClaimPaymentReduced)#

+reasonForRequest_CBox_ClaimCorrection@1,327,406,355,430,1,13=#trim(reasonForRequest_CBox_ClaimCorrection)#

+reasonForRequest_CBox_ClaimReopened@1,436,406,575,430,1,13=#trim(reasonForRequest_CBox_ClaimReopened)#

+ClaimNumber_TBox_Line1@1,117,345,207,390,4,8=#trim(ClaimNumber_TBox_Line1)#

+ClaimDateOfService_TBox_Line1@1,260,345,322,390,4,8=#trim(ClaimDateOfService_TBox_Line1)#

+ClaimHCPCS_TBox_Line1@1,375,345,442,390,4,8=#trim(ClaimHCPCS_TBox_Line1)#

+ClaimRemittanceDate_TBox_Line1@1,505,345,565,390,4,8=#trim(ClaimRemittanceDate_TBox_Line1)#

+ClaimNumber_TBox_Line2@1,117,330,207,369,4,8=#trim(ClaimNumber_TBox_Line2)#

+ClaimDateOfService_TBox_Line2@1,260,330,322,369,4,8=#trim(ClaimDateOfService_TBox_Line2)#

+ClaimHCPCS_TBox_Line2@1,375,330,442,369,4,8=#trim(ClaimHCPCS_TBox_Line2)#

+ClaimRemittanceDate_TBox_Line2@1,505,330,565,369,4,8=#trim(ClaimRemittanceDate_TBox_Line2)#

+ClaimNumber_TBox_Line3@1,117,313,207,346,4,8=#trim(ClaimNumber_TBox_Line3)#

+ClaimDateOfService_TBox_Line3@1,260,313,322,346,4,8=#trim(ClaimDateOfService_TBox_Line3)#

+ClaimHCPCS_TBox_Line3@1,375,313,442,346,4,8=#trim(ClaimHCPCS_TBox_Line3)#

+ClaimRemittanceDate_TBox_Line3@1,505,313,565,346,4,8=#trim(ClaimRemittanceDate_TBox_Line3)#

+ClaimNumber_TBox_Line4@1,117,295,207,325,4,8=#trim(ClaimNumber_TBox_Line4)#

+ClaimDateOfService_TBox_Line4@1,260,295,322,325,4,8=#trim(ClaimDateOfService_TBox_Line4)#

+ClaimHCPCS_TBox_Line4@1,375,295,442,325,4,8=#trim(ClaimHCPCS_TBox_Line4)#

+ClaimRemittanceDate_TBox_Line4@1,505,295,565,325,4,8=#trim(ClaimRemittanceDate_TBox_Line4)#

+Explanation_TBox_Line1@1,87,230,560,250,4,8=#trim(Explanation_TBox_Line1)#

+Explanation_TBox_Line2@1,87,215,560,235,4,8=#trim(Explanation_TBox_Line2)#

+Explanation_TBox_Line3@1,87,200,560,220,4,8=#trim(Explanation_TBox_Line3)#

+Explanation_TBox_Line4@1,87,185,560,205,4,8=#trim(Explanation_TBox_Line4)#

+Explanation_TBox_Line5@1,87,170,560,190,4,8=#trim(Explanation_TBox_Line5)#

+Explanation_TBox_Line6@1,87,157,560,175,4,8=#trim(Explanation_TBox_Line6)#

+Attachment_CBox_ClaimCopy@1,79,110,160,130,1,13=#trim(Attachment_CBox_ClaimCopy)#

+Attachment_CBox_RemittanceAdviceCopy@1,209,110,220,130,1,13=#trim(Attachment_CBox_RemittanceAdviceCopy)#

+Attachment_CBox_CMN@1,344,110,380,130,1,13=#trim(Attachment_CBox_CMN)#

+Attachment_CBox_Medical@1,483,110,498,130,1,13=#trim(Attachment_CBox_Medical)#

+Attachment_CBox_PhysicianDocumentation@1,79,90,160,100,1,13=#trim(Attachment_CBox_PhysicianDocumentation)#

+Attachment_CBox_CheckCopies@1,209,90,220,100,1,13=#trim(Attachment_CBox_CheckCopies)#

+Attachment_CBox_OtherCarrier@1,344,90,380,100,1,13=#trim(Attachment_CBox_OtherCarrier)#

+Attachment_CBox_Other@1,79,72,160,86,1,13=#trim(Attachment_CBox_Other)#

+OtherExplanation_TBox@1,162,72,560,86,4,8=#trim(OtherExplanation_TBox)#

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
		arguments="#trim(RedeterminationRequestFormPath)# #trim(savefilepath)#\#trim(fileName)# @#trim(savefilepath)#\#ListFirst(trim(fileName), ".")#.txt"			
		timeout="60"></cfexecute>
		
		