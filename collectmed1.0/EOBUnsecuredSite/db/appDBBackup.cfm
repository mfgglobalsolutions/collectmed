
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.message" default="<table border=1 cellpadding=3 cellspacing=0><th><font size=1>File&nbsp;Name</font></th><th><font size=1>Status</font></th><th><font size=1>Date</font></th><th><font size=1>Size</font></th>">
	<cfset message = attributes.message>
	
	<cfset success = "Failed">
		
	<cfscript>
		function getExtension(name) {  
		    if(find(".",name)) return listLast(name,".");
		    else return "";
		}
	</cfscript>		
	
	<cfset dir = "C:\EOBManager\DBbackup">	

	<cfdirectory action="LIST" directory="#trim(dir)#" name="dbBackupDirectory">	
      
   	<cfloop query="dbBackupDirectory">

		<!--------------------------------------------------------------------------------------->
		<!--- process everything returned in the CFDIRECTORY with the exception of the first  --->
		<!--- to records which are "." and "..". Those can be skipped for this example.       --->
		<!--------------------------------------------------------------------------------------->
        <cfif name neq "." OR name neq "..">	
                 		                			
        	<cfif type eq "file">
			
				<cfif ListFindNoCase("bak,txt,trn", getExtension(name)) AND DateCompare(DateFormat(DateLastModified, "mm/dd/yyyy"), DateFormat(NOW(), "mm/dd/yyyy"), "d") EQ 0>
					
					<cfset size1 = evaluate(size / 1024)>
					<cfset size1 = evaluate(size1 / 1024)>
					
					<cfif getExtension(name) EQ "txt">
						
						<cffile action="READ" file="#Directory#\#Name#" variable="FileContent">
						
						<cfif FindNoCase("(success)", FileContent)>
							<cfset success = "Success">					
						</cfif>
						
						<cfset message = message & "<tr><td><font size=1>" & name & "</font></td><td><font size=1>" & success & "</font></td><td><font size=1>" & DateFormat(DateLastModified, 'mm/dd/yyyy') & " " & TimeFormat(DateLastModified, 'hh:mm:ss tt') & "</font></td><td><font size=1>" & NumberFormat(size1, "0.000") & " Mb</font></td></tr>">
					
					<cfelse>
						
						<cfset message = message & "<tr><td><font size=1>" & name & "</font></td><td><font size=1>&nbsp;</font></td><td><font size=1>" & DateFormat(DateLastModified, 'mm/dd/yyyy') & " " & TimeFormat(DateLastModified, 'hh:mm:ss tt') & "</font></td><td><font size=1>" & NumberFormat(size1, "0.000") & " Mb</font></td></tr>">
								
					</cfif>				
														
				</cfif>
						
          	</cfif>

   		</cfif>
		
		<cfset success = "Failed">
	
	</cfloop>
		
	<cfif len(message) GTE 1>
		<cfset message = message & "</table>">
	</cfif>	
		
	<cfmail	from="support@collectmed.net" to="support@collectmed.net" subject="Nightly Backup Up #DayOfWeekAsString(DayOfweek(NOW()))# #DateFormat(NOW(), 'mm/dd/yyyy')# #TimeFormat(NOW(), 'hh:mm:ss')# [#trim(CGI.REMOTE_ADDR)#]" type="HTML">
		<cfoutput>
			<font size=1>
			<p><strong>Directory Read:</strong> #trim(dir)#</p>
			#trim(message)#
			</font>
		</cfoutput>
	</cfmail>
		
	
