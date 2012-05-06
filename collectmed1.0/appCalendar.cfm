<!---- appCalendar.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="">
	<cfset formName = attributes.formName>
	
	<cfif IsDefined("form.formName") AND form.formName NEQ "">
		<cfset formName = form.formName>
	<cfelseif IsDefined("url.formName") AND url.formName NEQ "">
		<cfset formName = url.formName>	
	</cfif>
	
	<cfparam name="attributes.dateFieldName" default="">
	<cfset dateFieldName = attributes.dateFieldName>
	
	<cfif IsDefined("form.dateFieldName") AND form.dateFieldName NEQ "">
		<cfset dateFieldName = form.dateFieldName>
	<cfelseif IsDefined("url.dateFieldName") AND url.dateFieldName NEQ "">
		<cfset dateFieldName = url.dateFieldName>	
	</cfif>

	<!--- Determine what date to show, and last viewed Date if applicable.--->
	<cfparam name="CurntDate" default="#now()#">
	
	<cfif isdefined("MonthChange")>
		<cfif monthchange is 'forward'>
			<cfset curntdate = createodbcdate(dateadd("m", 1, lastdate))>
		<cfelse>
			<cfset curntdate = createodbcdate(dateadd("m", -1, lastdate))>
		</cfif>
	</cfif>
	
	<cfparam name="YearSet" default="#year(CurntDate)#">
	<cfparam name="MonthSet" default="#month(CurntDate)#">

	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="formName,dateFieldName"
		fieldnames="Form Name,Date Field Name">	
		



<!--- Create the date variables to search the Database by. --->
<cfset monthstart = createdatetime(yearset, monthset, 1, 0, 0, 0)>
<cfset monthend = createdatetime(yearset, monthset, daysinmonth(monthstart), 23, 59, 59)>

<!--- Code for calculating the days format to display --->
<cfset offset = dayofweek(monthstart)>
<cfset lastslot = offset + daysinmonth(monthstart)-1>
<cfset caldays = (ceiling(lastslot/7))*7>
<cfset day = 1>



