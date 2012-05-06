<!---
LICENSE 
Copyright 2006 Raymond Camden

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
   
If you find this app worthy, I have a Amazon wish list set up (www.amazon.com/o/registry/2TCL1D08EZEYE ). Gifts are always welcome. ;)
--->

<!---
	Name         : toxml
	Author       : Raymond Camden (ray@camdenfamily.com) / Guillermo Cruz(added functions)
	Created      : 2006
	Last Updated : 4/30/07
	History      : Switched to stringbuffer (rkc 7/13/06)
				 : xmlFormat doesn't strip out extended MS chars (rkc 11/2/06)
				 : All methods allow for optional arg to determine if the "XML" header is used (rkc 4/30/07)
--->
<cfcomponent displayName="To XML" hint="Set of utility functions to generate XML" output="false">


<cffunction name="stringToXML" returnType="string" access="public" output="false" hint="Adds XML header to string">
	<cfargument name="data" type="string" required="true">
	<cfargument name="rootelement" type="string" required="true">
	<cfargument name="itemelement" type="string" required="true">
	<cfargument name="includeheader" type="boolean" required="false" default="true">
	
	<cfset var s = createObject('java','java.lang.StringBuffer').init()>
	
	<cfif FindNoCase('<?xml version="1.0" encoding="UTF-8"?>', arguments.data)>
		<cfset data = Replace(arguments.data, '<?xml version="1.0" encoding="UTF-8"?>', '', 'ALL')>
	</cfif>
		
	<cfif arguments.includeheader>
		<cfset s.append("<?xml version=""1.0"" encoding=""UTF-8""?>")>
	</cfif>
	
	<cfset s.append("<#arguments.rootelement#>")>

	<cfset s.append("<#arguments.itemelement#>#arguments.data#</#arguments.itemelement#>")>
	
	<cfset s.append("</#arguments.rootelement#>")>
	
	<cfreturn s.toString()>
</cffunction>



<cffunction name="arrayToXML" returnType="string" access="public" output="false" hint="Converts an array into XML">
	<cfargument name="data" type="array" required="true">
	<cfargument name="rootelement" type="string" required="true">
	<cfargument name="itemelement" type="string" required="true">
	<cfargument name="includeheader" type="boolean" required="false" default="true">
	
	<cfset var s = createObject('java','java.lang.StringBuffer').init()>
	<cfset var x = "">
	
	<cfif arguments.includeheader>
		<cfset s.append("<?xml version=""1.0"" encoding=""UTF-8""?>")>
	</cfif>
	
	<cfset s.append("<#arguments.rootelement#>")>

	<cfloop index="x" from="1" to="#arrayLen(arguments.data)#">
		<cfset s.append("<#arguments.itemelement#>#safeText(arguments.data[x])#</#arguments.itemelement#>")>
	</cfloop>

	<cfset s.append("</#arguments.rootelement#>")>
	
	<cfreturn s.toString()>
</cffunction>

<cffunction name="listToXML" returnType="string" access="public" output="false" hint="Converts a list into XML.">
	<cfargument name="data" type="string" required="true">
	<cfargument name="rootelement" type="string" required="true">
	<cfargument name="itemelement" type="string" required="true">
	<cfargument name="delimiter" type="string" required="false" default=",">
	<cfargument name="includeheader" type="boolean" required="false" default="true">
	
	<cfreturn arrayToXML( listToArray(arguments.data, arguments.delimiter), arguments.rootelement, arguments.itemelement,arguments.includeheader)>
</cffunction>

<cffunction name="queryToXML" returnType="string" access="public" output="false" hint="Converts a query to XML">
	<cfargument name="data" type="query" required="true">
	<cfargument name="rootelement" type="string" required="true">
	<cfargument name="itemelement" type="string" required="true">
	<cfargument name="cDataCols" type="string" required="false" default="">
	<cfargument name="includeheader" type="boolean" required="false" default="true">
	<cfargument name="preserveXML" type="boolean" required="false" default="false">
	
	<cfset var s = createObject('java','java.lang.StringBuffer').init()>
	<cfset var col = "">
	<cfset var columns = arguments.data.columnlist>
	<cfset var txt = "">

	<cfif arguments.includeheader>
		<cfset s.append("<?xml version=""1.0"" encoding=""UTF-8""?>")>
	</cfif>

	<cfset s.append("<#arguments.rootelement#>")>
	
	<cfloop query="arguments.data">
		<cfset s.append("<#arguments.itemelement#>")>

		<cfloop index="col" list="#columns#">
			<cfset txt = arguments.data[col][currentRow]>
			
			<cfif preserveXML AND isXML(txt)>
				<cfset txt = txt>
			<cfelseif isSimpleValue(txt)>
				<cfif listFindNoCase(arguments.cDataCols, col)>
					<cfset txt = "<![CDATA[" & txt & "]]" & ">">
				<cfelse>
					<cfset txt = safeText(txt)>
				</cfif>
			<cfelse>
				<cfset txt = "">
			</cfif>

			<cfif txt eq "">
				<cfset s.append("<#col#/>")>
			<cfelse> 
			<cfset s.append("<#col#>#txt#</#col#>")>
			</cfif>	
			

		</cfloop>
		
		<cfset s.append("</#arguments.itemelement#>")>	
	</cfloop>
	
	<cfset s.append("</#arguments.rootelement#>")>
	
	<cfreturn s.toString()>
