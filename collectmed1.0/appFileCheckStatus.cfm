<!---- appFileCheckStatus.cfm ---->
<!---1Z2X83R61329733331--->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	<cfparam name="attributes.openFileID" default="">
	<cfset openFileID = attributes.openFileID>
	
	<cfif IsDefined("form.openFileID") AND form.openFileID NEQ "">
		<cfset openFileID = form.openFileID>
	<cfelseif IsDefined("url.openFileID") AND url.openFileID NEQ "">
		<cfset openFileID = url.openFileID>	
	</cfif>
	
	<cfset openYear = "">
	<cfset openMonth = "">
	<cfset openQuarter = "">		
			



<!-------------------------------------------------------------------------------------->
<!--- Create a file object to use on this page.                                      --->
<!-------------------------------------------------------------------------------------->
	<cfset request.File = CreateObject("component", "com.common.File")>
	<cfset fileQuery = request.File.getFileQuery(usersID: trim(session.User.getUsersID()), DisplayInGUID: 1, GroupBy: "FilePlacementDirectory")>
	
	<cfquery name="qFiles" datasource="#request.datasource#">
		SELECT f.fileID,f.UsersID,f.ClientFileName,f.ClientFileExt,f.dateCreated,f.fileSize,f.fileType,f.fileplacementdirectory,DATEPART(month, f.DateCreated) AS 'month', DATEPART(year, f.DateCreated) AS 'year', DATEPART(day, f.DateCreated) AS 'day', s.ItemNameDisplay as 'Type'
		FROM file f INNER JOIN pa_master.StandardListItem s ON f.fileType = s.StandardListItemID
		WHERE DisplayInGUID = 1			
	</cfquery>
		
	<cfset years = valuelist(qFiles.year)>
	<cf_gcListRemoveDuplicates list="#trim(years)#" name="years">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Query for the file that should be open when this page loads.                   --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsNumeric(openFileID)>
		<cfquery name="getOpenFile" dbtype="query">
			SELECT *
			FROM qFiles 
			WHERE FileID = #trim(openFileID)#													
		</cfquery>
		
		<cfset openYear = getOpenFile.year>
		<cfset openMonth = getOpenFile.month>
		
		<cfswitch expression="#getOpenFile.month#">
			<cfcase value="1,2,3">
				<cfset openQuarter = 1>		
			</cfcase>
			<cfcase value="4,5,6">
				<cfset openQuarter = 2>		
			</cfcase>
			<cfcase value="7,8,9">
				<cfset openQuarter = 3>		
			</cfcase>
			<cfcase value="10,11,12">
				<cfset openQuarter = 4>		
			</cfcase>
		</cfswitch>
			
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If there is a message sent display it.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			&nbsp;<p><font face="Arial" size="4" color="c0c0c0">#trim(msg)#</font></p>			
		</cfoutput>
	</cfif>	
		
	<br>
	
	<cf_gcBorderedTable title="Files&nbsp;Uploaded&nbsp;By&nbsp;Date" tablealign="center" width="400px">
		<cfoutput>
		
			<script language="javascript">
				function toggle(ele, level, Obj){					
										
					action = ImageSwap(Obj.name);
										
					array1=Obj.name.split("_");		
					var thisStr = "row_";
					for(ii = 1; ii <= level; ii++){					
						thisStr = thisStr + array1[ii] + '_';															  
					}
										
					if(document.getElementsByTagName){  
				   		var table = document.getElementById('mainTable');   
				   		var rows = table.getElementsByTagName("tr");   
				   		for(i = 0; i < rows.length; i++){  
							if(rows[i].id != "" && rows[i].id.indexOf(thisStr) >= 0){									
								array=rows[i].id.split("_");																				
								if(eval(array.length - 2) == eval(level + 1)){								
									temp = 'document.all.' + rows[i].id + '.style.display="' + action + '"';										
									eval(temp);																				
								}
								
								if(action == "none" && eval(array.length - 2) > level){									
									temp = 'document.all.' + rows[i].id + '.style.display="' + action + '"';										
									eval(temp);																	
									arrayPM=rows[i].id.split("_");											
									if(arrayPM.length < 6){			
										var thisPM = rows[i].id.replace("row_", "PlusMinus_");	
										ImagePlus(thisPM);										
									}																										
								}
							}							
				   		} 
				 	} 				
				};
						
				function ImageSwap(Objname){
					
					str = 'document.images.' + Objname + '.src.split("/")'
					array=eval(str);									
					if (array[array.length-1] == 'minus.gif'){									
						ImagePlus(Objname);
						action = "none";
					}
					else{						
						ImageMinus(Objname);
						action = "block";
					}
					
					return action;				
				}	
				
				function ImagePlus(Objname){
					str = 'document.images.' + Objname + '.src="images/plus.gif"'						
					eval(str);					
				};
				
				function ImageMinus(Objname){
					str = 'document.images.' + Objname + '.src="images/minus.gif"'						
					eval(str);						
				};					
						
			</script>
			
				
		<form name="fileTree">
			
			<table cellspacing="2" cellpadding="2" border="0" id="mainTable">											
				<tr>
					<td>
						<table cellpadding="2" cellspacing="2" border="0">
							<cfloop list="#trim(years)#" index="y">
								
								<tr>
									<td class="SiteRequiredLabel">					
										<table cellpadding="2" cellspacing="2" border="0">
											<cfif y EQ openYear>
												<cfset image = "minus.gif">
											<cfelse>	
												<cfset image = "plus.gif">
											</cfif>
											<tr style="display:inline" id="row_#trim(y)#_">
												<td colspan="2" class="siteLabel"><img height=9 src="images/#trim(image)#" name="PlusMinus_#trim(y)#_" onclick="toggle('#trim(y)#', 1, this)" width=9 border=0>&nbsp;<strong>#trim(y)#</strong></td>
											</tr>
											
											<cfloop from="1" to="4" index="q">														
												
												<cfif trim(q) EQ 1>
												
													<cfif y EQ openYear AND q EQ openQuarter>
														<cfset image = "minus.gif">
														<cfset visibility = "inline">
													<cfelse>
														<cfset image = "plus.gif">
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/#trim(image)#" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>1st quarter</strong></td>
													</tr>																
													<cfloop list="1,2,3" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT *
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif y EQ openYear AND q EQ openQuarter AND m EQ openMonth>
																<cfset image = "minus.gif">
																<cfset visibility = "inline">
															<cfelse>
																<cfset image = "plus.gif">
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/#trim(image)#" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															
																														
															<cfif y EQ openYear AND q EQ openQuarter AND m EQ openMonth>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(y)#_">
																<td class="SiteLabel" nowrap align="center">																
																	<cfset count = 0>									
																	<table cellpadding="2" cellspacing="2" border="0" align="center">
																		<thead>			
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom">ID</td>
																			<td nowrap valign="bottom">File&nbsp;Name</td>
																			<td nowrap valign="bottom" align="center">Status</td>			
																			<td nowrap valign="bottom" align="center">Information</td>
																		</thead>									
																		<cfloop query="getFiles">
																			<cfset count = count + 1>																		
																			
																			<cfquery name="getUploaderName" datasource="#trim(request.datasource)#">
																				SELECT FName + '&nbsp;' + LName AS Fullname 
																				FROM view_useraccountparameters 
																				WHERE UsersID = #trim(UsersID)#
																			</cfquery>
																			
																			<cfset thisTable = "<strong>File Type:</strong> #trim(Type)#<br><strong>Uploaded BY:</strong> #trim(getUploaderName.Fullname)#<br><strong>Upload Date:</strong> #DateFormat(DateCreated, 'MM/DD/YYYY')# #TimeFormat(DateCreated, 'hh:mm:ss tt')#<br><strong>File Name:</strong> #ClientFileName#.#ClientFileExt#<br><strong>File Size:</strong> #FileSize#k">
																			
																			<tr>			
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#trim(FileID)#</td>
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#ClientfileName#.#ClientFileExt#</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><font color="FF0000">#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</font></td>			
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><span style="cursor:hand" onmouseover="doTooltip(1, this, event, '#trim(thisTable)#');" onmouseout="hideTip(this);"><a href="appFileMetadata.cfm?fileid=#trim(fileID)#">Info</a></span></td>												
																			</tr>																	
																		</cfloop>
																	</table>
																
																</td>
															</tr>
															
														
														</cfif>
														
													</cfloop>
												
												<cfelseif trim(q) EQ 2>
													
													<cfif 2 EQ openFileID>
														<cfset visibility = "inline">
													<cfelse>
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>2nd quarter</strong></td>
													</tr>																
													<cfloop list="4,5,6" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT *
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															
																														
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(y)#_">
																<td class="SiteLabel" nowrap align="center">																
																	<cfset count = 0>									
																	<table cellpadding="2" cellspacing="2" border="0" align="center">
																		<thead>			
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom">ID</td>
																			<td nowrap valign="bottom">File&nbsp;Name</td>
																			<td nowrap valign="bottom" align="center">Status</td>			
																			<td nowrap valign="bottom" align="center">Information</td>
																		</thead>									
																		<cfloop query="getFiles">
																			<cfset count = count + 1>																		
																			
																			<cfquery name="getUploaderName" datasource="#trim(request.datasource)#">
																				SELECT FName + '&nbsp;' + LName AS Fullname 
																				FROM view_useraccountparameters 
																				WHERE UsersID = #trim(UsersID)#
																			</cfquery>
																			
																			<cfset thisTable = "<strong>File Type:</strong> #trim(Type)#<br><strong>Uploaded BY:</strong> #trim(getUploaderName.Fullname)#<br><strong>Upload Date:</strong> #DateFormat(DateCreated, 'MM/DD/YYYY')# #TimeFormat(DateCreated, 'hh:mm:ss tt')#<br><strong>File Name:</strong> #ClientFileName#.#ClientFileExt#<br><strong>File Size:</strong> #FileSize#k">
																			
																			<tr>			
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#trim(FileID)#</td>
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#ClientfileName#.#ClientFileExt#</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><font color="FF0000">#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</font></td>			
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><span style="cursor:hand" onmouseover="doTooltip(1, this, event, '#trim(thisTable)#');" onmouseout="hideTip(this);"><a href="appFileMetadata.cfm?fileid=#trim(fileID)#">Info</a></span></td>												
																			</tr>																	
																		</cfloop>
																	</table>
																
																</td>
															</tr>
															
														
														</cfif>
														
													</cfloop>
													
												<cfelseif trim(q) EQ 3>
													
													<cfif 2 EQ openFileID>
														<cfset visibility = "inline">
													<cfelse>
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>3rd quarter</strong></td>
													</tr>																
													<cfloop list="7,8,9" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT *
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															
																														
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(y)#_">
																<td class="SiteLabel" nowrap align="center">																
																	<cfset count = 0>									
																	<table cellpadding="2" cellspacing="2" border="0" align="center">
																		<thead>			
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom">ID</td>
																			<td nowrap valign="bottom">File&nbsp;Name</td>
																			<td nowrap valign="bottom" align="center">Status</td>			
																			<td nowrap valign="bottom" align="center">Information</td>
																		</thead>									
																		<cfloop query="getFiles">
																			<cfset count = count + 1>																		
																			
																			<cfquery name="getUploaderName" datasource="#trim(request.datasource)#">
																				SELECT FName + '&nbsp;' + LName AS Fullname 
																				FROM view_useraccountparameters 
																				WHERE UsersID = #trim(UsersID)#
																			</cfquery>
																			
																			<cfset thisTable = "<strong>File Type:</strong> #trim(Type)#<br><strong>Uploaded BY:</strong> #trim(getUploaderName.Fullname)#<br><strong>Upload Date:</strong> #DateFormat(DateCreated, 'MM/DD/YYYY')# #TimeFormat(DateCreated, 'hh:mm:ss tt')#<br><strong>File Name:</strong> #ClientFileName#.#ClientFileExt#<br><strong>File Size:</strong> #FileSize#k">
																			
																			<tr>			
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#trim(FileID)#</td>
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#ClientfileName#.#ClientFileExt#</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><font color="FF0000">#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</font></td>			
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><span style="cursor:hand" onmouseover="doTooltip(1, this, event, '#trim(thisTable)#');" onmouseout="hideTip(this);"><a href="appFileMetadata.cfm?fileid=#trim(fileID)#">Info</a></span></td>												
																			</tr>																	
																		</cfloop>
																	</table>
																
																</td>
															</tr>
															
														
														</cfif>
														
													</cfloop>
													
												<cfelseif trim(q) EQ 4>
													
													<cfif 2 EQ openFileID>
														<cfset visibility = "inline">
													<cfelse>
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>4th quarter</strong></td>
													</tr>																
													<cfloop list="10,11,12" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT *
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															
																														
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(y)#_">
																<td class="SiteLabel" nowrap align="center">																
																	<cfset count = 0>									
																	<table cellpadding="2" cellspacing="2" border="0" align="center">
																		<thead>			
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom" style="background-color: ffffff">&nbsp;</td>
																			<td nowrap valign="bottom">ID</td>
																			<td nowrap valign="bottom">File&nbsp;Name</td>
																			<td nowrap valign="bottom" align="center">Status</td>			
																			<td nowrap valign="bottom" align="center">Information</td>
																		</thead>									
																		<cfloop query="getFiles">
																			<cfset count = count + 1>																		
																			
																			<cfquery name="getUploaderName" datasource="#trim(request.datasource)#">
																				SELECT FName + '&nbsp;' + LName AS Fullname 
																				FROM view_useraccountparameters 
																				WHERE UsersID = #trim(UsersID)#
																			</cfquery>
																			
																			<cfset thisTable = "<strong>File Type:</strong> #trim(Type)#<br><strong>Uploaded BY:</strong> #trim(getUploaderName.Fullname)#<br><strong>Upload Date:</strong> #DateFormat(DateCreated, 'MM/DD/YYYY')# #TimeFormat(DateCreated, 'hh:mm:ss tt')#<br><strong>File Name:</strong> #ClientFileName#.#ClientFileExt#<br><strong>File Size:</strong> #FileSize#k">
																			
																			<tr>			
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td nowrap valign="bottom">&nbsp;</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#trim(FileID)#</td>
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>>#ClientfileName#.#ClientFileExt#</td>
																				<td class="SiteLabel" nowrap <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><font color="FF0000">#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</font></td>			
																				<td class="SiteLabel" nowrap align="center" <cfif count MOD 2 EQ 0>style="background-color: f9f9f9"</cfif>><span style="cursor:hand" onmouseover="doTooltip(1, this, event, '#trim(thisTable)#');" onmouseout="hideTip(this);"><a href="appFileMetadata.cfm?fileid=#trim(fileID)#">Info</a></span></td>												
																			</tr>																	
																		</cfloop>
																	</table>
																
																</td>
															</tr>
															
														
														</cfif>
														
													</cfloop>
													
												</cfif>												
												
											</cfloop>
												
										</table>
										
									</td>
								</tr>	
							
							</cfloop>
																	
						</table>	
					</td>
				</tr>		
			</table>	
	
		</form>
		
		</cfoutput>
	
	</cf_gcBorderedTable>				


	
		






























