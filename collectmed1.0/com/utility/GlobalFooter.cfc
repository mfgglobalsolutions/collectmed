

<cfcomponent>


	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Address DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
		
		<cfscript>
			variables.instance.configBean = arguments.configBean;
		</cfscript>
			
		<cfreturn this />
		
	</cffunction>


	<cffunction name="GlobalFooterListD" output="no" hint="Global footer for the D network">		
		<cfargument name="list" hint="An assigned footer list" required="true">			
		<cfargument name="newList" default="" required="false">		
		
		<cfif list EQ "">
			<cfreturn "">
		</cfif>
		
		<cfloop list="#trim(list)#" delimiters="|" index="i">
			<cfset newItem = decrypt(trim(i), getGlobalFooterKS(), "AES", "Hex")>
			<cfset newList = ListAppend(newList, trim(newItem), "|")>  
		</cfloop>
		
		<cfreturn newList>
				
	</cffunction>
	
	<cffunction name="GlobalFooterListE" output="no" hint="Global footer for the E network">		
		<cfargument name="list" hint="An assigned footer list" required="true">					
		<cfargument name="newList" default="" required="false">		
		
		<cfif list EQ "">
			<cfreturn "">
		</cfif>
		
		<cfloop list="#trim(list)#" delimiters="|" index="i">
			<cfset newItem = encrypt(trim(i), getGlobalFooterKS(), "AES", "Hex")>
			<cfset newList = ListAppend(newList, trim(newItem), "|")>  
		</cfloop>
		
		<cfreturn newList>
				
	</cffunction>	
	
	<cffunction name="GlobalFooterE" output="no" hint="Global footer for the E network">		
		<cfargument name="footer" hint="An assigned footer" required="true">		
					
		<cfif footer EQ "">
			<cfreturn "">
		</cfif>
						
		<cfreturn encrypt(trim(footer), getGlobalFooterKS(), "AES", "Hex")>
				
	</cffunction>		
	
	<cffunction name="GlobalFooterD" output="no" hint="Global footer for the D network">		
		<cfargument name="footer" hint="An assigned footer" required="true">	
				
		<cfif footer EQ "">
			<cfreturn "">
		</cfif>
		
		<cfreturn decrypt(trim(footer), getGlobalFooterKS(), "AES", "Hex")>
				
	</cffunction>
	
	
	<cffunction name="getGlobalFooterKS" returntype="string" output="no" access="private">				
		
		<cftry>			
		
			<cfquery name="getColB" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 
				SELECT ColI
				FROM EntityKS 
				Where EntityKSID = 9
			</cfquery>				
		
			<cfquery name="getColC" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 	
				SELECT ColL
				FROM EntityKS W
				Where EntityKSID = 12
			</cfquery>
		
			<cfquery name="getColD" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 					
				SELECT ColE
				FROM EntityKS 
				Where EntityKSID = 5
			</cfquery>
		
			<cfquery name="getColE" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 					
				SELECT ColM
				FROM EntityKS
				Where EntityKSID = 14
			</cfquery>
		
			<cfquery name="getColF" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 						
				SELECT ColC
				FROM EntityKS
				Where EntityKSID = 54
			</cfquery>	
			
			<cfset GlobalFooterSP = trim(variables.instance.configBean.getDomain().ColA) & getColB.ColI & getColC.ColL & getColD.ColE & getColE.ColM & getColF.ColC /> 
			
			<cfset GlobalFooter = Left(GlobalFooterSP, 24)>
			
			<cfreturn GlobalFooter>
		
			<cfcatch type="Any">
				
				<cfthrow message="[#cfcatch.message#<br><br>#cfcatch.detail#] There was an error setting up the Global Footer file.">
						
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
			
</cfcomponent>

	
