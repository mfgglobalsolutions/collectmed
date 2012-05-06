<!------------------------------------------------------------------>
<!--- name: appAdminByPageReporting.cfm                          --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>




<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="request.datasource" default="#trim(request.datasource)#">
	<cfset datasource = request.datasource>
	
	<cfparam name="URL.date" default="#Now()#">
	<cfset date = URL.date>
			
	<cfparam name="Today" default="#CreateODBCDateTime(CreateDateTime(year(date), month(date), day(date), 0, 0 ,0))#">
	
		

<!------------------------------------------------------------------>
<!--- This is a join query doe snot need to be inside a          --->
<!--- custom tag.                                                --->
<!------------------------------------------------------------------>	
	<cfquery name="getPageHits" datasource="#datasource#">
		SELECT COUNT(PageHit.pageID) AS NumberOfHits, PageHit.PageID, Page.PageName
		FROM PageHit INNER JOIN Page ON PageHit.PageID = Page.PageID
		WHERE PageHit.DateCreated >= #Today#
		GROUP BY PageHit.PageID, Page.PageName
	</cfquery>
	
	
	
<cfoutput>This page is not yet done.</cfoutput>
<cfdump var="#getPageHits#">


