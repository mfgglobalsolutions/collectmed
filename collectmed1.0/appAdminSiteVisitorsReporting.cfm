<!------------------------------------------------------------------>
<!--- NAME: appAdminSiteVisitorsReporting.cfm                    --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="request.datasource" default="#request.datasource#">
	<cfset datasource = request.datasource>
	
	<cfparam name="URL.date" default="#Now()#">
	<cfset date = URL.date>
	
	<cfparam name="monthsVisitors" default="0">
		
	<cfparam name="day" default="#day(date)#">
		
	<cfparam name="month" default="#month(date)#">	
		
	<cfparam name="year" default="#year(date)#">	
	
	<cfparam name="DateCreatedTodayStart" default="#CreateODBCDateTime(CreateDateTime(year, month, day, 0, 0 ,0))#">
	
	<cfparam name="DateCreatedTodayEnd" default="#CreateODBCDateTime(CreateDateTime(year, month, day, 23, 59,59))#">

	<cfparam name="DateCreatedYesterdayStart" default="#CreateODBCDateTime(CreateDateTime(year, month, day, 0, 0 ,0))#">
	
	<cfset DateCreatedYesterdayStart = dateAdd("d", -1, DateCreatedYesterdayStart)>
		
	<cfparam name="DateCreatedYesterdayEnd" default="#CreateODBCDateTime(CreateDateTime(year, month, day, 23, 59,59))#">

	<cfset DateCreatedYesterdayEnd = dateAdd("d", -1, DateCreatedYesterdayEnd)>	
	
	
		
<!------------------------------------------------------------------>
<!--- Get all the visits from today.                             --->
<!------------------------------------------------------------------>	
	<cfquery name="TodaysVisitors" datasource="#datasource#">
		SELECT DISTINCT(IPAddress)
		FROM pagehit
		WHERE DateCreated >= #DateCreatedTodayStart#
			 AND DateCreated <= #DateCreatedTodayEnd#			 
	</cfquery>

	<cfoutput>
		<font face="#request.Site.getFont#" size="2">	
			<br>Total Visitors Today #dateFormat(date, "mm/dd/yyyy")#: #TodaysVisitors.RecordCount#<br>
		</font>	
	</cfoutput>
	
	
		
<!------------------------------------------------------------------>
<!--- Get all the visits from yesterday.                         --->
<!------------------------------------------------------------------>	
	<cfquery name="YesterdaysVisitors" datasource="#datasource#">
		SELECT DISTINCT(IPAddress)
		FROM pagehit
		WHERE DateCreated >= #DateCreatedYesterdayStart#
			 AND DateCreated <= #DateCreatedYesterdayEnd#			 
	</cfquery>

	<cfoutput>
		<font face="#request.Site.getFont#" size="2">	
			Total Visitors Yesterday #dateFormat(dateAdd("d", -1, date), "mm/dd/yyyy")#: #YesterdaysVisitors.RecordCount#<br>
		</font>	
	</cfoutput>
	
	
			
<!------------------------------------------------------------------>
<!--- Call the tag that will break up the month sent in and      --->
<!--- it will return the days in the month broken up by weeks    --->
<!--- that then can be processed.                                --->
<!------------------------------------------------------------------>
	<cf_gcTagDatesOfWeeksInMonth 
		specificMonth="#month#" 
		specificYear="#year#">
		
		
				
<!------------------------------------------------------------------>
<!--- Loop through the dates of the month broken into weeks      --->
<!--- and get the visitors for that week.                        --->
<!------------------------------------------------------------------>				
	<cfoutput>
		<font face="#request.Site.getFont#" size="2">	
			<br>Visitors for the weeks of #MonthAsString(month)# #year#<br>
		</font>	
	</cfoutput>	
	
	<cfloop from="1" to="#ArrayLen(WeeksOfMonth)#" index="i">		
		
		<cfset startOfWeek = CreateODBCDateTime(CreateDateTime(year, month, WeeksOfMonth[i][1], 23, 59,59))>
		<cfset endOfWeek = CreateODBCDateTime(CreateDateTime(year, month, WeeksOfMonth[i][2], 23, 59,59))>
		
		<cfquery name="thisWeeksVisitors" datasource="#datasource#">
			SELECT DISTINCT(IPAddress)
			FROM pagehit
			WHERE DateCreated >= #startOfWeek#
				 AND DateCreated <= #endOfWeek#			 
		</cfquery>
		
		<cfset monthsVisitors = evaluate(monthsVisitors + thisWeeksVisitors.RecordCount)>
			
		<cfoutput>
			<font face="#request.Site.getFont#" size="2">	
				Week #i# (#WeeksOfMonth[i][1]# - #WeeksOfMonth[i][2]#): #thisWeeksVisitors.RecordCount#<br>
			</font>		
		</cfoutput>	
		
	</cfloop>	
	
	<cfoutput>
		<font face="#request.Site.getFont#" size="2">	
			<br>Total Visitors this Month: #monthsVisitors#<P>
			<cfset months = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec">
			<cfloop from="1" to="12" index="i">
				<cfset currentMonth = ListGetAt(months,i)>
				<a href="appAdminSiteVisitorsReporting.cfm?date=#i#/#day(NOW())#/#year#">#currentMonth#</a>&nbsp;&nbsp;
			</cfloop>			
			<p><p>
			
			<a href="appAdminByPageReporting.cfm">By page reporting</a><p><p>
		</font>	
	</cfoutput>	
	
	
