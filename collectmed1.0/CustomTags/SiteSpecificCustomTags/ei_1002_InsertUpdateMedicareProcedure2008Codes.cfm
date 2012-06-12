<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   ei_1002_InsertUpdateMedicareProcedure2008Codes.cfm       --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   Maintenance                                              --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---   Guillermo Cruz                                           --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- File: #trim(request.applicationPath)#\                     --->
<!--- eobmanager\eob_1002_Codes_Import\ (Multiple Files)         --->
<!--- This tag will read the file above and place the claim      --->
<!--- procedure codes into the database.                         --->
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database. upon update   --->
<!--- set update date.                                           --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---  &lt;cf_ei_1002_InsertUpdateMedicareProcedureCodes<br>     --->
<!---  &nbsp;&nbsp;testmode="no"                                 --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---  [none]                                                    --->  
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!--- <b>filepath</b> (#trim(request.driveLetter)#:\             --->
<!--- eobmanager\eob_1002_Codes_Import)<br>                      --->
<!--- <strong>filename</strong>                                  --->
<!--- (run page in testmode to see files)<br>                    --->
<!--- <strong>testmode</strong> <b>TRUE</b>|FALSE&nbsp;          --->
<!---          (allows test prior to actual action)              --->  
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---   output to screen row action.                             --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---    Created 03/05/06                                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------> 



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="08anweb_PIPEDELIM_1_THRU_1000.txt,08anweb_PIPEDELIM_1001_THRU_2000.txt,08anweb_PIPEDELIM_2001_THRU_3000.txt,08anweb_PIPEDELIM_3001_THRU_4000.txt,08anweb_PIPEDELIM_4001_THRU_5000.txt,08anweb_PIPEDELIM_5001_THRU_6000.txt,08anweb_PIPEDELIM_6001_THRU_7000.txt,08anweb_PIPEDELIM_7001_THRU_8000.txt,08anweb_PIPEDELIM_8001_THRU_9000.txt,08anweb_PIPEDELIM_9001_THRU_10000.txt">
	<cfset filename = attributes.filename>
	
	<cfparam name="attributes.delimeter" default="|">
	<cfset delimeter = attributes.delimeter>
	
	<cfparam name="attributes.count" default="0">
	<cfset count = attributes.count>
	
	<cfset insertList = "">
	
	
<!------------------------------------------------------------------>
<!--- Needed cfscript.                                           --->
<!------------------------------------------------------------------>	
	<cfscript>
		/**
		 * @param list 	 The list to parse. (Required)
		 * @param delimiter 	 The delimiter to use. Defaults to a comma. (Optional)
		 * @param null 	 Null string to insert. Defaults to "NULL". (Optional)
		**/
		function listFix(list) {
		  var delim = ",";
		  var null = "NULL";
		  var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
		  var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";
		  var i = "";       
		  if(arrayLen(arguments) gt 1) delim = arguments[2];
		  if(arrayLen(arguments) gt 2) null = arguments[3];
		  if(findnocase(left(list, 1),delim)) list = null & list;
		  if(findnocase(right(list,1),delim)) list = list & null;
		  i = len(delim) - 1;
		  while(i GTE 1){
			delim = mid(delim,1,i) & "_Separator_" & mid(delim,i+1,len(delim) - (i));
			i = i - 1;
		  }
		  delim = ReplaceList(delim, special_char_list, esc_special_char_list);
		  delim = Replace(delim, "_Separator_", "|", "ALL");
		  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
		  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");	  
		  return list;
		}
	</cfscript>



<!------------------------------------------------------------------>
<!--- Set the timeout for the code to be able to run throughly.  --->
<!------------------------------------------------------------------>
	<cfsetting requestTimeOut = "900">
	
	
	
<!------------------------------------------------------------------>
<!--- Verify the needed variables were passed in.                --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="filename,filepath"
		fieldnames="File Name,File Path">	


	
<!------------------------------------------------------------------>
<!--- Include the files that contain the necessary javascript    --->
<!--- and cfscripts to run this page.                            --->
<!------------------------------------------------------------------>
	<cf_gcCFScriptIncludes>
	<cf_gcJScriptIncludes>
	
	
	
