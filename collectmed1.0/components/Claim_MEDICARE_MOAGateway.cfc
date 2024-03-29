 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record by an ID.                                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getById" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_MOAID" required="true" type="numeric" />
		<cfreturn createObject("component", "Claim_MEDICARE_MOADAO").read(trim(arguments.ds), trim(arguments.Claim_MEDICARE_MOAID))>		
				
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="obj" required="true" />
 		
		<cfif obj.getClaim_MEDICARE_MOAID() EQ 0>
			<cfreturn createObject("component", "Claim_MEDICARE_MOADAO").create(arguments.ds, arguments.obj)>
		<cfelse>
			<cfreturn createObject("component", "Claim_MEDICARE_MOADAO").update(arguments.ds, arguments.obj)>
		</cfif>	
				
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function delete a record by an ID.                                    --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="deleteById" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_MOAID" required="true" type="numeric" />
		<cfset var obj = getById(arguments.ds, trim(arguments.Claim_MEDICARE_MOAID)) />
 		<cfset createObject("component", "Claim_MEDICARE_MOADAO").delete(arguments.ds, obj) />		
				
	</cffunction>		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to get all.                                                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getAllByIDArray" output="false" access="remote" returntype="Claim_MEDICARE_MOABean[]">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="idList" required="true" type="string" hint="Comma delimeted list of ids to be returned in the array." />
		
		<cfset var qRead="" />
		<cfset var obj="" />
		<cfset var arrClaim_MEDICARE_MOABeans = arrayNew(1) />

		<cfquery name="qRead" datasource="#trim(arguments.ds)#">
			SELECT Claim_MEDICARE_MOAID
			FROM claim_medicare_moa 
			WHERE Claim_MEDICARE_MOAID IN(#trim(arguments.idList)#) 
		</cfquery>

		<cfloop query="qRead">
			<cfscript>
				obj = createObject("component", "Claim_MEDICARE_MOADAO").read(qRead.Claim_MEDICARE_MOAID);
				ArrayAppend(arrClaim_MEDICARE_MOABeans, obj);
			</cfscript>
		</cfloop>
		
		<cfreturn arrClaim_MEDICARE_MOABeans>
		
	</cffunction>	
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Use this functiont o return a query.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllByIdQuery" output="false" access="remote" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="idList" required="true" type="string" hint="Comma delimeted list of ids to be returned in the array." />
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query." />		

		<cfset var qRead="" />

		<cfquery name="qRead" datasource="#trim(arguments.ds)#">
			SELECT  #trim(arguments.fieldList)#
			FROM claim_medicare_moa 
			WHERE Claim_MEDICARE_MOAID IN(#trim(arguments.idList)#) 
			LIMIT 100
		</cfquery>

		<cfreturn qRead>
		
	</cffunction>
		
		
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->			
	
</cfcomponent>


