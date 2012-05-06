<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcBorderedTableOutline.cfm                               --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   General                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---    Guillermo Cruz                                          --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag will wrap any of your code in an outline table    --->
<!--- with a header and bounding box.                            --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---   &lt;cf_gcBorderedTableOutline label="The title"&gt;<br>  --->
<!---   You input goes here<br>                                  --->
<!---   &lt;/cf_gcBorderedTableOutline&gt;                       --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---  None                                                      --->  
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!--- tableWidth default="100"<br>                               --->
<!--- tableAlign left | right | <strong>center</strong><br>      --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---  [None]                                                    --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---  Created 05/05/04                                          --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>  



<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.label" default="">
	<cfset label = attributes.label>
	
	<cfparam name="attributes.labelColor" default="000000">
	<cfset labelColor = attributes.labelColor>
	
	<cfparam name="attributes.tableWidth" default="100">
	<cfset tableWidth = attributes.tableWidth>
	
	<cfparam name="attributes.tableAlign" default="left">
	<cfset tableAlign = attributes.tableAlign>
			
	<cfparam name="attributes.borderColorSpelledOut" default="black"><!---c0cddc---><!---FF9706--->
	<cfset borderColorSpelledOut = attributes.borderColorSpelledOut>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Styles needed for this page.                                                   --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<style type="text/css">
			fieldset {		
			border: 1px ridge #trim(bordercolorSpelledOut)#;
			color: ffffff;
			padding: 2px;} 
			
			legend { 			
			float: left; 		
			color: #trim(labelColor)#;
			font-family: verdana; 
			font-size:10px;} 
		</style>
		
	</cfoutput>
	
		  
		  
<!------------------------------------------------------------------>
<!--- Code for top of the Bordered Table.                        --->
<!------------------------------------------------------------------>	
	<cfif ThisTag.ExecutionMode neq "end">
	
		<cfoutput>
			<fieldset>
				<legend>#trim(label)#</legend>
					<table align="#trim(tableAlign)#" width="#trim(tableWidth)#%" border="0" cellspacing="0" cellpadding="0">	
						<tr>
							<td>	
		</cfoutput>										
									
<!------------------------------------------------------------------>
<!--- This is the code for the end of the table border           --->
<!--- below this comment is where the generated code             --->
<!--- will be output.                                            --->
<!------------------------------------------------------------------>				  
	<cfelseif ThisTag.ExecutionMode eq "end">				
						
		<cfoutput> 								
						</td>
					</tr>				
			   	</table>
			</fieldset>							
			
		</cfoutput>							
	
	</cfif>
	
	