<!------------------------------------------------------------------>
<!--- Output to the screen.                                      --->
<!------------------------------------------------------------------>		
	<cfif testmode>
		<font size="5" color="FF0000">RAN IN TEST MODE</font><p>		
	<cfelse>
		<font size="5" color="FF0000">RAN IN LIVE MODE</font><p>			
	</cfif>
	
	<cfoutput>
		<p>
			<font size="2" color="ff0000">
				1) Prior to running this page you must download the new MEDICARE Procedure Codes from the site<br>
				http://www.cms.hhs.gov/HCPCSReleaseCodeSets/ANHCPCS/list.asp
			</font>
		<p>
		<p>
			<font size="2" color="ff0000">
				2) Open the .xls file in excel and copy the ENTIRE "Long Description" column into notepad and search for tab in the description (this step is very IMPORTANT) if you find any remove them in favor of a space. 
			</font>
		</p>
		<p>
			<font size="2" color="ff0000">
				3) Copy 500 lines at a time from the Excel file into a notepad/cfstudio file called "08anweb_PIPEDELIM_[STARTNUMBER]_THRU_[ENDNUMBER].txt"
				<br>
				Actual file names the file is looking for: 08anweb_PIPEDELIM_1_THRU_1000.txt,08anweb_PIPEDELIM_1001_THRU_2000.txt,08anweb_PIPEDELIM_2001_THRU_3000.txt,08anweb_PIPEDELIM_3001_THRU_4000.txt,08anweb_PIPEDELIM_4001_THRU_5000.txt,08anweb_PIPEDELIM_5001_THRU_6000.txt,08anweb_PIPEDELIM_6001_THRU_7000.txt,08anweb_PIPEDELIM_7001_THRU_8000.txt,08anweb_PIPEDELIM_8001_THRU_9000.txt,08anweb_PIPEDELIM_9001_THRU_10000.txt
			</font>
		</p>
		<p>
			<font size="2" color="ff0000">
				4) Replace the tabs in the file with a pipe leaving a correctly formatted txt file that can be processed.
			</font>
		</p>
		You will see UPDATE or INSERT for each row. <p>Ouput in black is what was gathered from the actual file. Ouput in red is what Cold Fusion has parsed out. <p>NOTE: BOTH THE RED AND BLACK LINES SHOULD MATCH ENTIRELY. <p>When you feel confident in this output then and only then call this tag with testmode=no.
	</cfoutput>	



