














/**********************************************************************************************************/     
    <cfparam name="request.BrowserType" default="">
    <cfparam name="request.BrowserVersion" default="">
    <cfparam name="request.OperatingSystem" default="">
    <cfparam name="bv" default="">
    <cfparam name="bv1" default="">
	
   
    <cfif #HTTP_USER_AGENT# CONTAINS "MSIE">
    	<cfset #request.BrowserType# = "IE">
    <cfelseif #HTTP_USER_AGENT# DOES NOT CONTAIN "compatible;">
    	<cfset #request.BrowserType# = "NS">
    <cfelseif #HTTP_USER_AGENT# CONTAINS "Opera">
    	<cfset #request.BrowserType# = "OPERA">
    </cfif>
	
    <!--- Find OperatingSystem with IE--->
    <cfif #request.BrowserType# EQ "IE">
	   
	    <cfif #HTTP_USER_AGENT# CONTAINS "Windows NT)" OR #HTTP_USER_AGENT# CONTAINS "Windows NT 4.0)">
	    	<cfset #request.OperatingSystem# = "WinNT">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "95">
	   		<cfset #request.OperatingSystem# = "Win95">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "98">
	    	<cfset #request.OperatingSystem# = "Win98">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "9x">
	    	<cfset #request.OperatingSystem# = "WinME">
		<cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 5.2">
	    	<cfset #request.OperatingSystem# = "Win2003">	
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 5.0">
	    	<cfset #request.OperatingSystem# = "Win2k">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 5.1">
	    	<cfset #request.OperatingSystem# = "WinXP">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 6.1">
	    	<cfset #request.OperatingSystem# = "Win7">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Linux">
	    	<cfset #request.OperatingSystem# = "Linux">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "apple">
	    	<cfset #request.OperatingSystem# = "Apple">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "mac">
	    	<cfset #request.OperatingSystem# = "Mac">
	    <cfelse>
	    	<cfset #request.OperatingSystem# = "UnKnown">
	    </cfif>
   
    <cfelseif #request.BrowserType# EQ "NS">
	   
	    <cfif #HTTP_USER_AGENT# CONTAINS "WinNT; I)">
	    	<cfset #request.OperatingSystem# = "WinNT">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "95">
	    	<cfset #request.OperatingSystem# = "Win95">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "98">
	    	<cfset #request.OperatingSystem# = "Win98">
		<cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 5.2">
	    	<cfset #request.OperatingSystem# = "Win2003">	
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 5.0; I)">
	    	<cfset #request.OperatingSystem# = "Win2k">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 5.1">
	    	<cfset #request.OperatingSystem# = "WinXP">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Windows NT 6.1">
	    	<cfset #request.OperatingSystem# = "Win7">	
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "Linux">
	    	<cfset #request.OperatingSystem# = "Linux">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "apple">
	    	<cfset #request.OperatingSystem# = "Apple">
	    <cfelseif #HTTP_USER_AGENT# CONTAINS "mac">
	    	<cfset #request.OperatingSystem# = "Mac">
	    <cfelse>
	    	<cfset #request.OperatingSystem# = "UnKnown">
	    </cfif>
   
    </cfif>
    <!--- End Operating System Lookup --->
	
    <!--- Get the Browser Version --->
    <!--- IE Version On NT 4--->
    <cfif #request.BrowserType# EQ "IE" AND #request.OperatingSystem# EQ "winNT">
    	<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 30)#>
    	<cfset #bv1# = Findoneof(';', #bv# , 1)>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,#bv1#, 30)#>
    </cfif>
    <!--- IE Version on 95 and 98 --->
    <cfif #request.BrowserType# EQ "IE" AND #request.OperatingSystem# CONTAINS "win9">
    	<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 30)#>
    	<cfset #bv1# = Findoneof(';', #bv# , 1)>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,#bv1#, 40)#>
    </cfif>
    <!--- IE version on Win2k --->
    <cfif #request.BrowserType# EQ "IE" AND #request.OperatingSystem# EQ "win2k">
    	<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 30)#>
    	<cfset #bv1# = Findoneof(';', #bv# , 1)>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,#bv1#, 50)#>
    </cfif>
	 <!--- IE version on Win2003 --->
    <cfif #request.BrowserType# EQ "IE" AND #request.OperatingSystem# EQ "win2003">    	
		<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 30)#>
    	<cfset #bv1# = Findoneof(';', #bv# , 1)>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,#bv1#, len(bv))#>		
    </cfif>	
	
    <!--- IE version on WinXP --->
    <cfif #request.BrowserType# EQ "IE" AND #request.OperatingSystem# EQ "WinXP">
    	<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 30)#>
    	<cfset #bv1# = Findoneof(';', #bv# , 1)>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,#bv1#, 50)#>
    </cfif>
		
	<!--- IE version on Win7 --->
    <cfif #request.BrowserType# EQ "IE" AND #request.OperatingSystem# EQ "Win7">
    	<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 30)#>
    	<cfset #bv1# = Findoneof(';', #bv# , 1)>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,#bv1#, 50)#>
    </cfif>
	
	
    <!--- NS Version --->
    <cfif #request.BrowserType# EQ "NS">
    	<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 8)#>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,5, 60)#>
    </cfif>
    <!--- Opera Version --->
    <cfif #request.BrowserType# EQ "Opera">
    	<cfset #bv# = #RemoveChars(#HTTP_USER_AGENT#, 1, 39)#>
    	<cfset #request.BrowserVersion# = #RemoveChars(#bv#,4, 30)#>
    </cfif>
    <!--- End BrowserVersion Lookup--->
	
