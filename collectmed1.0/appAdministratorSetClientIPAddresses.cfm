<!---- appAdministratorSetClientIPAddresses.cfm ---->
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
<!-------------------------------------------------------------------------------------->
<!--- Start the display Blank IP address page.                                       --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>			
			
	<!------------------------------------------------------------------>
	<!--- Set IP address range page.                              --->
	<!------------------------------------------------------------------>
	
	<!--- Get IP data --->
	<!--- <cfset ListIP = CreateObject("component", "com.common.db.IprangeIO")> --->
	<!--- <cfset listItemQuery = listIP.getIPQuery(fields: "Ipaddress_id,Site_ID,entity_id,Ip_address_access,int_user_id,Access_In,Access_out")> --->
<!------------------------------------------------------------------>

<SCRIPT LANGUAGE="JavaScript">
	<!--
	function addRow(id){
	var tbody = document.getElementById(id).getElementsByTagName("TBODY")
	[0];
	document.createStyleSheet('styles/styles.css');
	var row = document.createElement("TR");

	var td1 = document.createElement("TD");
	p = document.createElement("input");
	p.setAttribute("type","text");
	p.setAttribute("name","txtA2");
	p.setAttribute("size","7");
	p.className = "SiteTextBox";
	p.setAttribute("maxlength","3");
	td1.appendChild(p);

	var td2 = document.createElement("TD");
	a = document.createElement("input");
	a.setAttribute("type","text");
	a.setAttribute("name","txtB2");
	a.setAttribute("size","7");
	a.className = "SiteTextBox";
	a.setAttribute("maxlength","3");
	td2.appendChild(a);

	var td3 = document.createElement("TD");
	b = document.createElement("input");
	b.setAttribute("type","text");
	b.setAttribute("name","txtC2");
	b.setAttribute("size","7");
	b.className = "SiteTextBox";
	b.setAttribute("maxlength","3");
	td3.appendChild(b);

	var td4 = document.createElement("TD");
	c = document.createElement("input");
	c.setAttribute("type","text");
	c.setAttribute("name","txtD2");
	c.setAttribute("size","7");
	c.className = "SiteTextBox";
	c.setAttribute("maxlength","3");
	td4.appendChild(c);


	var td5 = document.createElement("TD");
	d = document.createElement("");
	td5.appendChild(d);

	var td6 = document.createElement("TD");
	e = document.createElement("input");
	e.setAttribute("type","text");
	e.setAttribute("name","txtF2");
	e.setAttribute("size","7");
	e.className = "SiteTextBox";
	e.setAttribute("maxlength","3");
	td6.appendChild(e);


	var td7 = document.createElement("TD");
	f = document.createElement("input");
	f.setAttribute("type","text");
	f.setAttribute("name","txtG2");
	f.setAttribute("size","7");
	f.className = "SiteTextBox";
	f.setAttribute("maxlength","3");
	td7.appendChild(f);

	var td8 = document.createElement("TD");
	G = document.createElement("input");
	G.setAttribute("type","text");
	G.setAttribute("name","txt_H2");
	G.setAttribute("size","7");
	G.className = "SiteTextBox";
	G.setAttribute("maxlength","3");
	td8.appendChild(G);

	var td9 = document.createElement("TD");
	H = document.createElement("input");
	H.setAttribute("type","text");
	H.setAttribute("name","txtI2");
	H.setAttribute("size","7");
	H.className = "SiteTextBox";
	H.setAttribute("maxlength","3");
	td9.appendChild(H);


	var td10 = document.createElement("TD");
	I = document.createElement("input");
	I.setAttribute("type","text");
	I.setAttribute("name","txtJ2");
	I.setAttribute("size","7");
	I.className = "SiteTextBox";
	I.setAttribute("maxlength","3");
	td10.appendChild(I);

	var td11 = document.createElement("TD");
	m = document.createElement("input");
	m.setAttribute("type","text");
	m.setAttribute("name","txtE2");
	m.setAttribute("size","7");
	m.className = "SiteTextBox";
	m.setAttribute("maxlength","3");
	td11.appendChild(m);

	var td12 = document.createElement("TD");
	var J = document.createElement("select");


	td12.appendChild(J);

	var e11 = document.createElement('option');
	e11.innerText = 'Allen';
	J.appendChild(e11);
	var e11 = document.createElement('option');
	e11.innerText = 'Steve';
	J.appendChild(e11);
	var e11 = document.createElement('option');
	e11.innerText = 'John';
	J.appendChild(e11);


	var td13 = document.createElement("TD");
	k = document.createTextNode("Delete");
	td13.appendChild(k);

	td13.classname = "SiteLabel";


	row.appendChild(td1);
	row.appendChild(td2);

	row.appendChild(td3);
	row.appendChild(td4);

	row.appendChild(td5);
	row.appendChild(td6);

	row.appendChild(td7);
	row.appendChild(td8);

	row.appendChild(td9);
	row.appendChild(td10);

	row.appendChild(td11);
	row.appendChild(td12);

	row.appendChild(td13);

	tbody.appendChild(row);


	}