</cffunction>

<cffunction name="structToXML" returnType="string" access="public" output="false" hint="Converts a struct into XML.">
	<cfargument name="data" type="struct" required="true">
	<cfargument name="rootelement" type="string" required="true">
	<cfargument name="itemelement" type="string" required="true">
	<cfargument name="includeheader" type="boolean" required="false" default="true">
	
	<cfset var s = createObject('java','java.lang.StringBuffer').init()>

	<cfset var keys = structKeyList(arguments.data)>
	<cfset var key = "">

	<cfif arguments.includeheader>
		<cfset s.append("<?xml version=""1.0"" encoding=""UTF-8""?>")>
	</cfif>

	<cfset s.append("<#arguments.rootelement#>")>	
	<cfset s.append("<#arguments.itemelement#>")>

	<cfloop index="key" list="#keys#">
		<cfif IsArray(arguments.data[key])>		
			<!---Very important to send in false so the header does not get included.--->
			<cfset thisKey = arrayToXML(arguments.data[key], "array#key#", "array#key#element", false)>
			<cfset s.append("<#key#>#thisKey#</#key#>")>
		<cfelse>
		<cfset s.append("<#key#>#safeText(arguments.data[key])#</#key#>")>
		</cfif>
	</cfloop>
	
	<cfset s.append("</#arguments.itemelement#>")>
	<cfset s.append("</#arguments.rootelement#>")>
	
	<cfreturn s.toString()>		
</cffunction>

<!--- Fix damn smart quotes. Thank you Microsoft! --->
<!--- This line taken from Nathan Dintenfas' SafeText UDF --->
<!--- www.cflib.org/udf.cfm/safetext --->
<!--- I wrapped up both xmlFormat and this code together. --->
<cffunction name="safeText" returnType="string" access="private" output="false">
	<cfargument name="txt" type="string" required="true">

	<cfset arguments.txt = replaceList(arguments.txt,chr(8216) & "," & chr(8217) & "," & chr(8220) & "," & chr(8221) & "," & chr(8212) & "," & chr(8213) & "," & chr(8230),"',',"","",--,--,...")>
	<cfreturn xmlFormat(arguments.txt)>
</cffunction>

</cfcomponent>





















<!---

