<!------------------------------------------------------------------>
<!--- NAME: tagDatesOfWeeksInMonth                               --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!--- This tag was created to break up the month into            --->
<!--- specific weeks with the dates that belong in that          --->
<!--- week. This tag breaks up the month by starting each        --->
<!--- week on Sunday and calculating the rest of the month.      --->
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:  Created 04/18/02 GCruz                           --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>





<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>

	<cfparam name="attributes.specificMonth" default="#month(now())#">
	<cfset specificMonth = attributes.specificMonth>
		
	<cfparam name="attributes.specificYear" default="#year(now())#">
	<cfset specificYear = attributes.specificYear>	
	
	<cfparam name="attributes.queryname" default="weeksOfMonth">
	<cfset queryname = attributes.queryname>	
	
	<cfparam name="attributes.debug" default="no">
	<cfset debug = attributes.debug>
	
	<cfif IsDefined("URL.debug") AND URL.debug NEQ "">
		<cfparam name="URL.debug" default="no">
		<cfset debug = URL.debug>
	</cfif>		
	
	<cfparam name="sundaysOfMonth" default="">
	
	
	
	
	
<!------------------------------------------------------------------>
<!--- Find the first Sunday of the month to base all other       --->
<!--- calculation on.                                            --->
<!------------------------------------------------------------------>
	
	<cfloop from="1" to="7" index="i">	
		<cfset dateToCompare = CreateODBCDateTime(CreateDateTime(specificYear, specificMonth, i, 00, 00, 01))>	
		<cfif DayOfWeek(dateToCompare) EQ 1>
			<cfset firstSundayOfMonth = i>			
		</cfif>
	</cfloop>	
	
	
	<cfif debug>
		<font face="Arial" size="1" color="red">
			DEBUG:<br>
			<cfoutput>			
				firstSundayOfMonth is on the: #firstSundayOfMonth#				
			</cfoutput>
		</font><p>	
	</cfif>




<!------------------------------------------------------------------>
<!--- If the first Sunday of the current month is not equal      --->
<!--- to 1 then calculate the sundays in the month thats         --->
<!--- the day that the week starts.                              --->
<!------------------------------------------------------------------>
	
	<cfif firstSundayOfMonth NEQ 1>
		
		<cfloop from="1" to="#DaysInMonth(CreateODBCDateTime(CreateDateTime(specificYear, specificMonth, 1, 00, 00, 01)))#" index="i">	
			<cfset dateToCompare = CreateODBCDateTime(CreateDateTime(specificYear, specificMonth, i, 00, 00, 01))>	
			<cfif DayOfWeek(dateToCompare) EQ 1>
				<cfset sundaysOfMonth = ListAppend(sundaysOfMonth, i)>
			</cfif>
		</cfloop>		
		
	<cfelse>
		
		<cfset sundaysOfMonth = "1,8,15,22,29">		
		
	</cfif>
	
	
	<cfif debug>
		<font face="Arial" size="1" color="red">
			DEBUG:<br>
			<cfoutput>			
				sundaysOfMonth is on the: #sundaysOfMonth#			
				<p>
			</cfoutput>
		</font>
	</cfif>
	
	
	
<!------------------------------------------------------------------>
<!--- Create the array that will hold the dates of the           --->
<!--- weeks for the specific month you  pass in.                 --->
<!------------------------------------------------------------------>

	<cfset monthInWeeks = ArrayNew(2)>
	
	
	
	
	
<!------------------------------------------------------------------>
<!--- because a month can start on any other day other than      --->
<!--- one you must add it back in if its the case.               --->
<!------------------------------------------------------------------>
	
	<cfif ListFirst(sundaysOfMonth) NEQ 1>
		<cfset monthInWeeks[1][1] = 1>
		<cfset monthInWeeks[1][2] = evaluate(ListFirst(sundaysOfMonth) - 1)>
	</cfif>
	
	

	
	
<!------------------------------------------------------------------>
<!--- You want to take the last week of the month of the         --->
<!--- list that normally has 7 days. The last week could         --->
<!--- be 1 through 7 days long depending on the month and        --->
<!--- has to be processed differently.                           --->
<!------------------------------------------------------------------>
	
	<cfset lastSundayOfMonth = ListLast(sundaysOfMonth)>
	<cfset sundaysOfMonth = ListDeleteAt(sundaysOfMonth, ListLen(sundaysOfMonth))>
	
	
	
	
<!------------------------------------------------------------------>
<!--- If the Array already has the first week appended to        --->
<!--- it from above then just set the current to 1               --->
<!--- otherwise you have to increment it.                        --->
<!------------------------------------------------------------------>	
	
	<cfif ArrayLen(monthInWeeks) EQ 1>
		<cfset CurrentArrayRow = ArrayLen(monthInWeeks) + 1>
	<cfelse>
		<cfset CurrentArrayRow = 1>
	</cfif>


	

<!------------------------------------------------------------------>
<!--- The remainder of the list of sundays needs to have         --->
<!--- its end date calculated. this loop will loop through       --->
<!--- them and append to the array the dates that are needed     --->
<!------------------------------------------------------------------>	
	
	<cfloop list="#sundaysOfMonth#" index="i">
		<cfset weekStart = i>
		<cfset weekEnd = evaluate(i + 6)>		
		<cfset monthInWeeks[CurrentArrayRow][1] = weekStart>
		<cfset monthInWeeks[CurrentArrayRow][2] = weekEnd>
		<cfset CurrentArrayRow = CurrentArrayRow + 1>	
	</cfloop>
	

		

		
<!------------------------------------------------------------------>
<!--- The last week of the month has to be calculated            --->
<!--- differently because the end of that week could be          --->
<!--- shorter than 7 days.                                       --->
<!------------------------------------------------------------------>	

	<cfset monthInWeeks[CurrentArrayRow][1] = lastSundayOfMonth>
	<cfset monthInWeeks[CurrentArrayRow][2] = DaysInMonth(CreateDate(specificYear, specificMonth, 1))>
	
	
	
		
<!------------------------------------------------------------------>
<!--- Display the array if url "debug=yes" is requested.         --->
<!------------------------------------------------------------------>	
	
	<cfif debug EQ "yes">	
		<font face="Arial" size="1" color="red">	
			DEBUG:<br>
			<cfloop from="1" to="#ArrayLen(monthInWeeks)#" index="i">
				<cfloop from="1" to="#ArrayLen(monthInWeeks[i])#" index="j">
					<cfoutput>					
							[#monthInWeeks[i][j]#]					
					</cfoutput>
				</cfloop><P>
			</cfloop>
		</font>		
	</cfif>
	
	
		
		
<!------------------------------------------------------------------>
<!--- Set the caller scope to the page that calls this page.     --->
<!------------------------------------------------------------------>
	
	<cfset "caller.#queryname#" = monthInWeeks>
	<cfset caller.Month = attributes.specificMonth>
	<cfset caller.Year = attributes.specificYear>	