-->
</script>



<!-------------------------------------------------------------------------------------->
<!--- If the inccoming message is set display it.                                    --->
<!-------------------------------------------------------------------------------------->
<cfif msg NEQ "">
	<cfoutput>
		<p><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font></p>			
	</cfoutput>
</cfif>
<form action="appAdministratorSetClientIPAddresses_Process.cfm" method="post" name="frmtag">
	<fornt  bgcolor="c0c0c0" align="center"><strong>Set IP Address Range</strong></font>
		<span width="100%" >
		<cfquery name="getClientName" datasource="#trim(request.datasource)#">
			Select EntityID,Fname,Lname 
			FROM Entity
			WHERE ObjectTypeID = 2 AND Active = 1
		</cfquery>
<table border="0" cellspacing="0" cellpadding="0" width="527" id="myTable" >
<tbody>
<tr>
		 <tr>
			    <td width="58" align="center" class="SiteLabel" bgcolor="c0c0c0" >1</td>
			   
			    <td width="58" align="center" class="SiteLabel" bgcolor="c0c0c0" >2</td>
			  
			    <td width="58" align="center" class="SiteLabel" bgcolor="c0c0c0" >3</td>
			 
			    <td width="58" align="center" class="SiteLabel" bgcolor="c0c0c0" >4</td>
			    <td width="58" align="center" class="SiteLabel" bgcolor="c0c0c0" >&nbsp;</td>
			 
			    <td width="58" align="center" class="SiteLabel" bgcolor="c0c0c0" >1</td>

			    <td width="57" align="center" class="SiteLabel" bgcolor="c0c0c0" >2</td>

			    <td width="57" align="center" class="SiteLabel" bgcolor="c0c0c0" >3</td>

			    <td width="61" align="center" class="SiteLabel" bgcolor="c0c0c0" >4</td>

			    <td  nowrap class="SiteLabel" bgcolor="c0c0c0" width="69"><strong>In Time</strong></td>
			    <td nowrap class="SiteLabel" bgcolor="c0c0c0" width="70"><strong>Out Time</strong></td>

			    <td nowrap class="SiteLabel" bgcolor="c0c0c0" width="70"><strong>User</strong></td>
			</tr>
			<tr>
				<td width="58">
					<input type="text" class="SiteTextBox" class="SiteTextBox"   name="txtA1" size="7" tabindex="0" maxlength="3" bo>
				</td>

			    <td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtB1" size="7" tabindex="1" maxlength="3"></td>


			    </td><td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtC1" size="7" tabindex="2" maxlength="3"></td>


			   </td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtD1" size="7" tabindex="3" maxlength="3"></td>



			    <td width="58" >&nbsp;</td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtE1" size="7" tabindex="4" maxlength="3"></td>


			    </td> <td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtF1" size="7" tabindex="5" maxlength="3"></td>


			    </td><td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txt_G1" size="7" tabindex="6" maxlength="3"></td>

			    </td><td width="61" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txt_H1" size="7" tabindex="7" maxlength="3"></td>

		
			    <td width="69" id="td_txtJ1">&nbsp;&nbsp;<input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtI1" size="7" tabindex="8"></td>

			    <td width="198" id="td_txtK1"><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtJ1" size="7" tabindex="9"></td>
			   
			    <td width="164" id="td_IpAddressID1"><select class="SiteSelectBox" name="IpAddressID1"><option value="Allen" SELECTED>Allen</option><option value="Steve">Steve</option><option value="John">John</option></select></TD>
			    <td  align="right" nowrap id="td_M1">Delete</td>
	  </tr>

	  <tr >
			    <td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"   name="txtA1" size="7" tabindex="0" maxlength="3"></td>

			    <td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtB1" size="7" tabindex="1" maxlength="3"></td>


			    </td><td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtC1" size="7" tabindex="2" maxlength="3"></td>


			   </td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtD1" size="7" tabindex="3" maxlength="3"></td>



			    <td width="58" >&nbsp;</td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtE1" size="7" tabindex="4" maxlength="3"></td>


			    </td> <td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txtF1" size="7" tabindex="5" maxlength="3"></td>


			    </td><td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox" class="SiteTextBox"  name="txt_G1" size="7" tabindex="6" maxlength="3"></td>

			    </td><td width="61" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txt_H1" size="7" tabindex="7" maxlength="3"></td>

		
			    <td width="69" id="td_txtJ1"><input type="text" class="SiteTextBox"  name="txtI1" size="7" tabindex="8"></td>

			    <td width="198" id="td_txtK1"><input type="text" class="SiteTextBox"  name="txtJ1" size="7" tabindex="9"></td>
			   
			    <td width="164" id="td_IpAddressID2"><select  name="IpAddressID1"><option value="Allen" SELECTED>Allen</option><option value="Steve">Steve</option><option value="John">John</option></select></TD>
			    <td  align="right" nowrap id="td_M1">Delete</td>
	  </tr>
