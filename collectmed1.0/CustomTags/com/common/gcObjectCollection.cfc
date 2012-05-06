<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- gcObjectCollection.cfc                                                         --->
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->
<!--- Creates access to a collection of rows from Debug (dbtable)                    --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;gcObjectCollection.cfc"&gt;                                                --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!---  [ID]                                                                        --->
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 09/06/2005                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->



<!-------------------------------------------------------------------------------------->
<!--- This tag is a Collection of items. You may use the following methods to gain   --->
<!--- access to the collection.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfcomponent name="gcObjectCollection" hint="This tag is a Collection of objects (rows from db). You may use the following methods to gain access to the collection.">
		
		
		<cfset this.Collection = ArrayNew(1)>
	
		<!-------------------------------------------------------------------------------------->
		<!--- Initializes the component. Use this when creating an instance of this          --->
		<!--- component.                                                                     --->
		<!-------------------------------------------------------------------------------------->
		<cffunction name="init" output="no" hint="Initializes the component. Use this when creating an instance of this component." returntype="gcObjectCollection">
		
			<cfreturn this>
			
		</cffunction>
		

		
		<!-------------------------------------------------------------------------------------->
		<!--- Check to see if the row exists by sending in an ID.                            --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction output="no" name="objectExists" hint="Check to see if the object exists by sending in an ID.">
			
			<cfargument name="ID" required="yes" type="numeric">
			
			<cfset var collectionIndex = "0">				

			<cfloop from="1" to="#Arraylen(this.Collection)#" index="i">					
				<cfif this.Collection[i].getID() EQ trim(arguments.ID)>				
					<cfset collectionIndex = i>
					<cfbreak>
				</cfif>
			</cfloop>				
			
			<cfreturn collectionIndex>				
		
		</cffunction>
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Add an item to the collection.                                                 --->
		<!-------------------------------------------------------------------------------------->          
		<cffunction output="no" name="objectAdd" hint="Add an item to the collection.">
<!---You want to add an object but what kind of an object and what is its id to see if that specific item exists.--->		
			<cfargument name="ID" required="yes" type="numeric">					
					
			<cfif this.objectExists(ID) LTE 0>				
				
				<cfset collectionItem = CreateObject('component', 'com.common.db.DebugIO')>
				<cfset collectionItem.init(ID)>
				
				<cfset ArrayAppend(this.Collection, collectionItem)>
				
				<cfreturn Collection>
				
			</cfif>			
					
		</cffunction> 
		
	
	
		<!-------------------------------------------------------------------------------------->
		<!--- Method to get an item in the collection.                                       --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction output="no" name="objectGet"  hint="Method to get an item in the collection.">
			
			<cfargument name="ID" required="yes" type="numeric">			
						
			<cfif this.objectExists(ID) GT 0>			
				<cfreturn this.Collection[this.objectExists(ID)]>
			<cfelse>
				<cfreturn this.objectAdd(arguments.ID)>	
			</cfif>					
			
		</cffunction>				
		
				
				
	</cfcomponent>
	
	