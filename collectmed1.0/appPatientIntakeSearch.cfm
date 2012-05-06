<!---- appIntakeSearchProcess.cfm ---->

	
	
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->			
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	<cfparam name="attributes.active" default="">
	<cfset active = attributes.active>
	
	<cfif IsDefined("form.active") AND form.active NEQ "">
		<cfset active = form.active>
	<cfelseif IsDefined("url.active") AND url.active NEQ "">
		<cfset active = url.active>	
	</cfif>
	
	<cfparam name="attributes.lastNameContains" default="">
	<cfset lastNameContains = attributes.lastNameContains>
	
	<cfif IsDefined("form.lastNameContains") AND form.lastNameContains NEQ "">
		<cfset lastNameContains = form.lastNameContains>
	<cfelseif IsDefined("url.lastNameContains") AND url.lastNameContains NEQ "">
		<cfset lastNameContains = url.lastNameContains>	
	</cfif>
	
	<cfparam name="attributes.assignedToUserID" default="">
	<cfset assignedToUserID = attributes.assignedToUserID>
	
	<cfif IsDefined("form.assignedToUserID") AND form.assignedToUserID NEQ "">
		<cfset assignedToUserID = form.assignedToUserID>
	<cfelseif IsDefined("url.assignedToUserID") AND url.assignedToUserID NEQ "">
		<cfset assignedToUserID = url.assignedToUserID>	
	</cfif>
		
	<cfparam name="attributes.dateCreated" default="">
	<cfset dateCreated = attributes.dateCreated>
	
	<cfif IsDefined("form.dateCreated") AND form.dateCreated NEQ "">
		<cfset dateCreated = form.dateCreated>
	<cfelseif IsDefined("url.dateCreated") AND url.dateCreated NEQ "">
		<cfset dateCreated = url.dateCreated>	
	</cfif>
	
	<cfparam name="attributes.dateCreatedBetween" default="">
	<cfset dateCreatedBetween = attributes.dateCreatedBetween>
	
	<cfif IsDefined("form.dateCreatedBetween") AND form.dateCreatedBetween NEQ "">
		<cfset dateCreatedBetween = form.dateCreatedBetween>
	<cfelseif IsDefined("url.dateCreatedBetween") AND url.dateCreatedBetween NEQ "">
		<cfset dateCreatedBetween = url.dateCreatedBetween>	
	</cfif>
	
	<cfparam name="attributes.dateCreatedParameter" default="">
	<cfset dateCreatedParameter = attributes.dateCreatedParameter>
	
	<cfif IsDefined("form.dateCreatedParameter") AND form.dateCreatedParameter NEQ "">
		<cfset dateCreatedParameter = form.dateCreatedParameter>
	<cfelseif IsDefined("url.dateCreatedParameter") AND url.dateCreatedParameter NEQ "">
		<cfset dateCreatedParameter = url.dateCreatedParameter>	
	</cfif>
	
	<cfparam name="attributes.intakeIDs" default="">
	<cfset intakeIDs = attributes.intakeIDs>
	
	<cfif IsDefined("form.intakeIDs") AND form.intakeIDs NEQ "">
		<cfset intakeIDs = form.intakeIDs>
	<cfelseif IsDefined("url.intakeIDs") AND url.intakeIDs NEQ "">
		<cfset intakeIDs = url.intakeIDs>	
	</cfif>
	
	<cfparam name="attributes.id" default="">
	<cfset id = attributes.id>
	
	<cfif IsDefined("form.id") AND form.id NEQ "">
		<cfset id = form.id>
	<cfelseif IsDefined("url.id") AND url.id NEQ "">
		<cfset id = url.id>	
	</cfif>
	
	<cfparam name="attributes.clear" default="0">
	<cfset clear = attributes.clear>
	
	<cfif IsDefined("form.clear") AND form.clear NEQ "">
		<cfset clear = form.clear>
	<cfelseif IsDefined("url.clear") AND url.clear NEQ "">
		<cfset clear = url.clear>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- tab needed code.                                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script type="text/javascript" src="includes/tabber.js"></script>
		<link rel="stylesheet" href="styles/tabber.css" TYPE="text/css" MEDIA="screen">
		
		<script type="text/javascript">
			document.write('<style type="text/css">.tabber{display:none;}<\/style>');
		</script>
	</cfoutput>	
		
	
				
<!-------------------------------------------------------------------------------------->
<!--- The following parameters need to stay this way due to the way that cfparam     --->
<!--- handles the setting of these even when session is defined for them.            --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.OrderBy") AND form.OrderBy NEQ "">
		<cfset session.OrderBy = form.OrderBy>		
	<cfelseif IsDefined("url.OrderBy") AND url.OrderBy NEQ "">
		<cfset session.OrderBy = url.OrderBy>		
	<cfelseif IsDefined("session.OrderBy") AND session.OrderBy NEQ "">
		<cfset session.OrderBy = session.OrderBy>		
	<cfelse>
		<cfset session.OrderBy = "">		
	</cfif>
		
	<cfif IsDefined("form.Order") AND form.Order NEQ "">
		<cfset session.Order = form.Order>
	<cfelseif IsDefined("url.Order") AND url.Order NEQ "">
		<cfset session.Order = url.Order>	
	<cfelseif IsDefined("session.Order") AND session.Order NEQ "">
		<cfset session.Order = session.Order>	
	<cfelse>
		<cfset session.Order = "ASC">		
	</cfif>
		
		
				
