<!--- ==================================================================================
FILE:			barcode39.cfm - Custom tag for Code 39 (3 from 9) barcodes
VERSION: 		1.0
AUTHOR:     		Philip Pearson (Inspired by Ryan Masuga's UPCA version)
MODIFIED BY:		pearsonp@aquinas.vic.edu.au				
WRITTEN:  		17/11/2004
DESCRIPTION:		Writes barcodes in a browser window ready to be printed and scanned.
COMMENTS:		Code 39 specs from www.barcodeman.com    
=================================================================================== --->

<!--- These are fairly self explanatory --->
<cfparam name="Attributes.InputValue"     default="INVALID">
<cfparam name="Attributes.BarWidth"       default="2">
<cfparam name="Attributes.BarHeight"      default="50">
<cfparam name="Attributes.TextTop"        default="">
<cfparam name="Attributes.TextBottom"     default="">
<cfparam name="Attributes.TextFontTop"    default="font: bold 14px Arial, sans-serif">
<cfparam name="Attributes.TextFontBottom" default="font: bold 18px Courier, sans-serif">
<cfparam name="Attributes.MarginTop"      default="0">
<cfparam name="Attributes.MarginBottom"   default="0">

<!--- Initialize array. Note: not all characters are supported by the code 39 specification, ---> 
<!--- so invalid characters will show as a $ sign. Lowercase not supported either.           --->
<cfset code39 = ArrayNew(1)>
<cfloop index="i" from="1" to="256"> 
	<cfset code39[i] = "000001110"> <!--- '$' is default init string --->
</cfloop>

<!--- Load array with all the supported characters' bar attributes ---> 
<cfset code39[32] = "001101000"> <!---   --->
<cfset code39[36] = "000001110"> <!--- $ --->
<cfset code39[37] = "000000111"> <!--- % --->
<cfset code39[42] = "001101000"> <!--- * --->
<cfset code39[43] = "000001011"> <!--- + --->
<cfset code39[45] = "000111000"> <!--- - --->
<cfset code39[46] = "100101000"> <!--- . --->
<cfset code39[47] = "000001101"> <!--- / --->

<cfset code39[48] = "001100100"> <!--- 0 --->
<cfset code39[49] = "100010100"> <!--- 1 --->
<cfset code39[50] = "010010100"> <!--- 2 --->
<cfset code39[51] = "110000100"> <!--- 3 --->
<cfset code39[52] = "001010100"> <!--- 4 --->
<cfset code39[53] = "101000100"> <!--- 5 --->
<cfset code39[54] = "011000100"> <!--- 6 --->
<cfset code39[55] = "000110100"> <!--- 7 --->
<cfset code39[56] = "100100100"> <!--- 8 --->
<cfset code39[57] = "010100100"> <!--- 9 --->

<cfset code39[65] = "100010010"> <!--- A --->
<cfset code39[66] = "010010010"> <!--- B --->
<cfset code39[67] = "110000010"> <!--- C --->
<cfset code39[68] = "001010010"> <!--- D --->
<cfset code39[69] = "101000010"> <!--- E --->
<cfset code39[70] = "011000010"> <!--- F --->
<cfset code39[71] = "000110010"> <!--- G --->
<cfset code39[72] = "100100010"> <!--- H --->
<cfset code39[73] = "010100010"> <!--- I --->
<cfset code39[74] = "001100010"> <!--- J --->
<cfset code39[75] = "100010001"> <!--- K --->
<cfset code39[76] = "010010001"> <!--- L --->
<cfset code39[77] = "110000001"> <!--- M --->
<cfset code39[78] = "001010001"> <!--- N --->
<cfset code39[79] = "101000001"> <!--- O --->
<cfset code39[80] = "011000001"> <!--- P --->
<cfset code39[81] = "000110001"> <!--- Q --->
<cfset code39[82] = "100100001"> <!--- R --->
<cfset code39[83] = "010100001"> <!--- S --->
<cfset code39[84] = "001100001"> <!--- T --->
<cfset code39[85] = "100011000"> <!--- U --->
<cfset code39[86] = "010011000"> <!--- V --->
<cfset code39[87] = "110001000"> <!--- W --->
<cfset code39[88] = "001011000"> <!--- X --->
<cfset code39[89] = "101001000"> <!--- Y --->
<cfset code39[90] = "011001000"> <!--- Z --->

<!--- Code 39 specification requires * at the start and end of the barcode --->
<cfset Attributes.InputValue = "*" & Attributes.InputValue & "*">

<cfoutput>
	<span style="#Attributes.TextFontTop#">#Attributes.TextTop#</span>
	<div>
	<cfloop index="i" from="1" to="#len(Attributes.InputValue)#"> 
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],1,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: black; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],6,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: white; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],2,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: black; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],7,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: white; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],3,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: black; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],8,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: white; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],4,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: black; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],9,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: white; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:#val(mid(code39[asc(mid(Attributes.InputValue,i,1))],5,1)*(Attributes.BarWidth)+(Attributes.BarWidth/2))#px solid; border-color: black; height: #Attributes.BarHeight#px;margin-bottom:#Attributes.MarginBottom#px;margin-top:#Attributes.MarginTop#px;"></span>
		<span style="border-right:2px solid; border-color: white; height: 50px;margin-bottom:2px;margin-top:2px;"></span>   <!--- space between individual codes --->
	</cfloop>
	</div>
	<span style="#Attributes.TextFontBottom#">#Attributes.TextBottom#</span>	
</cfoutput>























<!--- VALID CALLS BLOW FOR EXAMPLE --->
<!--- 
<h1>Code 39 Barcode Examples</h1>
<hr>
<table width="100%" cellpadding="8">
<tr>
<cfloop index="i" from="25641" to="25655"> 
	<td><cf_gcBarCode39 InputValue="#i#" BarWidth="2" BarHeight="50" TextTop="Asset Number" TextBottom="#i#"></td>
	<cfif #i# MOD 5 EQ 0>
		</tr><tr>
	</cfif>
</cfloop>
</tr>
</table>

<hr>
<cf_gcBarCode39 InputValue="ABCDEFGHIJ" BarWidth="2" BarHeight="50" TextTop="BarWidth=2 BarHeight=50" TextBottom="ABCDEFGHIJ">
<hr>
<cf_gcBarCode39 InputValue="KLMNOPQRST" BarWidth="3" BarHeight="60" TextTop="BarWidth=3 BarHeight=60" TextBottom="KLMNOPQRST">
<hr>
<cf_gcBarCode39 InputValue="UVWXYZ$/+%" BarWidth="4" BarHeight="80" TextTop="BarWidth=4 BarHeight=80" TextBottom="UVWXYZ$/+%">
<hr>	
--->

