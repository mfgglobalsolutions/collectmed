<!---- gcEOBFileUpload.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.debug" default="no">
	<cfset debug = attributes.debug>

	<cfparam name="attributes.siteID" default="">
	<cfset siteID = attributes.siteID>

	<cfif IsDefined("form.siteID") AND form.siteID NEQ "">
		<cfset siteID = form.siteID>
	<cfelseif IsDefined("url.siteID") AND url.siteID NEQ "">
		<cfset siteID = url.siteID>
	</cfif>

	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>

	<cfif IsDefined("form.clientID") AND form.clientID NEQ "">
		<cfset clientID = form.clientID>
	<cfelseif IsDefined("url.clientID") AND url.clientID NEQ "">
		<cfset clientID = url.clientID>
	</cfif>

	<cfparam name="attributes.usersID" default="">
	<cfset usersID = attributes.usersID>

	<cfif IsDefined("form.usersID") AND form.usersID NEQ "">
		<cfset usersID = form.usersID>
	<cfelseif IsDefined("url.usersID") AND url.usersID NEQ "">
		<cfset usersID = url.usersID>
	</cfif>

	<cfparam name="attributes.SupportEmailAddressID" default="">
	<cfset SupportEmailAddressID = attributes.SupportEmailAddressID>

	<cfif IsDefined("form.SupportEmailAddressID") AND form.SupportEmailAddressID NEQ "">
		<cfset SupportEmailAddressID = form.SupportEmailAddressID>
	<cfelseif IsDefined("url.SupportEmailAddressID") AND url.SupportEmailAddressID NEQ "">
		<cfset SupportEmailAddressID = url.SupportEmailAddressID>
	</cfif>

	<cfparam name="attributes.checkFilefor" default="">
	<cfset checkFilefor = attributes.checkFilefor>

	<cfif IsDefined("form.checkFilefor") AND form.checkFilefor NEQ "">
		<cfset checkFilefor = form.checkFilefor>
	<cfelseif IsDefined("url.checkFilefor") AND url.checkFilefor NEQ "">
		<cfset checkFilefor = url.checkFilefor>
	</cfif>

	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>

	<cfif IsDefined("form.note") AND form.note NEQ "">
		<cfset note = form.note>
	<cfelseif IsDefined("url.note") AND url.note NEQ "">
		<cfset note = url.note>
	</cfif>

	<cfparam name="attributes.filePath" default="">
	<cfset filePath = attributes.filePath>

	<cfif IsDefined("form.filePath") AND form.filePath NEQ "">
		<cfset filePath = form.filePath>
	<cfelseif IsDefined("url.filePath") AND url.filePath NEQ "">
		<cfset filePath = url.filePath>
	</cfif>

	<cfparam name="attributes.fileType" default="">
	<cfset fileType = attributes.fileType>

	<cfif IsDefined("form.fileType") AND form.fileType NEQ "">
		<cfset fileType = form.fileType>
	<cfelseif IsDefined("url.fileType") AND url.fileType NEQ "">
		<cfset fileType = url.fileType>
	</cfif>

	<cfparam name="attributes.foldersToSkip" default="">
	<cfset foldersToSkip = attributes.foldersToSkip>

	<cfif IsDefined("form.foldersToSkip") AND form.foldersToSkip NEQ "">
		<cfset foldersToSkip = form.foldersToSkip>
	<cfelseif IsDefined("url.foldersToSkip") AND url.foldersToSkip NEQ "">
		<cfset foldersToSkip = url.foldersToSkip>
	</cfif>	
	
	<cfparam name="attributes.movefile" default="">
	<cfset movefile = attributes.movefile>

	<cfif IsDefined("form.movefile") AND form.movefile NEQ "">
		<cfset movefile = form.movefile>
	<cfelseif IsDefined("url.movefile") AND url.movefile NEQ "">
		<cfset movefile = url.movefile>
	</cfif>	
	
	<cfparam name="attributes.parentFileID" default="">
	<cfset parentFileID = attributes.parentFileID>

	<cfif IsDefined("form.parentFileID") AND form.parentFileID NEQ "">
		<cfset parentFileID = form.parentFileID>
	<cfelseif IsDefined("url.parentFileID") AND url.parentFileID NEQ "">
		<cfset parentFileID = url.parentFileID>
	</cfif>		


