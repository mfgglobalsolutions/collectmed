
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
			<span class="SiteLabelLarge">Chart&nbsp;Type:&nbsp;</span><select name="listID" class="SiteSelectBox" onchange="location='#CGI.script_name#?id=#trim(id)#&item=#trim(url.item)#&chartType='+this.options.value;">
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
	<cfquery name="getClaimStatuses" datasource="#trim(request.datasource)#">		
		SELECT cs.StatusID, count(cs.statusID) AS valuecolumn, CONCAT(vw.Fname, ' ', vw.Lname) AS itemColumn
		FROM claimstatus cs JOIN view_UserAccountParameters vw ON cs.usersID = vw.UsersID
		WHERE cs.StatusID = 199
		GROUP BY cs.UsersID, cs.statusID, vw.Fname, vw.Lname
	</cfquery>
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of the chart.                                                --->
<!-------------------------------------------------------------------------------------->			
	<cfif chartType EQ "pie2">	
		
		<cfchart url="appReportMain.cfm?series=$SERIESLABEL$&item=$ITEMLABEL$" title="Completed Claims" style="/styles/eob_pie.xml" pieSliceStyle="sliced" format="#trim(format)#" fontbold="Yes" xaxistitle="Completed" yaxistitle="Total" chartwidth="720" chartheight="500" show3d="Yes">
			<cfchartseries serieslabel="ClaimStatuses" type="pie" query="getClaimStatuses" itemcolumn="itemcolumn" valuecolumn="valuecolumn"></cfchartseries>
		</cfchart> 
	
	<cfelse>	
		
		<cfchart url="appReportMain.cfm?series=$SERIESLABEL$&item=$ITEMLABEL$" title="Completed Claims" format="#trim(format)#" pieSliceStyle="#trim(pieSliceStyle)#" xaxistitle="Completed" yaxistitle="Total" chartwidth="720" chartheight="500" show3d="Yes"> 
			<cfchartseries serieslabel="ClaimStatuses" datalabelstyle="pattern" type="#trim(chartType)#" query="getClaimStatuses" itemcolumn="itemcolumn" valuecolumn="valuecolumn"></cfchartseries>
		</cfchart> 
	
	</cfif>
	
	