<!---
Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)	
--->





C:\Java\Training\VirtualPairProgrammers\SpringFrameworkFundamentals\Chapter+5\chapter 5\index.html





ISA*00*          *00*         C21P  *ZZ*146153871      *101129*2349*U*00401*000000015*0*P*:~
GS*FA*617591011C21P*1461*2349*21~
ST*997*0002~
AK1*HS*9~
AK2*270*0001~
AK5*A~
AK9*A*1*1*1~
SE*6*0002~
GE*1*2~
IEA*1*000000015~












variables.Result = variableleX12270('1084', '2956', ISA, '146153871', 'kgpqax6s', '10843020110002956112210121533.txt'); 











<!-------------------------------------------------------------------------------------->
<!--- setup the Datasource OBJECT                                                    --->
<!-------------------------------------------------------------------------------------->

	<cfset session.objDatasource = application.beanFactory.getBean("Datasource") />
	<cfset session.objDatasource.init(DSName="PAClient_#trim(session.Client.getClientID())#") />


	










*************************************************************



 <cfset arguments.Company.init( CompanyID = qCompanies.COMPANY_ID,
                              Name = qCompanies.COMPANY_NAME,
                              AddressOne = qCompanies.COMPANY_ADDRESS_ONE,
                              AddressTwo = qCompanies.COMPANY_ADDRESS_TWO,
                              City = qCompanies.COMPANY_CITY,
                              State = qCompanies.COMPANY_STATE,
                              Zip = qCompanies.COMPANY_ZIP,
                              PhoneMain = qCompanies.COMPANY_PHONE_MAIN ) />




