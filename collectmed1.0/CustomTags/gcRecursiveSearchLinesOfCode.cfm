
	<cfscript>
		function getExtension(name) {  
		    if(find(".",name)) return listLast(name,".");
		    else return "";
		}
	</cfscript>		
		
	<cfset directory = "#trim(request.applicationPath)#\collectmed1.0">
	
	<cfset next_directory_to_crawl = directory>		
	<cfset current_directory_to_crawl = "">
	<cfset crawl_again = 1>
	<cfset file_counter = 0>
	<cfset file_container = "">
	<cfset file_completed = "">
	
	<cfoutput>
	
	<cftry>
	
		<!-------------------------------------------------------------------------------------->
		<!--- Start the loop for the file.                                                   --->
		<!-------------------------------------------------------------------------------------->	
		<cfloop condition="crawl_again neq 0">
		    
		    <cfset current_directory_to_crawl = next_directory_to_crawl>
		    <cfset next_directory_to_crawl = "">
		    <cfset file_container = "">
		
			<!-------------------------------------------------------------------------------------->
			<!--- Now loop through the list of directories to crawl and look for the extensions. --->
			<!-------------------------------------------------------------------------------------->			    
		    <cfloop list="#current_directory_to_crawl#" index="dir" delimiters="|">
			       
		        <cfdirectory action="LIST" directory="#dir#" name="CurrentPull">	
		        
		            <cfloop query="CurrentPull">
		
						<!--------------------------------------------------------------------------------------->
						<!--- process everything returned in the CFDIRECTORY with the exception of the first  --->
						<!--- to records which are "." and "..". Those can be skipped for this example.       --->
						<!--------------------------------------------------------------------------------------->
		                <cfif name neq "." OR name neq "..">	
		                             
			                <cfif type eq "dir">
			
								<!-------------------------------------------------------------------------------------->
								<!--- Found a directory, set this folder as crawlable so on the next loop we can     --->
								<!--- search it for PDF files.                                                       --->
								<!-------------------------------------------------------------------------------------->
		                        <cfset next_directory_to_crawl = ListAppend(next_directory_to_crawl, dir & "\" & name, "|")>
			
			                <cfelseif type eq "file">
								
								<cfif ListFind("cfm,cfc,js,cfg", getExtension(name))>
												
									<cffile 
										action="READ" 
										file="#Directory#\#Name#" 
										variable="FileContent">
									
									<cfloop list="#trim(FileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
										<cfif len(i)>
											<cfset file_counter = file_counter + 1>		
										</cfif>
									</cfloop>
								
								</cfif>
											
			            	</cfif>
		
		      			</cfif>
						
				</cfloop>
		
			</cfloop>
		 	
			<cfif next_directory_to_crawl eq "">
					
					<!-------------------------------------------------------------------------------------->
					<!--- There are no more folders to crawl, stop the main loop.                        --->
					<!-------------------------------------------------------------------------------------->
			       <cfset crawl_again = 0>
				   
			</cfif> 
	
		</cfloop>
		
		#NumberFormat(file_counter)# Lines of Code makeup collectmed1.0
		
	
		<cfcatch type="Any">											
			<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
			<p>#cfcatch.message# #cfcatch.detail#</p>								
		</cfcatch>
		
	</cftry>
	</cfoutput>
	
	
	