<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcListRemoveDuplicates.cfm                               --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   Strings                                                  --->		
<!--- @@CATEGORY@@                                               --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---   Guillermo Cruz                                           --->	
<!--- @@AUTHOR@@                                                 --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag takes out duplicate entries in a list. You can    --->
<!--- send in the name of the new list or it will return a       --->
<!--- variable named "newList" containing the list with          --->
<!--- duplicates taken out. You can also send in the sort        --->
<!--- type, Delimeter if different than a comma and whether or   --->
<!--- not to use case sensitivity.                               --->
<!--- @@DESCRIPTION@@                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!---   &lt;cf_gcListRemoveDuplicates                            --->
<!---   <br>list="yourlistname"&gt;                              --->
<!---@@ExampleCall@@                                             --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!---   list                                                     --->  
<!---@@RequiredParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!---  Name                                                      --->
<!--- <br>Sort(Numeric, Text, TextNoCase)                        --->
<!--- <br>CaseSensitive(boolean)                                 --->
<!--- <br>Delimeter                                              --->  
<!---@@OptionalParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!---   newList(if no Name is given)                             --->  
<!---@@ReturnedParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---   &nbsp; Created 02/25/03                                  --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.list" default="">
	<cfset list = attributes.list>
	
	<cfparam name="attributes.name" default="newList">
	<cfset name = attributes.name>
	
	<cfparam name="attributes.delimiter" default=",">
	<cfset delimiter = attributes.delimiter>
	
	<cfparam name="attributes.CaseSensitive" default="no">
	<cfset CaseSensitive = attributes.CaseSensitive>
	
	<cfparam name="attributes.Sort" default="">
	<cfset Sort = attributes.Sort>
	
	<cfparam name="attributes.tempList" default="">
	<cfset tempList = attributes.tempList>
	
	

<!------------------------------------------------------------------>
<!--- Loop through the list that was sent in and take out        --->
<!--- duplicates depending on case sensitivity then sort the     --->
<!--- list if required and then set the caller variable.         --->
<!------------------------------------------------------------------>
	<cfloop list="#List#" index="currentElement" delimiters="#delimiter#">
		<cfif CaseSensitive>
			<cfif ListFind(tempList,trim(currentElement),delimiter) eq 0>
				<cfset tempList = ListAppend(tempList,trim(currentElement),delimiter)>
			</cfif>
		<cfelse>
			<cfif ListFindNoCase(tempList,trim(currentElement),delimiter) eq 0>
				<cfset tempList = ListAppend(tempList,trim(currentElement),delimiter)>
			</cfif>
		</cfif>
	</cfloop>
	
	<cfif Sort NEQ "">
		<cfset tempList = ListSort(tempList, "#Sort#")>	
	</cfif>
	
	<cfset "caller.#name#" = tempList>

