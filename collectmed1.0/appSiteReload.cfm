




	<cfset originalfolder = "#trim(request.applicationPath)#\eobmanager1.0\">
	<cfset newfolder = "#trim(request.applicationPath)#\eobmanager1.0\">

	<cf_recurse
    	pathtoexe="#trim(request.driveLetter)#:\cfusionMX\bin\cfencode.exe"
    	originalfolder="trim(originalfolder)#"
    	newfolder="trim(newfolder)#">  
	
	<!---<cfexecute 
		name="e:\reloadEndearingWicks.bat" 
		arguments=""	
		outputFile="#trim(request.driveLetter)#:\Temp\output.txt"  
		timeout="60"></cfexecute>--->
	
	<cfoutput><script language="JavaScript">window.close()</script></cfoutput>
	



