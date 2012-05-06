
	<cfscript>
		function getExtension(name) {  
		    if(find(".",name)) return listLast(name,".");
		    else return "";
		}
	</cfscript>		
		




 					<cfdirectory action="LIST" directory="C:\EOBManager\DBbackup" name="dbBackupDirectory">	
		        
		            <cfloop query="dbBackupDirectory">
		
						<!--------------------------------------------------------------------------------------->
						<!--- process everything returned in the CFDIRECTORY with the exception of the first  --->
						<!--- to records which are "." and "..". Those can be skipped for this example.       --->
						<!--------------------------------------------------------------------------------------->
		                <cfif name neq "." OR name neq "..">	
		                    		                			
			                <cfif type eq "file">
								
								<cfif ListFindNoCase("bak", getExtension(name))>
												
									<cfmail	from="support@eobmanager.net" to="support@eobmanager.net" subject="backup up">
										<cfoutput>#name#<br></cfoutput>
									</cfmail>	
									<!---<cfoutput>#name#<br></cfoutput>--->
										
								</cfif>
											
			            	</cfif>
		
		      			</cfif>
						
					</cfloop>
		
		