**********************************************************







   <cfset variables.instance.CompanyID = 0 />
   <cfset variables.instance.Name = "" />
   <cfset variables.instance.AddressOne = "" />
   <cfset variables.instance.AddressTwo = "" />
   <cfset variables.instance.City = "" />
   <cfset variables.instance.State = "" />
   <cfset variables.instance.Zip = "" />
   <cfset variables.instance.PhoneMain = "" />

   <cffunction name="init" displayname="init" hint="Bean for CF_COMPANIES" access="public" output="false" returntype="Company">

      <cfargument name="CompanyID" type="numeric" required="false" default="0" hint="COMPANY_ID" />
      <cfargument name="Name" type="string" required="false" default="" hint="COMPANY_NAME" />
      <cfargument name="AddressOne" type="string" required="false" default="" hint="COMPANY_ADDRESS_ONE" />
      <cfargument name="AddressTwo" type="string" required="false" default="" hint="COMPANY_ADDRESS_TWO" />
      <cfargument name="City" type="string" required="false" default="" hint="COMPANY_CITY" />
      <cfargument name="State" type="string" required="false" default="" hint="COMPANY_STATE" />
      <cfargument name="Zip" type="string" required="false" default="" hint="COMPANY_ZIP" />
      <cfargument name="PhoneMain" type="string" required="false" default="" hint="COMPANY_PHONE_MAIN" />

      <cfset setCompanyID(arguments.CompanyID) />
      <cfset setName(arguments.Name) />
      <cfset setAddressOne(arguments.AddressOne) />
      <cfset setAddressTwo(arguments.AddressTwo) />
      <cfset setCity(arguments.City) />
      <cfset setState(arguments.State) />
      <cfset setZip(arguments.Zip) />
      <cfset setPhoneMain(arguments.PhoneMain) />

      <cfreturn this />

   </cffunction>





**************************************************************






<cffunction name="createCompany" access="public" output="false" returntype="boolean" hint="Creates a new Company record.">

   <cfargument name="event" type="MachII.framework.Event" required="true" />
  
   <cfset var company = createObject("component", "Company").init(
                        CompanyID = arguments.event.getArg("COMPANY_ID"),
                        Name = arguments.event.getArg("COMPANY_NAME"),
                        AddressOne = arguments.event.getArg("COMPANY_ADDRESS_ONE"),
                        AddressTwo = arguments.event.getArg("COMPANY_ADDRESS_TWO"),
                        City = arguments.event.getArg("COMPANY_CITY"),
                        State = arguments.event.getArg("COMPANY_STATE"),
                        Zip = arguments.event.getArg("COMPANY_ZIP"),
                        PhoneMain = arguments.event.getArg("COMPANY_PHONE_MAIN")
                        ) />

   	<cfset var companyDAO = createObject("component", "CompanyDAO").init( DSN = request.DSN ) />
	<cfreturn companyDAO.create( company ) />

</cffunction>




************************************************************