<tr >
			    <td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"   name="txtA1" size="7" tabindex="0" maxlength="3"></td>

			    <td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtB1" size="7" tabindex="1" maxlength="3"></td>


			    </td><td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtC1" size="7" tabindex="2" maxlength="3"></td>


			   </td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtD1" size="7" tabindex="3" maxlength="3"></td>



			    <td width="58" >&nbsp;</td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtE1" size="7" tabindex="4" maxlength="3"></td>


			    </td> <td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtF1" size="7" tabindex="5" maxlength="3"></td>


			    </td><td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txt_G1" size="7" tabindex="6" maxlength="3"></td>

			    </td><td width="61" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txt_H1" size="7" tabindex="7" maxlength="3"></td>

		
			    <td width="69" id="td_txtJ1"><input type="text" class="SiteTextBox"  name="txtI1" size="7" tabindex="8"></td>

			    <td width="198" id="td_txtK1"><input type="text" class="SiteTextBox"  name="txtJ1" size="7" tabindex="9"></td>
			   
			    <td width="164" id="td_IpAddressID3"><select   name="IpAddressID1"><option value="Allen" SELECTED>Allen</option><option value="Steve">Steve</option><option value="John">John</option></select></TD>
			    <td  align="right" nowrap id="td_M1">Delete</td>
	  </tr>
<tr >
			    <td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"   name="txtA1" size="7" tabindex="0" maxlength="3"></td>

			    <td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtB1" size="7" tabindex="1" maxlength="3"></td>


			    </td><td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtC1" size="7" tabindex="2" maxlength="3"></td>


			   </td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtD1" size="7" tabindex="3" maxlength="3"></td>



			    <td width="58" >&nbsp;</td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtE1" size="7" tabindex="4" maxlength="3"></td>


			    </td> <td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtF1" size="7" tabindex="5" maxlength="3"></td>


			    </td><td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txt_G1" size="7" tabindex="6" maxlength="3"></td>

			    </td><td width="61" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txt_H1" size="7" tabindex="7" maxlength="3"></td>

		
			    <td width="69" id="td_txtJ1"><input type="text" class="SiteTextBox"  name="txtI1" size="7" tabindex="8"></td>

			    <td width="198" id="td_txtK1"><input type="text" class="SiteTextBox"  name="txtJ1" size="7" tabindex="9"></td>
			   
			    <td width="164" id="td_IpAddressID4"><select  name="IpAddressID1"><option value="Allen" SELECTED>Allen</option><option value="Steve">Steve</option><option value="John">John</option></select></TD>
			    <td  align="right" nowrap id="td_M1">Delete</td>
	  </tr>
<tr >
			    <td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"   name="txtA1" size="7" tabindex="0" maxlength="3"></td>

			    <td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtB1" size="7" tabindex="1" maxlength="3"></td>


			    </td><td width="58"><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtC1" size="7" tabindex="2" maxlength="3"></td>


			   </td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtD1" size="7" tabindex="3" maxlength="3"></td>



			    <td width="58" >&nbsp;</td><td width="58" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtE1" size="7" tabindex="4" maxlength="3"></td>


			    </td> <td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txtF1" size="7" tabindex="5" maxlength="3"></td>


			    </td><td width="57" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txt_G1" size="7" tabindex="6" maxlength="3"></td>

			    </td><td width="61" ><!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="1" I-Maximum-Length="3" --><input type="text" class="SiteTextBox"  name="txt_H1" size="7" tabindex="7" maxlength="3"></td>

		
			    <td width="69" id="td_txtJ1"><input type="text" class="SiteTextBox"  name="txtI1" size="7" tabindex="8"></td>

			    <td width="198" id="td_txtK1"><input type="text" class="SiteTextBox"  name="txtJ1" size="7" tabindex="9"></td>
			   
			    <td width="164" id="td_IpAddressID5"><select   name="IpAddressID1"><option value="Allen" SELECTED>Allen</option><option value="Steve">Steve</option><option value="John">John</option></select></TD>
			    <td  align="right" nowrap id="td_M1">Delete</td>
	  </tr>
</tr>
</tbody>
</table>
<table border="0" width="853" cellspacing="0" cellpadding="0">	
	  <tr><td colspan="7">&nbsp;</td></tr>
	  <tr>	  	
	    <td align="center" colspan="7"  style="border-bottm: 1px solid; border-color: 000000;">
	      <p align="center">
		  	<input type="button" class="SiteSubmitbox" value="Add New Row" name="btnadd" tabindex="50" onclick="javascript:addRow('myTable')">&nbsp;&nbsp;
			<input type="submit" class="SiteSubmitbox" value="Save IP Range" name="btnsave" tabindex="50">&nbsp;&nbsp;
			<input type="button" class="SiteSubmitbox" value="Clear" name="btnclear" tabindex="51">
	      	<input type="Hidden" name="currentInlineRow" value="">
	      </td>
	  </tr>
	</table>
	<span width="100%" class="EOBclaimTableBody">
</form>				
</cfoutput>