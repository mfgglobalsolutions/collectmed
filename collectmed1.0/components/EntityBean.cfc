 	


<cfcomponent name="entityBean" output="false" alias="entityBean" extends="EntityDAO">

	<cfproperty name="EntityID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="ObjectTypeID" type="numeric" default="" />
	<cfproperty name="PrefixName" type="string" default="" />
	<cfproperty name="Fname" type="string" default="" />
	<cfproperty name="Mname" type="string" default="" />
	<cfproperty name="Lname" type="string" default="" />
	<cfproperty name="SuffixName" type="string" default="" />
	<cfproperty name="DOB" type="datetime" default="" />
	<cfproperty name="Sex" type="numeric" default="" />
	<cfproperty name="SSN" type="string" default="" />
	<cfproperty name="MaritalStatus" type="numeric" default="" />
	<cfproperty name="EmployerID" type="numeric" default="" />
	<cfproperty name="Languages" type="string" default="" />
	<cfproperty name="Weight" type="numeric" default="" />
	<cfproperty name="HeightInInches" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.EntityID = 0;
		variables.SiteID = "";
		variables.ClientID = "";
		variables.ObjectTypeID = "";
		variables.PrefixName = "";
		variables.Fname = "";
		variables.Mname = "";
		variables.Lname = "";
		variables.SuffixName = "";
		variables.DOB = "";
		variables.Sex = "";
		variables.SSN = "";
		variables.MaritalStatus = "";
		variables.EmployerID = "";
		variables.Languages = "";
		variables.Weight = "";
		variables.HeightInInches = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="entityBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "EntityID") AND stValues.EntityID NEQ 0>
				<cfquery name="qGetEntity" datasource="#trim(arguments.ds)#">
			  		SELECT EntityID,SiteID,ClientID,ObjectTypeID,PrefixName,Fname,Mname,Lname,SuffixName,DOB,Sex,SSN,MaritalStatus,EmployerID,Languages,Weight,HeightInInches,Active,InactiveCode,DateCreated,DateModified
					FROM entity  
					WHERE EntityID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.EntityID#" /> 
				</cfquery>		
				<cfif qGetEntity.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetEntity.SiteID;
					variables.ClientID = qGetEntity.ClientID;
					variables.ObjectTypeID = qGetEntity.ObjectTypeID;
					variables.PrefixName = qGetEntity.PrefixName;
					variables.Fname = qGetEntity.Fname;
					variables.Mname = qGetEntity.Mname;
					variables.Lname = qGetEntity.Lname;
					variables.SuffixName = qGetEntity.SuffixName;
					variables.DOB = qGetEntity.DOB;
					variables.Sex = qGetEntity.Sex;
					variables.SSN = qGetEntity.SSN;
					variables.MaritalStatus = qGetEntity.MaritalStatus;
					variables.EmployerID = qGetEntity.EmployerID;
					variables.Languages = qGetEntity.Languages;
					variables.Weight = qGetEntity.Weight;
					variables.HeightInInches = qGetEntity.HeightInInches;
					variables.Active = qGetEntity.Active;
					variables.InactiveCode = qGetEntity.InactiveCode;
					variables.DateModified = qGetEntity.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "ObjectTypeID")><cfset variables.ObjectTypeID = stValues.ObjectTypeID /></cfif>
			<cfif StructKeyExists(stValues, "PrefixName")><cfset variables.PrefixName = stValues.PrefixName /></cfif>
			<cfif StructKeyExists(stValues, "Fname")><cfset variables.Fname = stValues.Fname /></cfif>
			<cfif StructKeyExists(stValues, "Mname")><cfset variables.Mname = stValues.Mname /></cfif>
			<cfif StructKeyExists(stValues, "Lname")><cfset variables.Lname = stValues.Lname /></cfif>
			<cfif StructKeyExists(stValues, "SuffixName")><cfset variables.SuffixName = stValues.SuffixName /></cfif>
			<cfif StructKeyExists(stValues, "DOB")><cfset variables.DOB = stValues.DOB /></cfif>
			<cfif StructKeyExists(stValues, "Sex")><cfset variables.Sex = stValues.Sex /></cfif>
			<cfif StructKeyExists(stValues, "SSN")><cfset variables.SSN = stValues.SSN /></cfif>
			<cfif StructKeyExists(stValues, "MaritalStatus")><cfset variables.MaritalStatus = stValues.MaritalStatus /></cfif>
			<cfif StructKeyExists(stValues, "EmployerID")><cfset variables.EmployerID = stValues.EmployerID /></cfif>
			<cfif StructKeyExists(stValues, "Languages")><cfset variables.Languages = stValues.Languages /></cfif>
			<cfif StructKeyExists(stValues, "Weight")><cfset variables.Weight = stValues.Weight /></cfif>
			<cfif StructKeyExists(stValues, "HeightInInches")><cfset variables.HeightInInches = stValues.HeightInInches /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SiteID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSiteID" acess="public" output="false" returntype="any">
		<cfreturn variables.SiteID>
	</cffunction>
	
	<cffunction name="setSiteID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SiteID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SiteID)) OR trim(arguments.SiteID) EQ "">
			<cfset variables.SiteID = arguments.SiteID />
		<cfelse>
			<cfthrow message="SiteID (#arguments.SiteID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SiteID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ObjectTypeID.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getObjectTypeID" acess="public" output="false" returntype="any">
		<cfreturn variables.ObjectTypeID>
	</cffunction>
	
	<cffunction name="setObjectTypeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ObjectTypeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ObjectTypeID)) OR trim(arguments.ObjectTypeID) EQ "">
			<cfset variables.ObjectTypeID = arguments.ObjectTypeID />
		<cfelse>
			<cfthrow message="ObjectTypeID (#arguments.ObjectTypeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ObjectTypeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PrefixName.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPrefixName" acess="public" output="false" returntype="any">
		<cfreturn variables.PrefixName>
	</cffunction>
	
	<cffunction name="setPrefixName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PrefixName" required="true" type="any" />
			
		<cfset variables.PrefixName = arguments.PrefixName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PrefixName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Fname.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getFname" acess="public" output="false" returntype="any">
		<cfreturn variables.Fname>
	</cffunction>
	
	<cffunction name="setFname" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Fname" required="true" type="any" />
			
		<cfset variables.Fname = arguments.Fname />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Fname") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Mname.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMname" acess="public" output="false" returntype="any">
		<cfreturn variables.Mname>
	</cffunction>
	
	<cffunction name="setMname" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Mname" required="true" type="any" />
			
		<cfset variables.Mname = arguments.Mname />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Mname") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Lname.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLname" acess="public" output="false" returntype="any">
		<cfreturn variables.Lname>
	</cffunction>
	
	<cffunction name="setLname" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Lname" required="true" type="any" />
			
		<cfset variables.Lname = arguments.Lname />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Lname") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SuffixName.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSuffixName" acess="public" output="false" returntype="any">
		<cfreturn variables.SuffixName>
	</cffunction>
	
	<cffunction name="setSuffixName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SuffixName" required="true" type="any" />
			
		<cfset variables.SuffixName = arguments.SuffixName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SuffixName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DOB.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDOB" acess="public" output="false" returntype="any">
		<cfreturn variables.DOB>
	</cffunction>
	
	<cffunction name="setDOB" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DOB" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DOB)) OR trim(arguments.DOB) EQ "">
			<cfset variables.DOB = arguments.DOB />
		<cfelse>
			<cfthrow message="DOB (#arguments.DOB#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DOB") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Sex.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSex" acess="public" output="false" returntype="any">
		<cfreturn variables.Sex>
	</cffunction>
	
	<cffunction name="setSex" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Sex" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Sex)) OR trim(arguments.Sex) EQ "">
			<cfset variables.Sex = arguments.Sex />
		<cfelse>
			<cfthrow message="Sex (#arguments.Sex#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Sex") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SSN.                                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSSN" acess="public" output="false" returntype="any">
		<cfreturn variables.SSN>
	</cffunction>
	
	<cffunction name="setSSN" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SSN" required="true" type="any" />
			
		<cfset variables.SSN = arguments.SSN />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SSN") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for MaritalStatus.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getMaritalStatus" acess="public" output="false" returntype="any">
		<cfreturn variables.MaritalStatus>
	</cffunction>
	
	<cffunction name="setMaritalStatus" acess="public" output="false" returntype="boolean">
		
		<cfargument name="MaritalStatus" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.MaritalStatus)) OR trim(arguments.MaritalStatus) EQ "">
			<cfset variables.MaritalStatus = arguments.MaritalStatus />
		<cfelse>
			<cfthrow message="MaritalStatus (#arguments.MaritalStatus#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "MaritalStatus") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EmployerID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmployerID" acess="public" output="false" returntype="any">
		<cfreturn variables.EmployerID>
	</cffunction>
	
	<cffunction name="setEmployerID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EmployerID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EmployerID)) OR trim(arguments.EmployerID) EQ "">
			<cfset variables.EmployerID = arguments.EmployerID />
		<cfelse>
			<cfthrow message="EmployerID (#arguments.EmployerID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EmployerID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Languages.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLanguages" acess="public" output="false" returntype="any">
		<cfreturn variables.Languages>
	</cffunction>
	
	<cffunction name="setLanguages" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Languages" required="true" type="any" />
			
		<cfset variables.Languages = arguments.Languages />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Languages") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Weight.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getWeight" acess="public" output="false" returntype="any">
		<cfreturn variables.Weight>
	</cffunction>
	
	<cffunction name="setWeight" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Weight" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Weight)) OR trim(arguments.Weight) EQ "">
			<cfset variables.Weight = arguments.Weight />
		<cfelse>
			<cfthrow message="Weight (#arguments.Weight#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Weight") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for HeightInInches.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getHeightInInches" acess="public" output="false" returntype="any">
		<cfreturn variables.HeightInInches>
	</cffunction>
	
	<cffunction name="setHeightInInches" acess="public" output="false" returntype="boolean">
		
		<cfargument name="HeightInInches" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.HeightInInches)) OR trim(arguments.HeightInInches) EQ "">
			<cfset variables.HeightInInches = arguments.HeightInInches />
		<cfelse>
			<cfthrow message="HeightInInches (#arguments.HeightInInches#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "HeightInInches") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


