<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---    gcIsValidEmailAddress.cfm                               --->
<!--- @@NAME@@                                                   --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   General                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---   Guillermo Cruz                                           --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag was created to verify an email address sent       --->
<!--- to it. Meaning is the email address valid as typed. This   --->
<!--- tag will return a variable [validEmail] that is of         --->
<!--- boolean datatype to be able to handle the error as you     --->
<!--- wish. You can send in the name of the returned variable    --->
<!--- if you wish using the IsEmailValid parameter.              --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!---   &lt;cf_gcIsValidEmailAddress                             --->
<!---     email="[emailaddress]"&gt;                             --->
<!---@@ExampleCall@@                                             --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!---   email                                                    --->  
<!---@@RequiredParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!---   isEmailValid<br>                                         ---> 
<!---   handleError                                              ---> 
<!---@@OptionalParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!---   validEmail[boolean]                                      --->  
<!---@@ReturnedParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---   &nbsp; Created 01/09/03                                  --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>




<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->
<!------------------------------------------------------------------>

	<cfparam name="attributes.email" default="">
	<cfset email = attributes.email>

	<cfparam name="attributes.isEmailValid" default="validEmail">
	<cfset isEmailValid = attributes.isEmailValid>
	
	<cfparam name="attributes.sendErrorToCaller" default="yes">
	<cfset sendErrorToCaller = attributes.sendErrorToCaller>

	<cfparam name="emailValid" default="true">

	<cfset emailValidation = "0">


		
<!------------------------------------------------------------------>
<!--- Start the processing of this tag.                          --->
<!------------------------------------------------------------------>			
	<cfset emailValid = REQUEST.IsEmail('#trim(email)#')>	
	
	<cfif NOT sendErrorToCaller AND emailValid EQ "false">

		<cf_gcGeneralErrorTemplate
			message="The email address (#trim(email)#) is not formatted correctly.">

	<cfelse>

		<cfset "caller.#trim(isEmailValid)#" = emailValid>

	</cfif>
	
	