<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="clientID,filePath,SupportEmailAddressID"
		fieldnames="Client ID,Upload File Path,Support Email Address ID"
		datatypes="numeric,*,numeric">



<!-------------------------------------------------------------------------------------->
<!--- Check to make sure that the file name does not have multiple extensions.       --->
<!-------------------------------------------------------------------------------------->
	<cfif REQUEST.FindOccurrences(filePath, '.exe') GTE 1>
		<cf_gcGeneralErrorTemplate message="The file you are trying to upload has an invalid extension.<p>#ListLast(trim(filePath), '\')#</p>">
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Put a cftry on all the attempted code.                                         --->
<!-------------------------------------------------------------------------------------->
	<cftry>

		<!-------------------------------------------------------------------------------------->
		<!--- Check to see that the specified directory exists.                              --->
		<!-------------------------------------------------------------------------------------->
		<cfset fileLocationPathCheck = trim(request.fmsPath)>
		<cfset request.fileObject = Createobject("component","com.common.File")>

		<cfif NOT directoryExists(trim(fileLocationPathCheck))>

			<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
			<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />

			<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="The client file directory does not exist. Immediate attention required"	message="<p>There was an issue with file Location path. It did not exist but was created.</p>Location Attempted: #trim(fileLocationPathCheck)#">

			<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="<p>There was an issue with file Location path. It did not exist but was created.</p>Location Attempted: #trim(fileLocationPathCheck)#">

			<cfdirectory mode="777" action="CREATE" directory="#trim(fileLocationPathCheck)#">
			<cfdirectory mode="777" action="CREATE" directory="#trim(fileLocationPathCheck)#\temp">

		<!-------------------------------------------------------------------------------------->
		<!--- Check to see if the file already exists in the clients folder.                 --->
		<!-------------------------------------------------------------------------------------->
		<cfelse>

			<cfset existsFile = request.fileObject.checkFileExistsInDirectory(foldersToSkip: "#trim(foldersToSkip)#", filename: "#ListLast(filePath, '\')#", directory: "#trim(fileLocationPathCheck)#\")>

			<cfif existsFile GTE 1>
				<cfif debug>
					<cfoutput>
						request.fileObject.checkFileExistsInDirectory(filename: "#ListLast(filePath, '\')#", directory: "#trim(fileLocationPathCheck)#\")
					</cfoutput>
				</cfif>
				<cf_gcGeneralErrorTemplate message="The file you are trying to upload already exists.">
			</cfif>

		</cfif>

		<!-------------------------------------------------------------------------------------->
		<!--- Check to see if the folder exists where the file will go.                      --->
		<!-------------------------------------------------------------------------------------->
		<cfset fileLocationPathCheck = fileLocationPathCheck & "\" & year(NOW()) & "\" & month(NOW()) & "\" & day(NOW())>

		<!-------------------------------------------------------------------------------------->
		<!--- Check to see if the directory for this client for todays date exists.          --->
		<!-------------------------------------------------------------------------------------->
		<cfif directoryExists(trim(fileLocationPathCheck))>

			<cfdirectory action="LIST" directory="#fileLocationPathCheck#" name="directory">

			<cfquery name="getDirs" dbtype="query">
				SELECT Name
				FROM directory
				WHERE Type = 'Dir'
			</cfquery>

			<!-------------------------------------------------------------------------------------->
			<!--- If for this day there are no folders then go ahead and create the folder       --->
			<!--- named 1. Otherwise set the folder to add the file to the total number          --->
			<!--- of directories found in this day.                                              --->
			<!-------------------------------------------------------------------------------------->
			<cfif getDirs.RecordCount LTE 0>
				<cfset currentWorkingFolder = 1>
				<cfdirectory action="CREATE" directory="#trim(fileLocationPathCheck)#\#trim(currentWorkingFolder)#">
			<cfelse>
				<cfset currentWorkingFolder = getDirs.name[getDirs.RecordCount]>
			</cfif>


			<!-------------------------------------------------------------------------------------->
			<!--- Find out how many files are in the current folder if there are more than 256   --->
			<!--- start a new folder.                                                            --->
			<!-------------------------------------------------------------------------------------->
			<cfdirectory action="LIST" directory="#trim(fileLocationPathCheck)#\#trim(currentWorkingFolder)#" name="currentDirectoryFiles">

			<cfquery name="getCurrentDirectoryFiles" dbtype="query">
				SELECT Name
				FROM currentDirectoryFiles
				WHERE Type = 'File'
			</cfquery>

			<!-------------------------------------------------------------------------------------->
			<!--- if the current directory contains more than 256 files we want to start a       --->
			<!--- new folder and add the file there.                                             --->
			<!-------------------------------------------------------------------------------------->
			<cfif getCurrentDirectoryFiles.RecordCount GTE 256>
				<cfset currentWorkingFolder = currentWorkingFolder + 1>
				<cfdirectory action="CREATE" directory="#trim(fileLocationPathCheck)#\#trim(currentWorkingFolder)#">
			</cfif>


		<cfelse>

			<!-------------------------------------------------------------------------------------->
			<!--- Todays folder for this client does not exist so add it.                        --->
			<!-------------------------------------------------------------------------------------->
			<cfset currentWorkingFolder = 1>
			<cfdirectory action="CREATE" directory="#trim(fileLocationPathCheck)#\#trim(currentWorkingFolder)#">

		</cfif>



		<!-------------------------------------------------------------------------------------->
		<!--- Finally after all the chekcing is done in the directory go ahead and create    --->
		<!--- the path of where the file will reside.                                        --->
		<!-------------------------------------------------------------------------------------->
		<cfset filePlacementDirectory = trim(fileLocationPathCheck)& "\" & trim(currentWorkingFolder)>


		<!-------------------------------------------------------------------------------------->
		<!--- Upload the file to the directory you designated.                               --->
		<!-------------------------------------------------------------------------------------->
		<cfif movefile>
			
			<cffile action="move" source="#filepath#" destination="#trim(filePlacementDirectory)#">
			
			<!---TODO--->
			<!-------------------------------------------------------------------------------------->
			<!--- <cffile action="move" does not create a structure so we have to fake it.       --->
			<!--- This needs to be rewritten someplace else.                                     --->
			<!-------------------------------------------------------------------------------------->		
			<cfset CFFILE = structnew()>
			<cfset CFFILE.ServerDirectory = trim(filePlacementDirectory)>
			<cfset CFFILE.ServerFile = trim(ListLast(trim(filePath), '\'))>
			<cfset CFFILE.AttemptedServerFile = trim(ListLast(trim(filePath), '\'))>
			<cfset CFFILE.ClientDirectory = filepath>
			<cfset CFFILE.ClientFile = trim(ListLast(trim(filePath), '\'))>
			<cfset CFFILE.ClientFileExt = ListLAst(trim(ListLast(trim(filePath), '\')), ".")>
			<cfset CFFILE.ClientFileName = trim(ListLast(trim(filePath), '\'))>
			<cfset CFFILE.ContentSubType = "">
			<cfset CFFILE.ContentType = "">
			<cfset CFFILE.DateLastAccessed = "">
			<cfset CFFILE.FileExisted = "NO">
			<cfset CFFILE.FileSize = "">
			<cfset CFFILE.FileWasAppended = "NO">
			<cfset CFFILE.FileWasOverwritten = "NO">
			<cfset CFFILE.FileWasRenamed = "NO">
			<cfset CFFILE.FileWasSaved = "YES">
			<cfset CFFILE.OldFileSize = "">
			<cfset CFFILE.ServerFileExt = ListLast(trim(ListLast(trim(filePath), '\')), ".")>
			<cfset CFFILE.ServerFileName = ReplaceNoCase(trim(ListLast(trim(filePath), '\')), ".#trim(CFFILE.ServerFileExt)#", "", "ALL")>
			<cfset CFFILE.TimeCreated = "">
			<cfset CFFILE.TimeLastModified = "">
						
		<cfelse>
			
			<cffile action="upload" filefield="form.fileName" destination="#trim(filePlacementDirectory)#" nameconflict="MAKEUNIQUE">
		
		</cfif>
		
		

		<!-------------------------------------------------------------------------------------->
		<!--- The upload causes the fileName to be "MAKEUNIQUE" once the file is renamed we  --->
		<!--- need to make sure that the Database does not have this specific file already   --->
		<!--- in it. This will prevent from deleting from the directory and allowing the     --->
		<!--- same file to be uploaded.                                                      --->
		<!-------------------------------------------------------------------------------------->
		<cfif request.fileObject.checkFileExistsInDBByName(trim(CFFILE.ServerFile)) GTE 1>

			<!---delete the file from the directory.--->
			<cffile action="DELETE" file="#trim(CFFILE.ServerDirectory)#\#trim(CFFILE.ServerFile)#">

			<!---show the error to the user.--->
			<cf_gcGeneralErrorTemplate message="The file uploaded already exists in the database. You may not upload the same file twice">

		</cfif>



		<!-------------------------------------------------------------------------------------->
		<!--- Check the file just uploaded for specific strings that will tell you it is a   --->
		<!--- valid file of the type that it is.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif IsDefined("checkFileFor") AND checkFileFor NEQ "">

			<!---Read the file into a local variable.--->
			<cffile action="READ" file="#trim(CFFILE.ServerDirectory)#\#trim(CFFILE.ServerFile)#" variable="uploadedFile">

			<!---loop the list of strings to search the uploaded file for.--->
			<cfloop list="#trim(checkFileFor)#" delimiters="|" index="i">

				<cfif NOT FindNoCase(trim(i), trim(uploadedFile))>

					<!---delete the file from the directory.--->
					<cffile action="DELETE" file="#trim(CFFILE.ServerDirectory)#\#trim(CFFILE.ServerFile)#">

					<!---show the error to the user.--->
					<cf_gcGeneralErrorTemplate message="The file uploaded does not meet the file standard. Please check the file for errors.">

				</cfif>

			</cfloop>

		</cfif>



		<!-------------------------------------------------------------------------------------->
		<!--- Insert the file info into the DB so we have records of the uploads.            --->
		<!-------------------------------------------------------------------------------------->
		<cfset request.fileObject.setFileType(trim(fileType))>
		<cfset request.fileObject.setclientID(trim(clientID))>
		<cfset request.fileObject.setParentFileID(trim(parentFileID))>
		<cfset request.fileObject.setusersID(trim(usersID))>
		<cfset request.fileObject.setfilePlacementDirectory(trim(filePlacementDirectory))>
		<cfset request.fileObject.setAttemptedServerFile(trim(CFFILE.AttemptedServerFile))>
		<cfset request.fileObject.setClientDirectory(trim(CFFILE.ClientDirectory))>
		<cfset request.fileObject.setClientFile(trim(CFFILE.ClientFile))>
		<cfset request.fileObject.setClientFileExt(trim(CFFILE.ClientFileExt))>
		<cfset request.fileObject.setClientFileName(trim(CFFILE.ClientFileName))>
		<cfset request.fileObject.setContentSubType(trim(CFFILE.ContentSubType))>
		<cfset request.fileObject.setContentType(trim(CFFILE.ContentType))>
		<cfset request.fileObject.setDateLastAccessed(trim(CFFILE.DateLastAccessed))>
		<cfset request.fileObject.setFileExisted(trim(CFFILE.FileExisted))>
		<cfset request.fileObject.setFileSize(trim(CFFILE.FileSize))>
		<cfset request.fileObject.setFileWasAppended(trim(CFFILE.FileWasAppended))>
		<cfset request.fileObject.setFileWasOverwritten(trim(CFFILE.FileWasOverwritten))>
		<cfset request.fileObject.setFileWasRenamed(trim(CFFILE.FileWasRenamed))>
		<cfset request.fileObject.setFileWasSaved(trim(CFFILE.FileWasSaved))>
		<cfset request.fileObject.setOldFileSize(trim(CFFILE.OldFileSize))>
		<cfset request.fileObject.setServerDirectory(trim(CFFILE.ServerDirectory))>
		<cfset request.fileObject.setServerFile(trim(CFFILE.ServerFile))>
		<cfset request.fileObject.setServerFileExt(trim(CFFILE.ServerFileExt))>
		<cfset request.fileObject.setServerFileName(trim(CFFILE.ServerFileName))>
		<cfset request.fileObject.setTimeCreated(trim(CFFILE.TimeCreated))>
		<cfset request.fileObject.setTimeLastModified(trim(CFFILE.TimeLastModified))>
		<cfset FileID = request.fileObject.commit()>


		<!-------------------------------------------------------------------------------------->
		<!--- Add the new Note.                                                              --->
		<!-------------------------------------------------------------------------------------->
		<cfif note NEQ "">

			<!-------------------------------------------------------------------------------------->
			<!--- Create the object and get the XML.                                             --->
			<!-------------------------------------------------------------------------------------->
			<cfset request.NoteXML = CreateObject("component","com.common.Note")>

			<!-------------------------------------------------------------------------------------->
			<!--- If at this point the noteID is not available it means that the instance does   --->
			<!--- not have a note attached to it. Go ahead and create the note for this          --->
			<!--- object instance.                                                               --->
			<!-------------------------------------------------------------------------------------->
			<cfset noteID = request.NoteXML.addNote(clientID: trim(clientID), objectID: 7, instanceID: trim(FileID))>

			<cfset request.NoteXML.addNoteEntry(clientID: trim(clientID), NoteID: noteID, noteEntry: '#trim(note)#', userID: trim(usersID), userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>

		</cfif>



		<!-------------------------------------------------------------------------------------->
		<!--- Everything complted correctly to this point.                                   --->
		<!-------------------------------------------------------------------------------------->
		<cfset request.FileProcess = CreateObject("component","com.common.db.FileProcessIO")>
		<cfset request.FileProcess.setFileID(trim(fileID))>
		<cfset request.FileProcess.setNote('System Entered Note: initial entry through upload')>
		<cfset request.FileProcess.commit()>


		<!-------------------------------------------------------------------------------------->
		<!--- Send the caller a message if they choose to display it.                        --->
		<!-------------------------------------------------------------------------------------->
		<cfset caller.returnCode = 1>
		<cfset caller.ClientFile = cffile.ClientFile>
		<cfset caller.FileWasRenamed = cffile.FileWasRenamed>
		<cfset caller.ServerFile = cffile.ServerFile>
		<cfset caller.newfileID = trim(FileID)>




		<!-------------------------------------------------------------------------------------->
		<!--- Show the caught error here.                                                    --->
		<!-------------------------------------------------------------------------------------->
		<cfcatch type="Any">

			<cfoutput>

				<!-------------------------------------------------------------------------------------->
				<!--- Send the caller a message if they choose to display it.                        --->
				<!-------------------------------------------------------------------------------------->
				<cfset caller.returnCode = 0>
				<br><br>
				<cf_gcBorderedTable	title="Issue&nbsp;with&nbsp;upload" tablealign="center">
					
					<p>#cfcatch.message# #cfcatch.detail#</p>
				
				</cf_gcBorderedTable>


			</cfoutput>

			<cfabort>

		</cfcatch>

	</cftry>



<!-------------------------------------------------------------------------------------->
<!--- If debug is on then test will stop after this tag is run due to an abort.      --->
<!-------------------------------------------------------------------------------------->
	<cfif debug>
		<cfoutput>
			<font face="Arial" size="2">
				<div align="Left">
					<p><strong>filePlacementDirectory:</strong> #filePlacementDirectory#</p>
					<strong>AttemptedServerFile:</strong> #trim(CFFILE.AttemptedServerFile)#<br>Initial name ColdFusion used attempting to save a file, for example, myfile.txt.
			 		<br><strong>ClientDirectory:</strong> #trim(CFFILE.ClientDirectory)#<br>Directory location of the file uploaded from the client's system.
					<br><strong>ClientFile:</strong> #trim(CFFILE.ClientFile)#<br>Name of the file uploaded from the client's system.
					<br><strong>ClientFileExt:</strong> #trim(CFFILE.ClientFileExt)#<br>Extension of the uploaded file on the client's system without a period, for example, txt not .txt.
					<br><strong>ClientFileName:</strong> #trim(CFFILE.ClientFileName)#<br>Filename without an extension of the uploaded file on the client's system.
					<br><strong>ContentSubType:</strong> #trim(CFFILE.ContentSubType)#<br>MIME content subtype of the saved file.
					<br><strong>ContentType:</strong> #trim(CFFILE.ContentType)#<br>MIME content type of the saved file.
					<br><strong>DateLastAccessed:</strong> #trim(CFFILE.DateLastAccessed)#<br>Date and time the uploaded file was last accessed.
					<br><strong>FileExisted:</strong> #trim(CFFILE.FileExisted)#<br>Indicates (Yes or No) whether or not the file already existed with the same path.
					<br><strong>FileSize:</strong> #trim(CFFILE.FileSize)#<br>Size of the uploaded file.
					<br><strong>FileWasAppended:</strong> #trim(CFFILE.FileWasAppended)#<br>Indicates (Yes or No) whether or not ColdFusion appended the uploaded file to an existing file.
					<br><strong>FileWasOverwritten:</strong> #trim(CFFILE.FileWasOverwritten)#<br>Indicates (Yes or No) whether or not ColdFusion overwrote a file.
					<br><strong>FileWasRenamed:</strong> #trim(CFFILE.FileWasRenamed)#<br>Indicates (Yes or No) whether or not the uploaded file was renamed to avoid a name conflict.
					<br><strong>FileWasSaved:</strong> #trim(CFFILE.FileWasSaved)#<br>Indicates (Yes or No) whether or not Cold Fusion saved a file.
					<br><strong>OldFileSize:</strong> #trim(CFFILE.OldFileSize)#<br>Size of a file that was overwritten in the file upload operation.
					<br><strong>ServerDirectory:</strong> #trim(CFFILE.ServerDirectory)#<br>Directory of the file actually saved on the server.
					<br><strong>ServerFile:</strong> #trim(CFFILE.ServerFile)#<br>Filename of the file actually saved on the server.
					<br><strong>ServerFileExt:</strong> #trim(CFFILE.ServerFileExt)#<br>Extension of the uploaded file on the server, without a period, for example, txt not .txt.
					<br><strong>ServerFileName:</strong> #trim(CFFILE.ServerFileName)#<br>Filename, without an extension, of the uploaded file on the server.
					<br><strong>TimeCreated:</strong> #trim(CFFILE.TimeCreated)#<br>Time the uploaded file was created.
					<br><strong>TimeLastModified:</strong> #trim(CFFILE.TimeLastModified)#<br>
				</div>
			</font>
		</cfoutput>

		<cfabort>

	</cfif>

