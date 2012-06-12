
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
			SELECT pro.procedureid, COUNT(p.ClaimAdjustmentReasonCode2) AS codeCount, p.ClaimAdjustmentGroupCode1 AS CAGC1, p.ClaimAdjustmentReasonCode2 AS Code, pro.BilledQuantity AS Q, pro.BilledAmount, pro.PaidAmount, SUM(IFNULL(psa.MonetaryAmount2, 0)) AS AllowedAmount 
			FROM [Procedure] pro
			Join Claim c ON pro.ClaimID = c.claimID
			LEFT JOIN Procedure_MEDICARE_CLAIMADJUSTMENT p ON p.ProcedureID = pro.ProcedureID
			LEFT JOIN Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT psa ON  psa.ProcedureID = pro.ProcedureID
			WHERE c.clientID = #trim(session.clientID)# AND c.claimType = 108 AND p.ClaimAdjustmentReasonCode2 IS NOT NULL
			<cfif IsDate(ServiceDateFrom) AND (ServiceDateFromParameter EQ "GT" OR ServiceDateFromParameter EQ "LT")>
				AND pro.ServiceDateFrom <cfif ServiceDateFromParameter EQ "GT"> > <cfelseif ServiceDateFromParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateFrom)# 				
			<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
				AND pro.ServiceDateFrom > #CreateODBCDate(ServiceDateFrom)#
				AND pro.ServiceDateFrom < #CreateODBCDate(ServiceDateFromBetween)# 						
			</cfif>					
			GROUP BY p.ClaimAdjustmentReasonCode2, p.ClaimAdjustmentGroupCode1,  pro.BilledAmount, pro.PaidAmount, pro.BilledQuantity, pro.procedureid
			UNION ALL
			SELECT pro.procedureid, COUNT(p.ClaimAdjustmentReasonCode5) AS codeCount, p.ClaimAdjustmentGroupCode1 AS CAGC1, p.ClaimAdjustmentReasonCode5 AS Code, pro.BilledQuantity AS Q, pro.BilledAmount, pro.PaidAmount, SUM(IFNULL(psa.MonetaryAmount2, 0)) AS AllowedAmount 
			FROM [Procedure] pro
			Join Claim c ON pro.ClaimID = c.claimID
			LEFT JOIN Procedure_MEDICARE_CLAIMADJUSTMENT p ON p.ProcedureID = pro.ProcedureID
			LEFT JOIN Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT psa ON  psa.ProcedureID = pro.ProcedureID
			WHERE c.clientID = #trim(session.clientID)# AND c.claimType = 108 AND p.ClaimAdjustmentReasonCode5 IS NOT NULL
			<cfif IsDate(ServiceDateFrom) AND (ServiceDateFromParameter EQ "GT" OR ServiceDateFromParameter EQ "LT")>
				AND pro.ServiceDateFrom <cfif ServiceDateFromParameter EQ "GT"> > <cfelseif ServiceDateFromParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateFrom)# 				
			<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
				AND pro.ServiceDateFrom > #CreateODBCDate(ServiceDateFrom)#
				AND pro.ServiceDateFrom < #CreateODBCDate(ServiceDateFromBetween)# 						
			</cfif>					
			GROUP BY p.ClaimAdjustmentReasonCode5, p.ClaimAdjustmentGroupCode1, pro.BilledAmount, pro.PaidAmount, pro.BilledQuantity, pro.procedureid
			UNION ALL
			SELECT pro.procedureid, COUNT(p.ClaimAdjustmentReasonCode8) AS codeCount, p.ClaimAdjustmentGroupCode1 AS CAGC1, p.ClaimAdjustmentReasonCode8 AS Code, pro.BilledQuantity AS Q, pro.BilledAmount, pro.PaidAmount, SUM(IFNULL(psa.MonetaryAmount2, 0)) AS AllowedAmount 
			FROM [Procedure] pro
			Join Claim c ON pro.ClaimID = c.claimID
			LEFT JOIN Procedure_MEDICARE_CLAIMADJUSTMENT p ON p.ProcedureID = pro.ProcedureID
			LEFT JOIN Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT psa ON  psa.ProcedureID = pro.ProcedureID
			WHERE c.clientID = #trim(session.clientID)# AND c.claimType = 108 AND p.ClaimAdjustmentReasonCode8 IS NOT NULL
			<cfif IsDate(ServiceDateFrom) AND (ServiceDateFromParameter EQ "GT" OR ServiceDateFromParameter EQ "LT")>
				AND pro.ServiceDateFrom <cfif ServiceDateFromParameter EQ "GT"> > <cfelseif ServiceDateFromParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateFrom)# 				
			<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
				AND pro.ServiceDateFrom > #CreateODBCDate(ServiceDateFrom)#
				AND pro.ServiceDateFrom < #CreateODBCDate(ServiceDateFromBetween)# 						
			</cfif>					
			GROUP BY p.ClaimAdjustmentReasonCode8, p.ClaimAdjustmentGroupCode1, pro.BilledAmount, pro.PaidAmount, pro.BilledQuantity, pro.procedureid
			UNION ALL
			SELECT pro.procedureid, COUNT(p.ClaimAdjustmentReasonCode11) AS codeCount, p.ClaimAdjustmentGroupCode1 AS CAGC1, p.ClaimAdjustmentReasonCode11 AS Code, pro.BilledQuantity AS Q, pro.BilledAmount, pro.PaidAmount, SUM(IFNULL(psa.MonetaryAmount2, 0)) AS AllowedAmount 
			FROM [Procedure] pro
			Join Claim c ON pro.ClaimID = c.claimID
			LEFT JOIN Procedure_MEDICARE_CLAIMADJUSTMENT p ON p.ProcedureID = pro.ProcedureID
			LEFT JOIN Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT psa ON  psa.ProcedureID = pro.ProcedureID
			WHERE c.clientID = #trim(session.clientID)# AND c.claimType = 108 AND p.ClaimAdjustmentReasonCode11 IS NOT NULL
			<cfif IsDate(ServiceDateFrom) AND (ServiceDateFromParameter EQ "GT" OR ServiceDateFromParameter EQ "LT")>
				AND pro.ServiceDateFrom <cfif ServiceDateFromParameter EQ "GT"> > <cfelseif ServiceDateFromParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateFrom)# 				
			<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
				AND pro.ServiceDateFrom > #CreateODBCDate(ServiceDateFrom)#
				AND pro.ServiceDateFrom < #CreateODBCDate(ServiceDateFromBetween)# 						
			</cfif>			
			GROUP BY p.ClaimAdjustmentReasonCode11, p.ClaimAdjustmentGroupCode1, pro.BilledAmount, pro.PaidAmount, pro.BilledQuantity, pro.procedureid
			UNION ALL
			SELECT pro.procedureid, COUNT(p.ClaimAdjustmentReasonCode14) AS codeCount, p.ClaimAdjustmentGroupCode1 AS CAGC1, p.ClaimAdjustmentReasonCode14 AS Code, pro.BilledQuantity AS Q, pro.BilledAmount, pro.PaidAmount, SUM(IFNULL(psa.MonetaryAmount2, 0)) AS AllowedAmount 
			FROM [Procedure] pro
			Join Claim c ON pro.ClaimID = c.claimID
			LEFT JOIN Procedure_MEDICARE_CLAIMADJUSTMENT p ON p.ProcedureID = pro.ProcedureID
			LEFT JOIN Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT psa ON  psa.ProcedureID = pro.ProcedureID
			WHERE c.clientID = #trim(session.clientID)# AND c.claimType = 108 AND p.ClaimAdjustmentReasonCode14 IS NOT NULL
			<cfif IsDate(ServiceDateFrom) AND (ServiceDateFromParameter EQ "GT" OR ServiceDateFromParameter EQ "LT")>
				AND pro.ServiceDateFrom <cfif ServiceDateFromParameter EQ "GT"> > <cfelseif ServiceDateFromParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateFrom)# 				
			<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
				AND pro.ServiceDateFrom > #CreateODBCDate(ServiceDateFrom)#
				AND pro.ServiceDateFrom < #CreateODBCDate(ServiceDateFromBetween)# 						
			</cfif>			
			GROUP BY p.ClaimAdjustmentReasonCode14, p.ClaimAdjustmentGroupCode1, pro.BilledAmount, pro.PaidAmount, pro.BilledQuantity, pro.procedureid
			UNION ALL
			SELECT pro.procedureid, COUNT(p.ClaimAdjustmentReasonCode17) AS codeCount, p.ClaimAdjustmentGroupCode1 AS CAGC1, p.ClaimAdjustmentReasonCode17 AS Code, pro.BilledQuantity AS Q, pro.BilledAmount, pro.PaidAmount, SUM(IFNULL(psa.MonetaryAmount2, 0)) AS AllowedAmount 
			FROM [Procedure] pro
			Join Claim c ON pro.ClaimID = c.claimID
			LEFT JOIN Procedure_MEDICARE_CLAIMADJUSTMENT p ON p.ProcedureID = pro.ProcedureID
			LEFT JOIN Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT psa ON  psa.ProcedureID = pro.ProcedureID
			WHERE c.clientID = #trim(session.clientID)# AND c.claimType = 108 AND p.ClaimAdjustmentReasonCode17 IS NOT NULL
			<cfif IsDate(ServiceDateFrom) AND (ServiceDateFromParameter EQ "GT" OR ServiceDateFromParameter EQ "LT")>
				AND pro.ServiceDateFrom <cfif ServiceDateFromParameter EQ "GT"> > <cfelseif ServiceDateFromParameter EQ "LT"> < </cfif> #CreateODBCDate(ServiceDateFrom)# 				
			<cfelseif IsDate(ServiceDateFrom) AND ServiceDateFromParameter EQ "between" AND IsDate(ServiceDateFromBetween)>
				AND pro.ServiceDateFrom > #CreateODBCDate(ServiceDateFrom)#
				AND pro.ServiceDateFrom < #CreateODBCDate(ServiceDateFromBetween)# 						
			</cfif>		
			GROUP BY p.ClaimAdjustmentReasonCode17, p.ClaimAdjustmentGroupCode1, pro.BilledAmount, pro.PaidAmount, pro.BilledQuantity, pro.procedureid
			</cfoutput>		
	</cfsavecontent>
			
	<cfquery name="getProcedurePRs" datasource="#trim(request.datasource)#">
		#PreserveSingleQuotes(sqlStatement)#		
	</cfquery>	
	
	<cfsavecontent variable="sqlStatement1">		
		<cfoutput>
			SELECT Code, SUM(CodeCount) AS CCount, SUM(BilledAmount) AS BA, SUM(PaidAmount) AS PA, SUM(AllowedAmount) AS AA
			FROM getProcedurePRs
			GROUP BY Code
		</cfoutput>		
	</cfsavecontent>
		
	<cfquery name="tempQuery1" dbtype="Query">		
		#PreserveSingleQuotes(sqlStatement1)#		
	</cfquery>	
	
	<!---<cfif IsDefined("url.debug")>--->
		<cfdump var="#getProcedurePRs#" expand="no">
		<cfdump var="#tempQuery1#" expand="no">
	<!---</cfif>--->
	
	<cfloop query="tempQuery1">
		<cfset totalRecords = totalRecords + CCount>
	</cfloop>
	
	<cfset qAllRows = querynew("Code,CCount,Q,Percent,BA,PA,AA")>

	<cfloop query="tempQuery1">
		<cfset QueryAddRow(qAllRows, 1)>
		<cfset temp = QuerySetCell(qAllRows, "Code", "#trim(Code)#", qAllRows.getRowcount())>
		<cfset temp = QuerySetCell(qAllRows, "CCount", "#trim(CCount)#", qAllRows.getRowcount())>		
		<cfset temp = QuerySetCell(qAllRows, "Percent", "#NumberFormat(REQUEST.percentagep(ccount, totalRecords), "0.0")#", qAllRows.getRowcount())>	
		<cfset temp = QuerySetCell(qAllRows, "BA", "#trim(BA)#", qAllRows.getRowcount())>	
		<cfset temp = QuerySetCell(qAllRows, "PA", "#trim(PA)#", qAllRows.getRowcount())>	
		<cfset temp = QuerySetCell(qAllRows, "AA", "#trim(AA)#", qAllRows.getRowcount())>			
	</cfloop>
	
	<cfsavecontent variable="sqlStatement2">		
		<cfoutput>
			SELECT Code, CCount, Percent, BA, PA, AA
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
			<strong>CLAIM&nbsp;SUMMARY&nbsp;BY&nbsp;REASON&nbsp;CODE</strong>
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
						DENIAL&nbsp;CODES
						<hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
					</td>
				</tr>			
				
				<cfloop query="tempQuery">
					
					<cfset show = "yes">
					
					<cfquery name="getCAGC" dbtype="Query">		
						SELECT CAGC1
						FROM getProcedurePRs
						WHERE Code = #trim(Code)#						
					</cfquery>		
					
					<cfquery name="getCodeDescription" datasource="#trim(request.datasource)#">
						SELECT ItemNameDisplay,ItemDescription
						FROM [MedTap].[dbo].StandardListItem		
						WHERE StandardListItemID = #trim(getCAGC.CAGC1)#	
					</cfquery>
					
					<cfquery name="getSpecificCode" datasource="#trim(request.datasource)#">
						SELECT Code, Description
						FROM pa_master.eob_medicare_claimadjustmentcode
						WHERE RecordID = #trim(Code)#
					</cfquery>		
					<cfset thisDescription = Replace(getSpecificCode.Description, "'", "\'", "ALL")>
					
					<cfif trim(BA) LTE 0>
						<cfset class = "SiteRequiredLabel">
					<cfelse>
						<cfset class = "SiteLabel">	
					</cfif>
					
					<cfif trim(getCAGC.CAGC1) EQ 107 AND (Code EQ 1 OR Code EQ 2)>
						<cfset show = "no">					
					</cfif> 
					
					<cfif show>
						<tr onclick="alert('dsdds');">
						    <td class="siteLabel"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(getCodeDescription.ItemDescription)#');" onmouseout="hideTip(this);">#trim(getCodeDescription.ItemNameDisplay)#</span>&middot;<span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(thisDescription)#');" onmouseout="hideTip(this);">#getSpecificCode.Code#</span></td>
						    <td align="center" class="#trim(class)#">#DollarFormat(trim(BA))#</td>
						    <td align="center" class="siteLabel">#DollarFormat(trim(AA))#</td>
						    <td align="center" class="siteLabel">#DollarFormat(trim(PA))#</td>
						    <td align="center" class="siteLabel">#trim(CCount)#</td>
						    <td align="center" class="siteLabel">#NumberFormat(REQUEST.percentagep(ccount, totalRecords), "0.0")#%</td>
						</tr>		
						<tr><td colspan="6"><hr color="000000" style="margin:0px;padding:0px;border-bottom:1px dashed 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;"></td></tr>
					</cfif>					
															
				</cfloop>
				
			</table>
	
		</div>
	
	</cfoutput>
	
	

