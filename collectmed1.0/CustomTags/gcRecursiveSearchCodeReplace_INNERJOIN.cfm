
	<cfquery name="mastertables" datasource="pa_master">
		SELECT DISTINCT TABLE_NAME
		FROM information_schema.`COLUMNS`
		WHERE TABLE_SCHEMA = 'pa_master'		
	</cfquery>	
	<cfquery name="clienttables" datasource="paclient_1084">
		SELECT DISTINCT TABLE_NAME
		FROM information_schema.`COLUMNS`
		WHERE TABLE_SCHEMA = 'paclient_1084'		
	</cfquery>
	<cfset tableList = "#valuelist(mastertables.TABLE_NAME)#,#valuelist(clienttables.TABLE_NAME)#" />
		
	





	<cfscript>
		function getExtension(name) {  
		    if(find(".",name)) return listLast(name,".");
		    else return "";
		}
	</cfscript>		
		
	<!--- <cfset directory = "C:\Temp\collectmed\collectmed1.0"> --->
	<cfset directory = "#trim(request.applicationPath)#\collectmed1.0"><!--- \CustomTags\com\common\db --->
	
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
								
								<cfif ListFind("cfm,cfc", getExtension(name))>
									
									<cfset findFROM = false />	
												
									<cffile 
										action="READ" 
										file="#Directory#\#Name#" 
										variable="FileContent">
									
									<cfloop list="#trim(FileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
										<cfif len(i)>											
											<cfset file_counter = file_counter + 1>	
											<cfif FindNoCase("INNER JOIN ", i)>
												<cfset fromIndex = ListFindNoCase(trim(i), "JOIN", chr(32)) + 1 />
												<cfset dbWord = ListGetAt(trim(i), fromIndex, chr(32)) />
												<cfset paFound = false>												
												<cfif FindNoCase("pa_master.", dbWord) AND ListFindNoCase(tableList, ListLast(dbWord, '.'))>
													<cfset paFound = true>
												</cfif>
												<cfif REFind('[A-Z]', dbWord) AND (ListFindNoCase(tableList, dbWord) OR paFound)>
													<cfset findFROM = true />
													<cfbreak>	
												</cfif>	
											</cfif>
										</cfif>
									</cfloop>
									
									<!-------------------------------------------------------------------------------------->
									<!--- If the file contains a FROM caluse replace the line in the file.               --->
									<!-------------------------------------------------------------------------------------->
									<cfif findFROM>
										<br>#dbWord# = "#Directory#\#Name#"
										
										<cfset newFileContent1 = REReplaceNoCase(fileContent, '(INNER JOIN)+[ ]+(#dbWord#)', 'INNER JOIN #lcase(dbWord)#', 'all') />
										<cfset newFileContent = REReplaceNoCase(newfileContent1, '(INNER JOIN)+[ ]+(pa_master.#dbWord#)', 'INNER JOIN pa_master.#lcase(dbWord)#', 'all') />
					
										<cffile 
											action="write" 
											nameconflict="OVERWRITE" 
											file="#Directory#\#Name#" 
											output="#newFileContent#"> 
									
									</cfif>
									
								
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
		
		<p>#NumberFormat(file_counter)# Lines of Code makeup collectmed1.0</p>
		
	
		<cfcatch type="Any">											
			<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
			<p>#cfcatch.message# #cfcatch.detail#</p>								
		</cfcatch>
		
	</cftry>
	</cfoutput>
	
	
	