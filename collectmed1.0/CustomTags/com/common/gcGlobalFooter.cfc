

<cfcomponent>

	<cffunction name="GlobalFooterListD" output="no" hint="Global footer for the D network">
		
		<cfargument name="list" hint="An assigned footer list" required="true">		
		<cfargument name="ds" hint="datasource" required="true">		
		<cfargument name="newList" default="" required="false">		
		
		<cfif list EQ "">
			<cfreturn "">
		</cfif>
		
		<cfloop list="#trim(list)#" delimiters="|" index="i">
			<cfset newItem = decrypt(trim(i), getGlobalFooterKS(ds: trim(ds)), "AES", "Hex")>
			<cfset newList = ListAppend(newList, trim(newItem), "|")>  
		</cfloop>
		
		<cfreturn newList>
				
	</cffunction>
	
	<cffunction name="GlobalFooterListE" output="no" hint="Global footer for the E network">
		
		<cfargument name="list" hint="An assigned footer list" required="true">		
		<cfargument name="ds" hint="datasource" required="true">		
		<cfargument name="newList" default="" required="false">		
		
		<cfif list EQ "">
			<cfreturn "">
		</cfif>
		
		<cfloop list="#trim(list)#" delimiters="|" index="i">
			<cfset newItem = encrypt(trim(i), getGlobalFooterKS(ds: trim(ds)), "AES", "Hex")>
			<cfset newList = ListAppend(newList, trim(newItem), "|")>  
		</cfloop>
		
		<cfreturn newList>
				
	</cffunction>
	
	
	
	<cffunction name="GlobalFooterE" output="no" hint="Global footer for the E network">
		
		<cfargument name="footer" hint="An assigned footer" required="true">		
		<cfargument name="ds" hint="datasource" required="true">		
			
		<cfif footer EQ "">
			<cfreturn "">
		</cfif>
						
		<cfreturn encrypt(trim(footer), getGlobalFooterKS(ds: trim(ds)), "AES", "Hex")>
				
	</cffunction>
		
	
	<cffunction name="GlobalFooterD" output="no" hint="Global footer for the D network">
		
		<cfargument name="footer" hint="An assigned footer" required="true">	
		<cfargument name="ds" hint="datasource" required="true">			
		
		<cfif footer EQ "">
			<cfreturn "">
		</cfif>
		
		<cfreturn decrypt(trim(footer), getGlobalFooterKS(ds: trim(ds)), "AES", "Hex")>
				
	</cffunction>
	
	
	<cffunction name="getGlobalFooterKS" returntype="string" output="no" access="private">		
		
		<cfargument name="ds" hint="datasource" required="true">		
		
		<cftry>			
		
			<cfquery name="getColA" datasource="#trim(arguments.ds)#"> 
				SELECT ColA
				FROM pa_master.entityks 
				Where EntityKSID = 1
			</cfquery>
		
			<cfquery name="getColB" datasource="#trim(arguments.ds)#"> 
				SELECT ColI
				FROM pa_master.entityks 
				Where EntityKSID = 9
			</cfquery>				
		
			<cfquery name="getColC" datasource="#trim(arguments.ds)#"> 	
				SELECT ColL
				FROM pa_master.entityks W
				Where EntityKSID = 12
			</cfquery>
		
			<cfquery name="getColD" datasource="#trim(arguments.ds)#"> 					
				SELECT ColE
				FROM pa_master.entityks 
				Where EntityKSID = 5
			</cfquery>
		
			<cfquery name="getColE" datasource="#trim(arguments.ds)#"> 					
				SELECT ColM
				FROM pa_master.entityks
				Where EntityKSID = 14
			</cfquery>
		
			<cfquery name="getColF" datasource="#trim(arguments.ds)#"> 						
				SELECT ColC
				FROM pa_master.entityks
				Where EntityKSID = 54
			</cfquery>	
			
			<cfset GlobalFooterSP = getColA.ColA & getColB.ColI & getColC.ColL & getColD.ColE & getColE.ColM & getColF.ColC /> 
			
			<cfset GlobalFooter = Left(GlobalFooterSP, 24)>
			
			<cfreturn GlobalFooter>
		
			<cfcatch type="Any">
				
				<cf_gcGeneralErrorTemplate
					message="[#cfcatch.message#<br><br>#cfcatch.detail#] There was an error setting up the Global Footer file.">
						
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
			
</cfcomponent>

	