<!-------------------------------------------------------------------------------------->
<!--- Any scripts that would cause this page to fail                                 --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDate(dateCreated) AND IsDate(dateCreatedBetween) AND dateCreated GT dateCreatedBetween>
		<cf_gcGeneralErrorTemplate				
			message="There is an issue with the Created Date values please check then and resubmit your search.">
	<cfelseif IsDate(datecreated) AND IsDate(datecreatedBetween) AND datecreated GT datecreatedBetween>
		<cf_gcGeneralErrorTemplate				
			message="There is an issue with the Due Date values please check then and resubmit your search.">	
	</cfif>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Include the file that WDDX needs to do it's job. Taken from the CFIDE folder.  --->
<!--------------------------------------------------------------------------------------> 		
	<cfoutput>		
		
		<script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>		
		
		<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
	    <cfelse>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
	    </cfif>
		
	</cfoutput>		
		
	
	

<!-------------------------------------------------------------------------------------->
<!--- CFScript needed for this page.                                                 --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<cfscript>
		/**
		 * Counts down to a date.
		 * 
		 * @param dateToApproach 	 Date to count down to. (Required)
		 * @param returnMode 	 Either "text" or "struct." If text, returns a string, otherwise returns structure with keys for years, months, days, hours, and minutes. (Optional)
		 * @return Returns a string or structure. 
		 * @author Nathan Dintenfass (nathan@changemedia.com) 
		 * @version 1, October 11, 2002 
		 */
		function countdown(dateToApproach){
			//what mode should we return?  by default, return text
			var returnMode = "text";
			//parse the dateToApproach argument
			var dateToUse = parseDateTime(dateToApproach);
			//grab now(), so we don't have to do it over and over
			var rightNow = now();
			//a struct to hold the data for the countdown
			var countdownData = structNew();
			//a string used to return
			var returnString = "";
			//var to hold the sum to determine if it has passed
			var sum = "";
			//a var to tack on the beginning and end of string return
			var prefix = "";
			var suffix = "";
			//if there is a second argument, make that the returnMode
			if(arrayLen(arguments) GT 1)
				returnMode = arguments[2];
			//get the absolute difference in years, months, days, hours, minutes and seconds
			countdownData.years = dateDiff("yyyy",rightNow,dateToUse);
			countdownData.months = dateDiff("m",rightNow,dateToUse);
			countdownData.days = dateDiff("d",rightNow,dateToUse);		
			countdownData.hours = dateDiff("h",rightNow,dateToUse);
			countdownData.minutes = dateDiff("n",rightNow,dateToUse);
			countdownData.seconds = dateDiff("s",rightNow,dateToUse) - (60*countdownData.minutes);
			//now go back through them in reverse order and delete off the appropriate units
			countdownData.minutes = countdownData.minutes - (60*countdownData.hours);
			countdownData.hours = countdownData.hours - (24*countDownData.days);
			countdownData.days = countdownData.days - dateDiff("d",dateAdd("m",-1*countDownData.months,dateToUse),dateToUse);
			countdownData.months = countdownData.months - (12*countdownData.years);		
			//if we're returning a struct, just do it
			if(returnMode is "struct")
				return countdownData;
			//otherwise, we'll output a string
			//first, gather the sum, to know if it's future or past
			sum = countDownData.years + countdownData.months + countdownData.days + countdownData.hours + countdownData.minutes + countdownData.seconds;
			//if the sum is 0, it's right now!
			if(NOT sum)
				return "Right Now!";
			//if the sum is negative, it's in the past, so multiply -1 for display purposes
			if(sum LT 0){
				countdownData.seconds = countdownData.seconds * -1;
				countdownData.minutes = countdownData.minutes * -1;
				countdownData.hours = countdownData.hours * -1;
				countdownData.days = countdownData.days * -1;
				countdownData.months = countdownData.months * -1;
				countdownData.years = countdownData.years * -1;
				prefix = "";
				suffix = "";
			}
			//add the suffix
			returnString = returnString & prefix;		
			//build the return string  -- showing only the units that are non 0
			if(countDownData.years)
				returnString = returnString & countdownData.years & " years ";
			if(countdownData.months)
				returnString = returnString & countdownData.months & " months ";
			if(countdownData.days)
				returnString = returnString & countdownData.days & " days ";
			if(countdownData.hours)
				returnString = returnString & countdownData.hours & " hours ";
			if(countdownData.minutes)
				returnString = returnString & countdownData.minutes & " min ";
			//if(countdownData.seconds)
				//returnString = returnString & countdownData.seconds & " seconds";
			//add the suffix
			returnString = returnString & suffix;
			//return the string
			return returnString;
		}
		</cfscript>


	</cfoutput>		
	
	
	

