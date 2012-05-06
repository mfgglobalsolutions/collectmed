<!--- ei_1002_XtremeTranlatorConvert --->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileID" default="">
	<cfset fileID = attributes.fileID>
	
	<cfif IsDefined("form.fileID") AND form.fileID NEQ "">
		<cfset fileID = form.fileID>
	<cfelseif IsDefined("url.fileID") AND url.fileID NEQ "">
		<cfset fileID = url.fileID>	
	</cfif>
	
	<cfparam name="attributes.fileName" default="">
	<cfset fileName = attributes.fileName>
	
	<cfparam name="attributes.fileextension" default="">
	<cfset fileextension = attributes.fileextension>
	
	<cfparam name="attributes.directoryPath" default="">
	<cfset directoryPath = attributes.directoryPath>
		
	<cfparam name="attributes.MapFile" default="#trim(request.applicationPath)#\eobmanager1.0\includes\835_to_xml.xmp">
	<cfset MapFile = attributes.MapFile>
	
	<cfparam name="attributes.LicenseKey" default="812LX-3DT3X-YFD4XT-3Y6DF">
	<cfset LicenseKey = attributes.LicenseKey>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the processing of the page.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cftry> 
	
		<cfobject type="COM" action="Create" name="xtran" class="AXTRANS.xTranslator"> 
		
		<cfset xtran.MapFile = "#trim(MapFile)#">
		<cfset xtran.LicenseKey = "#trim(LicenseKey)#">	
		<cfset xtran.Input = "#trim(directoryPath)#\#trim(fileName)#.#trim(fileextension)#">	
		<cfset xtran.Output = "#trim(directoryPath)#\#trim(fileName)#.xml">	
		<cfset result = xtran.Run()>
				
		<cffile action="READ" file="#trim(directoryPath)#\#trim(fileName)#.xml" variable="fileContents">
			
		<cfset caller.XMLfileContent = fileContents>	
		
		<cfcatch type="Any">					
			<cfset message="#cfcatch.type# #cfcatch.message# #cfcatch.detail#">
			<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p><strong>Admin Note:</strong>The client file in directory does not exist. Immediate attention required<p>There was an issue with locating a file (#trim(fileName)#) in #trim(directoryPath)#. It did not exist.</p>#GetBaseTemplatePath()#">	
			<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
			<cfset request.FileProcess.new(fileid: trim(fileID), statusid: 97, note: '#trim(message)#')>
			<cfset request.FileProcess.commit()>
			<cfthrow message="#trim(message)#">
		</cfcatch>	
			
	</cftry>
	
	<!--- 792LT-YVF6T-XDY4XT-3VFYT NOT real license temp license Must have a working license--->