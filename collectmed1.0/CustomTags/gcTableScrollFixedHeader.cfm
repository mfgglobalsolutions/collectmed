<!--- gcTableScrollFixedHeader.cfm --->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.headers" default="">
	<cfset headers = attributes.headers>
	
	<cfparam name="attributes.headersAlign" default="">
	<cfset headersAlign = attributes.headersAlign>
	
	<cfparam name="attributes.randRange" default="#randRange(1001, 2252)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.mainWidth" default="500">
	<cfset mainWidth = attributes.mainWidth>
	
	<cfparam name="attributes.mainHeight" default="150">
	<cfset mainHeight = attributes.mainHeight>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="headers"
		fieldnames="Headers">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- If the headersAlign varaiable is not blank it should match in length with the  --->
<!--- headers variable.                                                              --->
<!-------------------------------------------------------------------------------------->
	<cfif headersAlign NEQ "" AND listlen(headers) NEQ listlen(headersAlign)>
		<cf_gcGeneralErrorTemplate				
			message="The Headers and the Headers Align variables do not match in length. [#listlen(headers)# NEQ #listlen(headersAlign)#]"
			back="no">			
	</cfif>
		
	
		
<!-------------------------------------------------------------------------------------->
<!--- CSS needed for this page.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<style type="text/css">
			<!--
			/* define height and width of scrollable area. Add 16px to width for scrollbar          */
			/* allow WinIE to scale 100% width of browser by not defining a width                   */
			/* WARNING: applying a background here may cause problems with scrolling in WinIE 5.x   */
			div.tableContainer_#RandRange# {
				clear: both;
				border: 0px solid ##CCFFFCC;
				height: #mainHeight#px;
				overflow: auto;
				/*width: 500px;*/
			}
			
			/* WinIE 6.x needs to re-account for it's scrollbar. Give it some padding */
			\html div.tableContainer_#RandRange#/* */ {
				padding: 0 0px 0 0;/* 1 instead of 16. This is the width for the table to fill but the scrollbar is suppose to have 16 pix */
				width: #mainWidth#px; /* WIDTH OF THE MAIN TABLE */
			}
			
			/* clean up for allowing display Opera 5.x/6.x and MacIE 5.x */
			html>body div.tableContainer_#RandRange# {
				height: auto;
				padding: 0;
			}
			
			/* Reset overflow value to hidden for all non-IE browsers. */
			/* Filter out Opera 5.x/6.x and MacIE 5.x                  */
			head:first-child+body div[class].tableContainer_#RandRange# {
				height: 285px;
				overflow: hidden;
				width: 100%;
			}
			
			/* define width of table. IE browsers only                 */
			/* if width is set to 100%, you can remove the width       */
			/* property from div.tableContainer and have the div scale */
			div.tableContainer_#RandRange# table {
				float: left;
				width: 100%
			}
			
			/* WinIE 6.x needs to re-account for padding. Give it a negative margin */
			\html div.tableContainer_#RandRange# table/* */ {
				margin: 0 -16px 0 0
			}
			
			/* define width of table. Opera 5.x/6.x and MacIE 5.x */
			html>body div.tableContainer_#RandRange# table {
				float: none;
				margin: 0;
				width: 100%;
			}
			
			/* define width of table. Add 16px to width for scrollbar.           */
			/* All other non-IE browsers. Filter out Opera 5.x/6.x and MacIE 5.x */
			head:first-child+body div[class].tableContainer_#RandRange# table {
				width: 100%
			}
			
			/* set table header to a fixed position. WinIE 6.x only                                       */
			/* In WinIE 6.x, any element with a position property set to relative and is a child of       */
			/* an element that has an overflow property set, the relative value translates into fixed.    */
			/* Ex: parent element DIV with a class of tableContainer has an overflow property set to auto */
			thead.fixedHeader_#RandRange# tr {
				position: relative;
				/* expression is for WinIE 5.x only. Remove to validate and for pure CSS solution      */
				top: expression(document.getElementById("tableContainer_#RandRange#").scrollTop);
			}
			
			
			/* make the TH elements pretty */
			thead.fixedHeader_#RandRange# th {
				background: c0cddc;
				border-left: 1px solid c0cddc;
				border-right: 1px solid c0cddc;
				border-top: 1px solid c0cddc;
				font-weight: normal;
				padding: 3px 2px;
				/*text-align: left*/
			}
			
			
			
			/* make TD elements pretty. Provide alternating classes for striping the table */		
			tbody.scrollContent_#RandRange# td, tbody.scrollContent_#RandRange# tr.normalRow td {
				/*background: ##FFF;*/
				border-bottom: 0px solid ##FFF;
				border-left: 0px solid ##FFF;
				border-right: 0px solid ##FFF;
				border-top: 0px solid ##FF6666;
				padding: 2px 3px 3px 4px
			}
			
			/*tbody.scrollContent tr.alternateRow td {
				background: ##EEE;
				border-bottom: none;
				border-left: none;
				border-right: 1px solid ##FFF;
				border-top: 1px solid ##FFF;
				padding: 2px 3px 3px 4px
			}*/
			
			/* define width of TH elements: 1st, 2nd, and 3rd respectively.      */
			/* All other non-IE browsers. Filter out Opera 5.x/6.x and MacIE 5.x */
			/* Add 16px to last TH for scrollbar padding                         */		
			head:first-child+body thead[class].fixedHeader_#RandRange# th {
				width: 100%
			}
			
			head:first-child+body thead[class].fixedHeader_#RandRange# th + th {
				width: 100%
			}
			
			head:first-child+body thead[class].fixedHeader_#RandRange# th + th + th {
				border-right: none;
				padding: 4px 4px 4px 3px;
				width: 100%
			}
			
			/* define width of TH elements: 1st, 2nd, and 3rd respectively.      */
			/* All other non-IE browsers. Filter out Opera 5.x/6.x and MacIE 5.x */
			/* Add 16px to last TH for scrollbar padding                         */		
			head:first-child+body tbody[class].scrollContent_#RandRange# td {
				width: 100%
			}
			
			head:first-child+body tbody[class].scrollContent_#RandRange# td + td {
				width: 100%
			}
			
			head:first-child+body tbody[class].scrollContent_#RandRange# td + td + td {
				border-right: none;
				padding: 2px 4px 2px 3px;
				width: 100%
			}
			-->
		</style>
	
	</cfoutput>	

	
		
