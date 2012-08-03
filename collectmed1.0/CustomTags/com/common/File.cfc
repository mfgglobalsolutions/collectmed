



<cfcomponent extends="com.common.db.FileIO">	


	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to create a file name.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="createFileName" output="yes" hint="This function will be called to create a file name.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="fileType" required="yes" type="numeric">
		<cfargument name="ObjectID" required="yes" type="numeric">
										
		<cftry>
		
			<cfset currentStatus = "">
			
			<cfquery name="getFileStatusesFromDB" datasource="#trim(request.datasource)#">
				SELECT fp.statusID, sli.ItemNameDisplay
				FROM fileprocess fp INNER JOIN pa_master.standardlistitem sli ON fp.statusID = sli.standardListItemID
				WHERE fp.FileID = #trim(fileID)#
			</cfquery>
			
			<cfif getFileStatusesFromDB.RecordCount GTE 1>
				<cfif display EQ 0> 
					<cfset currentStatus = ListLast(ValueList(getFileStatusesFromDB.statusID))>
				<cfelse>
					<cfset currentStatus = ListLast(ValueList(getFileStatusesFromDB.ItemNameDisplay))>
				</cfif>	
			</cfif>
			
			<cfreturn currentStatus>
			
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	


	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get a files current status.                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileCurrentStatus" output="yes" hint="This function will be called to get a files current status.">		
		
		<cfargument name="fileID" required="yes" type="numeric">
		<cfargument name="display" required="no" type="numeric" default="0">
						
		<cftry>
		
			<cfset currentStatus = "">
			
			<cfquery name="getFileStatusesFromDB" datasource="#trim(request.datasource)#">
				SELECT fp.statusID, sli.ItemNameDisplay
				FROM fileprocess fp INNER JOIN pa_master.standardlistitem sli ON fp.statusID = sli.standardListItemID
				WHERE fp.FileID = #trim(fileID)#
			</cfquery>
			
			<cfif getFileStatusesFromDB.RecordCount GTE 1>
				<cfif display EQ 0> 
					<cfset currentStatus = ListLast(ValueList(getFileStatusesFromDB.statusID))>
				<cfelse>
					<cfset currentStatus = ListLast(ValueList(getFileStatusesFromDB.ItemNameDisplay))>
				</cfif>	
			</cfif>
			
			<cfreturn currentStatus>
			
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get a files statuses formatted in a table.     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileStatusesFormatted" output="yes" hint="This function will be called to get a files statuses formatted in a table.">		
		
		<cfargument name="fileID" required="yes" type="numeric">
								
		<cftry>
		
			<cfset formattedString = "">
			
			<cfquery name="getFileStatusesFromDB" datasource="#trim(request.datasource)#">
				SELECT fp.*, sli.ItemNameDisplay
				FROM fileprocess fp INNER JOIN pa_master.standardlistitem sli ON fp.statusID = sli.standardListItemID
				WHERE fp.FileID = #trim(fileID)#
			</cfquery>
			
			<cfif getFileStatusesFromDB.RecordCount GTE 1>
				<cfloop query="getFileStatusesFromDB">
					<cfset formattedString = formattedString & "<tr><td class=sitelabel><strong>" & trim(ItemNameDisplay) & " " & DateFormat(trim(DateCreated), 'mm/dd/yy') & " " & TimeFormat(trim(DateCreated), 'hh:mm:ss tt') & "</strong><br>" & Note & "</td></tr>">
				</cfloop>	
			</cfif>
			
			<cfif formattedString NEQ ""> 
				<cfset formattedString = "<table border=0 cellpadding=2 cellspacing=0>" & formattedString & "</table>">
			</cfif>			
			
			<cfreturn trim(formattedString)>		
				
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check the file status.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFileStatuses" output="yes" hint="This function will be called to check the file status.">		
		
		<cfargument name="fileID" required="yes" type="numeric">
						
		<cftry>
		
			<cfset statuses = "">
			
			<cfquery name="getFileStatusesFromDB" datasource="#trim(request.datasource)#">
				SELECT statusID
				FROM fileprocess  
				WHERE FileID = #trim(fileID)#
			</cfquery>
			
			<cfif getFileStatusesFromDB.RecordCount GTE 1>
				<cfset statuses = ValueList(getFileStatusesFromDB.statusID)>
			</cfif>
			
			<cfreturn statuses>
			
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>



	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the assigned to id of a claim.          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="checkFileExistsInDirectory" output="no" hint="This function will be called to find out if the file sent in exists in the directory sent in. This search is recursive, all directories under the specified directory will be searched.">		
		
		<cfargument name="fileName" required="yes">
		<cfargument name="directory" required="yes">
		<cfargument name="foldersToSkip" required="false" default="">
		
		<cfset next_directory_to_crawl = directory>
		<cfset filename_to_crawl = fileName>
		<cfset current_directory_to_crawl = "">
		<cfset crawl_again = 1>
		<cfset file_counter = 0>
		<cfset file_container = "">
		<cfset file_completed = "">
		
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
			                             
				                <cfif type eq "dir" AND NOT ListFindNoCase(foldersToSkip, name)>
				
									<!-------------------------------------------------------------------------------------->
									<!--- Found a directory, set this folder as crawlable so on the next loop we can     --->
									<!--- search it for PDF files.                                                       --->
									<!-------------------------------------------------------------------------------------->
			                        <cfset next_directory_to_crawl = ListAppend(next_directory_to_crawl, dir & name & "\", "|")>
				
				                <cfelseif type eq "file">
				
									<!-------------------------------------------------------------------------------------->
									<!--- This is a file, see if the extension of the file is the one defined above      --->
									<!--------------------------------------------------------------------------------------> 
				                    <cfif name eq filename_to_crawl>		                        
				                        <cfif NOT ListFind(file_completed, dir & name, "|")>		                           
				                            <cfset file_completed = ListAppend(file_completed, dir & name, "|")>
				                            <cfset file_container = ListAppend(file_container, dir & name, "|")>
				                            <cfset file_counter = file_counter + 1>		
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
			
			<cfreturn file_counter>
			
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>
		
		
		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check if a file exists in the DB.              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="checkFileExistsInDB" output="yes" hint="This function will be called to find out if the file sent in exists in the database.">		
		
		<cfargument name="fileID" required="yes" type="numeric">
						
		<cftry>
		
			<cfquery name="getFileFromDB" datasource="#trim(request.datasource)#">
				SELECT FileID
				FROM file  
				WHERE FileID = #trim(fileID)#
			</cfquery>
			
			<cfreturn getFileFromDB.RecordCount>
			
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check if a file exists in the DB.              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="checkFileExistsInDBByName" output="yes" hint="This function will be called to find out if the file sent in exists in the database.">		
		
		<cfargument name="fileName" required="yes" type="string">
						
		<cftry>
		
			<cfquery name="getFileFromDBByName" datasource="#trim(request.datasource)#">
				SELECT FileID
				FROM file  
				WHERE ServerFile = '#trim(fileName)#'
			</cfquery>
			
			<cfreturn getFileFromDBByName.RecordCount>
			
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>

	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to delete a file from the system.                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="deleteFileDBAndDirectory" output="yes" hint="This function will be called to delete a file from the directory and the db.">		
		
		<cfargument name="fileID" required="yes" type="numeric">
						
		<cftry>
				
			<cfquery name="getFile" datasource="#request.datasource#">
				SELECT ServerDirectory, ServerFile
				FROM file  
				WHERE FileID = #trim(fileID)#
			</cfquery>	
													
			<cfquery name="delFile" datasource="#request.datasource#">
				DELETE FROM fileprocess 
				WHERE FileID = #trim(fileID)#
			</cfquery>	
			
			<cfquery name="delFileProcess" datasource="#request.datasource#">
				DELETE FROM file 
				WHERE FileID = #trim(fileID)#
			</cfquery>	
			
			<!---delete file--->
			<cffile action="DELETE" file="#trim(getFile.ServerDirectory)#\#trim(getFile.ServerFile)#">	
						
			
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
				
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the file status.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="updateFileStatus" output="yes" hint="This function will be called to update the file status.">		
		
		<cfargument name="fileID" required="yes" type="numeric">
		<cfargument name="statusID" required="yes" type="numeric">
		<cfargument name="note" required="no" type="string" default="">
						
		<cftry>
			
			<cfif checkFileExistsInDB(trim(fileID)) LTE 0>
				<cfreturn false>
			</cfif>	
			
			<cfquery name="getValidStatuses" datasource="pa_master">
				SELECT StandardListItemID
				FROM standardlistitem 
				WHERE ListID = 11
			</cfquery>
			
			<cfif NOT ListFind(ValueList(getValidStatuses.StandardListItemID), statusID)>
				<cfreturn false>
			</cfif>
			
			<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>	
			<cfset request.FileProcess.new(fileid: trim(fileID), statusid: trim(statusID), note: '#trim(note)#')>
			<cfset request.FileProcess.commit()>			
			
			<cfreturn true>	
				
			<cfcatch type="Any">											
				<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>								
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!--- ****************** --->	
	
	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the file status.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="FileUpload" output="yes" hint="This function will be called to upload a file.">		

		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="filePath" required="yes" type="string">
		<cfargument name="SupportEmailAddressID" required="yes" type="numeric">
		<cfargument name="checkFilefor" type="string" required="no">
		<cfargument name="note" type="string" required="no">
		<cfargument name="fileType" type="string" required="no">
		<cfargument name="foldersToSkip" type="string" required="no">
		<cfargument name="movefile" type="string" required="no">
		<cfargument name="debug" type="string" required="no" default="false">
		<cfargument name="usersID" type="numeric" required="no">
	
					
		<cftry>
			
					
			
			
			<cfreturn true>	
				
			<cfcatch type="Any">											
				<cfreturn "<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
		
	
	
	
	
	
	
	
	
	
<!--- ***************** --->	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</cfcomponent>

		


