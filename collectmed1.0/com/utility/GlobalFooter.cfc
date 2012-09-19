

<cfcomponent>


	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '' />
	<cfset variables.instance.entityKSDAO = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Address DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
		<cfargument name="entityKSDAO" required="true" type="com.persistence.daos.entityKSDAO" hint="I am the EntityKSDAO object." />
		
		<cfscript>
			variables.instance.configBean = arguments.configBean;
			variables.instance.entityKSDAO = arguments.entityKSDAO;
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
		
	<cffunction name="getGlobalFooterKS" returntype="string" output="no">				
		
		<cftry>			
					
			<cfset GlobalFooterSP = trim(variables.instance.configBean.getDomain().ColA) & variables.instance.entityKSDAO.getColB() & variables.instance.entityKSDAO.getColC() & variables.instance.entityKSDAO.getColD() & variables.instance.entityKSDAO.getColE() & variables.instance.entityKSDAO.getColF() /> 
			
			<cfset GlobalFooter = Left(GlobalFooterSP, 24)>
			
			<cfreturn GlobalFooter>
		
			<cfcatch type="Any">
				
				<cfthrow message="[#cfcatch.message#<br><br>#cfcatch.detail#] There was an error setting up the Global Footer file.">
						
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
			
</cfcomponent>

