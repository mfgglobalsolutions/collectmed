<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcClearSessionVariables.cfm                              --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---  General                                                   --->
<!--- @@CATEGORY@@                                               --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---  Guillermo Cruz                                            --->
<!--- @@AUTHOR@@                                                 --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This page was created to simply clear out any session      --->
<!--- variables that you might want cleared out. You can send    --->
<!--- a comma delimited list of certain session variables you    --->
<!--- want cleared or you can just call the page and all the     --->
<!--- session variables will be cleared. Or you can send in      --->
<!--- another list to delete all session varaibles except the    --->
<!--- ones in this list.                                         --->
<!--- @@DESCRIPTION@@                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!--- Will clear all session variables.<br>                      --->
<!---    &lt;cf_gcClearSessionVariables&gt;                      --->
<!---   <br><br>                                                 --->
<!--- Will clear the specified session variables. <br>           --->
<!---    &lt;cf_gcClearSessionVariables                          --->
<!---    	<br>SessionVarClearList="BeARepFlag,CRMCPMID"&gt;    --->
<!---   <br><br>                                                 --->
<!--- Will NOT clear the specified session variables but will    --->
<!--- all other session variables. <br>                          --->
<!---    &lt;cf_gcClearSessionVariables                          --->
<!---   <br>SessionVarDONOTClearList=                            --->
<!---     "PrimaryDS,gcRollCount"&gt;                            --->
<!---@@ExampleCall@@                                             --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!---   [None]                                                   --->  
<!---@@RequiredParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!---  SessionVarClearList                                       --->
<!--- <br>SessionVarDONOTClearList                               --->  
<!---@@OptionalParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!---   [None]                                                   --->  
<!---@@ReturnedParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---   &nbsp;Created 10/30/03                                   --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>

	<cfparam name="attributes.SessionVarClearList" default="">
	<cfset SessionVarClearList = attributes.SessionVarClearList>
	
	<cfparam name="attributes.SessionVarDONOTClearList" default="">
	<cfset SessionVarDONOTClearList = attributes.SessionVarDONOTClearList>
	
	<cfparam name="attributes.SessionVarClearContains" default="">
	<cfset SessionVarClearContains = attributes.SessionVarClearContains>
	
	
	
<!------------------------------------------------------------------>
<!--- Loop through list of session variables sent and            --->
<!--- clear them.                                                --->
<!------------------------------------------------------------------>
	
	<cfif SessionVarClearList NEQ "">
	
		<cfloop list="#SessionVarClearList#" index="i">
			<cfif IsDefined("session.#i#")>
				<cfset StructDelete(session,"#i#")>
			</cfif>
		</cfloop>
		
	<cfelseif SessionVarDONOTClearList NEQ "">
	
		<cfloop collection="#Session#" item="i">		
			<cfif ListFindNoCase(SessionVarDONOTClearList,i) LTE 0>
		  		<cfset StructDelete(session,"#i#")>	
			</cfif>
		</cfloop> 			
		
	<cfelseif SessionVarClearContains NEQ "">
	
		<cfloop collection="#Session#" item="i">		
			<cfif FindNoCase(SessionVarClearContains,i)>
		  		<cfset StructDelete(session,"#i#")>	
			</cfif>
		</cfloop> 					
			
	<cfelse>
		
		<cfset tempvariable = StructClear(session)>
	
	</cfif>	


