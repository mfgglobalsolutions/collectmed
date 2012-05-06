
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchDenials">
	<cfset formname = attributes.formname>
	
	<cfset validOrderBY = "BA,PA,AA,ccount,percent">
	
	<cfset totalRecords = 0>
	
	<cfparam name="attributes.ServiceDateFrom" default="#DateAdd('d', -30, NOW())#">
	<cfset ServiceDateFrom = attributes.ServiceDateFrom>
	
	<cfif IsDefined("form.ServiceDateFrom") AND form.ServiceDateFrom NEQ "">
		<cfset ServiceDateFrom = form.ServiceDateFrom>
	<cfelseif IsDefined("url.ServiceDateFrom") AND url.ServiceDateFrom NEQ "">
		<cfset ServiceDateFrom = url.ServiceDateFrom>	
	</cfif>
	
	<cfparam name="attributes.ServiceDateFromBetween" default="#NOW()#">
	<cfset ServiceDateFromBetween = attributes.ServiceDateFromBetween>
	
	<cfif IsDefined("form.ServiceDateFromBetween") AND form.ServiceDateFromBetween NEQ "">
		<cfset ServiceDateFromBetween = form.ServiceDateFromBetween>
	<cfelseif IsDefined("url.ServiceDateFromBetween") AND url.ServiceDateFromBetween NEQ "">
		<cfset ServiceDateFromBetween = url.ServiceDateFromBetween>	
	</cfif>
	
	<cfparam name="attributes.ServiceDateFromParameter" default="between">
	<cfset ServiceDateFromParameter = attributes.ServiceDateFromParameter>
	
	<cfif IsDefined("form.ServiceDateFromParameter") AND form.ServiceDateFromParameter NEQ "">
		<cfset ServiceDateFromParameter = form.ServiceDateFromParameter>
	<cfelseif IsDefined("url.ServiceDateFromParameter") AND url.ServiceDateFromParameter NEQ "">
		<cfset ServiceDateFromParameter = url.ServiceDateFromParameter>	
	</cfif>


			
<!-------------------------------------------------------------------------------------->
<!--- The following parameters need to stay this way due to the way that cfparam     --->
<!--- handles the setting of these even when session is defined for them.            --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.OrderBy") AND form.OrderBy NEQ "" AND ListFindNoCase(validOrderBY, form.OrderBy)>
		<cfset session.OrderBy = form.OrderBy>		
	<cfelseif IsDefined("url.OrderBy") AND url.OrderBy NEQ "" AND ListFindNoCase(validOrderBY, url.OrderBy)>
		<cfset session.OrderBy = url.OrderBy>		
	<cfelseif IsDefined("session.OrderBy") AND session.OrderBy NEQ "" AND ListFindNoCase(validOrderBY, session.OrderBy)>
		<cfset session.OrderBy = session.OrderBy>		
	<cfelse>
		<cfset session.OrderBy = "BA">		
	</cfif>
		
	<cfif IsDefined("form.Order") AND form.Order NEQ "">
		<cfset session.Order = form.Order>
	<cfelseif IsDefined("url.Order") AND url.Order NEQ "">
		<cfset session.Order = url.Order>	
	<cfelseif IsDefined("session.Order") AND session.Order NEQ "">
		<cfset session.Order = session.Order>	
	<cfelse>
		<cfset session.Order = "ASC">		
	</cfif>
		

		