<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			
			function submitReprocess(field, order){
				document.SearchReProcessASCDESi.orderby.value = field; 
				document.SearchReProcessASCDESi.order.value = order; 
				SearchReProcessASCDESi.submit();
			};
			
			function assignIntake(intakeid,reassign){
				assign=window.open('appIntakeAssign.cfm?intakeid='+intakeid+'&reassign='+reassign,'assign','top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=440,height=295'); assign.focus(0);
			};
			
			function editIntake(intakeid){
				editIntake=window.open('appIntakeEdit.cfm?intakeid='+intakeid,'editIntake','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=700,height=550'); editIntake.focus(0);
			};
			
			
			
			// Utility function to fetch text from a URL
		    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
		    function _wddxSelectListGetFromURL(strURL) {
		        var objHTTP, result;
		    
		        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
		        if (window.XMLHttpRequest) {
		          objHTTP=new XMLHttpRequest();
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		    
		        // For IE browsers under Windows    
		        } else if (window.ActiveXObject) {
		          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		        }
		  
		        // Return result
		        return result;
		    }
			
			
			function getIntakeNote(data1){						
						
				var url = "#trim(request.urlReconstructed)#/ws/wsIntake.cfc?method=wsIntakeNotes&Data3=#trim(session.ClientID)#&Data1=" + escape(data1);				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {						
					spIntakeNote.innerHTML = result;			
				};
									
			};
			
			function switchSearch(){
				if(tr_IntakeSearch.style.display=='none'){
					tr_IntakeSearch.style.display='inline';
					sp_Search.innerHTML = 'Close Search';
				} 
				else{
					tr_IntakeSearch.style.display='none';
					sp_Search.innerHTML = 'Search Intakes';
				}
			}
						
		</script>
		
	</cfoutput>
	
		


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<table cellspacing="0" cellpadding="2" border="0">					
			
			<tr valign="top">
			    <td valign="top" align="right">
					<u><span id="sp_Search" class="siteLabel" style="cursor:hand" onclick="switchSearch();">Search&nbsp;Intakes</span></u>
				</td>
			</tr>	
				
			<tr id="tr_IntakeSearch" style="display:'none';" valign="top">
			    <td valign="top" align="center">
					<br><cf_tagPatientIntakeSearch>			
				</td>
			</tr>	
			
			<tr valign="top">
			    <td valign="top"><br>		
					<div class="tabber" style="margin-top:6px">							    										
					    <div id="tabIntakeDisplay" class="tabbertab">
							<h2><span id="tabIntakeVerbage">Intakes</span></h2>
							<cfinclude template="tagIntakeDisplay.cfm">
					    </div>									
						<div id="tabIntakeDisplayClosed" class="tabbertab">
							<h2><span id="tabIntakeClosedVerbage">Closed</span></h2>
							<cfinclude template="tagIntakeDisplayClosed.cfm">
					    </div>		
						<div id="tabIntakeDisplayCancelled" class="tabbertab">
							<h2><span id="tabIntakeCancelledVerbage">Closed</span></h2>
							<cfinclude template="tagIntakeDisplayCancelled.cfm">
					    </div>														
					</div>
					
					<!-------------------------------------------------------------------------------------->
					<!--- Show this tab.                                                                 --->
					<!-------------------------------------------------------------------------------------->									
					<cfoutput>				
						<cfif IsDefined("form.rowsPerPage_Intake") OR IsDefined("url.startRow_Intake")>								
							<script language="JavaScript">
								document.getElementById("tabIntakeDisplay").className = 'tabbertab tabbertabdefault';
							</script>
						<cfelseif IsDefined("form.rowsPerPage_ClosedIntake") OR IsDefined("url.startRow_ClosedIntake")><!--- OR IsDefined("form.SubmittedReminder")--->								
							<script language="JavaScript">
								document.getElementById("tabIntakeDisplayClosed").className = 'tabbertab tabbertabdefault';
							</script>
						<cfelseif IsDefined("form.rowsPerPage_CancelledIntake") OR IsDefined("url.startRow_CancelledIntake")><!--- OR IsDefined("form.SubmittedReminder")--->								
							<script language="JavaScript">
								document.getElementById("tabIntakeDisplayCancelled").className = 'tabbertab tabbertabdefault';
							</script>	
						<cfelse>
							<script language="JavaScript">
								document.getElementById("tabIntakeDisplay").className = 'tabbertab tabbertabdefault';																
							</script>
						</cfif>													
					</cfoutput>
					
				</td>
			</tr>							
		</table>	
		
		<cfif clear>
			<script language="JavaScript">
				switchSearch();
			</script>
		</cfif>
	
	</cfoutput>
	
	