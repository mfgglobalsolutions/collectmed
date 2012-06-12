
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.chartType" default="pie2">
	<cfset chartType = attributes.chartType>
	
	<cfif IsDefined("form.chartType") AND form.chartType NEQ "">
		<cfset chartType = form.chartType>
	<cfelseif IsDefined("url.chartType") AND url.chartType NEQ "">
		<cfset chartType = url.chartType>	
	</cfif>
	
	<cfparam name="attributes.pieSliceStyle" default="solid">
	<cfset pieSliceStyle = attributes.pieSliceStyle>
	
	<cfif IsDefined("form.pieSliceStyle") AND form.pieSliceStyle NEQ "">
		<cfset pieSliceStyle = form.pieSliceStyle>
	<cfelseif IsDefined("url.pieSliceStyle") AND url.pieSliceStyle NEQ "">
		<cfset pieSliceStyle = url.pieSliceStyle>	
	</cfif>
	
	<cfparam name="attributes.format" default="flash">
	<cfset format = attributes.format>
	
	<cfif IsDefined("form.format") AND form.format NEQ "">
		<cfset format = form.format>
	<cfelseif IsDefined("url.format") AND url.format NEQ "">
		<cfset format = url.format>	
	</cfif>


	
<!-------------------------------------------------------------------------------------->
<!--- Show the dropdown chart choice.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		&nbsp;
		<p>
			<span class="SiteLabelLarge">Chart&nbsp;Type:&nbsp;</span><select name="listID" class="SiteSelectBox" onchange="location='#CGI.script_name#?id=#trim(id)#&chartType='+this.options.value;">
				<option value="bar" <cfif chartType EQ "bar">SELECTED</cfif>> Bar
				<option value="line" <cfif chartType EQ "line">SELECTED</cfif>> Line 
				<option value="pyramid" <cfif chartType EQ "pyramid">SELECTED</cfif>> Pyramid 
				<option value="area" <cfif chartType EQ "area">SELECTED</cfif>> Area 
				<option value="horizontalbar" <cfif chartType EQ "horizontalbar">SELECTED</cfif>> Horizontal Bar 
				<option value="cone" <cfif chartType EQ "cone">SELECTED</cfif>> Cone 
				<option value="curve" <cfif chartType EQ "curve">SELECTED</cfif>> Curve 
				<option value="cylinder" <cfif chartType EQ "cylinder">SELECTED</cfif>> Cylinder 
				<option value="step" <cfif chartType EQ "step">SELECTED</cfif>> Step 
				<option value="scatter" <cfif chartType EQ "scatter">SELECTED</cfif>> Scatter 
				<option value="pie" <cfif chartType EQ "pie">SELECTED</cfif>> Pie 
				<option value="pie2" <cfif chartType EQ "pie2">SELECTED</cfif>> Pie 2						
			</select>
		</p>
	</cfoutput>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the Available Procedure Codes to search by.                                --->