<cfcomponent
	extends="BaseService"
	output="false"
	hint="I provide photo gallery services.">
	
	
	<cffunction
		name="Init"
		access="public"
		returntype="any"
		output="false"
		hint="I return an initialized object.">

		<!--- Return This reference. --->
		<cfreturn THIS />
	</cffunction>
	
	
	<cffunction
		name="GetGalleriesByKeyword"
		access="public"
		returntype="query"
		output="false"
		hint="I return the galleries matching the given keywords.">

		<!--- Define arguments. --->
		<cfargument
			name="Keywords"
			type="string"
			required="true"
			hint="I am the keyword phrase used to match galleries. I will be compared to the gallery as well as the comments in the gallery."
			/>
			
		<!--- Define the local scope. --->
		<cfset var LOCAL = {} />
			
		<!--- Query for the gallery. --->
		<cfquery name="LOCAL.Gallery" datasource="#VARIABLES.DSN.Source#">
			SELECT
				g.id,
				g.name,
				g.description,
				g.jump_code,
				g.date_updated,
				g.date_created,
				
				<!--- Get the number of photos in this gallery. --->
				(
					SELECT
						COUNT( * )
					FROM
						photo p
					WHERE
						p.gallery_id = g.id
				) AS photo_count,
				
				<!--- Get the photo ID that represents this gallery. --->
				tg.photo_id
			FROM
				gallery g
			INNER JOIN
				(
				
					SELECT
						g2.id,
						MIN( p.id ) AS photo_id
					FROM
						gallery g2
					INNER JOIN
						photo p 
					ON
						g2.id = p.gallery_id
					LEFT OUTER JOIN
						comment c
					ON
						p.id = c.photo_id
					WHERE
						g2.name LIKE <cfqueryparam value="%#ARGUMENTS.Keywords#%" cfsqltype="cf_sql_varchar" />
					OR 
						g2.description LIKE <cfqueryparam value="%#ARGUMENTS.Keywords#%" cfsqltype="cf_sql_varchar" />
					OR
						c.comment LIKE <cfqueryparam value="%#ARGUMENTS.Keywords#%" cfsqltype="cf_sql_varchar" />
					GROUP BY
						g2.id
						
				) AS tg
			ON
				g.id = tg.id
			ORDER BY
				g.name ASC
		</cfquery>
		
		<!--- Return the galleries. --->
		<cfreturn LOCAL.Gallery />
	</cffunction>
	
	
	<cffunction
		name="GetGalleryByID"
		access="public"
		returntype="query"
		output="false"
		hint="I return the gallery with the given ID. If no gallery can be found, an exception is thrown.">

		<!--- Define arguments. --->
		<cfargument
			name="ID"
			type="numeric"
			required="true"
			hint="I am the unique ID of the gallery."
			/>
			
		<!--- Define the local scope. --->
		<cfset var LOCAL = {} />
			
		<!--- Query for the gallery. --->
		<cfquery name="LOCAL.Gallery" datasource="#VARIABLES.DSN.Source#">
			SELECT
				g.id,
				g.name,
				g.description,
				g.jump_code,
				g.date_updated,
				g.date_created
			FROM
				gallery g
			WHERE
				g.id = <cfqueryparam value="#ARGUMENTS.ID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<!--- 
			Check to see if a gallery was found. We are expecting 
			to find one, so if none was found, throw an exception.
		--->
		<cfif NOT LOCAL.Gallery.RecordCount>
			
			<!--- Throw exception. --->
			<cfthrow 
				type="OOPhoto.InvalidPhotoGallery"
				message="The selected gallery could not be found."
				detail="The gallery with ID #ARGUMENTS.ID# could not be found."
				/>
		
		</cfif>
		
		<!--- Return the gallery. --->
		<cfreturn LOCAL.Gallery />
	</cffunction>
	
	
	<cffunction
		name="GetGalleryByJumpCode"
		access="public"
		returntype="query"
		output="false"
		hint="I return the gallery with the given jump code. If no gallery can be found, an exception is thrown.">

		<!--- Define arguments. --->
		<cfargument
			name="JumpCode"
			type="string"
			required="true"
			hint="I am the unique jump code of the gallery."
			/>
			
		<!--- Define the local scope. --->
		<cfset var LOCAL = {} />
			
		<!--- Query for the gallery. --->
		<cfquery name="LOCAL.Gallery" datasource="#VARIABLES.DSN.Source#">
			SELECT
				g.id,
				g.name,
				g.description,
				g.jump_code,
				g.date_updated,
				g.date_created
			FROM
				gallery g
			WHERE
				g.jump_code = <cfqueryparam value="#ARGUMENTS.JumpCode#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<!--- 
			Check to see if a gallery was found. We are expecting 
			to find one, so if none was found, throw an exception.
		--->
		<cfif NOT LOCAL.Gallery.RecordCount>
			
			<!--- Throw exception. --->
			<cfthrow 
				type="OOPhoto.InvalidPhotoGallery"
				message="The selected gallery could not be found."
				detail="The gallery with Jump Code #UCase( ARGUMENTS.JumpCode )# could not be found."
				/>
		
		</cfif>
		
		<!--- Return the gallery. --->
		<cfreturn LOCAL.Gallery />
	</cffunction>
	
</cfcomponent>
Kinky File Explorer © 2010 Kinky Solutions / BenNadel.com 
