<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- EOB_MEDICARE_PROCEDURECodeIO.cfc                                               --->
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->
<!--- This tag is a CFC tag tied to the EOB_MEDICARE_PROCEDURECode table in the dB.  --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_EOB_MEDICARE_PROCEDURECodeTable                                  --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!--- Queryname<br>                                                                  --->
<!--- fields<br>                                                                     --->
<!--- orderby<br>                                                                    --->
<!--- groupby (same as fields contents maybe different order)<br>                    --->
<!--- andclause example.... (CN1= Column Name)                                       --->
<!--- [ andclause="RTRIM(CN1)+''+RTRIM(CN2)='#Var#'" ]<br>                           --->
<!--- RecordID<br>                                                                   --->
<!--- HCPC<br>                                                                       --->
<!--- SeqNum<br>                                                                     --->
<!--- RIC<br>                                                                        --->
<!--- LongDescription<br>                                                            --->
<!--- ShortDescription<br>                                                           --->
<!--- PI1<br>                                                                        --->
<!--- PI2<br>                                                                        --->
<!--- PI3<br>                                                                        --->
<!--- PI4<br>                                                                        --->
<!--- MPI<br>                                                                        --->
<!--- CIM1<br>                                                                       --->
<!--- CIM2<br>                                                                       --->
<!--- CIM3<br>                                                                       --->
<!--- MCM1<br>                                                                       --->
<!--- MCM2<br>                                                                       --->
<!--- MCM3<br>                                                                       --->
<!--- Statute<br>                                                                    --->
<!--- LabCert1<br>                                                                   --->
<!--- LabCert2<br>                                                                   --->
<!--- LabCert3<br>                                                                   --->
<!--- LabCert4<br>                                                                   --->
<!--- LabCert5<br>                                                                   --->
<!--- LabCert6<br>                                                                   --->
<!--- LabCert7<br>                                                                   --->
<!--- LabCert8<br>                                                                   --->
<!--- XRef1<br>                                                                      --->
<!--- XRef2<br>                                                                      --->
<!--- XRef3<br>                                                                      --->
<!--- XRef4<br>                                                                      --->
<!--- XRef5<br>                                                                      --->
<!--- Coverage<br>                                                                   --->
<!--- ASCPayGrp<br>                                                                  --->
<!--- ASCPayGrpEffDate<br>                                                           --->
<!--- MOGPayGrp<br>                                                                  --->
<!--- MOGPayInd<br>                                                                  --->
<!--- MOGEffDate<br>                                                                 --->
<!--- ProcNote<br>                                                                   --->
<!--- BETOS<br>                                                                      --->
<!--- FILLER<br>                                                                     --->
<!--- TOS1<br>                                                                       --->
<!--- TOS2<br>                                                                       --->
<!--- TOS3<br>                                                                       --->
<!--- TOS4<br>                                                                       --->
<!--- TOS5<br>                                                                       --->
<!--- AnestBaseUnits<br>                                                             --->
<!--- CodeAddDate<br>                                                                --->
<!--- ActionEffDate<br>                                                              --->
<!--- TermDate<br>                                                                   --->
<!--- ActionCode<br>                                                                 --->
<!--- Filler1<br>                                                                    --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- recordID                                                                       --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="EOB_MEDICARE_PROCEDURECodeIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.RecordID = "NULL";
			variables.instance.HCPC = "";
			variables.instance.SeqNum = "";
			variables.instance.RIC = "";
			variables.instance.LongDescription = "";
			variables.instance.ShortDescription = "";
			variables.instance.PI1 = "";
			variables.instance.PI2 = "";
			variables.instance.PI3 = "";
			variables.instance.PI4 = "";
			variables.instance.MPI = "";
			variables.instance.CIM1 = "";
			variables.instance.CIM2 = "";
			variables.instance.CIM3 = "";
			variables.instance.MCM1 = "";
			variables.instance.MCM2 = "";
			variables.instance.MCM3 = "";
			variables.instance.Statute = "";
			variables.instance.LabCert1 = "";
			variables.instance.LabCert2 = "";
			variables.instance.LabCert3 = "";
			variables.instance.LabCert4 = "";
			variables.instance.LabCert5 = "";
			variables.instance.LabCert6 = "";
			variables.instance.LabCert7 = "";
			variables.instance.LabCert8 = "";
			variables.instance.XRef1 = "";
			variables.instance.XRef2 = "";
			variables.instance.XRef3 = "";
			variables.instance.XRef4 = "";
			variables.instance.XRef5 = "";
			variables.instance.Coverage = "";
			variables.instance.ASCPayGrp = "";
			variables.instance.ASCPayGrpEffDate = "";
			variables.instance.MOGPayGrp = "";
			variables.instance.MOGPayInd = "";
			variables.instance.MOGEffDate = "";
			variables.instance.ProcNote = "";
			variables.instance.BETOS = "";
			variables.instance.FILLER = "";
			variables.instance.TOS1 = "";
			variables.instance.TOS2 = "";
			variables.instance.TOS3 = "";
			variables.instance.TOS4 = "";
			variables.instance.TOS5 = "";
			variables.instance.AnestBaseUnits = "";
			variables.instance.CodeAddDate = "";
			variables.instance.ActionEffDate = "";
			variables.instance.TermDate = "";
			variables.instance.ActionCode = "";
			variables.instance.Filler1 = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 55)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RECORDID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPC", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "XREF1", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "XREF2", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "XREF3", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "XREF4", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "XREF5", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "COVERAGE", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ASCPAYGRP", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ASCPAYGRPEFFDATE", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MOGPAYGRP", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MOGPAYIND", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MOGEFFDATE", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PROCNOTE", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "BETOS", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILLER", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOS1", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOS2", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOS3", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOS4", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TOS5", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ANESTBASEUNITS", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CODEADDDATE", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIONEFFDATE", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TERMDATE", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIONCODE", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FILLER1", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SEQNUM", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 32)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RIC", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 33)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LONGDESCRIPTION", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 34)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SHORTDESCRIPTION", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 35)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PI1", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 36)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PI2", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 37)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PI3", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 38)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PI4", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 39)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MPI", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 40)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CIM1", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 41)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CIM2", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 42)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CIM3", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 43)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MCM1", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 44)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MCM2", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 45)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "MCM3", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 46)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "STATUTE", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 47)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT1", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 48)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT2", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 49)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT3", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 50)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT4", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 51)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT5", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 52)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT6", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 53)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT7", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 54)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABCERT8", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 55)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RecordID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRecordID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RecordID>
	</cffunction>
	 
	<cffunction name="setRecordID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RecordID" required="Yes" type="String">
		
		<cfif RecordID NEQ "NULL">	
			
			<cfif arguments.RecordID EQ "@@" OR arguments.RecordID EQ "">
				
				<cfset arguments.RecordID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(RecordID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RecordID</strong> (#RecordID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RecordID = arguments.RecordID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for HCPC.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHCPC" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HCPC>
	</cffunction>
	 
	<cffunction name="setHCPC" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HCPC" required="Yes" type="String">
		
		<cfif HCPC NEQ "NULL">	
			
			<cfif arguments.HCPC EQ "@@" OR arguments.HCPC EQ "">
				
				<cfset arguments.HCPC = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HCPC)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HCPC</strong> (#HCPC#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(HCPC) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HCPC</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.HCPC = arguments.HCPC>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HCPC")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SeqNum.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSeqNum" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SeqNum>
	</cffunction>
	 
	<cffunction name="setSeqNum" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SeqNum" required="Yes" type="String">
		
		<cfif SeqNum NEQ "NULL">	
			
			<cfif arguments.SeqNum EQ "@@" OR arguments.SeqNum EQ "">
				
				<cfset arguments.SeqNum = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SeqNum)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SeqNum</strong> (#SeqNum#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SeqNum) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SeqNum</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SeqNum = arguments.SeqNum>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SeqNum")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RIC.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRIC" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RIC>
	</cffunction>
	 
	<cffunction name="setRIC" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RIC" required="Yes" type="String">
		
		<cfif RIC NEQ "NULL">	
			
			<cfif arguments.RIC EQ "@@" OR arguments.RIC EQ "">
				
				<cfset arguments.RIC = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(RIC)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RIC</strong> (#RIC#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(RIC) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RIC</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.RIC = arguments.RIC>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RIC")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LongDescription.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLongDescription" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LongDescription>
	</cffunction>
	 
	<cffunction name="setLongDescription" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LongDescription" required="Yes" type="String">
		
		<cfif LongDescription NEQ "NULL">	
			
			<cfif arguments.LongDescription EQ "@@" OR arguments.LongDescription EQ "">
				
				<cfset arguments.LongDescription = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LongDescription)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LongDescription</strong> (#LongDescription#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LongDescription) GT 4000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LongDescription</strong> cannot be greater than 4000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LongDescription = arguments.LongDescription>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LongDescription")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ShortDescription.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getShortDescription" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ShortDescription>
	</cffunction>
	 
	<cffunction name="setShortDescription" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ShortDescription" required="Yes" type="String">
		
		<cfif ShortDescription NEQ "NULL">	
			
			<cfif arguments.ShortDescription EQ "@@" OR arguments.ShortDescription EQ "">
				
				<cfset arguments.ShortDescription = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ShortDescription)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ShortDescription</strong> (#ShortDescription#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ShortDescription) GT 2000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ShortDescription</strong> cannot be greater than 2000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ShortDescription = arguments.ShortDescription>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ShortDescription")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PI1.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPI1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PI1>
	</cffunction>
	 
	<cffunction name="setPI1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PI1" required="Yes" type="String">
		
		<cfif PI1 NEQ "NULL">	
			
			<cfif arguments.PI1 EQ "@@" OR arguments.PI1 EQ "">
				
				<cfset arguments.PI1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PI1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PI1</strong> (#PI1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PI1) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PI1</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PI1 = arguments.PI1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PI1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PI2.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPI2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PI2>
	</cffunction>
	 
	<cffunction name="setPI2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PI2" required="Yes" type="String">
		
		<cfif PI2 NEQ "NULL">	
			
			<cfif arguments.PI2 EQ "@@" OR arguments.PI2 EQ "">
				
				<cfset arguments.PI2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PI2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PI2</strong> (#PI2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PI2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PI2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PI2 = arguments.PI2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PI2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PI3.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPI3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PI3>
	</cffunction>
	 
	<cffunction name="setPI3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PI3" required="Yes" type="String">
		
		<cfif PI3 NEQ "NULL">	
			
			<cfif arguments.PI3 EQ "@@" OR arguments.PI3 EQ "">
				
				<cfset arguments.PI3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PI3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PI3</strong> (#PI3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PI3) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PI3</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PI3 = arguments.PI3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PI3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for PI4.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPI4" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PI4>
	</cffunction>
	 
	<cffunction name="setPI4" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PI4" required="Yes" type="String">
		
		<cfif PI4 NEQ "NULL">	
			
			<cfif arguments.PI4 EQ "@@" OR arguments.PI4 EQ "">
				
				<cfset arguments.PI4 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PI4)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PI4</strong> (#PI4#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(PI4) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PI4</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PI4 = arguments.PI4>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PI4")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MPI.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMPI" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MPI>
	</cffunction>
	 
	<cffunction name="setMPI" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MPI" required="Yes" type="String">
		
		<cfif MPI NEQ "NULL">	
			
			<cfif arguments.MPI EQ "@@" OR arguments.MPI EQ "">
				
				<cfset arguments.MPI = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MPI)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MPI</strong> (#MPI#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MPI) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MPI</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MPI = arguments.MPI>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MPI")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CIM1.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCIM1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CIM1>
	</cffunction>
	 
	<cffunction name="setCIM1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CIM1" required="Yes" type="String">
		
		<cfif CIM1 NEQ "NULL">	
			
			<cfif arguments.CIM1 EQ "@@" OR arguments.CIM1 EQ "">
				
				<cfset arguments.CIM1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CIM1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CIM1</strong> (#CIM1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CIM1) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CIM1</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CIM1 = arguments.CIM1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CIM1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CIM2.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCIM2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CIM2>
	</cffunction>
	 
	<cffunction name="setCIM2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CIM2" required="Yes" type="String">
		
		<cfif CIM2 NEQ "NULL">	
			
			<cfif arguments.CIM2 EQ "@@" OR arguments.CIM2 EQ "">
				
				<cfset arguments.CIM2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CIM2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CIM2</strong> (#CIM2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CIM2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CIM2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CIM2 = arguments.CIM2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CIM2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CIM3.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCIM3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CIM3>
	</cffunction>
	 
	<cffunction name="setCIM3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CIM3" required="Yes" type="String">
		
		<cfif CIM3 NEQ "NULL">	
			
			<cfif arguments.CIM3 EQ "@@" OR arguments.CIM3 EQ "">
				
				<cfset arguments.CIM3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CIM3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CIM3</strong> (#CIM3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CIM3) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CIM3</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CIM3 = arguments.CIM3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CIM3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MCM1.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMCM1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MCM1>
	</cffunction>
	 
	<cffunction name="setMCM1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MCM1" required="Yes" type="String">
		
		<cfif MCM1 NEQ "NULL">	
			
			<cfif arguments.MCM1 EQ "@@" OR arguments.MCM1 EQ "">
				
				<cfset arguments.MCM1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MCM1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MCM1</strong> (#MCM1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MCM1) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MCM1</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MCM1 = arguments.MCM1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MCM1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MCM2.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMCM2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MCM2>
	</cffunction>
	 
	<cffunction name="setMCM2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MCM2" required="Yes" type="String">
		
		<cfif MCM2 NEQ "NULL">	
			
			<cfif arguments.MCM2 EQ "@@" OR arguments.MCM2 EQ "">
				
				<cfset arguments.MCM2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MCM2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MCM2</strong> (#MCM2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MCM2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MCM2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MCM2 = arguments.MCM2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MCM2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MCM3.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMCM3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MCM3>
	</cffunction>
	 
	<cffunction name="setMCM3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MCM3" required="Yes" type="String">
		
		<cfif MCM3 NEQ "NULL">	
			
			<cfif arguments.MCM3 EQ "@@" OR arguments.MCM3 EQ "">
				
				<cfset arguments.MCM3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MCM3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MCM3</strong> (#MCM3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MCM3) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MCM3</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MCM3 = arguments.MCM3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MCM3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Statute.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStatute" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Statute>
	</cffunction>
	 
	<cffunction name="setStatute" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Statute" required="Yes" type="String">
		
		<cfif Statute NEQ "NULL">	
			
			<cfif arguments.Statute EQ "@@" OR arguments.Statute EQ "">
				
				<cfset arguments.Statute = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Statute)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Statute</strong> (#Statute#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Statute) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Statute</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Statute = arguments.Statute>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Statute")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert1.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert1>
	</cffunction>
	 
	<cffunction name="setLabCert1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert1" required="Yes" type="String">
		
		<cfif LabCert1 NEQ "NULL">	
			
			<cfif arguments.LabCert1 EQ "@@" OR arguments.LabCert1 EQ "">
				
				<cfset arguments.LabCert1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert1</strong> (#LabCert1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert1) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert1</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert1 = arguments.LabCert1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert2.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert2>
	</cffunction>
	 
	<cffunction name="setLabCert2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert2" required="Yes" type="String">
		
		<cfif LabCert2 NEQ "NULL">	
			
			<cfif arguments.LabCert2 EQ "@@" OR arguments.LabCert2 EQ "">
				
				<cfset arguments.LabCert2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert2</strong> (#LabCert2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert2 = arguments.LabCert2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert3.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert3>
	</cffunction>
	 
	<cffunction name="setLabCert3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert3" required="Yes" type="String">
		
		<cfif LabCert3 NEQ "NULL">	
			
			<cfif arguments.LabCert3 EQ "@@" OR arguments.LabCert3 EQ "">
				
				<cfset arguments.LabCert3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert3</strong> (#LabCert3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert3) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert3</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert3 = arguments.LabCert3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert4.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert4" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert4>
	</cffunction>
	 
	<cffunction name="setLabCert4" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert4" required="Yes" type="String">
		
		<cfif LabCert4 NEQ "NULL">	
			
			<cfif arguments.LabCert4 EQ "@@" OR arguments.LabCert4 EQ "">
				
				<cfset arguments.LabCert4 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert4)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert4</strong> (#LabCert4#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert4) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert4</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert4 = arguments.LabCert4>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert4")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert5.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert5" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert5>
	</cffunction>
	 
	<cffunction name="setLabCert5" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert5" required="Yes" type="String">
		
		<cfif LabCert5 NEQ "NULL">	
			
			<cfif arguments.LabCert5 EQ "@@" OR arguments.LabCert5 EQ "">
				
				<cfset arguments.LabCert5 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert5)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert5</strong> (#LabCert5#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert5) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert5</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert5 = arguments.LabCert5>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert5")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert6.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert6" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert6>
	</cffunction>
	 
	<cffunction name="setLabCert6" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert6" required="Yes" type="String">
		
		<cfif LabCert6 NEQ "NULL">	
			
			<cfif arguments.LabCert6 EQ "@@" OR arguments.LabCert6 EQ "">
				
				<cfset arguments.LabCert6 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert6)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert6</strong> (#LabCert6#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert6) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert6</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert6 = arguments.LabCert6>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert6")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert7.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert7" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert7>
	</cffunction>
	 
	<cffunction name="setLabCert7" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert7" required="Yes" type="String">
		
		<cfif LabCert7 NEQ "NULL">	
			
			<cfif arguments.LabCert7 EQ "@@" OR arguments.LabCert7 EQ "">
				
				<cfset arguments.LabCert7 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert7)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert7</strong> (#LabCert7#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert7) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert7</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert7 = arguments.LabCert7>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert7")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabCert8.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabCert8" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabCert8>
	</cffunction>
	 
	<cffunction name="setLabCert8" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabCert8" required="Yes" type="String">
		
		<cfif LabCert8 NEQ "NULL">	
			
			<cfif arguments.LabCert8 EQ "@@" OR arguments.LabCert8 EQ "">
				
				<cfset arguments.LabCert8 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabCert8)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabCert8</strong> (#LabCert8#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabCert8) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabCert8</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LabCert8 = arguments.LabCert8>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabCert8")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for XRef1.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getXRef1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.XRef1>
	</cffunction>
	 
	<cffunction name="setXRef1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="XRef1" required="Yes" type="String">
		
		<cfif XRef1 NEQ "NULL">	
			
			<cfif arguments.XRef1 EQ "@@" OR arguments.XRef1 EQ "">
				
				<cfset arguments.XRef1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(XRef1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>XRef1</strong> (#XRef1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(XRef1) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>XRef1</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.XRef1 = arguments.XRef1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "XRef1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for XRef2.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getXRef2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.XRef2>
	</cffunction>
	 
	<cffunction name="setXRef2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="XRef2" required="Yes" type="String">
		
		<cfif XRef2 NEQ "NULL">	
			
			<cfif arguments.XRef2 EQ "@@" OR arguments.XRef2 EQ "">
				
				<cfset arguments.XRef2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(XRef2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>XRef2</strong> (#XRef2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(XRef2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>XRef2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.XRef2 = arguments.XRef2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "XRef2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for XRef3.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getXRef3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.XRef3>
	</cffunction>
	 
	<cffunction name="setXRef3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="XRef3" required="Yes" type="String">
		
		<cfif XRef3 NEQ "NULL">	
			
			<cfif arguments.XRef3 EQ "@@" OR arguments.XRef3 EQ "">
				
				<cfset arguments.XRef3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(XRef3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>XRef3</strong> (#XRef3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(XRef3) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>XRef3</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.XRef3 = arguments.XRef3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "XRef3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for XRef4.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getXRef4" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.XRef4>
	</cffunction>
	 
	<cffunction name="setXRef4" access="public" returntype="boolean" output="No">
 		
		<cfargument name="XRef4" required="Yes" type="String">
		
		<cfif XRef4 NEQ "NULL">	
			
			<cfif arguments.XRef4 EQ "@@" OR arguments.XRef4 EQ "">
				
				<cfset arguments.XRef4 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(XRef4)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>XRef4</strong> (#XRef4#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(XRef4) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>XRef4</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.XRef4 = arguments.XRef4>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "XRef4")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for XRef5.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getXRef5" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.XRef5>
	</cffunction>
	 
	<cffunction name="setXRef5" access="public" returntype="boolean" output="No">
 		
		<cfargument name="XRef5" required="Yes" type="String">
		
		<cfif XRef5 NEQ "NULL">	
			
			<cfif arguments.XRef5 EQ "@@" OR arguments.XRef5 EQ "">
				
				<cfset arguments.XRef5 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(XRef5)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>XRef5</strong> (#XRef5#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(XRef5) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>XRef5</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.XRef5 = arguments.XRef5>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "XRef5")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Coverage.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCoverage" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Coverage>
	</cffunction>
	 
	<cffunction name="setCoverage" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Coverage" required="Yes" type="String">
		
		<cfif Coverage NEQ "NULL">	
			
			<cfif arguments.Coverage EQ "@@" OR arguments.Coverage EQ "">
				
				<cfset arguments.Coverage = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Coverage)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Coverage</strong> (#Coverage#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Coverage) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Coverage</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Coverage = arguments.Coverage>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Coverage")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ASCPayGrp.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getASCPayGrp" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ASCPayGrp>
	</cffunction>
	 
	<cffunction name="setASCPayGrp" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ASCPayGrp" required="Yes" type="String">
		
		<cfif ASCPayGrp NEQ "NULL">	
			
			<cfif arguments.ASCPayGrp EQ "@@" OR arguments.ASCPayGrp EQ "">
				
				<cfset arguments.ASCPayGrp = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ASCPayGrp)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ASCPayGrp</strong> (#ASCPayGrp#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ASCPayGrp) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ASCPayGrp</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ASCPayGrp = arguments.ASCPayGrp>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ASCPayGrp")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ASCPayGrpEffDate.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getASCPayGrpEffDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ASCPayGrpEffDate>
	</cffunction>
	 
	<cffunction name="setASCPayGrpEffDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ASCPayGrpEffDate" required="Yes" type="String">
		
		<cfif ASCPayGrpEffDate NEQ "NULL" AND ASCPayGrpEffDate NEQ "NOW">	
			
			<cfif arguments.ASCPayGrpEffDate EQ "@@" OR arguments.ASCPayGrpEffDate EQ "">
				
				<cfset arguments.ASCPayGrpEffDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(ASCPayGrpEffDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ASCPayGrpEffDate</strong> (#ASCPayGrpEffDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ASCPayGrpEffDate = arguments.ASCPayGrpEffDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ASCPayGrpEffDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MOGPayGrp.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMOGPayGrp" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MOGPayGrp>
	</cffunction>
	 
	<cffunction name="setMOGPayGrp" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MOGPayGrp" required="Yes" type="String">
		
		<cfif MOGPayGrp NEQ "NULL">	
			
			<cfif arguments.MOGPayGrp EQ "@@" OR arguments.MOGPayGrp EQ "">
				
				<cfset arguments.MOGPayGrp = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MOGPayGrp)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MOGPayGrp</strong> (#MOGPayGrp#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MOGPayGrp) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MOGPayGrp</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MOGPayGrp = arguments.MOGPayGrp>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MOGPayGrp")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MOGPayInd.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMOGPayInd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MOGPayInd>
	</cffunction>
	 
	<cffunction name="setMOGPayInd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MOGPayInd" required="Yes" type="String">
		
		<cfif MOGPayInd NEQ "NULL">	
			
			<cfif arguments.MOGPayInd EQ "@@" OR arguments.MOGPayInd EQ "">
				
				<cfset arguments.MOGPayInd = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(MOGPayInd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MOGPayInd</strong> (#MOGPayInd#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(MOGPayInd) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>MOGPayInd</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MOGPayInd = arguments.MOGPayInd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MOGPayInd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for MOGEffDate.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getMOGEffDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.MOGEffDate>
	</cffunction>
	 
	<cffunction name="setMOGEffDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="MOGEffDate" required="Yes" type="String">
		
		<cfif MOGEffDate NEQ "NULL" AND MOGEffDate NEQ "NOW">	
			
			<cfif arguments.MOGEffDate EQ "@@" OR arguments.MOGEffDate EQ "">
				
				<cfset arguments.MOGEffDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(MOGEffDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>MOGEffDate</strong> (#MOGEffDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.MOGEffDate = arguments.MOGEffDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "MOGEffDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ProcNote.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getProcNote" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ProcNote>
	</cffunction>
	 
	<cffunction name="setProcNote" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ProcNote" required="Yes" type="String">
		
		<cfif ProcNote NEQ "NULL">	
			
			<cfif arguments.ProcNote EQ "@@" OR arguments.ProcNote EQ "">
				
				<cfset arguments.ProcNote = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ProcNote)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ProcNote</strong> (#ProcNote#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ProcNote) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ProcNote</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ProcNote = arguments.ProcNote>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ProcNote")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for BETOS.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getBETOS" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.BETOS>
	</cffunction>
	 
	<cffunction name="setBETOS" access="public" returntype="boolean" output="No">
 		
		<cfargument name="BETOS" required="Yes" type="String">
		
		<cfif BETOS NEQ "NULL">	
			
			<cfif arguments.BETOS EQ "@@" OR arguments.BETOS EQ "">
				
				<cfset arguments.BETOS = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(BETOS)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>BETOS</strong> (#BETOS#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(BETOS) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>BETOS</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.BETOS = arguments.BETOS>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "BETOS")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for FILLER.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFILLER" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FILLER>
	</cffunction>
	 
	<cffunction name="setFILLER" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FILLER" required="Yes" type="String">
		
		<cfif FILLER NEQ "NULL">	
			
			<cfif arguments.FILLER EQ "@@" OR arguments.FILLER EQ "">
				
				<cfset arguments.FILLER = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(FILLER)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FILLER</strong> (#FILLER#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(FILLER) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FILLER</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.FILLER = arguments.FILLER>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FILLER")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TOS1.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTOS1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TOS1>
	</cffunction>
	 
	<cffunction name="setTOS1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TOS1" required="Yes" type="String">
		
		<cfif TOS1 NEQ "NULL">	
			
			<cfif arguments.TOS1 EQ "@@" OR arguments.TOS1 EQ "">
				
				<cfset arguments.TOS1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TOS1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TOS1</strong> (#TOS1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TOS1) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TOS1</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TOS1 = arguments.TOS1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TOS1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TOS2.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTOS2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TOS2>
	</cffunction>
	 
	<cffunction name="setTOS2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TOS2" required="Yes" type="String">
		
		<cfif TOS2 NEQ "NULL">	
			
			<cfif arguments.TOS2 EQ "@@" OR arguments.TOS2 EQ "">
				
				<cfset arguments.TOS2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TOS2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TOS2</strong> (#TOS2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TOS2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TOS2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TOS2 = arguments.TOS2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TOS2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TOS3.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTOS3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TOS3>
	</cffunction>
	 
	<cffunction name="setTOS3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TOS3" required="Yes" type="String">
		
		<cfif TOS3 NEQ "NULL">	
			
			<cfif arguments.TOS3 EQ "@@" OR arguments.TOS3 EQ "">
				
				<cfset arguments.TOS3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TOS3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TOS3</strong> (#TOS3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TOS3) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TOS3</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TOS3 = arguments.TOS3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TOS3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TOS4.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTOS4" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TOS4>
	</cffunction>
	 
	<cffunction name="setTOS4" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TOS4" required="Yes" type="String">
		
		<cfif TOS4 NEQ "NULL">	
			
			<cfif arguments.TOS4 EQ "@@" OR arguments.TOS4 EQ "">
				
				<cfset arguments.TOS4 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TOS4)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TOS4</strong> (#TOS4#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TOS4) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TOS4</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TOS4 = arguments.TOS4>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TOS4")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TOS5.                                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTOS5" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TOS5>
	</cffunction>
	 
	<cffunction name="setTOS5" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TOS5" required="Yes" type="String">
		
		<cfif TOS5 NEQ "NULL">	
			
			<cfif arguments.TOS5 EQ "@@" OR arguments.TOS5 EQ "">
				
				<cfset arguments.TOS5 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TOS5)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TOS5</strong> (#TOS5#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(TOS5) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TOS5</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TOS5 = arguments.TOS5>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TOS5")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AnestBaseUnits.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAnestBaseUnits" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AnestBaseUnits>
	</cffunction>
	 
	<cffunction name="setAnestBaseUnits" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AnestBaseUnits" required="Yes" type="String">
		
		<cfif AnestBaseUnits NEQ "NULL">	
			
			<cfif arguments.AnestBaseUnits EQ "@@" OR arguments.AnestBaseUnits EQ "">
				
				<cfset arguments.AnestBaseUnits = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AnestBaseUnits)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AnestBaseUnits</strong> (#AnestBaseUnits#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(AnestBaseUnits) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AnestBaseUnits</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AnestBaseUnits = arguments.AnestBaseUnits>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AnestBaseUnits")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CodeAddDate.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCodeAddDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CodeAddDate>
	</cffunction>
	 
	<cffunction name="setCodeAddDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CodeAddDate" required="Yes" type="String">
		
		<cfif CodeAddDate NEQ "NULL" AND CodeAddDate NEQ "NOW">	
			
			<cfif arguments.CodeAddDate EQ "@@" OR arguments.CodeAddDate EQ "">
				
				<cfset arguments.CodeAddDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(CodeAddDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CodeAddDate</strong> (#CodeAddDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CodeAddDate = arguments.CodeAddDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CodeAddDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ActionEffDate.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActionEffDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ActionEffDate>
	</cffunction>
	 
	<cffunction name="setActionEffDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ActionEffDate" required="Yes" type="String">
		
		<cfif ActionEffDate NEQ "NULL" AND ActionEffDate NEQ "NOW">	
			
			<cfif arguments.ActionEffDate EQ "@@" OR arguments.ActionEffDate EQ "">
				
				<cfset arguments.ActionEffDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(ActionEffDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ActionEffDate</strong> (#ActionEffDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ActionEffDate = arguments.ActionEffDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ActionEffDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for TermDate.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTermDate" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TermDate>
	</cffunction>
	 
	<cffunction name="setTermDate" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TermDate" required="Yes" type="String">
		
		<cfif TermDate NEQ "NULL" AND TermDate NEQ "NOW">	
			
			<cfif arguments.TermDate EQ "@@" OR arguments.TermDate EQ "">
				
				<cfset arguments.TermDate = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(TermDate)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TermDate</strong> (#TermDate#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TermDate = arguments.TermDate>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TermDate")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ActionCode.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActionCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ActionCode>
	</cffunction>
	 
	<cffunction name="setActionCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ActionCode" required="Yes" type="String">
		
		<cfif ActionCode NEQ "NULL">	
			
			<cfif arguments.ActionCode EQ "@@" OR arguments.ActionCode EQ "">
				
				<cfset arguments.ActionCode = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ActionCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ActionCode</strong> (#ActionCode#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ActionCode) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ActionCode</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ActionCode = arguments.ActionCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ActionCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Filler1.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFiller1" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Filler1>
	</cffunction>
	 
	<cffunction name="setFiller1" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Filler1" required="Yes" type="String">
		
		<cfif Filler1 NEQ "NULL">	
			
			<cfif arguments.Filler1 EQ "@@" OR arguments.Filler1 EQ "">
				
				<cfset arguments.Filler1 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Filler1)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Filler1</strong> (#Filler1#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Filler1) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Filler1</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Filler1 = arguments.Filler1>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Filler1")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="HCPC" required="No" type="String" default="">
		<cfargument name="SeqNum" required="No" type="String" default="">
		<cfargument name="RIC" required="No" type="String" default="">
		<cfargument name="LongDescription" required="No" type="String" default="">
		<cfargument name="ShortDescription" required="No" type="String" default="">
		<cfargument name="PI1" required="No" type="String" default="">
		<cfargument name="PI2" required="No" type="String" default="">
		<cfargument name="PI3" required="No" type="String" default="">
		<cfargument name="PI4" required="No" type="String" default="">
		<cfargument name="MPI" required="No" type="String" default="">
		<cfargument name="CIM1" required="No" type="String" default="">
		<cfargument name="CIM2" required="No" type="String" default="">
		<cfargument name="CIM3" required="No" type="String" default="">
		<cfargument name="MCM1" required="No" type="String" default="">
		<cfargument name="MCM2" required="No" type="String" default="">
		<cfargument name="MCM3" required="No" type="String" default="">
		<cfargument name="Statute" required="No" type="String" default="">
		<cfargument name="LabCert1" required="No" type="String" default="">
		<cfargument name="LabCert2" required="No" type="String" default="">
		<cfargument name="LabCert3" required="No" type="String" default="">
		<cfargument name="LabCert4" required="No" type="String" default="">
		<cfargument name="LabCert5" required="No" type="String" default="">
		<cfargument name="LabCert6" required="No" type="String" default="">
		<cfargument name="LabCert7" required="No" type="String" default="">
		<cfargument name="LabCert8" required="No" type="String" default="">
		<cfargument name="XRef1" required="No" type="String" default="">
		<cfargument name="XRef2" required="No" type="String" default="">
		<cfargument name="XRef3" required="No" type="String" default="">
		<cfargument name="XRef4" required="No" type="String" default="">
		<cfargument name="XRef5" required="No" type="String" default="">
		<cfargument name="Coverage" required="No" type="String" default="">
		<cfargument name="ASCPayGrp" required="No" type="String" default="">
		<cfargument name="ASCPayGrpEffDate" required="No" type="String" default="">
		<cfargument name="MOGPayGrp" required="No" type="String" default="">
		<cfargument name="MOGPayInd" required="No" type="String" default="">
		<cfargument name="MOGEffDate" required="No" type="String" default="">
		<cfargument name="ProcNote" required="No" type="String" default="">
		<cfargument name="BETOS" required="No" type="String" default="">
		<cfargument name="FILLER" required="No" type="String" default="">
		<cfargument name="TOS1" required="No" type="String" default="">
		<cfargument name="TOS2" required="No" type="String" default="">
		<cfargument name="TOS3" required="No" type="String" default="">
		<cfargument name="TOS4" required="No" type="String" default="">
		<cfargument name="TOS5" required="No" type="String" default="">
		<cfargument name="AnestBaseUnits" required="No" type="String" default="">
		<cfargument name="CodeAddDate" required="No" type="String" default="">
		<cfargument name="ActionEffDate" required="No" type="String" default="">
		<cfargument name="TermDate" required="No" type="String" default="">
		<cfargument name="ActionCode" required="No" type="String" default="">
		<cfargument name="Filler1" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.HCPC = arguments.HCPC>
		<cfset variables.instance.SeqNum = arguments.SeqNum>
		<cfset variables.instance.RIC = arguments.RIC>
		<cfset variables.instance.LongDescription = arguments.LongDescription>
		<cfset variables.instance.ShortDescription = arguments.ShortDescription>
		<cfset variables.instance.PI1 = arguments.PI1>
		<cfset variables.instance.PI2 = arguments.PI2>
		<cfset variables.instance.PI3 = arguments.PI3>
		<cfset variables.instance.PI4 = arguments.PI4>
		<cfset variables.instance.MPI = arguments.MPI>
		<cfset variables.instance.CIM1 = arguments.CIM1>
		<cfset variables.instance.CIM2 = arguments.CIM2>
		<cfset variables.instance.CIM3 = arguments.CIM3>
		<cfset variables.instance.MCM1 = arguments.MCM1>
		<cfset variables.instance.MCM2 = arguments.MCM2>
		<cfset variables.instance.MCM3 = arguments.MCM3>
		<cfset variables.instance.Statute = arguments.Statute>
		<cfset variables.instance.LabCert1 = arguments.LabCert1>
		<cfset variables.instance.LabCert2 = arguments.LabCert2>
		<cfset variables.instance.LabCert3 = arguments.LabCert3>
		<cfset variables.instance.LabCert4 = arguments.LabCert4>
		<cfset variables.instance.LabCert5 = arguments.LabCert5>
		<cfset variables.instance.LabCert6 = arguments.LabCert6>
		<cfset variables.instance.LabCert7 = arguments.LabCert7>
		<cfset variables.instance.LabCert8 = arguments.LabCert8>
		<cfset variables.instance.XRef1 = arguments.XRef1>
		<cfset variables.instance.XRef2 = arguments.XRef2>
		<cfset variables.instance.XRef3 = arguments.XRef3>
		<cfset variables.instance.XRef4 = arguments.XRef4>
		<cfset variables.instance.XRef5 = arguments.XRef5>
		<cfset variables.instance.Coverage = arguments.Coverage>
		<cfset variables.instance.ASCPayGrp = arguments.ASCPayGrp>
		<cfset variables.instance.ASCPayGrpEffDate = arguments.ASCPayGrpEffDate>
		<cfset variables.instance.MOGPayGrp = arguments.MOGPayGrp>
		<cfset variables.instance.MOGPayInd = arguments.MOGPayInd>
		<cfset variables.instance.MOGEffDate = arguments.MOGEffDate>
		<cfset variables.instance.ProcNote = arguments.ProcNote>
		<cfset variables.instance.BETOS = arguments.BETOS>
		<cfset variables.instance.FILLER = arguments.FILLER>
		<cfset variables.instance.TOS1 = arguments.TOS1>
		<cfset variables.instance.TOS2 = arguments.TOS2>
		<cfset variables.instance.TOS3 = arguments.TOS3>
		<cfset variables.instance.TOS4 = arguments.TOS4>
		<cfset variables.instance.TOS5 = arguments.TOS5>
		<cfset variables.instance.AnestBaseUnits = arguments.AnestBaseUnits>
		<cfset variables.instance.CodeAddDate = arguments.CodeAddDate>
		<cfset variables.instance.ActionEffDate = arguments.ActionEffDate>
		<cfset variables.instance.TermDate = arguments.TermDate>
		<cfset variables.instance.ActionCode = arguments.ActionCode>
		<cfset variables.instance.Filler1 = arguments.Filler1>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="EOB_MEDICARE_PROCEDURECodeIO" output="No">
		
		<cfargument name="RecordID" required="yes" type="numeric">		
		<cfset var qGetEOB_MEDICARE_PROCEDURECode = "">
		
		<cfset preInit(RecordID)>
	
		<cfquery name="qGetEOB_MEDICARE_PROCEDURECode" datasource="pa_master">
	  		SELECT RecordID,HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode,DateCreated,DateModified
			FROM EOB_MEDICARE_PROCEDURECode  
			WHERE RecordID = #trim(arguments.RecordID)# 
		</cfquery>
		
		<cfif qGetEOB_MEDICARE_PROCEDURECode.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetEOB_MEDICARE_PROCEDURECode.RecordID EQ "" OR qGetEOB_MEDICARE_PROCEDURECode.RecordID EQ "NULL") 
				variables.instance.RecordID = "NULL"; 
			ELSE 
				variables.instance.RecordID = qGetEOB_MEDICARE_PROCEDURECode.RecordID;
							
				variables.instance.HCPC = qGetEOB_MEDICARE_PROCEDURECode.HCPC;
							
				variables.instance.SeqNum = qGetEOB_MEDICARE_PROCEDURECode.SeqNum;
							
				variables.instance.RIC = qGetEOB_MEDICARE_PROCEDURECode.RIC;
							
				variables.instance.LongDescription = qGetEOB_MEDICARE_PROCEDURECode.LongDescription;
							
				variables.instance.ShortDescription = qGetEOB_MEDICARE_PROCEDURECode.ShortDescription;
							
				variables.instance.PI1 = qGetEOB_MEDICARE_PROCEDURECode.PI1;
							
				variables.instance.PI2 = qGetEOB_MEDICARE_PROCEDURECode.PI2;
							
				variables.instance.PI3 = qGetEOB_MEDICARE_PROCEDURECode.PI3;
							
				variables.instance.PI4 = qGetEOB_MEDICARE_PROCEDURECode.PI4;
							
				variables.instance.MPI = qGetEOB_MEDICARE_PROCEDURECode.MPI;
							
				variables.instance.CIM1 = qGetEOB_MEDICARE_PROCEDURECode.CIM1;
							
				variables.instance.CIM2 = qGetEOB_MEDICARE_PROCEDURECode.CIM2;
							
				variables.instance.CIM3 = qGetEOB_MEDICARE_PROCEDURECode.CIM3;
							
				variables.instance.MCM1 = qGetEOB_MEDICARE_PROCEDURECode.MCM1;
							
				variables.instance.MCM2 = qGetEOB_MEDICARE_PROCEDURECode.MCM2;
							
				variables.instance.MCM3 = qGetEOB_MEDICARE_PROCEDURECode.MCM3;
							
				variables.instance.Statute = qGetEOB_MEDICARE_PROCEDURECode.Statute;
							
				variables.instance.LabCert1 = qGetEOB_MEDICARE_PROCEDURECode.LabCert1;
							
				variables.instance.LabCert2 = qGetEOB_MEDICARE_PROCEDURECode.LabCert2;
							
				variables.instance.LabCert3 = qGetEOB_MEDICARE_PROCEDURECode.LabCert3;
							
				variables.instance.LabCert4 = qGetEOB_MEDICARE_PROCEDURECode.LabCert4;
							
				variables.instance.LabCert5 = qGetEOB_MEDICARE_PROCEDURECode.LabCert5;
							
				variables.instance.LabCert6 = qGetEOB_MEDICARE_PROCEDURECode.LabCert6;
							
				variables.instance.LabCert7 = qGetEOB_MEDICARE_PROCEDURECode.LabCert7;
							
				variables.instance.LabCert8 = qGetEOB_MEDICARE_PROCEDURECode.LabCert8;
							
				variables.instance.XRef1 = qGetEOB_MEDICARE_PROCEDURECode.XRef1;
							
				variables.instance.XRef2 = qGetEOB_MEDICARE_PROCEDURECode.XRef2;
							
				variables.instance.XRef3 = qGetEOB_MEDICARE_PROCEDURECode.XRef3;
							
				variables.instance.XRef4 = qGetEOB_MEDICARE_PROCEDURECode.XRef4;
							
				variables.instance.XRef5 = qGetEOB_MEDICARE_PROCEDURECode.XRef5;
							
				variables.instance.Coverage = qGetEOB_MEDICARE_PROCEDURECode.Coverage;
							
				variables.instance.ASCPayGrp = qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrp;
							
				variables.instance.ASCPayGrpEffDate = qGetEOB_MEDICARE_PROCEDURECode.ASCPayGrpEffDate;
							
				variables.instance.MOGPayGrp = qGetEOB_MEDICARE_PROCEDURECode.MOGPayGrp;
							
				variables.instance.MOGPayInd = qGetEOB_MEDICARE_PROCEDURECode.MOGPayInd;
							
				variables.instance.MOGEffDate = qGetEOB_MEDICARE_PROCEDURECode.MOGEffDate;
							
				variables.instance.ProcNote = qGetEOB_MEDICARE_PROCEDURECode.ProcNote;
							
				variables.instance.BETOS = qGetEOB_MEDICARE_PROCEDURECode.BETOS;
							
				variables.instance.FILLER = qGetEOB_MEDICARE_PROCEDURECode.FILLER;
							
				variables.instance.TOS1 = qGetEOB_MEDICARE_PROCEDURECode.TOS1;
							
				variables.instance.TOS2 = qGetEOB_MEDICARE_PROCEDURECode.TOS2;
							
				variables.instance.TOS3 = qGetEOB_MEDICARE_PROCEDURECode.TOS3;
							
				variables.instance.TOS4 = qGetEOB_MEDICARE_PROCEDURECode.TOS4;
							
				variables.instance.TOS5 = qGetEOB_MEDICARE_PROCEDURECode.TOS5;
							
				variables.instance.AnestBaseUnits = qGetEOB_MEDICARE_PROCEDURECode.AnestBaseUnits;
							
				variables.instance.CodeAddDate = qGetEOB_MEDICARE_PROCEDURECode.CodeAddDate;
							
				variables.instance.ActionEffDate = qGetEOB_MEDICARE_PROCEDURECode.ActionEffDate;
							
				variables.instance.TermDate = qGetEOB_MEDICARE_PROCEDURECode.TermDate;
							
				variables.instance.ActionCode = qGetEOB_MEDICARE_PROCEDURECode.ActionCode;
							
				variables.instance.Filler1 = qGetEOB_MEDICARE_PROCEDURECode.Filler1;
							
				variables.instance.Active = qGetEOB_MEDICARE_PROCEDURECode.Active;
				
			IF(qGetEOB_MEDICARE_PROCEDURECode.InactiveCode EQ "" OR qGetEOB_MEDICARE_PROCEDURECode.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetEOB_MEDICARE_PROCEDURECode.InactiveCode;
							
				variables.instance.DateCreated = qGetEOB_MEDICARE_PROCEDURECode.DateCreated;
							
				variables.instance.DateModified = qGetEOB_MEDICARE_PROCEDURECode.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(RecordID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitEOB_MEDICARE_PROCEDURECode = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.RecordID) AND variables.instance.RecordID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitEOB_MEDICARE_PROCEDURECode" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitEOB_MEDICARE_PROCEDURECode" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.RecordID = qInsertCommitEOB_MEDICARE_PROCEDURECode.RecordID>
				
				<cfreturn qInsertCommitEOB_MEDICARE_PROCEDURECode.RecordID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "RecordID,HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,MOGPayGrp,MOGPayInd,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,ActionCode,Filler1,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "ASCPayGrpEffDate,MOGEffDate,CodeAddDate,ActionEffDate,TermDate,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE EOB_MEDICARE_PROCEDURECode  SET #columnsToUpdate# WHERE RecordID = #trim(variables.instance.RecordID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,MOGPayGrp,MOGPayInd,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,ActionCode,Filler1,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "ASCPayGrpEffDate,MOGEffDate,CodeAddDate,ActionEffDate,TermDate,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO EOB_MEDICARE_PROCEDURECode  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS RecordID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEOB_MEDICARE_PROCEDURECodeQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getEOB_MEDICARE_PROCEDURECodeQuery">						
		<cfargument name="Fields" required="No" type="String" default="RecordID,HCPC,SeqNum,RIC,LongDescription,ShortDescription,PI1,PI2,PI3,PI4,MPI,CIM1,CIM2,CIM3,MCM1,MCM2,MCM3,Statute,LabCert1,LabCert2,LabCert3,LabCert4,LabCert5,LabCert6,LabCert7,LabCert8,XRef1,XRef2,XRef3,XRef4,XRef5,Coverage,ASCPayGrp,ASCPayGrpEffDate,MOGPayGrp,MOGPayInd,MOGEffDate,ProcNote,BETOS,FILLER,TOS1,TOS2,TOS3,TOS4,TOS5,AnestBaseUnits,CodeAddDate,ActionEffDate,TermDate,ActionCode,Filler1,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="RecordID" required="No" type="String" default="">
		<cfargument name="RecordID_IN" required="No" type="String" default="">
		<cfargument name="RecordID_LIKE" required="No" type="String" default="">
		<cfargument name="HCPC" required="No" type="String" default="">
		<cfargument name="HCPC_IN" required="No" type="String" default="">
		<cfargument name="HCPC_LIKE" required="No" type="String" default="">
		<cfargument name="SeqNum" required="No" type="String" default="">
		<cfargument name="SeqNum_IN" required="No" type="String" default="">
		<cfargument name="SeqNum_LIKE" required="No" type="String" default="">
		<cfargument name="RIC" required="No" type="String" default="">
		<cfargument name="RIC_IN" required="No" type="String" default="">
		<cfargument name="RIC_LIKE" required="No" type="String" default="">
		<cfargument name="LongDescription" required="No" type="String" default="">
		<cfargument name="LongDescription_IN" required="No" type="String" default="">
		<cfargument name="LongDescription_LIKE" required="No" type="String" default="">
		<cfargument name="ShortDescription" required="No" type="String" default="">
		<cfargument name="ShortDescription_IN" required="No" type="String" default="">
		<cfargument name="ShortDescription_LIKE" required="No" type="String" default="">
		<cfargument name="PI1" required="No" type="String" default="">
		<cfargument name="PI1_IN" required="No" type="String" default="">
		<cfargument name="PI1_LIKE" required="No" type="String" default="">
		<cfargument name="PI2" required="No" type="String" default="">
		<cfargument name="PI2_IN" required="No" type="String" default="">
		<cfargument name="PI2_LIKE" required="No" type="String" default="">
		<cfargument name="PI3" required="No" type="String" default="">
		<cfargument name="PI3_IN" required="No" type="String" default="">
		<cfargument name="PI3_LIKE" required="No" type="String" default="">
		<cfargument name="PI4" required="No" type="String" default="">
		<cfargument name="PI4_IN" required="No" type="String" default="">
		<cfargument name="PI4_LIKE" required="No" type="String" default="">
		<cfargument name="MPI" required="No" type="String" default="">
		<cfargument name="MPI_IN" required="No" type="String" default="">
		<cfargument name="MPI_LIKE" required="No" type="String" default="">
		<cfargument name="CIM1" required="No" type="String" default="">
		<cfargument name="CIM1_IN" required="No" type="String" default="">
		<cfargument name="CIM1_LIKE" required="No" type="String" default="">
		<cfargument name="CIM2" required="No" type="String" default="">
		<cfargument name="CIM2_IN" required="No" type="String" default="">
		<cfargument name="CIM2_LIKE" required="No" type="String" default="">
		<cfargument name="CIM3" required="No" type="String" default="">
		<cfargument name="CIM3_IN" required="No" type="String" default="">
		<cfargument name="CIM3_LIKE" required="No" type="String" default="">
		<cfargument name="MCM1" required="No" type="String" default="">
		<cfargument name="MCM1_IN" required="No" type="String" default="">
		<cfargument name="MCM1_LIKE" required="No" type="String" default="">
		<cfargument name="MCM2" required="No" type="String" default="">
		<cfargument name="MCM2_IN" required="No" type="String" default="">
		<cfargument name="MCM2_LIKE" required="No" type="String" default="">
		<cfargument name="MCM3" required="No" type="String" default="">
		<cfargument name="MCM3_IN" required="No" type="String" default="">
		<cfargument name="MCM3_LIKE" required="No" type="String" default="">
		<cfargument name="Statute" required="No" type="String" default="">
		<cfargument name="Statute_IN" required="No" type="String" default="">
		<cfargument name="Statute_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert1" required="No" type="String" default="">
		<cfargument name="LabCert1_IN" required="No" type="String" default="">
		<cfargument name="LabCert1_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert2" required="No" type="String" default="">
		<cfargument name="LabCert2_IN" required="No" type="String" default="">
		<cfargument name="LabCert2_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert3" required="No" type="String" default="">
		<cfargument name="LabCert3_IN" required="No" type="String" default="">
		<cfargument name="LabCert3_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert4" required="No" type="String" default="">
		<cfargument name="LabCert4_IN" required="No" type="String" default="">
		<cfargument name="LabCert4_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert5" required="No" type="String" default="">
		<cfargument name="LabCert5_IN" required="No" type="String" default="">
		<cfargument name="LabCert5_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert6" required="No" type="String" default="">
		<cfargument name="LabCert6_IN" required="No" type="String" default="">
		<cfargument name="LabCert6_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert7" required="No" type="String" default="">
		<cfargument name="LabCert7_IN" required="No" type="String" default="">
		<cfargument name="LabCert7_LIKE" required="No" type="String" default="">
		<cfargument name="LabCert8" required="No" type="String" default="">
		<cfargument name="LabCert8_IN" required="No" type="String" default="">
		<cfargument name="LabCert8_LIKE" required="No" type="String" default="">
		<cfargument name="XRef1" required="No" type="String" default="">
		<cfargument name="XRef1_IN" required="No" type="String" default="">
		<cfargument name="XRef1_LIKE" required="No" type="String" default="">
		<cfargument name="XRef2" required="No" type="String" default="">
		<cfargument name="XRef2_IN" required="No" type="String" default="">
		<cfargument name="XRef2_LIKE" required="No" type="String" default="">
		<cfargument name="XRef3" required="No" type="String" default="">
		<cfargument name="XRef3_IN" required="No" type="String" default="">
		<cfargument name="XRef3_LIKE" required="No" type="String" default="">
		<cfargument name="XRef4" required="No" type="String" default="">
		<cfargument name="XRef4_IN" required="No" type="String" default="">
		<cfargument name="XRef4_LIKE" required="No" type="String" default="">
		<cfargument name="XRef5" required="No" type="String" default="">
		<cfargument name="XRef5_IN" required="No" type="String" default="">
		<cfargument name="XRef5_LIKE" required="No" type="String" default="">
		<cfargument name="Coverage" required="No" type="String" default="">
		<cfargument name="Coverage_IN" required="No" type="String" default="">
		<cfargument name="Coverage_LIKE" required="No" type="String" default="">
		<cfargument name="ASCPayGrp" required="No" type="String" default="">
		<cfargument name="ASCPayGrp_IN" required="No" type="String" default="">
		<cfargument name="ASCPayGrp_LIKE" required="No" type="String" default="">
		<cfargument name="ASCPayGrpEffDate" required="No" type="String" default="">
		<cfargument name="ASCPayGrpEffDate_IN" required="No" type="String" default="">
		<cfargument name="ASCPayGrpEffDate_LIKE" required="No" type="String" default="">
		<cfargument name="MOGPayGrp" required="No" type="String" default="">
		<cfargument name="MOGPayGrp_IN" required="No" type="String" default="">
		<cfargument name="MOGPayGrp_LIKE" required="No" type="String" default="">
		<cfargument name="MOGPayInd" required="No" type="String" default="">
		<cfargument name="MOGPayInd_IN" required="No" type="String" default="">
		<cfargument name="MOGPayInd_LIKE" required="No" type="String" default="">
		<cfargument name="MOGEffDate" required="No" type="String" default="">
		<cfargument name="MOGEffDate_IN" required="No" type="String" default="">
		<cfargument name="MOGEffDate_LIKE" required="No" type="String" default="">
		<cfargument name="ProcNote" required="No" type="String" default="">
		<cfargument name="ProcNote_IN" required="No" type="String" default="">
		<cfargument name="ProcNote_LIKE" required="No" type="String" default="">
		<cfargument name="BETOS" required="No" type="String" default="">
		<cfargument name="BETOS_IN" required="No" type="String" default="">
		<cfargument name="BETOS_LIKE" required="No" type="String" default="">
		<cfargument name="FILLER" required="No" type="String" default="">
		<cfargument name="FILLER_IN" required="No" type="String" default="">
		<cfargument name="FILLER_LIKE" required="No" type="String" default="">
		<cfargument name="TOS1" required="No" type="String" default="">
		<cfargument name="TOS1_IN" required="No" type="String" default="">
		<cfargument name="TOS1_LIKE" required="No" type="String" default="">
		<cfargument name="TOS2" required="No" type="String" default="">
		<cfargument name="TOS2_IN" required="No" type="String" default="">
		<cfargument name="TOS2_LIKE" required="No" type="String" default="">
		<cfargument name="TOS3" required="No" type="String" default="">
		<cfargument name="TOS3_IN" required="No" type="String" default="">
		<cfargument name="TOS3_LIKE" required="No" type="String" default="">
		<cfargument name="TOS4" required="No" type="String" default="">
		<cfargument name="TOS4_IN" required="No" type="String" default="">
		<cfargument name="TOS4_LIKE" required="No" type="String" default="">
		<cfargument name="TOS5" required="No" type="String" default="">
		<cfargument name="TOS5_IN" required="No" type="String" default="">
		<cfargument name="TOS5_LIKE" required="No" type="String" default="">
		<cfargument name="AnestBaseUnits" required="No" type="String" default="">
		<cfargument name="AnestBaseUnits_IN" required="No" type="String" default="">
		<cfargument name="AnestBaseUnits_LIKE" required="No" type="String" default="">
		<cfargument name="CodeAddDate" required="No" type="String" default="">
		<cfargument name="CodeAddDate_IN" required="No" type="String" default="">
		<cfargument name="CodeAddDate_LIKE" required="No" type="String" default="">
		<cfargument name="ActionEffDate" required="No" type="String" default="">
		<cfargument name="ActionEffDate_IN" required="No" type="String" default="">
		<cfargument name="ActionEffDate_LIKE" required="No" type="String" default="">
		<cfargument name="TermDate" required="No" type="String" default="">
		<cfargument name="TermDate_IN" required="No" type="String" default="">
		<cfargument name="TermDate_LIKE" required="No" type="String" default="">
		<cfargument name="ActionCode" required="No" type="String" default="">
		<cfargument name="ActionCode_IN" required="No" type="String" default="">
		<cfargument name="ActionCode_LIKE" required="No" type="String" default="">
		<cfargument name="Filler1" required="No" type="String" default="">
		<cfargument name="Filler1_IN" required="No" type="String" default="">
		<cfargument name="Filler1_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "RecordID,RecordID_IN,RecordID_LIKE,HCPC,HCPC_IN,HCPC_LIKE,SeqNum,SeqNum_IN,SeqNum_LIKE,RIC,RIC_IN,RIC_LIKE,LongDescription,LongDescription_IN,LongDescription_LIKE,ShortDescription,ShortDescription_IN,ShortDescription_LIKE,PI1,PI1_IN,PI1_LIKE,PI2,PI2_IN,PI2_LIKE,PI3,PI3_IN,PI3_LIKE,PI4,PI4_IN,PI4_LIKE,MPI,MPI_IN,MPI_LIKE,CIM1,CIM1_IN,CIM1_LIKE,CIM2,CIM2_IN,CIM2_LIKE,CIM3,CIM3_IN,CIM3_LIKE,MCM1,MCM1_IN,MCM1_LIKE,MCM2,MCM2_IN,MCM2_LIKE,MCM3,MCM3_IN,MCM3_LIKE,Statute,Statute_IN,Statute_LIKE,LabCert1,LabCert1_IN,LabCert1_LIKE,LabCert2,LabCert2_IN,LabCert2_LIKE,LabCert3,LabCert3_IN,LabCert3_LIKE,LabCert4,LabCert4_IN,LabCert4_LIKE,LabCert5,LabCert5_IN,LabCert5_LIKE,LabCert6,LabCert6_IN,LabCert6_LIKE,LabCert7,LabCert7_IN,LabCert7_LIKE,LabCert8,LabCert8_IN,LabCert8_LIKE,XRef1,XRef1_IN,XRef1_LIKE,XRef2,XRef2_IN,XRef2_LIKE,XRef3,XRef3_IN,XRef3_LIKE,XRef4,XRef4_IN,XRef4_LIKE,XRef5,XRef5_IN,XRef5_LIKE,Coverage,Coverage_IN,Coverage_LIKE,ASCPayGrp,ASCPayGrp_IN,ASCPayGrp_LIKE,ASCPayGrpEffDate,ASCPayGrpEffDate_IN,ASCPayGrpEffDate_LIKE,MOGPayGrp,MOGPayGrp_IN,MOGPayGrp_LIKE,MOGPayInd,MOGPayInd_IN,MOGPayInd_LIKE,MOGEffDate,MOGEffDate_IN,MOGEffDate_LIKE,ProcNote,ProcNote_IN,ProcNote_LIKE,BETOS,BETOS_IN,BETOS_LIKE,FILLER,FILLER_IN,FILLER_LIKE,TOS1,TOS1_IN,TOS1_LIKE,TOS2,TOS2_IN,TOS2_LIKE,TOS3,TOS3_IN,TOS3_LIKE,TOS4,TOS4_IN,TOS4_LIKE,TOS5,TOS5_IN,TOS5_LIKE,AnestBaseUnits,AnestBaseUnits_IN,AnestBaseUnits_LIKE,CodeAddDate,CodeAddDate_IN,CodeAddDate_LIKE,ActionEffDate,ActionEffDate_IN,ActionEffDate_LIKE,TermDate,TermDate_IN,TermDate_LIKE,ActionCode,ActionCode_IN,ActionCode_LIKE,Filler1,Filler1_IN,Filler1_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="EOB_MEDICARE_PROCEDURECode"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getEOB_MEDICARE_PROCEDURECodeQuery" datasource="pa_master">
				SELECT #trim(Fields)#
				FROM EOB_MEDICARE_PROCEDURECode   
				WHERE 1=1
					<cfif RecordID NEQ "" AND IsNumeric(RecordID)>AND RecordID = #RecordID#</cfif>
					<cfif RecordID_IN NEQ "">AND RecordID IN(#trim(RecordID_IN)#)</cfif>
					<cfif RecordID_LIKE NEQ "">AND RecordID LIKE '%#trim(RecordID_LIKE)#%'</cfif>
					<cfif HCPC NEQ "">AND HCPC = '#HCPC#'</cfif>
					<cfif HCPC_IN NEQ "">AND HCPC IN(#trim(HCPC_IN)#)</cfif>
					<cfif HCPC_LIKE NEQ "">AND HCPC LIKE '%#trim(HCPC_LIKE)#%'</cfif>
					<cfif SeqNum NEQ "">AND SeqNum = '#SeqNum#'</cfif>
					<cfif SeqNum_IN NEQ "">AND SeqNum IN(#trim(SeqNum_IN)#)</cfif>
					<cfif SeqNum_LIKE NEQ "">AND SeqNum LIKE '%#trim(SeqNum_LIKE)#%'</cfif>
					<cfif RIC NEQ "">AND RIC = '#RIC#'</cfif>
					<cfif RIC_IN NEQ "">AND RIC IN(#trim(RIC_IN)#)</cfif>
					<cfif RIC_LIKE NEQ "">AND RIC LIKE '%#trim(RIC_LIKE)#%'</cfif>
					<cfif LongDescription NEQ "">AND LongDescription = '#LongDescription#'</cfif>
					<cfif LongDescription_IN NEQ "">AND LongDescription IN(#trim(LongDescription_IN)#)</cfif>
					<cfif LongDescription_LIKE NEQ "">AND LongDescription LIKE '%#trim(LongDescription_LIKE)#%'</cfif>
					<cfif ShortDescription NEQ "">AND ShortDescription = '#ShortDescription#'</cfif>
					<cfif ShortDescription_IN NEQ "">AND ShortDescription IN(#trim(ShortDescription_IN)#)</cfif>
					<cfif ShortDescription_LIKE NEQ "">AND ShortDescription LIKE '%#trim(ShortDescription_LIKE)#%'</cfif>
					<cfif PI1 NEQ "">AND PI1 = '#PI1#'</cfif>
					<cfif PI1_IN NEQ "">AND PI1 IN(#trim(PI1_IN)#)</cfif>
					<cfif PI1_LIKE NEQ "">AND PI1 LIKE '%#trim(PI1_LIKE)#%'</cfif>
					<cfif PI2 NEQ "">AND PI2 = '#PI2#'</cfif>
					<cfif PI2_IN NEQ "">AND PI2 IN(#trim(PI2_IN)#)</cfif>
					<cfif PI2_LIKE NEQ "">AND PI2 LIKE '%#trim(PI2_LIKE)#%'</cfif>
					<cfif PI3 NEQ "">AND PI3 = '#PI3#'</cfif>
					<cfif PI3_IN NEQ "">AND PI3 IN(#trim(PI3_IN)#)</cfif>
					<cfif PI3_LIKE NEQ "">AND PI3 LIKE '%#trim(PI3_LIKE)#%'</cfif>
					<cfif PI4 NEQ "">AND PI4 = '#PI4#'</cfif>
					<cfif PI4_IN NEQ "">AND PI4 IN(#trim(PI4_IN)#)</cfif>
					<cfif PI4_LIKE NEQ "">AND PI4 LIKE '%#trim(PI4_LIKE)#%'</cfif>
					<cfif MPI NEQ "">AND MPI = '#MPI#'</cfif>
					<cfif MPI_IN NEQ "">AND MPI IN(#trim(MPI_IN)#)</cfif>
					<cfif MPI_LIKE NEQ "">AND MPI LIKE '%#trim(MPI_LIKE)#%'</cfif>
					<cfif CIM1 NEQ "">AND CIM1 = '#CIM1#'</cfif>
					<cfif CIM1_IN NEQ "">AND CIM1 IN(#trim(CIM1_IN)#)</cfif>
					<cfif CIM1_LIKE NEQ "">AND CIM1 LIKE '%#trim(CIM1_LIKE)#%'</cfif>
					<cfif CIM2 NEQ "">AND CIM2 = '#CIM2#'</cfif>
					<cfif CIM2_IN NEQ "">AND CIM2 IN(#trim(CIM2_IN)#)</cfif>
					<cfif CIM2_LIKE NEQ "">AND CIM2 LIKE '%#trim(CIM2_LIKE)#%'</cfif>
					<cfif CIM3 NEQ "">AND CIM3 = '#CIM3#'</cfif>
					<cfif CIM3_IN NEQ "">AND CIM3 IN(#trim(CIM3_IN)#)</cfif>
					<cfif CIM3_LIKE NEQ "">AND CIM3 LIKE '%#trim(CIM3_LIKE)#%'</cfif>
					<cfif MCM1 NEQ "">AND MCM1 = '#MCM1#'</cfif>
					<cfif MCM1_IN NEQ "">AND MCM1 IN(#trim(MCM1_IN)#)</cfif>
					<cfif MCM1_LIKE NEQ "">AND MCM1 LIKE '%#trim(MCM1_LIKE)#%'</cfif>
					<cfif MCM2 NEQ "">AND MCM2 = '#MCM2#'</cfif>
					<cfif MCM2_IN NEQ "">AND MCM2 IN(#trim(MCM2_IN)#)</cfif>
					<cfif MCM2_LIKE NEQ "">AND MCM2 LIKE '%#trim(MCM2_LIKE)#%'</cfif>
					<cfif MCM3 NEQ "">AND MCM3 = '#MCM3#'</cfif>
					<cfif MCM3_IN NEQ "">AND MCM3 IN(#trim(MCM3_IN)#)</cfif>
					<cfif MCM3_LIKE NEQ "">AND MCM3 LIKE '%#trim(MCM3_LIKE)#%'</cfif>
					<cfif Statute NEQ "">AND Statute = '#Statute#'</cfif>
					<cfif Statute_IN NEQ "">AND Statute IN(#trim(Statute_IN)#)</cfif>
					<cfif Statute_LIKE NEQ "">AND Statute LIKE '%#trim(Statute_LIKE)#%'</cfif>
					<cfif LabCert1 NEQ "">AND LabCert1 = '#LabCert1#'</cfif>
					<cfif LabCert1_IN NEQ "">AND LabCert1 IN(#trim(LabCert1_IN)#)</cfif>
					<cfif LabCert1_LIKE NEQ "">AND LabCert1 LIKE '%#trim(LabCert1_LIKE)#%'</cfif>
					<cfif LabCert2 NEQ "">AND LabCert2 = '#LabCert2#'</cfif>
					<cfif LabCert2_IN NEQ "">AND LabCert2 IN(#trim(LabCert2_IN)#)</cfif>
					<cfif LabCert2_LIKE NEQ "">AND LabCert2 LIKE '%#trim(LabCert2_LIKE)#%'</cfif>
					<cfif LabCert3 NEQ "">AND LabCert3 = '#LabCert3#'</cfif>
					<cfif LabCert3_IN NEQ "">AND LabCert3 IN(#trim(LabCert3_IN)#)</cfif>
					<cfif LabCert3_LIKE NEQ "">AND LabCert3 LIKE '%#trim(LabCert3_LIKE)#%'</cfif>
					<cfif LabCert4 NEQ "">AND LabCert4 = '#LabCert4#'</cfif>
					<cfif LabCert4_IN NEQ "">AND LabCert4 IN(#trim(LabCert4_IN)#)</cfif>
					<cfif LabCert4_LIKE NEQ "">AND LabCert4 LIKE '%#trim(LabCert4_LIKE)#%'</cfif>
					<cfif LabCert5 NEQ "">AND LabCert5 = '#LabCert5#'</cfif>
					<cfif LabCert5_IN NEQ "">AND LabCert5 IN(#trim(LabCert5_IN)#)</cfif>
					<cfif LabCert5_LIKE NEQ "">AND LabCert5 LIKE '%#trim(LabCert5_LIKE)#%'</cfif>
					<cfif LabCert6 NEQ "">AND LabCert6 = '#LabCert6#'</cfif>
					<cfif LabCert6_IN NEQ "">AND LabCert6 IN(#trim(LabCert6_IN)#)</cfif>
					<cfif LabCert6_LIKE NEQ "">AND LabCert6 LIKE '%#trim(LabCert6_LIKE)#%'</cfif>
					<cfif LabCert7 NEQ "">AND LabCert7 = '#LabCert7#'</cfif>
					<cfif LabCert7_IN NEQ "">AND LabCert7 IN(#trim(LabCert7_IN)#)</cfif>
					<cfif LabCert7_LIKE NEQ "">AND LabCert7 LIKE '%#trim(LabCert7_LIKE)#%'</cfif>
					<cfif LabCert8 NEQ "">AND LabCert8 = '#LabCert8#'</cfif>
					<cfif LabCert8_IN NEQ "">AND LabCert8 IN(#trim(LabCert8_IN)#)</cfif>
					<cfif LabCert8_LIKE NEQ "">AND LabCert8 LIKE '%#trim(LabCert8_LIKE)#%'</cfif>
					<cfif XRef1 NEQ "">AND XRef1 = '#XRef1#'</cfif>
					<cfif XRef1_IN NEQ "">AND XRef1 IN(#trim(XRef1_IN)#)</cfif>
					<cfif XRef1_LIKE NEQ "">AND XRef1 LIKE '%#trim(XRef1_LIKE)#%'</cfif>
					<cfif XRef2 NEQ "">AND XRef2 = '#XRef2#'</cfif>
					<cfif XRef2_IN NEQ "">AND XRef2 IN(#trim(XRef2_IN)#)</cfif>
					<cfif XRef2_LIKE NEQ "">AND XRef2 LIKE '%#trim(XRef2_LIKE)#%'</cfif>
					<cfif XRef3 NEQ "">AND XRef3 = '#XRef3#'</cfif>
					<cfif XRef3_IN NEQ "">AND XRef3 IN(#trim(XRef3_IN)#)</cfif>
					<cfif XRef3_LIKE NEQ "">AND XRef3 LIKE '%#trim(XRef3_LIKE)#%'</cfif>
					<cfif XRef4 NEQ "">AND XRef4 = '#XRef4#'</cfif>
					<cfif XRef4_IN NEQ "">AND XRef4 IN(#trim(XRef4_IN)#)</cfif>
					<cfif XRef4_LIKE NEQ "">AND XRef4 LIKE '%#trim(XRef4_LIKE)#%'</cfif>
					<cfif XRef5 NEQ "">AND XRef5 = '#XRef5#'</cfif>
					<cfif XRef5_IN NEQ "">AND XRef5 IN(#trim(XRef5_IN)#)</cfif>
					<cfif XRef5_LIKE NEQ "">AND XRef5 LIKE '%#trim(XRef5_LIKE)#%'</cfif>
					<cfif Coverage NEQ "">AND Coverage = '#Coverage#'</cfif>
					<cfif Coverage_IN NEQ "">AND Coverage IN(#trim(Coverage_IN)#)</cfif>
					<cfif Coverage_LIKE NEQ "">AND Coverage LIKE '%#trim(Coverage_LIKE)#%'</cfif>
					<cfif ASCPayGrp NEQ "">AND ASCPayGrp = '#ASCPayGrp#'</cfif>
					<cfif ASCPayGrp_IN NEQ "">AND ASCPayGrp IN(#trim(ASCPayGrp_IN)#)</cfif>
					<cfif ASCPayGrp_LIKE NEQ "">AND ASCPayGrp LIKE '%#trim(ASCPayGrp_LIKE)#%'</cfif>
					<cfif ASCPayGrpEffDate NEQ "">AND ASCPayGrpEffDate = '#ASCPayGrpEffDate#'</cfif>
					<cfif ASCPayGrpEffDate_IN NEQ "">AND ASCPayGrpEffDate IN(#trim(ASCPayGrpEffDate_IN)#)</cfif>
					<cfif ASCPayGrpEffDate_LIKE NEQ "">AND ASCPayGrpEffDate LIKE '%#trim(ASCPayGrpEffDate_LIKE)#%'</cfif>
					<cfif MOGPayGrp NEQ "">AND MOGPayGrp = '#MOGPayGrp#'</cfif>
					<cfif MOGPayGrp_IN NEQ "">AND MOGPayGrp IN(#trim(MOGPayGrp_IN)#)</cfif>
					<cfif MOGPayGrp_LIKE NEQ "">AND MOGPayGrp LIKE '%#trim(MOGPayGrp_LIKE)#%'</cfif>
					<cfif MOGPayInd NEQ "">AND MOGPayInd = '#MOGPayInd#'</cfif>
					<cfif MOGPayInd_IN NEQ "">AND MOGPayInd IN(#trim(MOGPayInd_IN)#)</cfif>
					<cfif MOGPayInd_LIKE NEQ "">AND MOGPayInd LIKE '%#trim(MOGPayInd_LIKE)#%'</cfif>
					<cfif MOGEffDate NEQ "">AND MOGEffDate = '#MOGEffDate#'</cfif>
					<cfif MOGEffDate_IN NEQ "">AND MOGEffDate IN(#trim(MOGEffDate_IN)#)</cfif>
					<cfif MOGEffDate_LIKE NEQ "">AND MOGEffDate LIKE '%#trim(MOGEffDate_LIKE)#%'</cfif>
					<cfif ProcNote NEQ "">AND ProcNote = '#ProcNote#'</cfif>
					<cfif ProcNote_IN NEQ "">AND ProcNote IN(#trim(ProcNote_IN)#)</cfif>
					<cfif ProcNote_LIKE NEQ "">AND ProcNote LIKE '%#trim(ProcNote_LIKE)#%'</cfif>
					<cfif BETOS NEQ "">AND BETOS = '#BETOS#'</cfif>
					<cfif BETOS_IN NEQ "">AND BETOS IN(#trim(BETOS_IN)#)</cfif>
					<cfif BETOS_LIKE NEQ "">AND BETOS LIKE '%#trim(BETOS_LIKE)#%'</cfif>
					<cfif FILLER NEQ "">AND FILLER = '#FILLER#'</cfif>
					<cfif FILLER_IN NEQ "">AND FILLER IN(#trim(FILLER_IN)#)</cfif>
					<cfif FILLER_LIKE NEQ "">AND FILLER LIKE '%#trim(FILLER_LIKE)#%'</cfif>
					<cfif TOS1 NEQ "">AND TOS1 = '#TOS1#'</cfif>
					<cfif TOS1_IN NEQ "">AND TOS1 IN(#trim(TOS1_IN)#)</cfif>
					<cfif TOS1_LIKE NEQ "">AND TOS1 LIKE '%#trim(TOS1_LIKE)#%'</cfif>
					<cfif TOS2 NEQ "">AND TOS2 = '#TOS2#'</cfif>
					<cfif TOS2_IN NEQ "">AND TOS2 IN(#trim(TOS2_IN)#)</cfif>
					<cfif TOS2_LIKE NEQ "">AND TOS2 LIKE '%#trim(TOS2_LIKE)#%'</cfif>
					<cfif TOS3 NEQ "">AND TOS3 = '#TOS3#'</cfif>
					<cfif TOS3_IN NEQ "">AND TOS3 IN(#trim(TOS3_IN)#)</cfif>
					<cfif TOS3_LIKE NEQ "">AND TOS3 LIKE '%#trim(TOS3_LIKE)#%'</cfif>
					<cfif TOS4 NEQ "">AND TOS4 = '#TOS4#'</cfif>
					<cfif TOS4_IN NEQ "">AND TOS4 IN(#trim(TOS4_IN)#)</cfif>
					<cfif TOS4_LIKE NEQ "">AND TOS4 LIKE '%#trim(TOS4_LIKE)#%'</cfif>
					<cfif TOS5 NEQ "">AND TOS5 = '#TOS5#'</cfif>
					<cfif TOS5_IN NEQ "">AND TOS5 IN(#trim(TOS5_IN)#)</cfif>
					<cfif TOS5_LIKE NEQ "">AND TOS5 LIKE '%#trim(TOS5_LIKE)#%'</cfif>
					<cfif AnestBaseUnits NEQ "">AND AnestBaseUnits = '#AnestBaseUnits#'</cfif>
					<cfif AnestBaseUnits_IN NEQ "">AND AnestBaseUnits IN(#trim(AnestBaseUnits_IN)#)</cfif>
					<cfif AnestBaseUnits_LIKE NEQ "">AND AnestBaseUnits LIKE '%#trim(AnestBaseUnits_LIKE)#%'</cfif>
					<cfif CodeAddDate NEQ "">AND CodeAddDate = '#CodeAddDate#'</cfif>
					<cfif CodeAddDate_IN NEQ "">AND CodeAddDate IN(#trim(CodeAddDate_IN)#)</cfif>
					<cfif CodeAddDate_LIKE NEQ "">AND CodeAddDate LIKE '%#trim(CodeAddDate_LIKE)#%'</cfif>
					<cfif ActionEffDate NEQ "">AND ActionEffDate = '#ActionEffDate#'</cfif>
					<cfif ActionEffDate_IN NEQ "">AND ActionEffDate IN(#trim(ActionEffDate_IN)#)</cfif>
					<cfif ActionEffDate_LIKE NEQ "">AND ActionEffDate LIKE '%#trim(ActionEffDate_LIKE)#%'</cfif>
					<cfif TermDate NEQ "">AND TermDate = '#TermDate#'</cfif>
					<cfif TermDate_IN NEQ "">AND TermDate IN(#trim(TermDate_IN)#)</cfif>
					<cfif TermDate_LIKE NEQ "">AND TermDate LIKE '%#trim(TermDate_LIKE)#%'</cfif>
					<cfif ActionCode NEQ "">AND ActionCode = '#ActionCode#'</cfif>
					<cfif ActionCode_IN NEQ "">AND ActionCode IN(#trim(ActionCode_IN)#)</cfif>
					<cfif ActionCode_LIKE NEQ "">AND ActionCode LIKE '%#trim(ActionCode_LIKE)#%'</cfif>
					<cfif Filler1 NEQ "">AND Filler1 = '#Filler1#'</cfif>
					<cfif Filler1_IN NEQ "">AND Filler1 IN(#trim(Filler1_IN)#)</cfif>
					<cfif Filler1_LIKE NEQ "">AND Filler1 LIKE '%#trim(Filler1_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getEOB_MEDICARE_PROCEDURECodeQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>


