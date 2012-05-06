


<cfcomponent output="false">
	
	<cffunction name="init" access="public" output="false" returntype="EnvironmentPropertiesLoader">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="loadEnvironmentalVariables" access="public" output="false" returntype="struct">
		<cfargument name="environmentFilePath" type="string" required="true" />
		<cfargument name="serverVariablesToLoad" type="string" required="true" />
		
		<cfset var propertyStruct = StructNew() />		
		<cfset var defFileXML = "" />
	
		
		<cftry>
			<!--- Attempt to read XML file --->
			<cfxml variable="defFileXML"><cfoutput><cfinclude template="#arguments.environmentFilePath#" /></cfoutput></cfxml>
			<!--- Catch file not found error --->
			<cfcatch type="missinginclude">
				<cfthrow message="File not found: #arguments.environmentFilePath#" />
			</cfcatch>
			<!--- Catch XML parsing errors --->
			<cfcatch type="any">
				<cfthrow message="Error reading xml file: #cfcatch.message#" />
			</cfcatch>
		</cftry>

		<cfscript>
			loadEnvironment(propertyStruct, defFileXML);
			loadEnvironment(propertyStruct, defFileXML, arguments.serverVariablesToLoad);
			loadAbsolutePath(propertyStruct);
		</cfscript>
		
		<cfreturn propertyStruct />
		
	</cffunction>
	

	<cffunction name="loadEnvironment" access="private" output="false" returntype="void">
		<cfargument name="propertyStruct" type="struct" required="true" />
		<cfargument name="defFileXML" required="true" type="xml" hint="xml data" />
		<cfargument name="environment" required="false" type="string" default="default" />
		<cfset var index = "" />
		<cfset var aData = xmlSearch(defFileXML,"/properties/environments/environment[@name='" & arguments.environment & "']/property") />
		<cfset var importFileArray = xmlSearch(defFileXML,"/properties/environments/environment[@name='" & arguments.environment & "']/import") />
		<cfset var importFileXML = "" />
		<cfset var i = "" />
		<cfset var j = "" />
		<cfset var newValue = "" />
		
		<cfloop from="1" to="#arrayLen(aData)#" index="i"><!--- array="#aData#" index="index"> --->
			<cfif NOT isStruct(aData[i].xmlAttributes) >
				<cfset arguments.propertyStruct[aData[i].xmlAttributes.name] = aData[i].xmlAttributes.value  />
			<cfelse>
				<cfset arguments.propertyStruct[aData[i].xmlAttributes.name] = loadComplexValue(aData[i]) />
			</cfif>
		</cfloop>
		
		
		<cfif arrayLen(importFileArray)>
			<cfloop  from="1" to="#arrayLen(importFileArray)#" index="i"><!--- array="#importFileArray#" index="i"> --->
				<cftry>
					<cfxml variable="importFileXML"><cfoutput><cfinclude template="#importFileArray[i].XmlAttributes.resource#" /></cfoutput></cfxml>
			
					<!--- Catch file not found error --->
					<cfcatch type="missinginclude">
						<cfthrow message="File not found: #importFileArray[i].XmlAttributes.resource#" />
					</cfcatch>
					<!--- Catch XML parsing errors --->
					<cfcatch type="any">
						<cfthrow message="Error reading xml file: #cfcatch.message#" />
					</cfcatch>		
				</cftry>
				<cfdump var="#arguments.propertyStruct#" />
				<cfset aData = xmlSearch(importFileXML,"/properties/property") />	
	
				<cfloop from="1" to="#arrayLen(aData)#" index="index">
					<cfif  NOT isStruct(aData[index].xmlAttributes) >
						<cfset arguments.propertyStruct[aData[index].xmlAttributes.name] = aData[index].xmlAttributes.value  />
					<cfelse>
						<cfset newValue = loadComplexValue(aData[index]) />
						<!--- If this is an existing element and the element is a complex structure, we will append from default --->
						
						<cfif StructKeyExists(arguments.propertyStruct,aData[index].xmlAttributes.name)>
							<!--- Structures --->
							<cfif IsStruct(arguments.propertyStruct[aData[index].xmlAttributes.name]) AND IsStruct(newValue)>
								<cfloop collection="#newValue#" item="j">
									<cfset arguments.propertyStruct[aData[index].xmlAttributes.name][j] = newValue[j] />
								</cfloop>	
							<!--- Arrays --->						
							<cfelseif IsArray(arguments.propertyStruct[aData[index].xmlAttributes.name]) AND IsArray(newValue)>
								<cfloop from="1" to="#arraylen(newValue)#" index="j">
									<cfset ArrayAppend(arguments.propertyStruct[aData[index].xmlAttributes.name],newValue[j]) />
								</cfloop>
							</cfif>
						<cfelse>
							<cfset arguments.propertyStruct[aData[index].xmlAttributes.name] = loadComplexValue(aData[index]) />
						</cfif>
						
					</cfif>
				</cfloop>				
					
			</cfloop>			
		</cfif>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="loadComplexValue" access="private" output="false" returntype="any">
		<cfargument name="defFileXML" required="true" type="xml" hint="xml data" />
		<cfreturn evaluate("loadXMLTo#defFileXML.xmlChildren[1].xmlName#(defFileXML.xmlChildren[1].xmlChildren)") />
	</cffunction>
	
	<cffunction name="loadXMLToStruct" access="private" output="false" returntype="struct">
		<cfargument name="defFileXML" required="true" type="array" hint="xml data" />
		<cfset var index = "" />
		<cfset var sData = StructNew() />
		<cfloop from="1" to="#arrayLen(defFileXML)#" index="index">
			<cfset structInsert(sData,defFileXML[index].xmlAttributes.name,defFileXML[index].xmlAttributes.value) />
		</cfloop>
		<cfreturn sData />
	</cffunction>
	
	<cffunction name="loadXMLToArray" access="private" output="false" returntype="array">
		<cfargument name="defFileXML" required="true" type="array" hint="xml data" />
		<cfset var index = "" />
		<cfset var aData = arrayNew[1] />
		<cfloop from="1"  to="#arrayLen(defFileXML)#" index="index">
			<cfset arrayAppend(aData,defFileXML[index].xmlAttributes.value) />
		</cfloop>
		<cfreturn aData />
	</cffunction>		
	
	<cffunction name="loadAbsolutePath"  access="private" output="false" returntype="void">
		<cfargument name="propertyStruct" type="struct" required="true" />
		<cfset arguments.propertyStruct["absolutePath"] = GetDirectoryFromPath(ExpandPath("/")) />
		<cfset arguments.propertyStruct["comPath"] = GetDirectoryFromPath(ExpandPath("/com")) />
		<cfset arguments.propertyStruct["rootPath"] =  listDeleteAt(GetDirectoryFromPath(ExpandPath("/")),listLen(GetDirectoryFromPath(ExpandPath("/")),"/"),"/") />
		<cfreturn />
	</cffunction>		
	
</cfcomponent>