<!-------------------------------------------------------------------------------------->
<!--- Javascript for this page.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			
			function keyUp(e){	  		
				if(e.type == "keypress" && e.keyCode=="13"){
		        	var d = document.getElementById("manualDate").value; 					
					validDate = isDateJS(d);							
					if(validDate == true){						
						var d_array = d.split("/");			
						setParent(d_array[0], d_array[1], d_array[2]);
					}	
		        }			
			};
			
			function setParent(month, day, year){
				var dateChosen = month + "/" + day + "/" + year;				
				window.opener.document.#trim(formName)#.#trim(dateFieldName)#.value = dateChosen;				
				window.opener.span_#trim(dateFieldName)#.innerText = formatDate(dateChosen, "NNN d, y");
				window.close();
			};						
				
			function TimeFormat(x) {return(x<0||x>9?"":"0")+x}			
			
			function formatDate(thisDate,format) {
				var date = new Date(thisDate);
				format=format+"";
				var MONTH_NAMES=new Array('January','February','March','April','May','June','July','August','September','October','November','December','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
				var DAY_NAMES=new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sun','Mon','Tue','Wed','Thu','Fri','Sat');
				var result="";
				var i_format=0;
				var c="";
				var token="";
				var y=date.getYear()+"";
				var M=date.getMonth()+1;
				var d=date.getDate();
				var E=date.getDay();
				var H=date.getHours();
				var m=date.getMinutes();
				var s=date.getSeconds();
				var yyyy,yy,MMM,MM,dd,hh,h,mm,ss,ampm,HH,H,KK,K,kk,k;
				// Convert real date parts into formatted versions
				var value=new Object();
				if (y.length < 4) {y=""+(y-0+1900);}
				value["y"]=""+y;
				value["yyyy"]=y;
				value["yy"]=y.substring(2,4);
				value["M"]=M;
				value["MM"]=TimeFormat(M);
				value["MMM"]=MONTH_NAMES[M-1];
				value["NNN"]=MONTH_NAMES[M+11];
				value["d"]=d;
				value["dd"]=TimeFormat(d);
				value["E"]=DAY_NAMES[E+7];
				value["EE"]=DAY_NAMES[E];
				value["H"]=H;
				value["HH"]=TimeFormat(H);
				if (H==0){value["h"]=12;}
				else if (H>12){value["h"]=H-12;}
				else {value["h"]=H;}
				value["hh"]=TimeFormat(value["h"]);
				if (H>11){value["K"]=H-12;} else {value["K"]=H;}
				value["k"]=H+1;
				value["KK"]=TimeFormat(value["K"]);
				value["kk"]=TimeFormat(value["k"]);
				if (H > 11) { value["a"]="PM"; }
				else { value["a"]="AM"; }
				value["m"]=m;
				value["mm"]=TimeFormat(m);
				value["s"]=s;
				value["ss"]=TimeFormat(s);
				while (i_format < format.length) {
					c=format.charAt(i_format);
					token="";
					while ((format.charAt(i_format)==c) && (i_format < format.length)) {
						token += format.charAt(i_format++);
						}
					if (value[token] != null) { result=result + value[token]; }
					else { result=result + token; }
					}
				return result;
				}
			 
		</script>
		
	</cfoutput>


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
	
		<!--- insert calendar table --->
		<table align="left" bgcolor="ffffff" cellpadding=0 cellspacing=0 border="0">
		<tr>
		<td>
		<!--- previous table is white background (shell) --->
		<table border="0" align="center">
		<tr align="center">		
			<cfoutput>
				<td colspan="1" align="center"> 
					<a href="appCalendar.cfm?formname=#trim(formname)#&dateFieldName=#dateFieldName#&MonthChange=Backward&LastDate=#DateFormat(CurntDate, "mm/dd/yyyy")#" style="text-decoration:none"><font style="font:12px arial;color:660000;">&lt;&lt;</font></a>
				</td>
				<td colspan="5" align="center"><font color="000080" style="font:12px arial;"><b>#DateFormat(CurntDate,"MMMM yyyy")#</b></font></td>
				<td>
					<a href="appCalendar.cfm?formname=#trim(formname)#&dateFieldName=#dateFieldName#&MonthChange=Forward&LastDate=#DateFormat(CurntDate, "mm/dd/yyyy")#" style="text-decoration:none"><font style="font:12px arial;color:660000;">&gt;&gt;</font></a>
				</td>
			</cfoutput>
		</tr>
		</table>
		<table border="1" cellpadding="3" bordercolor="f7f4f4" cellspacing="0">
		<tr>
			<td align="center" ><font style="font:10px arial;color:660000;">S</font></td>
			<td align="center" ><font style="font:10px arial;color:660000;">M</font></td>
			<td align="center" ><font style="font:10px arial;color:660000;">T</font></td>
			<td align="center" ><font style="font:10px arial;color:660000;">W</font></td>
			<td align="center" ><font style="font:10px arial;color:660000;">T</font></td>
			<td align="center" ><font style="font:10px arial;color:660000;">F</font></td>
			<td align="center" ><font style="font:10px arial;color:660000;">S</font></td>
		</tr>
		
		<tr>
		
			<cfloop index="ii" from="1" to="#CalDays#">
				<cfif ii gte offset and ii lte lastslot>
					
					<cfif day is datepart("d", now()) and month(curntdate) is month(now())>
						<cfset bgcolor = "003399">
						<cfset fontcolor = "ffffff">
					<cfelse>
						<cfset bgcolor = "ffffff">
						<cfset fontcolor = "003399">	
					</cfif>							
					<td valign=top align="center" bgcolor="#trim(bgcolor)#"><span onclick="setParent('#month(curntdate)#', '#Day#', '#year(curntdate)#');" style="cursor: hand; font:10px arial; color:#trim(fontcolor)#;">#Day#</span></td>
					<cfset day = day + 1>
					
				<cfelse>
					<td><font style="font:8px">&nbsp;</font></td>
				</cfif>
				
				<cfif (ii mod 7 is 0)>
				</tr>
				<tr>
				</cfif>
			</cfloop>					
		</tr>
		</table>
		</td>
		</tr>		
		
		<tr>
			<td style="padding-top:0.3ex"><input type="Text" size="11" class="siteTextBox" name="manualDate" onKeyPress="keyUp(event);">&nbsp;<span class="copyGreySmall">(01/31/1972)</span></td>
		</tr>		
		
		</table>
	</cfoutput>	
	
	

<!------------------------------------------------------------------>
<!--- Set the focus on this form to the highest editable field.  --->
<!------------------------------------------------------------------>		
	<cfoutput>
		<script language="JavaScript">
			document.getElementById("manualDate").focus();					
		</script>
	</cfoutput>



<!---
<!--- /insert calendar table --->

<cfloop index="ii" from="1" to="#CalDays#">
				<cfif ii gte offset and ii lte lastslot>
					<td valign=top align="center" 
					 <cfif day is datepart("d", now()) and month(curntdate) is month(now())>bgcolor="003399"</cfif>>
						<font style="font:10px arial;color:660000;">
							<a href="appCalendar.cfm?CurntDate=#DateFormat(CurntDate, "mm/dd/yyyy")#" style="text-decoration:none">
								<cfif day is datepart("d", now()) and month(curntdate) is month(now())>
									<font style="color:ffffff;"><b>#Day#</b></font>
								<cfelse>
									<font style="color:003399;">#Day#</font>
								</cfif><br>									
							</a>	
						</font>					
					</td>
					<cfset day = day + 1>
				<cfelse>
					<td><font style="font:8px arial;color:660000;">&nbsp;</font></td>
				</cfif>
				
				<cfif (ii mod 7 is 0)>
				</tr>
				<tr>
				</cfif>
			</cfloop>--->
		
		<!--- The last TR is created in the loop above --->
		<!---<td colspan="7" align="center"><font style="font:10px arial;color:660000;">Choose a date</font></td>--->		