<!-------------------------------------------------------------------------------------->
<!--- Page Specific Javascripts                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">			
			
			function resetForm(textObject) {   
				document.#formName#.reset();
				
				span_dueDate.innerText = 'Choose Date';
				span_dueDate.style.display = 'none';
				
				span_dueDateBetween.innerText = 'Choose Date';
				span_dueDateBetweenShow.style.display = 'none';
									
				span_dateCreated.innerText = 'Choose Date';
				span_dateCreated.style.display = 'none';				
				
				span_dateCreatedBetween.innerText = 'Choose Date';
				span_dateCreatedBetweenShow.style.display = 'none';
				
				span_ServiceDateFrom.innerText = 'Choose Date';
				span_ServiceDateFrom.style.display = 'none';				
				
				span_ServiceDateFromBetween.innerText = 'Choose Date';
				span_ServiceDateFromBetweenShow.style.display = 'none';
										
			};
																											
			function openCalender(formName, dateFieldName){				
				var xCordinate =  event.screenX;
			    var yCordinate =  event.screenY + 10;
			    var rxCordinate = event.offsetX;
			    var temp = 10*5 - rxCordinate;				
			    xCordinate = xCordinate  + temp;
				Calender=window.open('appCalendar.cfm?formname='+formName+'&dateFieldName='+dateFieldName, 'Calender', 'top='+yCordinate+',left='+xCordinate+',dependent=no,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=155,height=195');
     			Calender.focus(0);
			};
									
			function showServiceDateFromBetween(val){
				if(val == 'between'){
					span_ServiceDateFrom.style.display = '';
					span_ServiceDateFromBetweenShow.style.display = '';
				}
				else if(val == ''){
					span_ServiceDateFrom.style.display = 'none';
					span_ServiceDateFromBetweenShow.style.display = 'none';
					span_ServiceDateFrom.innerText = 'Choose Date';					
					#trim(formname)#.ServiceDateFrom.value = '';
					#trim(formname)#.ServiceDateFromBetween.value = '';
					
				}
				else{
					span_ServiceDateFrom.style.display = '';
					#trim(formname)#.ServiceDateFromBetween.value = '';
					span_ServiceDateFromBetweenShow.style.display = 'none';
					span_ServiceDateFromBetween.innerText = 'Choose Date';
				};	
			};
						
			function editClaim(claimid){
				editClaim=window.open('appClaimEdit.cfm?claimid='+claimid,'editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=700,height=550'); editClaim.focus(0);
			};
			
								
		</script>
		
	</cfoutput>
	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Form needed for ordering.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<form name="SearchReProcessASCDESC" method="post">
			<input type="Hidden" name="orderby" value="">
			<input type="Hidden" name="order" value="">
			<cf_gcEmbedFields except="orderby,order">
		</form>
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">
			function submitReprocess(field, order){
				document.SearchReProcessASCDESC.orderby.value = field; 
				document.SearchReProcessASCDESC.order.value = order; 
				SearchReProcessASCDESC.submit();
			};
		</script>	
	</cfoutput>		 		


	
