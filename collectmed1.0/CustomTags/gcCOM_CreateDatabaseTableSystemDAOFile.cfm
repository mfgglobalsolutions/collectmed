<!-------------------------------------------------------------------------------------->
<!--- NAME: gcCreateDatabaseTableSystemDAOFile.cfm                                   --->
<!-------------------------------------------------------------------------------------->
<!--- PURPOSE:                                                                       --->  
<!---                                                                                --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!--- NOTE: DO NOT CHANGE THIS TAG UNLESS YOU KNOW WHAT YOU                          --->
<!--- ARE DOING!!!                                                                   --->
<!---                                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY: Created 02/23/2005                                                    --->
<!---                                                                                --->
<!---                                                                                --->      
<!-------------------------------------------------------------------------------------->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileString" default="">
	<cfset fileString = attributes.fileString>

	<cfparam name="attributes.debug" default="no">
	<cfset debug = attributes.debug>
	
	<cfparam name="attributes.toSave" default="">
	<cfset toSave = attributes.toSave>
	
	<cfparam name="attributes.fileInDirectory" default="no">
	<cfset fileInDirectory = attributes.fileInDirectory>
	
	<cfparam name="attributes.tempName" default="systemDAO">
	<cfset tempName = attributes.tempName>
	
	<cfparam name="attributes.componentPath" default="eobmanager1.0\com\persistence">
	<cfset componentPath = attributes.componentPath>
	 

	
<!-------------------------------------------------------------------------------------->
<!--- Find out if the tag already exists and take out of it                          --->
<!--- the functions that have been custom created.                                   --->
<!-------------------------------------------------------------------------------------->			
	<cfif FileExists("#trim(request.applicationPath)#\#trim(componentPath)#\SystemDAO.cfc")>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Read the file into a variable.                                                 --->
		<!-------------------------------------------------------------------------------------->					
			<cffile 
				action="READ" 
				file="#trim(request.applicationPath)#\#trim(componentPath)#\SystemDAO.cfc" 
				variable="FileContent">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the custom functions and place them in a variable.                         --->
		<!-------------------------------------------------------------------------------------->				
			<cfset toSave = request.midString(FileContent, '<!---Start_Custom_Functions--->', '<!---End_Custom_Functions--->')>
			
			<cfset toSave =  trim(toSave)>
			
			<cfset fileInDirectory = "yes">
				
	</cfif>
	
	 
	 
<!-------------------------------------------------------------------------------------->
<!--- Function to use.                                                               --->
<!-------------------------------------------------------------------------------------->
<cfscript>
	function capitalizeFirstLetter(word) {			
		return UCase(Mid(word,1, 1)) & mid(word, 2, len(word));			
	}	
</cfscript>



 <cfdirectory action="LIST" directory="C:\EOBManager\eobmanager1.0\com\persistence\daos" name="CurrentDAOS">	



<cfset fileString = fileString & ' 	
<cfcomponent output="false" extends="com.persistence.BaseDAO">

	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.ConfigBean = '''' />'>

<cfloop query="CurrentDAOS">		
<cfif ListLast(name, ".") EQ "cfc" AND FindNoCase("DAO.cfc", name)>		
<cfset fileString = fileString & '
	<cfset variables.instance.#ListFirst(name, ".")# = '''' />'>
</cfif>	
</cfloop>	
	
		
<cfset fileString = fileString & ' 		
		
	<cffunction name="init" access="public" output="false" returntype="systemDAO" hint="I am the constructor method for the SystemDAO Class.">
		<cfargument name="ConfigBean" required="true" type="com.utility.configBean" hint="I am the ConfigBean object." />'>	

<cfloop query="CurrentDAOS">		
<cfif ListLast(name, ".") EQ "cfc" AND FindNoCase("DAO.cfc", name)>		
<cfset fileString = fileString & '
		<cfargument name="#ListFirst(name, ".")#" required="true" type="com.persistence.daos.#ListFirst(name, ".")#" hint="I am the #ListFirst(name, ".")# object." />'>
</cfif>	
</cfloop>

<cfset fileString = fileString & ' 	
				
		<cfscript>			
			structAppend(variables.instance, arguments);
		</cfscript>
		
		<cfreturn this />
	</cffunction>
'>

<cfloop query="CurrentDAOS">		
<cfif ListLast(name, ".") EQ "cfc" AND FindNoCase("DAO.cfc", name)>		
<cfset fileString = fileString & '
	<cffunction name="get#ListFirst(name, ".")#" access="public" output="false" returntype="com.persistence.daos.#ListFirst(name, ".")#" hint="return com.persistence.daos.#ListFirst(name, ".")# Class.">
		<cfreturn variables.instance.#ListFirst(name, ".")# />
	</cffunction>	
'>	
</cfif>	
</cfloop>



			

<cfset fileString = fileString & '	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		#toSave#
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>

'>					






<!-------------------------------------------------------------------------------------->
<!--- Once everything is set for the fileString Save the new                         --->
<!--- Custom Tag in the Custom Tags directory.                                       --->
<!-------------------------------------------------------------------------------------->	
	<cftry>
		
		<cffile 
			action="write" 
			nameconflict="OVERWRITE" 
			file="#trim(request.applicationPath)#\#trim(componentPath)#\SystemDAO.cfc"
			output="#fileString#">		
				
		
		<cfcatch type="any">		
			
			<cfoutput>				
				<font size=2 face="ms sans serif">
					An error was detected while creating the SystemDAO.cfc.
				</font>
				<p>				
				<hr>
				<p>The error that occurred was <font face="Arial Black" size="3" color="800000">(This is a caught error)</font>:
				<p><strong>#cfcatch.type#</strong><br>
				#cfcatch.message# #cfcatch.detail#<br>
				<hr>				
			</cfoutput>
			
		</cfcatch>
	
	</cftry>
	
	









