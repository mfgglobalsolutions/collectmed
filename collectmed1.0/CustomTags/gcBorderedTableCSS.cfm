<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   gcBorderedTable.cfm                                      --->
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
<!--- This tag will wrap any of your code in a (curved) table    --->
<!--- with a header and bounding box.                            --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---   &lt;cf_gcBorderedTable title="The title"&gt;<br>         --->
<!---   You input goes here<br>                                  --->
<!---   &lt;/cf_gcBorderedTable&gt;                              --->
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
<!--- Curved yes | <strong>no</strong><br>                       --->
<!--- boxLineBorderColor default="cccccc"<br>                    --->
<!--- backgroundColor default="cccccc"><br>                      --->
<!--- title<br>                                                  --->
<!--- subtitle<br>                                               --->
<!--- titleFont default="arial"<br>                              --->
<!--- subTitleFont default="arial"<br>                           --->
<!--- titlesize default="3"<br>                                  --->
<!--- subtitlesize default="2"<br>                               --->
<!--- boxFont default="arial"<br>                                --->
<!--- boxFontSize default="2"<br>                                --->
<!--- boxTextAlign <strong>left</strong> | right | center<br>    --->
<!--- qnote<br>                                                  --->
<!--- view <strong>block</strong> | inline<br>                   --->
<!--- titleFontColor default="000000"<br>                        --->
<!--- topSpace yes | <strong>no</strong><br>                     --->
<!--- bottomSpace yes | <strong>no</strong><br>                  --->
<!--- titleBold <strong>yes</strong>|no<br>                      --->
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
	<cfparam name="attributes.tableWidth" default=""><!--- DO NOT put a number in here it will throw off any page calling it inside of an IFrame instead have the caller send in the tablewidth.--->
	<cfset tableWidth = attributes.tableWidth>
	
	<cfparam name="attributes.tableAlign" default="left">
	<cfset tableAlign = attributes.tableAlign>
	
	<cfparam name="attributes.dataAlign" default="center">
	<cfset dataAlign = attributes.dataAlign>
	
	<cfparam name="attributes.Curved" default="no">
	<cfset Curved = attributes.Curved>
	
	<cfparam name="attributes.boxLineBorderWidth" default="1">
	<cfset boxLineBorderWidth = attributes.boxLineBorderWidth>
	
	<cfparam name="attributes.boxLineBorderColor" default="CBD9E9"><!---DCE3EB---><!---c0cddc---><!---FF9706--->
	<cfset boxLineBorderColor = attributes.boxLineBorderColor>
	
	<cfparam name="attributes.boxLineBorderColorTop" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorTop = attributes.boxLineBorderColorTop>
	
	<cfparam name="attributes.boxLineBorderColorRight" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorRight = attributes.boxLineBorderColorRight>
	
	<cfparam name="attributes.boxLineBorderColorBottom" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorBottom = attributes.boxLineBorderColorBottom>
	
	<cfparam name="attributes.boxLineBorderColorLeft" default="#boxLineBorderColor#">
	<cfset boxLineBorderColorLeft = attributes.boxLineBorderColorLeft>
	
	<cfparam name="attributes.backgroundColor" default="DCE3EB"><!---CBD9E9---><!---c0cddc---><!---FF9706--->
	<cfset backgroundColor = attributes.backgroundColor>
	
	<cfparam name="attributes.title" default="">
	<cfset title = attributes.title>
	
	<cfparam name="attributes.subtitle" default="">
	<cfset subtitle = attributes.subtitle>
	
	<cfparam name="attributes.titleFont" default="arial">
	<cfset titleFont = attributes.titleFont>
	
	<cfparam name="attributes.subTitleFont" default="arial">
	<cfset subTitleFont = attributes.subTitleFont>		
		
	<cfparam name="attributes.titlesize" default="2">
	<cfset titlesize = attributes.titlesize>
	
	<cfparam name="attributes.subtitlesize" default="2">
	<cfset subtitlesize = attributes.subtitlesize>				
		
	<cfparam name="attributes.boxFont" default="arial">
	<cfset boxFont = attributes.boxFont>
	
	<cfparam name="attributes.boxFontSize" default="2">
	<cfset boxFontSize = attributes.boxFontSize>	
	
	<cfparam name="attributes.boxTextAlign" default="left">
	<cfset boxTextAlign = attributes.boxTextAlign>
	
	<cfparam name="attributes.qnote" default="">
	<cfset qnote = attributes.qnote>
	
	<cfparam name="attributes.view" default="block">
	<cfset view = attributes.view>
	
	<cfparam name="attributes.randRange" default="#randRange(1, 5000)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.TitleFontColor" default="003399">
	<cfset TitleFontColor = attributes.TitleFontColor>
	
	<cfparam name="attributes.topSpace" default="no">
	<cfset topSpace = attributes.topSpace>
	
	<cfparam name="attributes.bottomSpace" default="no">
	<cfset bottomSpace = attributes.bottomSpace>
	
	<cfparam name="attributes.titleBold" default="yes">
	<cfset titleBold = attributes.titleBold>
	
	<cfparam name="attributes.spanLink" default="no">
	<cfset spanLink = attributes.spanLink>
	
	<cfparam name="attributes.spanLinkTitle" default="">
	<cfset spanLinkTitle = attributes.spanLinkTitle>
	
	<cfparam name="attributes.titleRight" default="">
	<cfset titleRight = attributes.titleRight>
	
	<cfparam name="attributes.callWhenVisible" default="">
	<cfset callWhenVisible = attributes.callWhenVisible>
	
	<cfparam name="attributes.onclick" default="">
	<cfset onclick = attributes.onclick>
 

<!-------------------------------------------------------------------------------------->
<!--- CSS for any box that we create.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<style type="text/css">
			
			div.btDiv{
				border: 1px solid;
				border-color: ###boxLineBorderColor#;
			};
			
			div.spTitle{
				font-weight: bold;
				font-style: #trim(titleFont)#;
				font-size: 12;
				padding: 4px 2px 4px 4px;
				background-color: ###backgroundColor#;
				clear: both;
			};
			
		</style>
		
	</cfoutput>		  
	  
	  
<!-------------------------------------------------------------------------------------->
<!--- Code for top of the Bordered Table.                                            --->
<!-------------------------------------------------------------------------------------->
	<cfif ThisTag.ExecutionMode neq "end">
	
		<cfoutput>
			
			<div class="btDiv">
				<div class="spTitle">#trim(title)#</div>				
					<div>
		
		</cfoutput>										
									

<!-------------------------------------------------------------------------------------->
<!--- This is the code for the end of the table border below this comment is where   --->
<!--- the generated code will be output.                                             --->
<!-------------------------------------------------------------------------------------->				  
	<cfelseif ThisTag.ExecutionMode eq "end">				
						
		<cfoutput> 								
				</div>					
			</div>	   							
			
		</cfoutput>							
	
	</cfif>
	
	

