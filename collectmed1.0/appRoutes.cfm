
<script type="text/javascript" src="scripts/tagAddRoutePopupFunction.js"></script>

<cfscript>
	variables.filterRoute = structNew();
	//variables.filterRoute.UsersID = trim(session.user.getUsersID()); will these be seen based on userID
	variables.filterRoute.Active = 1;
	variables.filterRoute.OrderBy = "RouteID";
	variables.RouteSVC = application.beanFactory.getBean('old_RouteService');	
	variables.allRoutes = variables.RouteSVC.getAllRoutes(variables.filterRoute);
</cfscript>


<style type="text/css">
	td{
		font-size: 12px;
	}	
</style>


<cfoutput>

	<script>
		
		var urlReconstructed = '#trim(request.urlReconstructed)#';
		
		function processData(formData){    		
			if(formData != "Cancelled"){		 	
				alert(formData.routeName); 
			};   
		};
	
		function processData(formData){		
	
			if(formData != "Cancelled"){
					
				var data1 = #trim(session.ClientID)#;			
				var data2 = #trim(session.User.getUsersID())#;					
				var data3 = formData.routeName;
				
				$.get("#trim(request.urlReconstructed)#/ws/wsRoute.cfc", 
					{ 
						method: "wsAddRoute",
						dataType: "xml",
						Data1: escape(data1), 
						Data2: escape(data2), 							
						Data3: escape(data3), 							
						rand: escape(randNum_JS()) 
					},
				 	function(data){										
						//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
						if (window.ActiveXObject){
							var doc=new ActiveXObject("Microsoft.XMLDOM");
						  	doc.async="false";
						  	doc.loadXML(data);
						}				
						
						var x = doc.documentElement;
						
						$(x).find('change').each(function(){								
							var $change = $(this);
							var thisChangeError = $change.find('error').text();																				
							alert(thisChangeError);																	
						});	
						
						window.location.reload(true);		
								
					//ends the callback function.										
					});			
			};
		};	
	
	</script>  


	<br>	
	<table cellspacing="4" cellpadding="2" border="0" align="center">	
		<tr>		   
			<td align="left" valign="top">				
				<table cellspacing="0" cellpadding="10" border="0">
					<tr>
						<td valign="top">
							<cf_gcBorderedTable	title="Current Routes &nbsp;&nbsp;&nbsp;" tableWidth="100%">	
								<table>
								<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Create New Route" id="createNewRouteButton" onclick="addRoutePopup('processData');"></td></tr>
								<cfif IsQuery(variables.allRoutes)>									
									<cfloop query="variables.allRoutes">
										<tr><td><a href="appRoute.cfm?RouteID=#trim(RouteID)#">#Name#</a></td></tr>
									</cfloop>
								</table>									
								<cfelse>
									<tr><td>No Routes Found</td></tr>	
								</cfif>											
							</cf_gcBorderedTable>	
						</td>
					</tr>						
				</table>				
			</td>
		</tr>			
	</table>
	<br><br>
</cfoutput>



