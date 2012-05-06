 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record by an ID.                                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getById" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="true" type="numeric" />
		<cfreturn createObject("component", "Claim_MEDICARE_SUPPLEMENTAL_AMOUNTDAO").read(trim(arguments.ds), trim(arguments.Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID))>		
				
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="obj" required="true" />
 		
		<cfif obj.getClaim_MEDICARE_SUPPLEMENTAL_AMOUNTID() EQ 0>
			<cfreturn createObject("component", "Claim_MEDICARE_SUPPLEMENTAL_AMOUNTDAO").create(arguments.ds, arguments.obj)>
		<cfelse>
			<cfreturn createObject("component", "Claim_MEDICARE_SUPPLEMENTAL_AMOUNTDAO").update(arguments.ds, arguments.obj)>
		</cfif>	
				
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function delete a record by an ID.                                    --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="deleteById" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID" required="true" type="numeric" />
		<cfset var obj = getById(arguments.ds, trim(arguments.Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID)) />
 		<cfset createObject("component", "Claim_MEDICARE_SUPPLEMENTAL_AMOUNTDAO").delete(arguments.ds, obj) />		
				
	</cffunction>		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to get all.                                                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getAllByIDArray" output="false" access="remote" returntype="Claim_MEDICARE_SUPPLEMENTAL_AMOUNTBean[]">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="idList" required="true" type="string" hint="Comma delimeted list of ids to be returned in the array." />
		
		<cfset var qRead="" />
		<cfset var obj="" />
		<cfset var arrClaim_MEDICARE_SUPPLEMENTAL_AMOUNTBeans = arrayNew(1) />

		<cfquery name="qRead" datasource="#trim(arguments.ds)#">
			SELECT Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID
			FROM Claim_MEDICARE_SUPPLEMENTAL_AMOUNT
			WHERE Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID IN(#trim(arguments.idList)#) 
		</cfquery>

		<cfloop query="qRead">
			<cfscript>
				obj = createObject("component", "Claim_MEDICARE_SUPPLEMENTAL_AMOUNTDAO").read(qRead.Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID);
				ArrayAppend(arrClaim_MEDICARE_SUPPLEMENTAL_AMOUNTBeans, obj);
			</cfscript>
		</cfloop>
		
		<cfreturn arrClaim_MEDICARE_SUPPLEMENTAL_AMOUNTBeans>
		
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
			FROM Claim_MEDICARE_SUPPLEMENTAL_AMOUNT
			WHERE Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID IN(#trim(arguments.idList)#) 
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


