
<!--Changed again--->

<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>
	<cfparam name="attributes.filename" default="UNKNOWN_HCPC2002.txt">
	<cfset filename = attributes.filename>
	<cfsetting requestTimeOut = "900">

	<cf_gcVerifyFields fields="filename,filepath" fieldnames="File Name,File Path">
	<cf_gcCFScriptIncludes>
	<cf_gcJScriptIncludes>

	<cffile	action="READ" file="#trim(filepath)#\#trim(fileName)#" variable="fileContent">

	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">

		<cfset HCPCS = ListGetAt(i,1,"|")>
		<cfset desc = ListGetAt(i,2,"|")>

		<cfquery name="insertCode" datasource="#trim(request.datasource)#">
			INSERT INTO pa_master.EOB_MEDICARE_PROCEDURECode  (HCPC, LongDescription, ShortDescription)
			VALUES('#trim(HCPCS)#', '#trim(Desc)#', '#trim(Desc)#')
		</cfquery>

	</cfloop>





<!---

	<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>
	<cfparam name="attributes.filename" default="UNKNOWN_HCPC.txt">
	<cfset filename = attributes.filename>
	<cfsetting requestTimeOut = "900">

	<cf_gcVerifyFields fields="filename,filepath" fieldnames="File Name,File Path">
	<cf_gcCFScriptIncludes>
	<cf_gcJScriptIncludes>

	<cffile	action="READ" file="#trim(filepath)#\#trim(fileName)#" variable="fileContent">

	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">

		<cfset HCPCS = ListGetAt(i,1,"|")>
		<cfset desc = ListGetAt(i,2,"|")>

		<cfquery name="insertCode" datasource="#trim(request.datasource)#">
			INSERT INTO pa_master.EOB_MEDICARE_PROCEDURECode  (HCPC, LongDescription, ShortDescription)
			VALUES('#trim(HCPCS)#', '#trim(Desc)#', '#trim(Desc)#')
		</cfquery>

	</cfloop>--->

