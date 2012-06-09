('phillip@eobmanager.net','Phil1127')
('susies@startel.net','SUSIE1234')
('gcruz@eobmanager.net','Gui1234')







This is the change ineed to see after pull

C:\Java\Training\VirtualPairProgrammers\SpringFrameworkFundamentals\Chapter+5\chapter 5\index.html




<!---
<cfset custom = structNew()>
<cfset custom["allowMultiQueries"] = "true">
<cfset custom["characterEncoding"] = "UTF-8">
<cfset custom["jdbcCompliantTruncation"] = "true">
<cfset custom["useUnicode"] = "true">

<cfadmin
    action="updateDatasource"
    type="server"
    password="collectmednet"
    classname="org.gjt.mm.mysql.Driver"
    dsn="jdbc:mysql://{host}:{port}/{database}"
    name="pa_master"
	newname="pa_master"
    host="127.0.0.1"
    database="pa_master"
    port="3306"
    dbusername="root"
    dbpassword="collectmednet"    
    connectionTimeout="1"
    blob="false"
    clob="false"
    allowed_select="true"
    allowed_insert="true"
    allowed_update="true"
    allowed_delete="true"
    allowed_alter="true"
    allowed_drop="true"
    allowed_revoke="true"
    allowed_create="true"
    allowed_grant="true"
	custom="#custom#">

<cfadmin
    action="getDatasource"
	name="pa_master"
    type="server"
    password="collectmednet"
    returnVariable="pamaster">
<cfdump var="#pamaster#">
--->
<!---
<cfset custom = structNew()>
<cfset custom["allowMultiQueries"] = "true">
<cfset custom["characterEncoding"] = "UTF-8">
<cfset custom["jdbcCompliantTruncation"] = "true">
<cfset custom["useUnicode"] = "true">

<cfadmin
    action="updateDatasource"
    type="server"
    password="collectmednet"
    classname="org.gjt.mm.mysql.Driver"
    dsn="jdbc:mysql://{host}:{port}/{database}"
    name="paclient_1084"
	newname="paclient_1084"
    host="127.0.0.1"
    database="paclient_1084"
    port="3306"
    dbusername="root"
    dbpassword="collectmednet"    
    connectionTimeout="1"
    blob="false"
    clob="false"
    allowed_select="true"
    allowed_insert="true"
    allowed_update="true"
    allowed_delete="true"
    allowed_alter="true"
    allowed_drop="true"
    allowed_revoke="true"
    allowed_create="true"
    allowed_grant="true"
	custom="#custom#">

<cfadmin
    action="getDatasource"
	name="paclient_1084"
    type="server"
    password="collectmednet"
    returnVariable="clientDB">
<cfdump var="#clientDB#">
<cfabort>	--->








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
