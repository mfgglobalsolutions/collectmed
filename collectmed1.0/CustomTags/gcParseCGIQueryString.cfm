<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@Name@@                                                   --->
<!--- gcParseCGIQueryString.cfm                                  --->
<!--- @@Name@@                                                   --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!--- General                                                    --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!--- Guillermo Cruz                                             --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               ---> 
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag will allow you to send in the CGI QueryString     --->
<!--- and change it as necessary.                                ---> 
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!--- &lt;cf_gcParseCGIQueryString&gt;                           --->
<!--- @@ExampleCall@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!--- [None]                                                     --->
<!--- @@RequiredParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!--- except (value you want excluded)<br>                       --->
<!--- include (val1=one,val2=two)                                --->
<!--- @@OptionalParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!--- parsedCGIQueryString                                       --->  
<!--- @@ReturnedParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---  Created 07/28/2004                                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.parsedCGIQueryString" default="">
	<cfset parsedCGIQueryString = attributes.parsedCGIQueryString>
	
	<cfparam name="attributes.cgiquerystring" default="">
	<cfset cgiquerystring = attributes.cgiquerystring>
	
	<cfparam name="attributes.except" default="">
	<cfset except = attributes.except>
	
	<cfparam name="attributes.include" default="">
	<cfset include = attributes.include>
	
	<cfparam name="attributes.append" default="true">
	<cfset append = attributes.append>
	
	<cfparam name="attributes.cgiVariables" default="">
	<cfset cgiVariables = attributes.cgiVariables>
	
	
		
<!------------------------------------------------------------------>
<!--- Start the processing of this page.                         --->
<!------------------------------------------------------------------>	
	
	
	<!------------------------------------------------------------------>
	<!--- Loop through the sent in CGI QueryString.                  --->
	<!------------------------------------------------------------------>	
	<cfloop list="#cgiquerystring#" delimiters="&" index="i">
		
		<!------------------------------------------------------------------>
		<!--- If the variable except is defined we want to exclude       --->
		<!--- these variables.                                           --->
		<!------------------------------------------------------------------>
		<cfif except GT "">
			
			<!------------------------------------------------------------------>
			<!--- Loop the except fields to exclude.                         --->
			<!------------------------------------------------------------------>
			<cfloop list="#except#" index="j">
				
				<!------------------------------------------------------------------>
				<!--- When looping the query string you are actually looking     --->
				<!--- at value pairs (varone=myval). Because of this you have    --->
				<!--- to parse.                                                  --->
				<!------------------------------------------------------------------>
				<cfset currentVar = ListFirst(i,"=")>
				
				<!------------------------------------------------------------------>
				<!--- If the current except variable you are looking at is       --->
				<!--- included in the list of except variables then do not       --->
				<!--- append the current variable.                               --->
				<!------------------------------------------------------------------>
				<cfif currentVar EQ j>
					<cfset append = false>
				</cfif>
				
			</cfloop>
			
		</cfif>
		
		
		<!------------------------------------------------------------------>
		<!--- If the variable checks out and append is true then go      --->
		<!--- ahead and add it to the parsed query string.               --->
		<!------------------------------------------------------------------>		
		<cfif append>
			<cfset parsedCGIQueryString = ListAppend(parsedCGIQueryString,i,CHR(38))>
		</cfif>
		
		<!------------------------------------------------------------------>
		<!--- Reset append to true for the next variable.                --->
		<!------------------------------------------------------------------>		
		<cfset append = true>
		
	</cfloop>
	
	
	
<!------------------------------------------------------------------>
<!--- If the user has placed values to be added to the           --->
<!--- CGIQueryString then add them.                              --->
<!------------------------------------------------------------------>
	<cfif include GT "">
				
		<!------------------------------------------------------------------>
		<!--- Loop through the sent in CGI QueryString.                  --->
		<!------------------------------------------------------------------>	
		<cfloop list="#cgiquerystring#" delimiters="&" index="i">
						
			<cfset cgiVariables = ListAppend(cgiVariables,ListFirst(i,"="))>			
			
		</cfloop>	
			
		<!------------------------------------------------------------------>
		<!--- Loop through the list of variables to add.                 --->
		<!------------------------------------------------------------------>	
		<cfloop list="#include#" index="j">
									
			<!------------------------------------------------------------------>
			<!--- When looping the query string you are actually looking     --->
			<!--- at value pairs (varone=myval). Because of this you have    --->
			<!--- to parse.                                                  --->
			<!------------------------------------------------------------------>
			<cfset currentVar = ListFirst(j,"=")>
			
			<!------------------------------------------------------------------>
			<!--- If the current except variable you are looking at is       --->
			<!--- included in the list of except variables then do not       --->
			<!--- append the current variable.                               --->
			<!------------------------------------------------------------------>
			<cfif NOT ListContains(cgiVariables,currentVar)>
				<cfset parsedCGIQueryString = ListAppend(parsedCGIQueryString,j,CHR(38))>		
			</cfif>				
		
		</cfloop>
	
	</cfif>	
	
	
			
<!------------------------------------------------------------------>
<!--- Return the parsed query string to the calling page.        --->
<!------------------------------------------------------------------>	
	<cfset caller.parsedCGIQueryString = parsedCGIQueryString>
	
	