<!-------------------------------------------------------------------------------------->		
	<cfquery name="getDenialCodes" datasource="#trim(request.datasource)#">		
		SELECT COUNT(ClaimAdjustmentReasonCode2) AS codeCount, ClaimAdjustmentReasonCode2 as Code
		FROM procedure_medicare_claimadjustment 
		WHERE ClaimAdjustmentReasonCode2 IS NOT NULL
		GROUP BY ClaimAdjustmentReasonCode2
		UNION ALL
		SELECT COUNT(ClaimAdjustmentReasonCode5) AS codeCount, ClaimAdjustmentReasonCode5 AS Code
		FROM procedure_medicare_claimadjustment 
		WHERE ClaimAdjustmentReasonCode5 IS NOT NULL
		GROUP BY ClaimAdjustmentReasonCode5
		UNION ALL
		SELECT COUNT(ClaimAdjustmentReasonCode8) AS codeCount, ClaimAdjustmentReasonCode8 AS Code
		FROM procedure_medicare_claimadjustment 
		WHERE ClaimAdjustmentReasonCode8 IS NOT NULL
		GROUP BY ClaimAdjustmentReasonCode8
		UNION ALL
		SELECT COUNT(ClaimAdjustmentReasonCode11) AS codeCount, ClaimAdjustmentReasonCode11 AS Code
		FROM procedure_medicare_claimadjustment 
		WHERE ClaimAdjustmentReasonCode11 IS NOT NULL
		GROUP BY ClaimAdjustmentReasonCode11
		UNION ALL
		SELECT COUNT(ClaimAdjustmentReasonCode14) AS codeCount, ClaimAdjustmentReasonCode14 AS Code
		FROM procedure_medicare_claimadjustment 
		WHERE ClaimAdjustmentReasonCode14 IS NOT NULL
		GROUP BY ClaimAdjustmentReasonCode14
		UNION ALL
		SELECT COUNT(ClaimAdjustmentReasonCode17) AS codeCount, ClaimAdjustmentReasonCode17 AS Code
		FROM procedure_medicare_claimadjustment 
		WHERE ClaimAdjustmentReasonCode17 IS NOT NULL
		GROUP BY ClaimAdjustmentReasonCode17
	</cfquery>
	
	<cfquery name="getCombinedDenials" dbtype="query">
		SELECT SUM(codeCount) AS valuecolumn, Code AS itemcolumn
		FROM getDenialCodes
		GROUP BY Code 
		ORDER BY valuecolumn DESC
	</cfquery>	
	
	<cfset qCodes = querynew("code, itemcolumn, valuecolumn, Description")>
	
	<cfloop query="getCombinedDenials" startrow="1" endrow="10">
		
		<cfquery name="getSpecificCode" datasource="#trim(request.datasource)#">
			SELECT Code, Description
			FROM pa_master.eob_medicare_claimadjustmentcode
			WHERE RecordID = '#trim(itemcolumn)#'
		</cfquery>
		
		<cfif getSpecificCode.RecordCount EQ 1>
			<cfset newRow  = QueryAddRow(qCodes, 1)>
			<cfset temp = QuerySetCell(qCodes, "code", "#trim(itemcolumn)#", qCodes.getRowcount())>
			<cfset temp = QuerySetCell(qCodes, "itemcolumn", "#trim(getSpecificCode.Code)#", qCodes.getRowcount())>
			<cfset temp = QuerySetCell(qCodes, "valuecolumn", "#trim(valuecolumn)#", qCodes.getRowcount())>			
			<cfset temp = QuerySetCell(qCodes, "Description", "#trim(getSpecificCode.Description)#", qCodes.getRowcount())>	
		</cfif>
				
	</cfloop>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of the chart.                                                --->
<!-------------------------------------------------------------------------------------->		
	<cfif chartType EQ "pie2">	
		
		<cfchart  title="Top 10 Denial Codes" style="/styles/eob_pie.xml" pieSliceStyle="sliced" format="#trim(format)#" fontbold="Yes" xaxistitle="Code" yaxistitle="Total" chartwidth="720" chartheight="500" show3d="Yes">
			<cfchartseries serieslabel="DenialCodes" datalabelstyle="pattern" type="pie" query="qCodes" itemcolumn="itemcolumn" valuecolumn="valuecolumn"></cfchartseries>
		</cfchart> 
	
	<cfelse>	
		
		<cfchart title="Top 10 Denial Codes" format="#trim(format)#" pieSliceStyle="#trim(pieSliceStyle)#" xaxistitle="Code" yaxistitle="Total" chartwidth="720" chartheight="500" show3d="Yes"> 
			<cfchartseries serieslabel="DenialCodes" datalabelstyle="pattern" type="#trim(chartType)#" query="qCodes" itemcolumn="itemcolumn" valuecolumn="valuecolumn"></cfchartseries>
		</cfchart> 
	
	</cfif>
	

<!-------------------------------------------------------------------------------------->
<!--- Load the Glossary.                                                             --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>		
		<table cellpadding="2" cellspacing="0" border="0">				
			<tr><td colspan="2" class="SiteLabel" nowrap>&nbsp;</td></tr>								
			<tr><td colspan="2" class="SiteLabel" nowrap><strong>GLOSSARY:</strong></td></tr>				
			<cfloop query="qCodes">
				<tr>
					<td class="siteLabel" valign="top" align="right"><strong>#trim(itemcolumn)#</strong></td>
					<td class="siteLabel" valign="top">#trim(Description)#</td>
				</tr>														
			</cfloop>																				
		</table>		
	</cfoutput>	