<!-------------------------------------------------------------------------------------->
<!--- Beginning Code                                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfif ThisTag.ExecutionMode neq "end">
		
		<cfoutput>
		
			<div id="tableContainer_#RandRange#" class="tableContainer_#RandRange#">
							
				<table border="0" bordercolor="c0c0c0" cellpadding="0" cellspacing="0">
					
					<thead class="fixedHeader_#RandRange#" id="fixedHeader_#RandRange#">
						<tr>			
							<cfloop from="1" to="#listLen(trim(headers))#" index="i">
								<cfif headersAlign NEQ "">
									<cfif ListGetAt(headers, i) EQ "*">
										<th align="#ListGetAt(headersAlign, i)#">&nbsp;</th>
									<cfelse>
										<th align="#ListGetAt(headersAlign, i)#">#ListGetAt(headers, i)#</th>	
									</cfif>										
								<cfelse>	
									<cfif ListGetAt(headers, i) EQ "*">
										<th>&nbsp;</th>
									<cfelse>
										<th>#ListGetAt(headers, i)#</th>	
									</cfif>		
								</cfif>														
							</cfloop>							
						</tr>
					</thead>
					
					<tbody class="scrollContent_#RandRange#">			
			
		</cfoutput>
	
	
	
<!------------------------------------------------------------------>
<!--- This is the code for the end of the table border           --->
<!--- below this comment is where the generated code             --->
<!--- will be output.                                            --->
<!------------------------------------------------------------------>				  
	<cfelseif ThisTag.ExecutionMode eq "end">			
	
		<cfoutput>
		
					</tbody>
							
				</table>
							
			</div>				
							
		</cfoutput>
	
	</cfif>