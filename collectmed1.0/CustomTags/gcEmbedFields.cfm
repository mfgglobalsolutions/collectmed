<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcEmbedFields.cfm                                        --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---  Forms                                                     --->
<!--- @@CATEGORY@@                                               --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---  Ben Forta / Guillermo Cruz                                --->
<!--- @@AUTHOR@@                                                 --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- Cold Fusion custom tag to embed all submitted form         --->
<!--- fields as hidden fields in another form. Designed to be    --->
<!--- used within multi part forms. To use just call this        --->
<!--- module between the &lt;FORM&gt; and &lt;/FORM&gt; tags.    --->
<!--- Tag processes the comma delimited list of field names      --->
<!--- available as FORM.fieldnames (this variable is             --->
<!--- automatically available if any form fields were            --->
<!--- submitted). Each field is checked to see that it has not   --->
<!--- already been processed (if there were multiple fields      --->
<!--- with the same name then they'd appear multiple times in    --->
<!--- the FORM.fieldnames list), and then it is written out as   --->
<!--- a hidden FORM field (INPUT TYPE="hidden").                 --->
<!--- @@DESCRIPTION@@                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!---   &lt;CF_EmbedFields&gt;                                   --->
<!--- anywhere between the &lt;FORM&gt; and &lt;/FORM&gt; tags   --->
<!--- (or &lt;CFFORM&gt; and &lt;/CFFORM&gt;).                   --->
<!--- <br><br>                                                   --->
<!--- &lt;CF_EmbedFields                                         --->
<!---  <br>except="[formVarName]"&gt;                            --->
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
<!---   except                                                   --->  
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
<!---   &nbsp; Created 7/15/97                                   --->
<!---	&nbsp;<br>Added parameter to omit a certain variable to  --->
<!---  be processed as hidden 02/10/03 GC                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.except" default="">
	<cfset except = attributes.except>
	
	<cfparam name="attributes.notcontains" default="">
	<cfset notcontains = attributes.notcontains>
	
	<cfset fieldnames_processed = "">



<!-------------------------------------------------------------------------------------->
<!--- Check that fieldnames exists.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfif ParameterExists(form.fieldnames)>
		
		<cfloop index="form_element" list="#form.fieldnames#">
		 
			<!------------------------------------------------------------------>
			<!--- If the field that is currently being embeded is in         --->
			<!--- the EXCEPT list then it should not be embedded.            --->
			<!--- AND                                                        --->
			<!--- the current field does not contain this string in it.      --->
			<!------------------------------------------------------------------>		 
				<cfif NOT ListContainsNoCase(except,form_element)>		
				 
					<!--- has the element been processed. --->
					<cfif ListFind(fieldnames_processed, form_element) IS 0>
					  
						<cfif notContains NEQ "">
							<cfif NOT FindNoCase(notcontains, form_element)>							
								<cfset form_element_qualified = "form." & form_element>				
					   			<cfoutput><input type="hidden" name="#form_element#" value="#evaluate(form_element_qualified)#"></cfoutput>				
							</cfif>
					   	<cfelse>						
							<cfset form_element_qualified = "form." & form_element>				
					   		<cfoutput><input type="hidden" name="#form_element#" value="#evaluate(form_element_qualified)#"></cfoutput>			   
						</cfif>
						
					   	<cfset fieldnames_processed = ListAppend(fieldnames_processed, form_element)>
					   
					</cfif>
				 
				</cfif> 
		  
		</cfloop>
	 
	</cfif>


