 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record by an ID.                                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getById" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PatientID" required="true" type="numeric" />
		<cfreturn createObject("component", "PatientDAO").read(trim(arguments.ds), trim(arguments.PatientID))>		
				
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="obj" required="true" />
 		
		<cfif obj.getPatientID() EQ 0>
			<cfreturn createObject("component", "PatientDAO").create(arguments.ds, arguments.obj)>
		<cfelse>
			<cfreturn createObject("component", "PatientDAO").update(arguments.ds, arguments.obj)>
		</cfif>	
				
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function delete a record by an ID.                                    --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="deleteById" output="false" access="remote">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PatientID" required="true" type="numeric" />
		<cfset var obj = getById(arguments.ds, trim(arguments.PatientID)) />
 		<cfset createObject("component", "PatientDAO").delete(arguments.ds, obj) />		
				
	</cffunction>		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to get all.                                                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getAllByIDArray" output="false" access="remote" returntype="PatientBean[]">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="idList" required="true" type="string" hint="Comma delimeted list of ids to be returned in the array." />
		
		<cfset var qRead="" />
		<cfset var obj="" />
		<cfset var arrPatientBeans = arrayNew(1) />

		<cfquery name="qRead" datasource="#trim(arguments.ds)#">
			SELECT PatientID
			FROM patient
			WHERE PatientID IN(#trim(arguments.idList)#) 
		</cfquery>

		<cfloop query="qRead">
			<cfscript>
				obj = createObject("component", "PatientDAO").read(qRead.PatientID);
				ArrayAppend(arrPatientBeans, obj);
			</cfscript>
		</cfloop>
		
		<cfreturn arrPatientBeans>
		
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
			SELECT #trim(arguments.fieldList)#
			FROM patient
			WHERE PatientID IN(#trim(arguments.idList)#) 
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