<!-------------------------------------------------------------------------------------->
<!--- Loop over all the files to make this table.                                    --->
<!-------------------------------------------------------------------------------------->	
	<cfloop list="#trim(filename)#" index="i">	
	
		<!------------------------------------------------------------------>
		<!--- Check to make sure the directory actually exists.          --->
		<!------------------------------------------------------------------>
		<cfif NOT DirectoryExists("#trim(filepath)#\")>
			<cf_gcGeneralErrorTemplate
				message="The specified path does not exist (#trim(filepath)#).">
		</cfif>
		
		
		
		<!------------------------------------------------------------------>
		<!--- Check to make sure the file actually exists.               --->
		<!------------------------------------------------------------------>
		<cfif NOT FileExists("#trim(filepath)#\#trim(i)#")>
			<cf_gcGeneralErrorTemplate
				message="The file you are trying to view is not in the specified path (#trim(filepath)#\#trim(i)#).">
		</cfif>
		
		
		
		<!------------------------------------------------------------------>
		<!--- Read the file that has been sent in and set it ue.         --->
		<!------------------------------------------------------------------>
		<cffile
			action="READ"
			file="#trim(filepath)#\#trim(i)#" variable="fileContent">
		
			
				
		
		<!------------------------------------------------------------------>
		<!--- Start the processing of this page.                         --->
		<!------------------------------------------------------------------>		
		<cftry>
				
			<!------------------------------------------------------------------>
			<!--- Loop through the file content that was read in and use     --->
			<!--- the newline and line feed as the delimeter and put each    --->
			<!--- line item into the database depending on the code. If      --->
			<!--- the code already exists then simply the description may    --->
			<!--- have changed. so update the description. If the code       --->
			<!--- does not exist then enter into the database.               --->
			<!------------------------------------------------------------------>
			<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
				
				<cfset count = count + 1>
				
				<cfset i = listfix(i, delimeter)>
				
				<cfset HCPC = ListGetAt(i, 1, delimeter)>
				<cfset SeqNum = ListGetAt(i, 2, delimeter)>
				<cfset RIC = ListGetAt(i, 3, delimeter)>
				<cfset LongDescription = ListGetAt(i, 4, delimeter)>
				<cfset ShortDescription = ListGetAt(i, 5, delimeter)>
				<cfset PI1 = ListGetAt(i, 6, delimeter)>
				<cfset PI2 = ListGetAt(i, 7, delimeter)>
				<cfset PI3 = ListGetAt(i, 8, delimeter)>
				<cfset PI4 = ListGetAt(i, 9, delimeter)>
				<cfset MPI = ListGetAt(i, 10, delimeter)>
				<cfset CIM1 = ListGetAt(i, 11, delimeter)>
				<cfset CIM2 = ListGetAt(i, 12, delimeter)>
				<cfset CIM3 = ListGetAt(i, 13, delimeter)>
				<cfset MCM1 = ListGetAt(i, 14, delimeter)>
				<cfset MCM2 = ListGetAt(i, 15, delimeter)>
				<cfset MCM3 = ListGetAt(i, 16, delimeter)>
				<cfset Statute = ListGetAt(i, 17, delimeter)>
				<cfset LabCert1 = ListGetAt(i, 18, delimeter)>
				<cfset LabCert2 = ListGetAt(i, 19, delimeter)>		
				<cfset LabCert3 = ListGetAt(i, 20, delimeter)>
				<cfset LabCert4 = ListGetAt(i, 21, delimeter)>
				<cfset LabCert5 = ListGetAt(i, 22, delimeter)>
				<cfset LabCert6 = ListGetAt(i, 23, delimeter)>
				<cfset LabCert7 = ListGetAt(i, 24, delimeter)>
				<cfset LabCert8 = ListGetAt(i, 25, delimeter)>
				<cfset XRef1 = ListGetAt(i, 26, delimeter)>
				<cfset XRef2 = ListGetAt(i, 27, delimeter)>
				<cfset XRef3 = ListGetAt(i, 28, delimeter)>
				<cfset XRef4 = ListGetAt(i, 29, delimeter)>
				<cfset XRef5 = ListGetAt(i, 30, delimeter)>
				<cfset Coverage = ListGetAt(i, 31, delimeter)>
				<cfset ASCPayGrp = ListGetAt(i, 32, delimeter)>
				
				<cfif ListGetAt(i, 33, delimeter) NEQ "NULL">
					<cfset ASCPayGrpEffDate_Year = MID(ListGetAt(i, 33, delimeter), 1, 4)>
					<cfset ASCPayGrpEffDate_Month = MID(ListGetAt(i, 33, delimeter), 5, 2)>
					<cfset ASCPayGrpEffDate_Day = MID(ListGetAt(i, 33, delimeter), 7, 2)>
					<cfset ASCPayGrpEffDate = CreateDate(ASCPayGrpEffDate_Year, ASCPayGrpEffDate_Month, ASCPayGrpEffDate_Day)>
					<cfset ASCPayGrpEffDate = CreateODBCDate(ASCPayGrpEffDate)>
				<cfelse>
					<cfset ASCPayGrpEffDate = "NULL">
				</cfif>		
				
				<cfset MOGPayGrp = ListGetAt(i, 34, delimeter)>
				<cfset MOGPayInd = ListGetAt(i, 35, delimeter)>
				
				<cfif ListGetAt(i, 36, delimeter) NEQ "NULL">
					<cfset MOGEffDate_Year = MID(ListGetAt(i, 36, delimeter), 1, 4)>
					<cfset MOGEffDate_Month = MID(ListGetAt(i, 36, delimeter), 5, 2)>
					<cfset MOGEffDate_Day = MID(ListGetAt(i, 36, delimeter), 7, 2)>
					<cfset MOGEffDate = CreateDate(MOGEffDate_Year, MOGEffDate_Month, MOGEffDate_Day)>
					<cfset MOGEffDate = CreateODBCDate(MOGEffDate)>
				<cfelse>
					<cfset MOGEffDate = "NULL">
				</cfif>	
				
				
				<cfset ProcNote = ListGetAt(i, 37, delimeter)>
				<cfset BETOS = ListGetAt(i, 38, delimeter)>
				<cfset FILLER = ListGetAt(i, 39, delimeter)>
				<cfset TOS1 = ListGetAt(i, 40, delimeter)>
				<cfset TOS2 = ListGetAt(i, 41, delimeter)>
				<cfset TOS3 = ListGetAt(i, 42, delimeter)>
				<cfset TOS4 = ListGetAt(i, 43, delimeter)>
				<cfset TOS5 = ListGetAt(i, 44, delimeter)>
				<cfset AnestBaseUnits = ListGetAt(i, 45, delimeter)>
				
				<cfif ListGetAt(i, 46, delimeter) NEQ "NULL">
					<cfset CodeAddDate_Year = MID(ListGetAt(i, 46, delimeter), 1, 4)>
					<cfset CodeAddDate_Month = MID(ListGetAt(i, 46, delimeter), 5, 2)>
					<cfset CodeAddDate_Day = MID(ListGetAt(i, 46, delimeter), 7, 2)>
					<cfset CodeAddDate = CreateDate(CodeAddDate_Year, CodeAddDate_Month, CodeAddDate_Day)>
					<cfset CodeAddDate = CreateODBCDate(CodeAddDate)>
				<cfelse>
					<cfset CodeAddDate = "NULL">
				</cfif>
						
				<cfif ListGetAt(i, 47, delimeter) NEQ "NULL">
					<cfset ActionEffDate_Year = MID(ListGetAt(i, 47, delimeter), 1, 4)>
					<cfset ActionEffDate_Month = MID(ListGetAt(i, 47, delimeter), 5, 2)>
					<cfset ActionEffDate_Day = MID(ListGetAt(i, 47, delimeter), 7, 2)>
					<cfset ActionEffDate = CreateDate(ActionEffDate_Year, ActionEffDate_Month, ActionEffDate_Day)>
					<cfset ActionEffDate = CreateODBCDate(ActionEffDate)>
				<cfelse>
					<cfset ActionEffDate = "NULL">
				</cfif>				
						
				<cfif ListGetAt(i, 48, delimeter) NEQ "NULL">
					<cfset TermDate_Year = MID(ListGetAt(i, 48, delimeter), 1, 4)>
					<cfset TermDate_Month = MID(ListGetAt(i, 48, delimeter), 5, 2)>
					<cfset TermDate_Day = MID(ListGetAt(i, 48, delimeter), 7, 2)>
					<cfset TermDate = CreateDate(TermDate_Year, TermDate_Month, TermDate_Day)>
					<cfset TermDate = CreateODBCDate(TermDate)>
				<cfelse>
					<cfset TermDate = "NULL">
				</cfif>	
				
				<cfset ActionCode = ListGetAt(i, 49, delimeter)>
								
						
				
				<cfif listlen(trim(i), delimeter) NEQ 49><!--- Column Filler1 was not received in the zip file for 2008 --->
					<cfthrow message="STOPPED ON: #Count# List not 50 in length">
				</cfif>
					
				<cfquery name="getCode" datasource="#trim(request.datasource)#">
					SELECT recordID 
					FROM pa_master.eob_medicare_procedurecode  
					WHERE HCPC = '#trim(HCPC)#' AND SeqNum = '#trim(SeqNum)#'
				</cfquery>
				
				
							
				<cfif getCode.RecordCount GTE 1>
					<!---<cfthrow message="STOPPED ON: #Count# UPDATE">--->
					<cfoutput><font size="1">[RECORD: #count#][LIST LENGTH: #listlen(trim(i), delimeter)#]<br></font></cfoutput>
					<cfoutput><font size="1">[UPDATE]<br>[#trim(i)#]<br><font color="FF0000">[#trim(HCPC)##delimeter##trim(SeqNum)##delimeter##trim(RIC)##delimeter##trim(LongDescription)##delimeter##trim(ShortDescription)##delimeter##trim(PI1)##delimeter##trim(PI2)##delimeter##trim(PI3)##delimeter##trim(PI4)##delimeter##trim(MPI)##delimeter##trim(CIM1)##delimeter##trim(CIM2)##delimeter##trim(CIM3)##delimeter##trim(MCM1)##delimeter##trim(MCM2)##delimeter##trim(MCM3)##delimeter##trim(Statute)##delimeter##trim(LabCert1)##delimeter##trim(LabCert2)##delimeter##trim(LabCert3)##delimeter##trim(LabCert4)##delimeter##trim(LabCert5)##delimeter##trim(LabCert6)##delimeter##trim(LabCert7)##delimeter##trim(LabCert8)##delimeter##trim(XRef1)##delimeter##trim(XRef2)##delimeter##trim(XRef3)##delimeter##trim(XRef4)##delimeter##trim(XRef5)##delimeter##trim(Coverage)##delimeter##trim(ASCPayGrp)##delimeter##trim(ASCPayGrpEffDate)##delimeter##trim(MOGPayGrp)##delimeter##trim(MOGPayInd)##delimeter##trim(MOGEffDate)##delimeter##trim(ProcNote)##delimeter##trim(BETOS)##delimeter##trim(FILLER)##delimeter##trim(TOS1)##delimeter##trim(TOS2)##delimeter##trim(TOS3)##delimeter##trim(TOS4)##delimeter##trim(TOS5)##delimeter##trim(AnestBaseUnits)##delimeter##trim(CodeAddDate)##delimeter##trim(ActionEffDate)##delimeter##trim(TermDate)##delimeter##trim(ActionCode)#]</font><p></p></font></cfoutput>
					
					<cfif NOT testmode>
						
						<cfquery name="update" datasource="#trim(request.datasource)#">
							UPDATE pa_master.eob_medicare_procedurecode  
							SET 
								HCPC = '#trim(HCPC)#', 
								SeqNum = <cfif SeqNum NEQ "NULL">'#trim(SeqNum)#'<cfelse>NULL</cfif>, 
								RIC = <cfif RIC NEQ "NULL">'#trim(RIC)#'<cfelse>NULL</cfif>,  
								LongDescription = <cfif LongDescription NEQ "NULL">'#trim(LongDescription)#'<cfelse>NULL</cfif>, 
								ShortDescription = <cfif ShortDescription NEQ "NULL">'#trim(ShortDescription)#'<cfelse>NULL</cfif>, 
								PI1 = <cfif PI1 NEQ "NULL">'#trim(PI1)#'<cfelse>NULL</cfif>, 
								PI2 = <cfif PI2 NEQ "NULL">'#trim(PI2)#'<cfelse>NULL</cfif>, 
								PI3 = <cfif PI3 NEQ "NULL">'#trim(PI3)#'<cfelse>NULL</cfif>, 
								PI4 = <cfif PI4 NEQ "NULL">'#trim(PI4)#'<cfelse>NULL</cfif>, 
								MPI = <cfif MPI NEQ "NULL">'#trim(MPI)#'<cfelse>NULL</cfif>, 
								CIM1 = <cfif CIM1 NEQ "NULL">'#trim(CIM1)#'<cfelse>NULL</cfif>, 
								CIM2 = <cfif CIM2 NEQ "NULL">'#trim(CIM2)#'<cfelse>NULL</cfif>, 
								CIM3 = <cfif CIM3 NEQ "NULL">'#trim(CIM3)#'<cfelse>NULL</cfif>, 
								MCM1 = <cfif MCM1 NEQ "NULL">'#trim(MCM1)#'<cfelse>NULL</cfif>, 
								MCM2 = <cfif MCM2 NEQ "NULL">'#trim(MCM2)#'<cfelse>NULL</cfif>, 
								MCM3 = <cfif MCM3 NEQ "NULL">'#trim(MCM3)#'<cfelse>NULL</cfif>, 
								Statute = <cfif Statute NEQ "NULL">'#trim(Statute)#'<cfelse>NULL</cfif>, 
								LabCert1 = <cfif LabCert1 NEQ "NULL">'#trim(LabCert1)#'<cfelse>NULL</cfif>, 
								LabCert2 = <cfif LabCert2 NEQ "NULL">'#trim(LabCert2)#'<cfelse>NULL</cfif>, 
								LabCert3 = <cfif LabCert3 NEQ "NULL">'#trim(LabCert3)#'<cfelse>NULL</cfif>, 
								LabCert4 = <cfif LabCert4 NEQ "NULL">'#trim(LabCert4)#'<cfelse>NULL</cfif>, 
								LabCert5 = <cfif LabCert5 NEQ "NULL">'#trim(LabCert5)#'<cfelse>NULL</cfif>, 
								LabCert6 = <cfif LabCert6 NEQ "NULL">'#trim(LabCert6)#'<cfelse>NULL</cfif>, 
								LabCert7 = <cfif LabCert7 NEQ "NULL">'#trim(LabCert7)#'<cfelse>NULL</cfif>, 
								LabCert8 = <cfif LabCert8 NEQ "NULL">'#trim(LabCert8)#'<cfelse>NULL</cfif>, 
								XRef1 = <cfif XRef1 NEQ "NULL">'#trim(XRef1)#'<cfelse>NULL</cfif>, 
								XRef2 = <cfif XRef2 NEQ "NULL">'#trim(XRef2)#'<cfelse>NULL</cfif>, 
								XRef3 = <cfif XRef3 NEQ "NULL">'#trim(XRef3)#'<cfelse>NULL</cfif>, 
								XRef4 = <cfif XRef4 NEQ "NULL">'#trim(XRef4)#'<cfelse>NULL</cfif>, 
								XRef5 = <cfif XRef5 NEQ "NULL">'#trim(XRef5)#'<cfelse>NULL</cfif>, 
								Coverage = <cfif Coverage NEQ "NULL">'#trim(Coverage)#'<cfelse>NULL</cfif>, 
								ASCPayGrp = <cfif ASCPayGrp NEQ "NULL">'#trim(ASCPayGrp)#'<cfelse>NULL</cfif>, 
								ASCPayGrpEffDate = #trim(ASCPayGrpEffDate)#, 
								MOGPayGrp = <cfif MOGPayGrp NEQ "NULL">'#trim(MOGPayGrp)#'<cfelse>NULL</cfif>, 
								MOGPayInd = <cfif MOGPayInd NEQ "NULL">'#trim(MOGPayInd)#'<cfelse>NULL</cfif>, 
								MOGEffDate = #trim(MOGEffDate)#, 
								ProcNote = <cfif ProcNote NEQ "NULL">'#trim(ProcNote)#'<cfelse>NULL</cfif>, 
								BETOS = <cfif BETOS NEQ "NULL">'#trim(BETOS)#'<cfelse>NULL</cfif>, 
								FILLER = <cfif FILLER NEQ "NULL">'#trim(FILLER)#'<cfelse>NULL</cfif>, 
								TOS1 = <cfif TOS1 NEQ "NULL">'#trim(TOS1)#'<cfelse>NULL</cfif>, 
								TOS2 = <cfif TOS2 NEQ "NULL">'#trim(TOS2)#'<cfelse>NULL</cfif>, 
								TOS3 = <cfif TOS3 NEQ "NULL">'#trim(TOS3)#'<cfelse>NULL</cfif>, 
								TOS4 = <cfif TOS4 NEQ "NULL">'#trim(TOS4)#'<cfelse>NULL</cfif>, 
								TOS5 = <cfif TOS5 NEQ "NULL">'#trim(TOS5)#'<cfelse>NULL</cfif>, 
								AnestBaseUnits = <cfif AnestBaseUnits NEQ "NULL">'#trim(AnestBaseUnits)#'<cfelse>NULL</cfif>, 
								CodeAddDate = #trim(CodeAddDate)#, 
								ActionEffDate = #trim(ActionEffDate)#, 
								TermDate = #trim(TermDate)#, 
								ActionCode = <cfif ActionCode NEQ "NULL">'#trim(ActionCode)#'<cfelse>NULL</cfif>
							
							WHERE recordID = #trim(getCode.recordID)#
						</cfquery>
						
					</cfif>
					
				<cfelse>
					
					<cfoutput><font size="1">[RECORD: #count#][LIST LENGTH: #listlen(trim(i), delimeter)#]<br></font></cfoutput>
					<cfoutput><font size="1">[INSERT]<br>[#trim(i)#]<br><font color="FF0000">[#trim(HCPC)##delimeter##trim(SeqNum)##delimeter##trim(RIC)##delimeter##trim(LongDescription)##delimeter##trim(ShortDescription)##delimeter##trim(PI1)##delimeter##trim(PI2)##delimeter##trim(PI3)##delimeter##trim(PI4)##delimeter##trim(MPI)##delimeter##trim(CIM1)##delimeter##trim(CIM2)##delimeter##trim(CIM3)##delimeter##trim(MCM1)##delimeter##trim(MCM2)##delimeter##trim(MCM3)##delimeter##trim(Statute)##delimeter##trim(LabCert1)##delimeter##trim(LabCert2)##delimeter##trim(LabCert3)##delimeter##trim(LabCert4)##delimeter##trim(LabCert5)##delimeter##trim(LabCert6)##delimeter##trim(LabCert7)##delimeter##trim(LabCert8)##delimeter##trim(XRef1)##delimeter##trim(XRef2)##delimeter##trim(XRef3)##delimeter##trim(XRef4)##delimeter##trim(XRef5)##delimeter##trim(Coverage)##delimeter##trim(ASCPayGrp)##delimeter##trim(ASCPayGrpEffDate)##delimeter##trim(MOGPayGrp)##delimeter##trim(MOGPayInd)##delimeter##trim(MOGEffDate)##delimeter##trim(ProcNote)##delimeter##trim(BETOS)##delimeter##trim(FILLER)##delimeter##trim(TOS1)##delimeter##trim(TOS2)##delimeter##trim(TOS3)##delimeter##trim(TOS4)##delimeter##trim(TOS5)##delimeter##trim(AnestBaseUnits)##delimeter##trim(CodeAddDate)##delimeter##trim(ActionEffDate)##delimeter##trim(TermDate)##delimeter##trim(ActionCode)#]</font><p></p></font></cfoutput>
					<cfset insertList = ListAppend(insertList, trim(HCPC))>
					
					<cfif NOT testmode>
		
						<cfquery name="insertCode" datasource="#trim(request.datasource)#">
							INSERT INTO pa_master.eob_medicare_procedurecode  (HCPC, SeqNum, RIC, LongDescription, ShortDescription, PI1, PI2, PI3, PI4, MPI, CIM1, CIM2, CIM3, MCM1, MCM2, MCM3, Statute, LabCert1, LabCert2, LabCert3, LabCert4, LabCert5, LabCert6, LabCert7, LabCert8, XRef1, XRef2, XRef3, XRef4, XRef5, Coverage, ASCPayGrp, ASCPayGrpEffDate, MOGPayGrp, MOGPayInd, MOGEffDate, ProcNote, BETOS, FILLER, TOS1, TOS2, TOS3, TOS4, TOS5, AnestBaseUnits, CodeAddDate, ActionEffDate, TermDate, ActionCode)
							VALUES('#trim(HCPC)#', <cfif SeqNum NEQ "NULL">'#trim(SeqNum)#'<cfelse>NULL</cfif>, <cfif RIC NEQ 	"NULL">'#trim(RIC)#'<cfelse>NULL</cfif>, <cfif LongDescription NEQ "NULL">'#trim(LongDescription)#'<cfelse>NULL</cfif>, <cfif 	ShortDescription NEQ "NULL">'#trim(ShortDescription)#'<cfelse>NULL</cfif>, <cfif PI1 NEQ "NULL">'#trim(PI1)#'<cfelse>NULL</cfif>, 	<cfif PI2 NEQ "NULL">'#trim(PI2)#'<cfelse>NULL</cfif>, <cfif PI3 NEQ "NULL">'#trim(PI3)#'<cfelse>NULL</cfif>, <cfif PI4 NEQ 	"NULL">'#trim(PI4)#'<cfelse>NULL</cfif>, <cfif MPI NEQ "NULL">'#trim(MPI)#'<cfelse>NULL</cfif>, <cfif CIM1 NEQ 	"NULL">'#trim(CIM1)#'<cfelse>NULL</cfif>, <cfif CIM2 NEQ "NULL">'#trim(CIM2)#'<cfelse>NULL</cfif>, <cfif CIM3 NEQ 	"NULL">'#trim(CIM3)#'<cfelse>NULL</cfif>, <cfif MCM1 NEQ "NULL">'#trim(MCM1)#'<cfelse>NULL</cfif>, <cfif MCM2 NEQ 	"NULL">'#trim(MCM2)#'<cfelse>NULL</cfif>, <cfif MCM3 NEQ "NULL">'#trim(MCM3)#'<cfelse>NULL</cfif>, <cfif Statute NEQ 	"NULL">'#trim(Statute)#'<cfelse>NULL</cfif>, <cfif LabCert1 NEQ "NULL">'#trim(LabCert1)#'<cfelse>NULL</cfif>, <cfif LabCert2 NEQ 	"NULL">'#trim(LabCert2)#'<cfelse>NULL</cfif>, <cfif LabCert3 NEQ "NULL">'#trim(LabCert3)#'<cfelse>NULL</cfif>, <cfif LabCert4 NEQ 	"NULL">'#trim(LabCert4)#'<cfelse>NULL</cfif>, <cfif LabCert5 NEQ "NULL">'#trim(LabCert5)#'<cfelse>NULL</cfif>, <cfif LabCert6 NEQ 	"NULL">'#trim(LabCert6)#'<cfelse>NULL</cfif>, <cfif LabCert7 NEQ "NULL">'#trim(LabCert7)#'<cfelse>NULL</cfif>, <cfif LabCert8 NEQ 	"NULL">'#trim(LabCert8)#'<cfelse>NULL</cfif>, <cfif XRef1 NEQ "NULL">'#trim(XRef1)#'<cfelse>NULL</cfif>, <cfif XRef2 NEQ 	"NULL">'#trim(XRef2)#'<cfelse>NULL</cfif>, <cfif XRef3 NEQ "NULL">'#trim(XRef3)#'<cfelse>NULL</cfif>, <cfif XRef4 NEQ 	"NULL">'#trim(XRef4)#'<cfelse>NULL</cfif>, <cfif XRef5 NEQ "NULL">'#trim(XRef5)#'<cfelse>NULL</cfif>, <cfif Coverage NEQ 	"NULL">'#trim(Coverage)#'<cfelse>NULL</cfif>, <cfif ASCPayGrp NEQ "NULL">'#trim(ASCPayGrp)#'<cfelse>NULL</cfif>, 	#trim(ASCPayGrpEffDate)#, <cfif MOGPayGrp NEQ "NULL">'#trim(MOGPayGrp)#'<cfelse>NULL</cfif>, <cfif 	MOGPayInd NEQ 	"NULL">'#trim(MOGPayInd)#'<cfelse>NULL</cfif>, #trim(MOGEffDate)#, <cfif ProcNote NEQ "NULL">'#trim(ProcNote)#'<cfelse>NULL</cfif>, 	<cfif BETOS NEQ "NULL">'#trim(BETOS)#'<cfelse>NULL</cfif>, <cfif FILLER NEQ "NULL">'#trim(FILLER)#'<cfelse>NULL</cfif>, <cfif TOS1 	NEQ "NULL">'#trim(TOS1)#'<cfelse>NULL</cfif>, <cfif TOS2 NEQ "NULL">'#trim(TOS2)#'<cfelse>NULL</cfif>, <cfif TOS3 NEQ 	"NULL">'#trim(TOS3)#'<cfelse>NULL</cfif>, <cfif TOS4 NEQ "NULL">'#trim(TOS4)#'<cfelse>NULL</cfif>, <cfif TOS5 NEQ 	"NULL">'#trim(TOS5)#'<cfelse>NULL</cfif>, <cfif AnestBaseUnits NEQ "NULL">'#trim(AnestBaseUnits)#'<cfelse>NULL</cfif>, 	#trim(CodeAddDate)#, #trim(ActionEffDate)#, #trim(TermDate)#, <cfif ActionCode NEQ "NULL">'#trim(ActionCode)#'<cfelse>NULL</cfif>)
						</cfquery>
					
					</cfif>
					
				</cfif>
					
				
				
				<cfset HCPC = "">
				<cfset SeqNum = "">
				<cfset RIC = "">
				<cfset LongDescription = "">
				<cfset ShortDescription = "">
				<cfset PI1 = "">
				<cfset PI2 = "">
				<cfset PI3 = "">
				<cfset PI4 = "">
				<cfset MPI = "">
				<cfset CIM1 = "">
				<cfset CIM2 = "">
				<cfset CIM3 = "">
				<cfset MCM1 = "">
				<cfset MCM2 = "">
				<cfset MCM3 = "">
				<cfset Statute = "">
				<cfset LabCert1 = "">
				<cfset LabCert2 = "">		
				<cfset LabCert3 = "">
				<cfset LabCert4 = "">
				<cfset LabCert5 = "">
				<cfset LabCert6 = "">
				<cfset LabCert7 = "">
				<cfset LabCert8 = "">
				<cfset XRef1 = "">
				<cfset XRef2 = "">
				<cfset XRef3 = "">
				<cfset XRef4 = "">
				<cfset XRef5 = "">
				<cfset Coverage = "">
				<cfset ASCPayGrp = "">
				<cfset ASCPayGrpEffDate = "">
				<cfset MOGPayGrp = "">
				<cfset MOGPayInd = "">
				<cfset MOGEffDate = "">
				<cfset ProcNote = "">
				<cfset BETOS = "">
				<cfset FILLER = "">
				<cfset TOS1 = "">
				<cfset TOS2 = "">
				<cfset TOS3 = "">
				<cfset TOS4 = "">
				<cfset TOS5 = "">
				<cfset AnestBaseUnits = "">
				<cfset CodeAddDate = "">
				<cfset ActionEffDate = "">
				<cfset TermDate = "">
				<cfset ActionCode = "">
				
				
							
			</cfloop>
		
			
			
			<cfcatch type="Any">
				<cfoutput>
					THERE WAS AN ERROR PROCESSING THE FILE.
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>		
			</cfcatch>
			
		</cftry>	
	
	
	
	</cfloop>




<cfoutput>insertList : [#ListLen(insertList)#] #insertList# [END]<br><br><br></cfoutput>










<!--- Code below can be run inside of QueryAnalyzer and will drop the table to be able to start over.



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_PROCEDURECode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_PROCEDURECode]
GO

CREATE TABLE [dbo].[EOB_MEDICARE_PROCEDURECode] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPC] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[SeqNum] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RIC] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LongDescription] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ShortDescription] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PI1] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PI2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PI3] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PI4] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPI] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CIM1] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CIM2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CIM3] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MCM1] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MCM2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MCM3] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Statute] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert1] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert3] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert4] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert5] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert6] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert7] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabCert8] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[XRef1] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[XRef2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[XRef3] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[XRef4] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[XRef5] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Coverage] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ASCPayGrp] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ASCPayGrpEffDate] [datetime] NULL ,
	[MOGPayGrp] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MOGPayInd] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MOGEffDate] [datetime] NULL ,
	[ProcNote] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BETOS] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FILLER] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TOS1] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TOS2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TOS3] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TOS4] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TOS5] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AnestBaseUnits] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CodeAddDate] [datetime] NULL ,
	[ActionEffDate] [datetime] NULL ,
	[TermDate] [datetime] NULL ,
	[ActionCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Filler1] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_PROCEDURECode] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_PROCEDURECode_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_PROCEDURECode_DateCreated] DEFAULT (now()) FOR [DateCreated],
	CONSTRAINT [PK_EOB_MEDICARE_PROCEDURECode] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

Select Count(*) FROM pa_master.eob_medicare_procedurecode






--->









		