<!--- WORKING CODE



<!---- appFileCheckStatus.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	<cfparam name="attributes.openFileID" default="2362">
	<cfset openFileID = attributes.openFileID>
	
	<cfif IsDefined("form.openFileID") AND form.openFileID NEQ "">
		<cfset openFileID = form.openFileID>
	<cfelseif IsDefined("url.openFileID") AND url.openFileID NEQ "">
		<cfset openFileID = url.openFileID>	
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Create a file object to use on this page.                                      --->
<!-------------------------------------------------------------------------------------->
	<cfset request.File = CreateObject("component", "com.common.File")>
	<cfset fileQuery = request.File.getFileQuery(usersID: trim(session.User.getUsersID()), DisplayInGUID: 1, GroupBy: "FilePlacementDirectory")>
	

	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If there is a message sent display it.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			&nbsp;<p><font face="Arial" size="4" color="c0c0c0">#trim(msg)#</font></p>			
		</cfoutput>
	</cfif>	
		
	<br>
	
	<cf_gcBorderedTable title="Files&nbsp;Uploaded&nbsp;By&nbsp;Date" tablealign="center" tablewidth="50">
	
		<table cellspacing="2" cellpadding="2" border="0">
		
			<cfoutput query="fileQuery" group="FilePlacementDirectory">	
				
				<!-------------------------------------------------------------------------------------->
				<!--- Create a dynamic Javascript for the page that will let the code handle         --->
				<!--- multiple categories without error. This will ensure that the javascripts       --->
				<!--- are named differently.                                                         --->
				<!-------------------------------------------------------------------------------------->		
				<script language="javascript">
					function toggle#FileID#() {
						if(document.all.audit#FileID#.style.display=='none') {
							document.all.audit#FileID#.style.display='block';							
						}
						else {
							document.all.audit#FileID#.style.display='none';							 				
						}
					}
				</script>	
					
				<!------------------------------------------------------------------------------------->
				<!--- Create the javascript image swap.                                             --->
				<!------------------------------------------------------------------------------------->			
				<cfoutput>
					<SCRIPT LANGUAGE="JavaScript">				
						function ImageSwap#FileID#(){							
							array=document.images.PlusMinus#FileID#.src.split("/");
							if (array[array.length-1] == 'minus.gif'){							
								document.images.PlusMinus#FileID#.src='images/plus.gif';
							}
							else{								
								document.images.PlusMinus#FileID#.src='images/minus.gif';
							}
						}			
					</SCRIPT>
				</cfoutput>			
				
				<cfset day = ListGetAt(FilePlacementDirectory, ListLen(FilePlacementDirectory, "\") - 1, "\")>
				<cfset month = ListGetAt(FilePlacementDirectory, ListLen(FilePlacementDirectory, "\") - 2, "\")>
				<cfset year = ListGetAt(FilePlacementDirectory, ListLen(FilePlacementDirectory, "\") - 3, "\")>
				<cfset folderDate = CreateDate(year, month, day)>
				<tr>
					<td>
						<table cellspacing="2" cellpadding="2" border="0">
							<tr>
								<td class="SiteRequiredLabel">					
									<cfif fileID EQ openFileID>
										<img height=9 alt="" src="images/minus.gif" name="PlusMinus#FileID#" width=9 border=0 id="toggleImage" onclick="ImageSwap#FileID#(),toggle#FileID#()">&nbsp;<strong>#DateFormat(trim(folderDate), "mmm, d yyyy")#</strong>
									<cfelse>
										<img height=9 alt="" src="images/plus.gif" name="PlusMinus#FileID#" width=9 border=0 id="toggleImage" onclick="ImageSwap#FileID#(),toggle#FileID#()">&nbsp;<strong>#DateFormat(trim(folderDate), "mmm, d yyyy")#</strong>
									</cfif>									
								</td>
							</tr>	
							<cfif fileID EQ openFileID>
								<cfset visibility = "inline">
							<cfelse>
								<cfset visibility = "none">
							</cfif>		
							<tr style="display:#trim(visibility)#" id="audit#FileID#">
							    <td class="SiteLabel" nowrap>
									
									<cfquery name="getSpecificRows" dbtype="query">
										SELECT *    
										FROM fileQuery
										WHERE FilePlacementDirectory = '#trim(FilePlacementDirectory)#'
									</cfquery>		
									
									<cfset count = 0>
									
									<table cellpadding="2" cellspacing="2" border="0" align="center">
										<thead>			
											<td nowrap valign="bottom">ID</td>
											<td nowrap valign="bottom">File&nbsp;Name</td>
											<td nowrap valign="bottom" align="center">Status</td>			
											<td nowrap valign="bottom" align="center">Information</td>
										</thead>									
										<cfloop query="getSpecificRows">
											<cfset count = count + 1>																		
											
											<cfquery name="getUploaderName" datasource="#trim(request.datasource)#">
												SELECT FName + '&nbsp;' + LName AS Fullname 
												FROM view_useraccountparameters 
												WHERE UsersID = #trim(UsersID)#
											</cfquery>
											
											<cfset thisTable = "<strong>File Type:</strong> #trim(FileType)#<br><strong>Uploaded BY:</strong> #trim(getUploaderName.Fullname)#<br><strong>Upload Date:</strong> #DateFormat(DateCreated, 'MM/DD/YYYY')# #TimeFormat(DateCreated, 'hh:mm:ss tt')#<br><strong>File Name:</strong> #ClientFileName#.#ClientFileExt#<br><strong>File Size:</strong> #FileSize#k">
											
											<tr <cfif count MOD 2 EQ 0> class="TblRow"</cfif>>			
												<td class="SiteLabel" nowrap>#trim(FileID)#</td>
												<td class="SiteLabel" nowrap align="center">#ClientfileName#.#ClientFileExt#</td>
												<td class="SiteLabel" nowrap><font color="FF0000">#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</font></td>			
												<td class="SiteLabel" nowrap align="center"><span style="cursor:hand" onmouseover="doTooltip(1, this, event, '#trim(thisTable)#');" onmouseout="hideTip(this);"><a href="appFileMetadata.cfm?fileid=#trim(fileID)#">Info</a></span></td>												
											</tr>																	
										</cfloop>
									</table>	
								</td>
							</tr>										
						</table>	
					</td>
				</tr>		
			</cfoutput>
	
		</table>	
	
	</cf_gcBorderedTable>				



--->

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



<!---
StandardListItemID	ItemNameDisplay		ItemDescription
94					Entered				File has been uploaded but no processing has taken place.
95					Queued				File has been queued for processing
96					In Process			File has begun its process
97					Hold				There was an issue with the file and was placed on hold.
98					Process Complete	The Process taken on this type of file has completed.
99					Closed				The file has gone through all steps needed.
100					Reopened			The file can be reprocessed.
--->




<!---<cf_gcBorderedTable title="File Status" tablealign="center" tablewidth="50">
			
		<table align=center border="0" cellpadding="7" cellspacing="0" class="Tbl">
			<br><br>
			<thead>			
				<td nowrap valign="bottom">ID</td>
				<td nowrap valign="bottom">File&nbsp;Name</td>
				<td nowrap valign="bottom" align="center">Status</td>			
			</thead>
			
			<cfset count = 0>
			
			<cfloop query="fileQuery">
				
				<cfset count = count + 1>
							
				<cfoutput>
					<tr <cfif count MOD 2 EQ 0> class="TblRow"</cfif>>			
						<td class="SiteLabel" nowrap>#trim(FileID)#</td>
						<td class="SiteLabel" nowrap align="center">#ClientfileName#.#ClientFileExt#</td>
						<td class="SiteLabel" nowrap><font color="FF0000">#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</font></td>			
					</tr>
				</cfoutput>
				
			</cfloop>
			
		</table>
		<br><br>	
		<table border="0" width="100%">			
			<tr>
				<td class="SiteLabel">									
					<a href="appFileManage.cfm">Upload&nbsp;Another&nbsp;File</a>						
				</td>								
			</tr>	
		</table>
		<br><br>	
		
	</cf_gcBorderedTable>--->


	
	
	
<!---<cfset fileQuery = request.File.getFileQuery(usersID: trim(session.User.getUsersID()), fields: "fileID,UsersID,ClientFileName,ClientFileExt,dateCreated,fileSize,fileType,fileplacementdirectory", DisplayInGUID: 1, GroupBy: "FilePlacementDirectory")>
	
	<cfset qFiles = querynew("fileID,UsersID,ClientFileName,clientFileExt,day,month,year,folderdate,quarter,fileplacementdirectory,dateCreated,fileSize,fileType")>
			
	<cfloop query="fileQuery">	
		
		<cfset QueryAddRow(qFiles, 1)>
		<cfset temp = QuerySetCell(qFiles, "FileID", "#trim(FileID)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "UsersID", "#trim(UsersID)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "ClientFileName", "#trim(ClientFileName)#.#trim(ClientFileExt)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "ClientFileExt", "#trim(ClientFileExt)#", qFiles.getRowcount())>
						
		<cfset day = ListGetAt(FilePlacementDirectory, ListLen(FilePlacementDirectory, "\") - 1, "\")>
		<cfset month = ListGetAt(FilePlacementDirectory, ListLen(FilePlacementDirectory, "\") - 2, "\")>
		<cfset year = ListGetAt(FilePlacementDirectory, ListLen(FilePlacementDirectory, "\") - 3, "\")>
		<cfset folderDate = CreateDate(year, month, day)>
		
		<cfswitch expression="#month#">
			<cfcase value="1,2,3">
				<cfset quarter = 1>		
			</cfcase>
			<cfcase value="4,5,6">
				<cfset quarter = 2>		
			</cfcase>
			<cfcase value="7,8,9">
				<cfset quarter = 3>		
			</cfcase>
			<cfcase value="10,11,12">
				<cfset quarter = 4>		
			</cfcase>
		</cfswitch>
						
		<cfset temp = QuerySetCell(qFiles, "day", "#trim(day)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "month", "#trim(month)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "year", "#trim(year)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "folderdate", "#trim(folderdate)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "quarter", "#trim(quarter)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "fileplacementdirectory", "#trim(fileplacementdirectory)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "dateCreated", "#trim(dateCreated)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "fileSize", "#trim(fileSize)#", qFiles.getRowcount())>
		<cfset temp = QuerySetCell(qFiles, "fileType", "#trim(fileType)#", qFiles.getRowcount())>				
					
	</cfloop>--->	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!--- WORKING TABLE

<!---- appFileCheckStatus.cfm ---->
<!---1Z2X83R61329733331--->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	<cfparam name="attributes.openFileID" default="2362">
	<cfset openFileID = attributes.openFileID>
	
	<cfif IsDefined("form.openFileID") AND form.openFileID NEQ "">
		<cfset openFileID = form.openFileID>
	<cfelseif IsDefined("url.openFileID") AND url.openFileID NEQ "">
		<cfset openFileID = url.openFileID>	
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Create a file object to use on this page.                                      --->
<!-------------------------------------------------------------------------------------->
	<cfset request.File = CreateObject("component", "com.common.File")>
	<cfset fileQuery = request.File.getFileQuery(usersID: trim(session.User.getUsersID()), DisplayInGUID: 1, GroupBy: "FilePlacementDirectory")>
	
	<cfquery name="qFiles" datasource="#request.datasource#">
		select fileID,UsersID,ClientFileName,ClientFileExt,dateCreated,fileSize,fileType,fileplacementdirectory, DATEPART(month, DateCreated) AS 'month', DATEPART(year, DateCreated) AS 'year', DATEPART(day, DateCreated) AS 'day'
		FROM file
		WHERE DisplayInGUID = 1		
	</cfquery>
		
	<cfset years = valuelist(qFiles.year)>
	<cf_gcListRemoveDuplicates list="#trim(years)#" name="years">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If there is a message sent display it.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			&nbsp;<p><font face="Arial" size="4" color="c0c0c0">#trim(msg)#</font></p>			
		</cfoutput>
	</cfif>	
		
	<br>
	
	<cf_gcBorderedTable title="Files&nbsp;Uploaded&nbsp;By&nbsp;Date" tablealign="center" tablewidth="50">
		<cfoutput>
		
			<script language="javascript">
				function toggle(ele, level, Obj){					
										
					action = ImageSwap(Obj.name);
										
					array1=Obj.name.split("_");		
					var thisStr = "row_";
					for(ii = 1; ii <= level; ii++){					
						thisStr = thisStr + array1[ii] + '_';															  
					}
										
					if(document.getElementsByTagName){  
				   		var table = document.getElementById('mainTable');   
				   		var rows = table.getElementsByTagName("tr");   
				   		for(i = 0; i < rows.length; i++){  
							if(rows[i].id != "" && rows[i].id.indexOf(thisStr) >= 0){									
								array=rows[i].id.split("_");																				
								if(eval(array.length - 2) == eval(level + 1)){								
									temp = 'document.all.' + rows[i].id + '.style.display="' + action + '"';										
									eval(temp);																				
								}
								
								if(action == "none" && eval(array.length - 2) > level){									
									temp = 'document.all.' + rows[i].id + '.style.display="' + action + '"';										
									eval(temp);																	
									arrayPM=rows[i].id.split("_");											
									if(arrayPM.length < 6){			
										var thisPM = rows[i].id.replace("row_", "PlusMinus_");	
										ImagePlus(thisPM);										
									}																										
								}
							}							
				   		} 
				 	} 				
				};
						
				function ImageSwap(Objname){
					
					str = 'document.images.' + Objname + '.src.split("/")'
					array=eval(str);									
					if (array[array.length-1] == 'minus.gif'){									
						ImagePlus(Objname);
						action = "none";
					}
					else{						
						ImageMinus(Objname);
						action = "block";
					}
					
					return action;				
				}	
				
				function ImagePlus(Objname){
					str = 'document.images.' + Objname + '.src="images/plus.gif"'						
					eval(str);					
				};
				
				function ImageMinus(Objname){
					str = 'document.images.' + Objname + '.src="images/minus.gif"'						
					eval(str);						
				};					
						
			</script>
			
				
		<form name="fileTree">
			
			<table cellspacing="2" cellpadding="2" border="0" id="mainTable">											
				<tr>
					<td>
						<table cellpadding="2" cellspacing="2" border="0">
							<cfloop list="#trim(years)#" index="y">
								
								<tr>
									<td class="SiteRequiredLabel">					
										<table cellpadding="2" cellspacing="2" border="0">
											<tr style="display:inline" id="row_#trim(y)#_">
												<td colspan="2" class="siteLabel"><img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_" onclick="toggle('#trim(y)#', 1, this)" width=9 border=0>&nbsp;<strong>#trim(y)#</strong></td>
											</tr>
											
											<cfloop from="1" to="4" index="q">														
												
												<cfif trim(q) EQ 1>																											
													<cfif 2 EQ openFileID>
														<cfset visibility = "inline">
													<cfelse>
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>1st quarter</strong></td>
													</tr>																
													<cfloop list="1,2,3" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT fileID
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															
															<cfloop query="getFiles">
																<cfif 2 EQ openFileID>
																	<cfset visibility = "inline">
																<cfelse>
																	<cfset visibility = "none">
																</cfif>		
																<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(fileID)#_">																												
																	<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>#fileID#</strong></td>
																</tr>
															</cfloop>
														
														</cfif>
														
													</cfloop>
												
												<cfelseif trim(q) EQ 2>
													
													<cfif 2 EQ openFileID>
														<cfset visibility = "inline">
													<cfelse>
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>2nd quarter</strong></td>
													</tr>																
													<cfloop list="4,5,6" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT fileID
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															
															<cfloop query="getFiles">
																<cfif 2 EQ openFileID>
																	<cfset visibility = "inline">
																<cfelse>
																	<cfset visibility = "none">
																</cfif>		
																<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(fileID)#_">																												
																	<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>#fileID#</strong></td>
																</tr>
															</cfloop>
														
														</cfif>
														
													</cfloop>
													
												<cfelseif trim(q) EQ 3>
													
													<cfif 2 EQ openFileID>
														<cfset visibility = "inline">
													<cfelse>
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>3rd quarter</strong></td>
													</tr>																
													<cfloop list="7,8,9" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT fileID
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															
															<cfloop query="getFiles">
																<cfif 2 EQ openFileID>
																	<cfset visibility = "inline">
																<cfelse>
																	<cfset visibility = "none">
																</cfif>		
																<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(fileID)#_">																												
																	<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>#fileID#</strong></td>
																</tr>
															</cfloop>
														
														</cfif>
														
													</cfloop>
													
												<cfelseif trim(q) EQ 4>
													
													<cfif 2 EQ openFileID>
														<cfset visibility = "inline">
													<cfelse>
														<cfset visibility = "none">
													</cfif>		
													<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_">	
														<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_" width=9 border=0 onclick="toggle('#trim(q)#', 2, this)">&nbsp;<strong>4th quarter</strong></td>
													</tr>																
													<cfloop list="10,11,12" index="m">
														
														<cfquery name="getFiles" dbtype="query">
															SELECT *
															FROM qFiles 
															WHERE [year] = #trim(y)# AND [month] = #trim(m)#															
														</cfquery>	
														
														<cfif getFiles.RecordCount GTE 1>
															
															<cfif 2 EQ openFileID>
																<cfset visibility = "inline">
															<cfelse>
																<cfset visibility = "none">
															</cfif>		
															<tr style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_">																												
																<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9 src="images/plus.gif" name="PlusMinus_#trim(y)#_#trim(q)#_#trim(m)#_" width=9 border=0 onclick="toggle('#trim(m)#', 3, this)">&nbsp;<strong>#MonthAsString(m)#</strong></td>
															</tr>															
															<cfset count = 0>
															
															<cfloop query="getFiles">
																
																<cfset count = count + 1>																		
		
																<cfquery name="getUploaderName" datasource="#trim(request.datasource)#">
																	SELECT FName + '&nbsp;' + LName AS Fullname 
																	FROM view_useraccountparameters 
																	WHERE UsersID = #trim(UsersID)#
																</cfquery>
																
																<cfset thisTable = "<strong>File Type:</strong> #trim(FileType)#<br><strong>Uploaded BY:</strong> #trim(getUploaderName.Fullname)#<br><strong>Upload Date:</strong> #DateFormat(DateCreated, 'MM/DD/YYYY')# #TimeFormat(DateCreated, 'hh:mm:ss tt')#<br><strong>File Name:</strong> #ClientFileName#.#ClientFileExt#<br><strong>File Size:</strong> #FileSize#k">
		
																<cfif 2 EQ openFileID>
																	<cfset visibility = "inline">
																<cfelse>
																	<cfset visibility = "none">
																</cfif>		
																<tr <cfif count MOD 2 NEQ 0> class="TblRow"</cfif> style="display:#trim(visibility)#" id="row_#trim(y)#_#trim(q)#_#trim(m)#_#trim(fileID)#_">																												
																	<td class="siteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>#fileID#</strong></td>
																	<td class="SiteLabel" nowrap align="center">#ClientfileName#.#ClientFileExt#</td>
																	<td class="SiteLabel" nowrap><font color="FF0000">#request.File.getFileCurrentStatus(display: 1, fileID: fileID)#</font></td>			
																	<td class="SiteLabel" nowrap align="center"><span style="cursor:hand" onmouseover="doTooltip(1, this, event, '#trim(thisTable)#');" onmouseout="hideTip(this);"><a href="appFileMetadata.cfm?fileid=#trim(fileID)#">Info</a></span></td>												
																</tr>
															</cfloop>
														
														</cfif>
														
													</cfloop>
													
												</cfif>												
												
											</cfloop>
												
										</table>
										
									</td>
								</tr>	
							
							</cfloop>
																	
						</table>	
					</td>
				</tr>		
			</table>	
	
		</form>
		
		</cfoutput>
	
	</cf_gcBorderedTable>				


	
--->		