<!-------------------------------------------------------------------------------------->
<!--- Query to get all the Procedure Adjustments.                                    --->
<!-------------------------------------------------------------------------------------->		
	<cfsavecontent variable="sqlStatement">				
		<cfoutput>
			SELECT ent.LName + ', '  + ent.FName AS Fullname, c.claimID, c.InterchangeClaimID, pro.ProcedureID, pro.ProcedureCode, pro.BilledQuantity, pro.BilledAmount, pro.PaidQuantity, pro.PaidAmount, IFNULL(psa.MonetaryAmount2, 0) AS AllowedAmount,
			pca.Procedure_MEDICARE_CLAIMADJUSTMENTID, 
			pca.ClaimAdjustmentGroupCode1, pca.ClaimAdjustmentReasonCode2, pca.MonetaryAmount3, pca.Quantity4, 
			pca.ClaimAdjustmentReasonCode5, pca.MonetaryAmount6, pca.Quantity7, pca.ClaimAdjustmentReasonCode8, 
			pca.MonetaryAmount9, pca.Quantity10, pca.ClaimAdjustmentReasonCode11, pca.MonetaryAmount12, pca.Quantity13, 
			pca.ClaimAdjustmentReasonCode14, pca.MonetaryAmount15, pca.Quantity16, pca.ClaimAdjustmentReasonCode17, 
			pca.MonetaryAmount18, pca.Quantity19
			FROM [Procedure] pro
			JOIN Claim c ON pro.ClaimID = c.claimID
			LEFT JOIN Entity ent on c.EntityID = ent.EntityID
			LEFT JOIN Procedure_MEDICARE_CLAIMADJUSTMENT pca ON pca.ProcedureID = pro.ProcedureID
			LEFT JOIN Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT psa ON  psa.ProcedureID = pro.ProcedureID
			WHERE c.clientID = #trim(session.ClientID)# AND c.claimType = 108 
			<cfif IsDate(ServiceDateFrom) AND (ServiceDateFromParameter EQ "GT" OR ServiceDateFromParameter EQ "LT")>
				AND  pro.ServiceDateFrom <cfif ServiceDateFromParameter EQ "GT"> > <cfelseif ServiceDateFromParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateFrom)# 				
			<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
				AND  pro.ServiceDateFrom > #CreateODBCDate(ServiceDateFrom)#
				AND  pro.ServiceDateFrom < #CreateODBCDate(ServiceDateFromBetween)# 						
			</cfif>		
			Order BY procedureCode					
		</cfoutput>
	</cfsavecontent>
			
	<cfquery name="getProcedures" datasource="#trim(request.datasource)#">
		#PreserveSingleQuotes(sqlStatement)#		
	</cfquery>	
	
	<cfsavecontent variable="sqlStatement1">		
		<cfoutput>
			SELECT ProcedureCode, SUM(BilledQuantity) AS BQ, SUM(BilledAmount) AS BA, SUM(PaidQuantity) AS PQ, SUM(PaidAmount) AS PA, SUM(AllowedAmount) AS AA 
			FROM getProcedures			
			GROUP BY ProcedureCode
			Order by BA DESC	
		</cfoutput>		
	</cfsavecontent>
		
	<cfquery name="tempQuery1" dbtype="Query">		
		#PreserveSingleQuotes(sqlStatement1)#		
	</cfquery>		
	
		
	<cfif IsDefined("url.debug")>
		<cfdump var="#getProcedures#" expand="no">		
		<cfdump var="#tempQuery1#" expand="no">
	</cfif>
	
	<cfloop query="tempQuery1">
		<cfset totalRecords = totalRecords + BQ>
	</cfloop>
		
	<cfset qAllRows = querynew("Code,CCount,Q,Percent,BA,BQ,PA,AA")>

	<cfloop query="tempQuery1">
		<cfset QueryAddRow(qAllRows, 1)>
		<cfset temp = QuerySetCell(qAllRows, "Code", "#trim(ProcedureCode)#", qAllRows.getRowcount())>
		<cfset temp = QuerySetCell(qAllRows, "CCount", "#trim(BQ)#", qAllRows.getRowcount())>		
		<cfset temp = QuerySetCell(qAllRows, "Percent", "#NumberFormat(REQUEST.percentagep(BQ, totalRecords), "0.0")#", qAllRows.getRowcount())>	
		<cfset temp = QuerySetCell(qAllRows, "BA", "#trim(BA)#", qAllRows.getRowcount())>	
		<cfset temp = QuerySetCell(qAllRows, "PA", "#trim(PA)#", qAllRows.getRowcount())>	
		<cfset temp = QuerySetCell(qAllRows, "AA", "#trim(AA)#", qAllRows.getRowcount())>			
	</cfloop>
	
	
	<cfsavecontent variable="sqlStatement2">		
		<cfoutput>
			SELECT Code, Percent, CCount, BA, PA, AA
			FROM qAllRows			
			<!---Order by--->				
			<cfif IsDefined("session.OrderBy") AND session.OrderBY NEQ "">			
				ORDER BY #trim(session.OrderBy)#				
			</cfif>
			<cfif IsDefined("session.Order")>			
				#trim(session.Order)#
			</cfif>			
		</cfoutput>		
	</cfsavecontent>
		
	<cfquery name="tempQuery" dbtype="Query">		
		#PreserveSingleQuotes(sqlStatement2)#		
	</cfquery>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
	
		<div align="center">
			
			<form name="#trim(formName)#" method="post">
								
				<table>
					<tr><td>&nbsp;</td></tr>									
					<tr>							
						<td class="SiteLabel" nowrap align="right">
							Service Dates: 
						</td>	
						<td>						
							<select name="ServiceDateFromParameter" class="SiteSelectBox" onchange="showServiceDateFromBetween(this.value);">
								<option value="" selected>
								<option value="LT">Before					
								<option value="GT">After
								<option value="between">Between
							</select>
							&nbsp;
							<span id="span_ServiceDateFrom" title="Click to select a date" style="display: 'none'; font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'ServiceDateFrom');"><u>Choose&nbsp;Date</u></span>
							<span id="span_ServiceDateFromBetweenShow" style="font:12px; display: 'none'">&nbsp;AND&nbsp;&nbsp;<span id="span_ServiceDateFromBetween" title="Click to select a date" style="font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'ServiceDateFromBetween');"><u>Choose&nbsp;Date</u></span></span>
							<input type="hidden" name="ServiceDateFrom" value="">
							<input type="hidden" name="ServiceDateFromBetween" value="">
							&nbsp;&nbsp;<input type="Submit" value="Submit" class="SiteSubmitBox">
						</td>			
					</tr>	
				</table>
			</form>
			
			<br>
			<strong>CLAIM&nbsp;SUMMARY&nbsp;BY&nbsp;PROCEDURE&nbsp;CODE</strong>
			<br>
			<span class="siteLabel">
				<cfif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "GT">
					AFTER&nbsp;#DateFormat(ServiceDateFrom, "mm/dd/yy")#&nbsp;FOR #trim(session.Client.getClientName())#
				<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "LT">
					BEFORE&nbsp;#DateFormat(ServiceDateFrom, "mm/dd/yy")#&nbsp;FOR #trim(session.Client.getClientName())#				
				<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
					FROM&nbsp;#DateFormat(ServiceDateFrom, "mm/dd/yy")#&nbsp;TO&nbsp;#DateFormat(ServiceDateFromBetween, "mm/dd/yy")#&nbsp;FOR #trim(session.Client.getClientName())#
				</cfif>					
			</span>
			<br>
			<hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
			<br>
			<table cellspacing="0" cellpadding="2" border="0" width="100%">
				<tr>
				    <td align="center" class="siteLabel">&nbsp;</td>
				    <td nowrap valign="bottom" align="center">										
						<table cellspacing="0" cellpadding="2" border="0">
							<tr>
							    <td class="siteLabel" nowrap valign="bottom" rowspan="2" align="center">BILLED</td>
							   	<td><span style="cursor: hand;" onclick="submitReprocess('BA', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
							</tr>
							<tr>
							    <td><span style="cursor: hand;" onclick="submitReprocess('BA', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
							</tr>
						</table>
					</td>
				    <td nowrap valign="bottom" align="center">										
						<table cellspacing="0" cellpadding="2" border="0">
							<tr>
							    <td class="siteLabel" nowrap valign="bottom" rowspan="2" align="center">ALLOWED</td>
							   	<td><span style="cursor: hand;" onclick="submitReprocess('AA', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
							</tr>
							<tr>
							    <td><span style="cursor: hand;" onclick="submitReprocess('AA', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
							</tr>
						</table>
					</td>
				    <td nowrap valign="bottom" align="center">										
						<table cellspacing="0" cellpadding="2" border="0">
							<tr>
							    <td class="siteLabel" nowrap valign="bottom" rowspan="2" align="center">PAID</td>
							   	<td><span style="cursor: hand;" onclick="submitReprocess('PA', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
							</tr>
							<tr>
							    <td><span style="cursor: hand;" onclick="submitReprocess('PA', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
							</tr>
						</table>
					</td>
				    <td nowrap valign="bottom" align="center">										
						<table cellspacing="0" cellpadding="2" border="0">
							<tr>
							    <td class="siteLabel" nowrap valign="bottom" rowspan="2" align="center">COUNT</td>
							   	<td><span style="cursor: hand;" onclick="submitReprocess('ccount', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
							</tr>
							<tr>
							    <td><span style="cursor: hand;" onclick="submitReprocess('ccount', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
							</tr>
						</table>
					</td>
					 <td nowrap valign="bottom" align="center">										
						<table cellspacing="0" cellpadding="2" border="0">
							<tr>
							    <td class="siteLabel" nowrap valign="bottom" rowspan="2" align="center">PERCENT</td>
							   	<td><span style="cursor: hand;" onclick="submitReprocess('percent', 'asc');"><img src="images/SortASC.gif" width="11" height="7" border="0" alt="Ascending"></span></td>
							</tr>
							<tr>
							    <td><span style="cursor: hand;" onclick="submitReprocess('percent', 'desc');"><img src="images/SortDESC.gif" width="11" height="7" border="0" alt="Descending"></span></td>
							</tr>
						</table>
					</td>				    
				</tr>
				<tr>
					<td colspan="6" class="siteLabel">
						<hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
						PROCEDURE&nbsp;CODES
						<hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
					</td>
				</tr>			
				
				<cfloop query="tempQuery">
					
					<cfset paidCodeQuery = querynew("CodeDescription,AdjustmentCode,AdjustmentCodeDescription")>
															
					<cfquery name="getCodeDescription" datasource="#trim(request.datasource)#">
						SELECT HCPC, ShortDescription, LongDescription
						FROM pa_master.EOB_MEDICARE_PROCEDURECode 
						WHERE RecordID = #trim(Code)#						
					</cfquery>
					
					<cfquery name="getRows" dbtype="query">
						SELECT *
						FROM getProcedures
						WHERE ProcedureCode = #trim(Code)#
						ORDER BY ProcedureID 
					</cfquery>
									
					<cfif trim(BA) LTE 0>
						<cfset class = "SiteRequiredLabel">
					<cfelse>
						<cfset class = "SiteLabel">	
					</cfif>					
													
					<!---<tr>
					    <td colspan="10"><cfdump var="#getRows#" expand="no"></td>
					</tr>--->	
					
					<tr>
					    <td class="siteLabel"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(getCodeDescription.LongDescription)#');" onmouseout="hideTip(this);"><strong>#trim(getCodeDescription.HCPC)#</strong>&nbsp;&middot;&nbsp;#trim(getCodeDescription.ShortDescription)#</span></td>
					    <td align="right" class="#trim(class)#">#DollarFormat(trim(BA))#</td>
					    <td align="right" class="siteLabel">#DollarFormat(trim(AA))#</td>
					    <td align="right" class="siteLabel">#DollarFormat(trim(PA))#</td>
					    <td align="center" class="siteLabel">#trim(ccount)#</td>
					    <td align="center" class="siteLabel">#NumberFormat(percent, "0.0")#%</td>
					</tr>	
										
					<cfset paidBA = 0>
					<cfset paidAA = 0>
					<cfset paidPA = 0>						
					<cfset deniedBA = 0>
					<cfset deniedAA = 0>
					<cfset deniedPA = 0>	
					
					<cfloop query="getRows">
						
						<cfif AllowedAmount GT 0>
							
							<cfset paidBA = paidBA + BilledAmount>
							<cfset paidAA = paidAA + AllowedAmount>
							<cfset paidPA = paidPA + paidAmount>
							
							<cfloop list="#getRows.ColumnList#" index="i_col">
								<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
									<cfset column = "getRows.#i_col#">																										
									<cfif evaluate(column) NEQ "">														
										<cfset numCol = "getRows.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>																								 	
										<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" fields="Code,Description" RecordID="#evaluate(column)#" active="1" returnvariable="getAdjustmentCode">
										<cfset getCodeDescription = application.beanFactory.getBean('StandardListItemIO').getStandardListItemQuery(fields:'ItemNameDisplay,ItemDescription', StandardListItemID: '#trim(ClaimAdjustmentGroupCode1)#') />
																			
										<cfset QueryAddRow(paidCodeQuery, 1)>
										<cfset QuerySetCell(paidCodeQuery, "CodeDescription", "#trim(getCodeDescription.ItemNameDisplay)#", paidCodeQuery.getRowcount())>
										<cfset QuerySetCell(paidCodeQuery, "AdjustmentCode", "#trim(getAdjustmentCode.Code)#", paidCodeQuery.getRowcount())>
										<cfset QuerySetCell(paidCodeQuery, "AdjustmentCodeDescription", "#trim(getAdjustmentCode.Description)#", paidCodeQuery.getRowcount())>
																																																																																			
									</cfif>													
								</cfif>												
							</cfloop>		
							
						<cfelse>
							<cfset deniedBA = deniedBA + BilledAmount>
							<cfset deniedAA = deniedAA + AllowedAmount>
							<cfset deniedPA = deniedPA + paidAmount>	
						</cfif>
						
					</cfloop>
					<tr>
					    <td colspan="10"><cfdump var="#paidCodeQuery#" expand="no"></td>
					</tr>
					<tr onclick="if(trDenied#trim(Code)#.style.display=='none') {trDenied#trim(Code)#.style.display='block';} else {trDenied#trim(Code)#.style.display='none'};" class="SiteLabel" style="cursor: hand">
						<td class="siteRequiredLabel">DENIED</td>
						<td align="right" class="siteRequiredLabel">#DollarFormat(trim(deniedBA))#</td>
						<td align="right" class="siteRequiredLabel">#DollarFormat(trim(deniedAA))#</td>
						<td align="right" class="siteRequiredLabel">#DollarFormat(trim(deniedPA))#</td>			
					</tr>
					<tr id="trDenied#trim(Code)#" style="display: 'none';">
						<td colspan="7" id="td#trim(Code)#">
							<table cellspacing="2" cellpadding="2" border="0">
								<cfloop query="getRows">						
									<cfif AllowedAmount LTE 0>
										<tr><td class="SiteLabel">22222</td></tr>
									</cfif>									
								</cfloop>																
							</table>						
						</td>			
					</tr>
					<tr onclick="if(trPaid#trim(Code)#.style.display=='none') {trPaid#trim(Code)#.style.display='block';} else {trPaid#trim(Code)#.style.display='none'};" class="SiteLabel" style="cursor: hand">
						<td class="siteLabel"><font color="008000">PAID</font></td>
						<td align="right" class="siteLabel"><font color="008000">#DollarFormat(trim(paidBA))#</font></td>
						<td align="right" class="siteLabel"><font color="008000">#DollarFormat(trim(paidAA))#</font></td>
						<td align="right" class="siteLabel"><font color="008000">#DollarFormat(trim(paidPA))#</font></td>			
					</tr>
					<tr id="trPaid#trim(Code)#" style="display: 'none';">
						<td id="td#trim(Code)#">
							<table cellspacing="2" cellpadding="2" border="0">
								<cfloop query="getRows">									
									<cfif AllowedAmount GT 0>
										
										<cfquery name="getCodeDescription" datasource="#trim(request.datasource)#">
											SELECT ItemNameDisplay,ItemDescription
											FROM [MedTap].[dbo].StandardListItem		
											WHERE StandardListItemID = #trim(ClaimAdjustmentGroupCode1)#	
										</cfquery>
									
										<tr>
											<td class="SiteLabel">												
												<cfloop list="#getRows.ColumnList#" index="i_col">
													<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
														<cfset column = "getRows.#i_col#">																										
														<cfif evaluate(column) NEQ "">														
															<cfset numCol = "getRows.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>																								 	
															<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" fields="Code,Description" RecordID="#evaluate(column)#" active="1" returnvariable="getAdjustmentCode">
															#trim(getCodeDescription.ItemNameDisplay)#&middot;#trim(getAdjustmentCode.Code)# - #trim(getAdjustmentCode.Description)#																																																																				
														</cfif>													
													</cfif>												
												</cfloop>																					
											</td>
										</tr>
									</cfif>									
								</cfloop>																
							</table>						
						</td>			
					</tr>
					<tr><td colspan="6"><hr color="000000" style="margin:0px;padding:0px;border-bottom:1px dashed 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;"></td></tr>
									
				</cfloop>
				
			</table>
	
		</div>
	
	</cfoutput>
	
	
	
	
