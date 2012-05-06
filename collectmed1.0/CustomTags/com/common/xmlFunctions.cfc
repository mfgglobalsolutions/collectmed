
<cfcomponent>	


	<cffunction name="XmlAppend" access="public" returntype="any" output="false" hint="Copies the children of one node to the node of another document.">
 	
		<!--- Define arguments. --->
		<cfargument name="NodeA" type="any" required="true" hint="The node whose children will be added to."/>
	 	<cfargument name="NodeB" type="any" required="true" hint="The node whose children will be copied to another document."/>
	 
		<!--- Set up local scope. --->
		<cfset var LOCAL = StructNew() />
	 	
		<!--- Get the child nodes of the originating XML node. This will return both tag nodes and text nodes. We only want the tag nodes. --->
		<cfset LOCAL.ChildNodes = ARGUMENTS.NodeB.GetChildNodes() />
	 	
		<!--- Loop over child nodes. --->
		<cfloop index="LOCAL.ChildIndex" from="1" to="#LOCAL.ChildNodes.GetLength()#" step="1">
	 				
			<!-------------------------------------------------------------------------------------->
			<!--- Get a short hand to the current node. Remember that the child nodes NodeList   --->
			<!--- starts with index zero. Therefore, we must subtract one from out child         --->
			<!--- node index.                                                                    --->
			<!-------------------------------------------------------------------------------------->			
			<cfset LOCAL.ChildNode = LOCAL.ChildNodes.Item(JavaCast("int",(LOCAL.ChildIndex - 1))) />
					 
			<!-------------------------------------------------------------------------------------->
			<!--- Import this noded into the target XML doc. If we do not do this first,         --->
			<!--- then ColdFusion will throw an error about us using nodes that are owned by     --->
			<!--- another document. Importing will return a reference to the newly created       --->
			<!--- xml node. The TRUE argument defines this import as DEEP copy.                  --->
			<!-------------------------------------------------------------------------------------->
			<cfset LOCAL.ChildNode = ARGUMENTS.NodeA.GetOwnerDocument().ImportNode(LOCAL.ChildNode, JavaCast( "boolean", true )) />
		 
			<!--- Append the imported xml node to the child nodes of the target node. --->
			<cfset ARGUMENTS.NodeA.AppendChild(LOCAL.ChildNode) />
	 	
		</cfloop>
	 	
		<!--- Return the target node. --->
		<cfreturn ARGUMENTS.NodeA />
	
	</cffunction>
	
		
	
	<cffunction name="rawElementToXML" returntype="string">		
				
		<cfargument name="rawString" required="yes" type="string">		
		<cfargument name="elementDelimeter" required="yes" type="string">
		<cfargument name="subElementDelimeter" required="yes" type="string">
			
							
		<cftry>				
			
			<cfset thisIteration = ListGetAt(rawString, 1, "~")>
			<cfset rootElement = ListGetAt(thisIteration, 1, trim(elementDelimeter))>
			
			<cfset arrElementData = ArrayNew(2) />				
			<cfset xmlStart = xmlNew()>
			<cfset xmlStart.xmlRoot = XmlElemNew(xmlStart,"#lcase(trim(rootElement))#")>			
			<cfset xmlString = xmlParse(xmlStart)>
						
			<!-------------------------------------------------------------------------------------->
			<!--- Loop over the contents and use the tilde as the delimeter for all the lines    --->
			<!-------------------------------------------------------------------------------------->	
			<cfloop index="i" list="#trim(rawString)#" delimiters="~">			
				
				<cfset arrayLength = arrayLen(arrElementData)+1>						
							
				<!-------------------------------------------------------------------------------------->
				<!--- NOTE: must be used twice (used to show NULL where no data was sent in)         --->
				<!-------------------------------------------------------------------------------------->
				<cfset i = ReReplace(i, "\#trim(elementDelimeter)#{2}", "#trim(elementDelimeter)#NULL#trim(elementDelimeter)#", "all")>
				<cfset i = ReReplace(i, "\#trim(elementDelimeter)#{2}", "#trim(elementDelimeter)#NULL#trim(elementDelimeter)#", "all")>
			
				<!-------------------------------------------------------------------------------------->
				<!--- Get the current element that we are working with. It will be the first thing   --->
				<!--- in the i iteration of the file contents.                                       --->
				<!-------------------------------------------------------------------------------------->		
				<cfset thisElement = listGetAt(i, 1, trim(elementDelimeter))>
				
				<!--------------------------------------------------------------------------------------->
				<!--- We need to put the full string element in the data array and its element sector --->
				<!--------------------------------------------------------------------------------------->		
				<cfif trim(thisElement) NEQ "" AND trim(i) NEQ "">
					<cfset arrElementData[arrayLength][1] = trim(thisElement)>
					<cfset arrElementData[arrayLength][2] = "#trim(i)#">
				</cfif>
				
			</cfloop>
						
			<!-------------------------------------------------------------------------------------->
			<!--- Loop over the array and put the values into the XML                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfloop from="1" to="#arrayLen(arrElementData)#" index="j">				
				
				<cfset thisStr = trim(arrElementData[j][2])>					
				<cfset ucaseElement = ucase(trim(arrElementData[j][1]))>
				<cfset lcaseElement = lcase(trim(ucaseElement))>
				
				<cfif lcaseElement neq rootElement>
					<cfset mainElem = "">		
					<cfset mainElem = XmlElemNew(xmlString, lcaseElement)>
					<cfset mainElem.XmlText = "">						
					<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainElem>											
				</cfif>			
			
				<cfset mainElem = "">		
				<cfset elemCount = 0>									
				<cfloop list="#trim(thisStr)#" delimiters="*" index="elemListIndex">
					
					<cfif trim(elemListIndex) NEQ ListGetAt(thisStr, 1, elementDelimeter)>							
						
						<!---Create the initial element that is the parent of this list.--->
						<cfset thisElementName = numberFormat(evaluate(elemCount + 1), "00")>
						<cfset elemCount = elemCount + 1>								
						<cfset mainElem = XmlElemNew(xmlString, "#trim(lcaseElement)#_#trim(thisElementName)#")>								
						
						<cfif NOT find(subElementDelimeter, elemListIndex, 0) AND trim(ListGetAt(thisStr, evaluate(elemCount + 1), elementDelimeter)) NEQ "NULL">		
							<cfset mainElem.XmlText = trim(ListGetAt(thisStr, evaluate(elemCount + 1), elementDelimeter))>
						<cfelse>
							<cfset mainElem.XmlText = "">	
						</cfif>
						
						<!--- EXCEPTION: ISA 16 needs to be filled like all other elements. It shows the delimeter sent in. --->						
						<cfif rootElement EQ "ISA" AND thisElementName EQ 16>
							<cfset mainElem.XmlText = trim(ListGetAt(thisStr, evaluate(elemCount + 1), elementDelimeter))>
						</cfif> 
						
						<cfif lcaseElement neq rootElement>	
							<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren) + 1] = mainElem>
						<cfelse>	
							<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren) + 1] = mainElem>
						</cfif>
						
						<!--- If the current iteration contains the Sub-Element delimeter then it must be treated as sub-elements. --->								
						<cfif find(subElementDelimeter, elemListIndex, 0)>									
							
							<!---Now loop the list and create its sub elements.--->											
							<cfset subElementList = trim(elemListIndex)>						
							<cfloop from="1" to="#ListLen(subElementList, subElementDelimeter)#" index="subElemIndex">
								<cfset thisSubElementName = numberFormat(subElemIndex, "00")>
								<cfset mainSubElem = XmlElemNew(xmlString,"#trim(lcaseElement)#_#trim(thisElementName)#_#thisSubElementName#")>
								<cfset mainSubElem.XmlText = ListGetAt(subElementList, subElemIndex, subElementDelimeter)>
								<cfif lcaseElement neq rootElement>	
									<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren)].XmlChildren[subElemIndex] = mainSubElem>										
								<cfelse>
									<cfset xmlString.xmlRoot.XmlChildren[arrayLen(xmlString.xmlRoot.XmlChildren)].XmlChildren[subElemIndex] = mainSubElem>	
								</cfif>	
							</cfloop>
													
						</cfif>
						
					</cfif>
							
				</cfloop>					
				
			</cfloop>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Now that the xml string is created then go ahead and send it to the caller.    --->
			<!-------------------------------------------------------------------------------------->									
			<cfif isxml(trim(xmlString))>	
								
				<cfset xmlString = toString(trim(xmlString))>
				<cfset xmlString = ReplaceNoCase(xmlString, '<?xml version="1.0" encoding="UTF-8"?>', "")>				
				<cfreturn trim(xmlString)>
				
			<cfelse>
				<cfreturn "Error Creating Element XML">
			</cfif>
							
			<cfcatch type="Any">			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
		
		
</cfcomponent>
	
	