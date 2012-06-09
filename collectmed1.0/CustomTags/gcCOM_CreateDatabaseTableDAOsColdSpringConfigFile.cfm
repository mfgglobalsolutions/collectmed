<!-------------------------------------------------------------------------------------->
<!--- NAME: gcCreateDatabaseTableDAOsColdSpringConfigFile.cfm                       --->
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
	
	<cfparam name="attributes.componentPath" default="collectmed1.0\com\persistence\daos\config">
	<cfset componentPath = attributes.componentPath>
	 
	<cfparam name="attributes.persistDAOSPath" default="com.persistence.daos">
	<cfset persistDAOSPath = attributes.persistDAOSPath>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Find out if the tag already exists and take out of it                          --->
<!--- the functions that have been custom created.                                   --->
<!-------------------------------------------------------------------------------------->			
	<cfif FileExists("#trim(request.applicationPath)#\#trim(componentPath)#\coldspring.xml")>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Read the file into a variable.                                                 --->
		<!-------------------------------------------------------------------------------------->					
			<cffile 
				action="READ" 
				file="#trim(request.applicationPath)#\#trim(componentPath)#\coldspring.xml" 
				variable="FileContent">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the custom functions and place them in a variable.                         --->
		<!-------------------------------------------------------------------------------------->				
			<cfset toSave = request.midString(FileContent, '<!--Start_Custom_Functions-->', '<!--End_Custom_Functions-->')>
			
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



<cfdirectory action="LIST" directory="C:\railo\tomcat\webapps\collectmed\collectmed1.0\com\persistence\daos" name="CurrentDAOcfcs">	


<cfset fileString = fileString & ' 	
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">

<beans>
'>	

<cfloop query="CurrentDAOcfcs">		
<cfif ListLast(name, ".") EQ "cfc">		
<cfset fileString = fileString & '
	<bean id="#ListFirst(name, ".")#" class="#persistDAOSPath#.#ListFirst(name, ".")#" autowire="byType" />'>
</cfif>	
</cfloop>

<cfset fileString = fileString & '	


<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->	
<!-- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  -->
<!-- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   -->
<!-- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             -->   	
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->	
	
	<!--Start_Custom_Functions-->

		#toSave#
	
	<!--End_Custom_Functions-->		
	
		
	
</beans>

'>					






<!-------------------------------------------------------------------------------------->
<!--- Once everything is set for the fileString Save the new                         --->
<!--- Custom Tag in the Custom Tags directory.                                       --->
<!-------------------------------------------------------------------------------------->	
	<cftry>
		
		<cffile 
			action="write" 
			nameconflict="OVERWRITE" 
			file="#trim(request.applicationPath)#\#trim(componentPath)#\coldspring.xml"
			output="#fileString#">		
				
		
		<cfcatch type="any">		
			
			<cfoutput>				
				<font size=2 face="ms sans serif">
					An error was detected while creating the coldspring.xml.
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
	
	