<cfcomponent displayName="To XML" hint="Set of utility functions to generate XML" output="false">
	
	<cffunction name="arrayToXML" returnType="string" access="public" output="false" hint="Converts an array into XML">
		<cfargument name="data" type="array" required="true">
		<cfargument name="rootelement" type="string" required="true">
		<cfargument name="itemelement" type="string" required="true">
		<cfset var s = "<?xml version=""1.0"" encoding=""UTF-8""?>">
		<cfset var x = "">
		
		<cfset s = s & "<" & arguments.rootelement & ">">
		<cfloop index="x" from="1" to="#arrayLen(arguments.data)#">
			<cfset s = s & "<" & arguments.itemelement & ">" & xmlFormat(arguments.data[x]) & "</" & arguments.itemelement & ">">
		</cfloop>
		
		<cfset s = s & "</" & arguments.rootelement & ">">
		
		<cfreturn s>
	</cffunction>
	
	<cffunction name="listToXML" returnType="string" access="public" output="false" hint="Converts a list into XML.">
		<cfargument name="data" type="string" required="true">
		<cfargument name="rootelement" type="string" required="true">
		<cfargument name="itemelement" type="string" required="true">
		<cfargument name="delimiter" type="string" required="false" default=",">
		
		<cfreturn arrayToXML( listToArray(arguments.data, arguments.delimiter), arguments.rootelement, arguments.itemelement)>
	</cffunction>
	
	<cffunction name="queryToXML" returnType="string" access="public" output="false" hint="Converts a query to XML">
		<cfargument name="data" type="query" required="true">
		<cfargument name="rootelement" type="string" required="true">
		<cfargument name="itemelement" type="string" required="true">
		<cfargument name="cDataCols" type="string" required="false" default="">
		
		<cfset var s = "<?xml version=""1.0"" encoding=""UTF-8""?>">
		<cfset var col = "">
		<cfset var columns = arguments.data.columnlist>
		<cfset var txt = "">
		
		<cfset s = s & "<" & arguments.rootelement & ">">
		<cfloop query="arguments.data">
			<cfset s = s & "<" & arguments.itemelement & ">">
	
			<cfloop index="col" list="#columns#">
				<cfset txt = arguments.data[col][currentRow]>
				<cfif txt EQ "">
					<cfset txt = "@@">
				</cfif>
				<cfif isSimpleValue(txt)>
					<cfif listFindNoCase(arguments.cDataCols, col)>
						<cfset txt = "<![CDATA[" & txt & "]]" & ">">
					<cfelse>
						<cfset txt = xmlFormat(txt)>
					</cfif>
				<cfelse>
					<cfset txt = "">
				</cfif>
	
				<cfset s = s & "<" & col & ">" & txt & "</" & col & ">">
	
			</cfloop>
			
			<cfset s = s & "</" & arguments.itemelement & ">">
		</cfloop>
		
		<cfset s = s & "</" & arguments.rootelement & ">">
		
		<cfreturn s>
	</cffunction>
	
	<cffunction name="structToXML" returnType="string" access="public" output="false" hint="Converts a struct into XML.">
		<cfargument name="data" type="struct" required="true">
		<cfargument name="rootelement" type="string" required="true">
		<cfargument name="itemelement" type="string" required="true">
	
		<cfset var s = "<?xml version=""1.0"" encoding=""UTF-8""?>">
		<cfset var keys = structKeyList(arguments.data)>
		<cfset var key = "">
		
		<cfset s = s & "<" & arguments.rootelement & ">">
		<cfset s = s & "<" & arguments.itemelement & ">">
	
		<cfloop index="key" list="#keys#">
			<cfset s = s & "<#key#>#xmlFormat(arguments.data[key])#</#key#>">
		</cfloop>
		
		<cfset s = s & "</" & arguments.itemelement & ">">
		<cfset s = s & "</" & arguments.rootelement & ">">
		
		<cfreturn s>		
	</cffunction>

</cfcomponent>






<!--- Tests to run this code --->

<!---


<cfset intakeString = "autoSaveOn=0^hidden_Step_OLD=1%7C10%2F08%2F2006%7C12%3A17%3A32%20PM%7C55%7CPhillip%20Stephenson~^hidden_UsersID=55^patientFNameTBox=444^patientLNameTBox=5555^Equipment2RentPurchasedSelect=Purchased">



<cfloop list="#trim(intakeString)#" index="i" delimiters="^">
	<cfoutput>
		<cfset param = ListGetAt(i, 1, "=")>		
		<cfset val = ListGetAt(i, 2, "=")>		
		<strong>#URLDecode(param)#:</strong> 
		#URLDecode(val)#
		<br>				
	</cfoutput>
</cfloop>


<cfset toXML = createObject("component", "toXML")>

<!--- List to XML --->
<cfset list = "apple,orange,pear,banana">
<cfset xmlList = toXML.listToXML(list,"fruits", "fruit")>

<cfdump var="#xmlParse(xmlList)#">

<!--- Array to XML --->
<cfset array = arrayNew(1)>
<cfset array[1] = "apple">
<cfset array[2] = "orange">
<cfset array[3] = "pear">
<cfset array[4] = "banana">
<cfset xmlArray = toXML.arrayToXML(array, "fruits", "fruit")>

<cfdump var="#xmlParse(xmlArray)#">

<!--- Query to XML --->
<cfset q = queryNew("id,fruit,calories,color")>

<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 1)>
<cfset querySetCell(q, "fruit", "apple")>
<cfset querySetCell(q, "calories", "200")>
<cfset querySetCell(q, "color", "red")>

<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 2)>
<cfset querySetCell(q, "fruit", "orange")>
<cfset querySetCell(q, "calories", "220")>
<cfset querySetCell(q, "color", "orange")>

<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 3)>
<cfset querySetCell(q, "fruit", "pear")>
<cfset querySetCell(q, "calories", "500")>
<cfset querySetCell(q, "color", "yellowish")>

<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 4)>
<cfset querySetCell(q, "fruit", "banana")>
<cfset querySetCell(q, "calories", "90")>
<cfset querySetCell(q, "color", "yellow")>

<cfset xmlQuery = toXML.queryToXML(q, "fruits", "fruit")>

<cfdump var="#xmlParse(xmlQuery)#">

<cfset s = structNew()>
<cfset s.id = 9>
<cfset s.name = "Raymond Camden">
<cfset s.age = 33>

<cfset xmlStruct = toXML.structToXML(s, "people", "person")>
<cfdump var="#xmlParse(xmlStruct)#">

--->
--->