<!---
ALLOWEDAMOUNT,
BILLEDAMOUNT,
BILLEDQUANTITY,
PAIDAMOUNT,
PAIDQUANTITY,
PROCEDURECODE,
PROCEDUREID,
PROCEDURE_MEDICARE_CLAIMADJUSTMENTID,

CLAIMADJUSTMENTGROUPCODE1,
CLAIMADJUSTMENTREASONCODE2,
MONETARYAMOUNT3,

CLAIMADJUSTMENTREASONCODE11,
CLAIMADJUSTMENTREASONCODE14,
CLAIMADJUSTMENTREASONCODE17,

CLAIMADJUSTMENTREASONCODE5,
CLAIMADJUSTMENTREASONCODE8,
MONETARYAMOUNT12,
MONETARYAMOUNT15,
MONETARYAMOUNT18,

MONETARYAMOUNT6,
MONETARYAMOUNT9,
QUANTITY10,
QUANTITY13,
QUANTITY16,
QUANTITY19,
QUANTITY4,
QUANTITY7 


--->	



<!---
<tr id="tr#trim(Code)#" style="display: 'none';">
						<td colspan="7" id="td#trim(Code)#">
							<table cellspacing="2" cellpadding="2" border="0">
								<tr><td class="SiteRequiredLabel"><u>Claims&nbsp;Containing&nbsp;This&nbsp;Code</u></td></tr>
								
								<cfset InterchangeClaimIDs = valueList(getRows.InterchangeClaimID)>								
								<cf_gcListRemoveDuplicates list="#trim(InterchangeClaimIDs)#" name="InterchangeClaimIDs">
								
								<cfloop list="#trim(InterchangeClaimIDs)#" index="i">
									<cfquery name="getThisRow" dbtype="query">
										SELECT claimID, fullName
										FROM getProcedures
										WHERE InterchangeClaimID = '#trim(i)#'										
									</cfquery>
									<tr>
									    <td class="SiteLabel">											
											<span onclick="editClaim=window.open('appClaimEditMedicare.cfm?reset=no&claimID=#trim(getThisRow.claimID)#','editClaim','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=950,height=480'); editClaim.focus(0);" style="cursor: hand;"><u>#trim(i)#&nbsp;&middot;&nbsp;#trim(getThisRow.FullName)#</u></span>
										</td>
									</tr>
								</cfloop>	
															
							</table>						
						</td>			
					</tr>
--->