

<!------------------------------------------------------------------>
<!--- Create the CSS.                                            --->
<!------------------------------------------------------------------>
	<style type="text/css">
		html body {height: 100%;
		  width: 100%!important;
		  font: 12px Arial, sans-serif;
		  margin: 0;
		  padding: 0;
		  }
		select {display: none;}
		#over {background:  url(/images/shadowlight.gif) repeat;
		  position: absolute;
		  left: 0;
		  top: 0;
		  z-index: 100;
		  width: 100%;
		  height: 100%;
		  margin: 0;
		  filter:progid:DXImageTransform.Microsoft.Alpha(opacity=80);
		  -moz-opacity:0.80;
		  -khtml-opacity:0.80;
		  }
		#box, #box2 {
		 height: 350px;
		 overflow: none;
		 border: 1px ridge #ccc;
		 z-index: 150;
		 background: #fff;
		 position: relative;
		 padding: 10px;
		 top: -5px; /* these two define the shadow 'offset'*/
		 left: -5px; /*...*/
		   }
		.sh {
			position: absolute;
			top:100px;
		  	z-index: 1000;
		 	width: 450px;
		  	right: 30%;
		  	background: url(/images/shadow.png) repeat !important;
		   	background: url(/images/shadowlight.gif) repeat;
		   }
		.bar {background: #ddd;
		   text-align: right;
		   margin: -5px;
		   padding: 5px }
		  h1 { color: #006;}
		 .bar2 {
		 	background: #6495ed;
		   	text-align: right;
		   	margin: -5px;
		   	padding: 5px }
		.bar a {border: 1px solid #777;
		 color: #777;
		 text-decoration: none;
		 font-size: 10px;
		 padding: 0 5px; }
	</style>
	
		 
	<script type="text/javascript">
		function expandCollapse() {
		 		for (var i=0; i<expandCollapse.arguments.length; i++) {
		  		var element = document.getElementById(expandCollapse.arguments[i]);
		  		element.style.display = (element.style.display == "none") ? "block" : "none";
		 	}
		}		
	</script>
	
	
	<script type="text/javascript">
		// Determine browser and version.
		function Browser() {
		  var ua, s, i;
		  this.isIE    = false;
		  this.isNS    = false;
		  this.version = null;
		  ua = navigator.userAgent;
		  s = "MSIE";
		  if ((i = ua.indexOf(s)) >= 0) {
		    this.isIE = true;
		    this.version = parseFloat(ua.substr(i + s.length));
		    return;
		  }
		  s = "Netscape6/";
		  if ((i = ua.indexOf(s)) >= 0) {
		    this.isNS = true;
		    this.version = parseFloat(ua.substr(i + s.length));
		    return;
		  }
		  // Treat any other "Gecko" browser as NS 6.1.
		  s = "Gecko";
		  if ((i = ua.indexOf(s)) >= 0) {
		    this.isNS = true;
		    this.version = 6.1;
		    return;
		  }
		}
		var browser = new Browser();
		// Global object to hold drag information.
		var dragObj = new Object();
		dragObj.zIndex = 1000;
		function dragStart(event, id) {
		  var el;
		  var x, y;
		  // If an element id was given, find it. Otherwise use the element being
		  // clicked on.
		  if (id)
		    dragObj.elNode = document.getElementById(id);
		  else {
		    if (browser.isIE)
		      dragObj.elNode = window.event.srcElement;
		    if (browser.isNS)
		      dragObj.elNode = event.target;
		    // If this is a text node, use its parent element.
		    if (dragObj.elNode.nodeType == 3)
		      dragObj.elNode = dragObj.elNode.parentNode;
		  }
		  // Get cursor position with respect to the page.
		  if (browser.isIE) {
		    x = window.event.clientX + document.documentElement.scrollLeft
		      + document.body.scrollLeft;
		    y = window.event.clientY + document.documentElement.scrollTop
		      + document.body.scrollTop;
		  }
		  if (browser.isNS) {
		    x = event.clientX + window.scrollX;
		    y = event.clientY + window.scrollY;
		  }
		  // Save starting positions of cursor and element.
		  dragObj.cursorStartX = x;
		  dragObj.cursorStartY = y;
		  dragObj.elStartLeft  = parseInt(dragObj.elNode.style.left, 10);
		  dragObj.elStartTop   = parseInt(dragObj.elNode.style.top,  10);
		  if (isNaN(dragObj.elStartLeft)) dragObj.elStartLeft = 0;
		  if (isNaN(dragObj.elStartTop))  dragObj.elStartTop  = 0;
		  // Update element's z-index.
		  dragObj.elNode.style.zIndex = ++dragObj.zIndex;
		  // Capture mousemove and mouseup events on the page.
		  if (browser.isIE) {
		    document.attachEvent("onmousemove", dragGo);
		    document.attachEvent("onmouseup",   dragStop);
		    window.event.cancelBubble = true;
		    window.event.returnValue = false;
		  }
		  if (browser.isNS) {
		    document.addEventListener("mousemove", dragGo,   true);
		    document.addEventListener("mouseup",   dragStop, true);
		    event.preventDefault();
		  }
		}
		function dragGo(event) {
		  var x, y;
		  // Get cursor position with respect to the page.
		  if (browser.isIE) {
		    x = window.event.clientX + document.documentElement.scrollLeft
		      + document.body.scrollLeft;
		    y = window.event.clientY + document.documentElement.scrollTop
		      + document.body.scrollTop;
		  }
		  if (browser.isNS) {
		    x = event.clientX + window.scrollX;
		    y = event.clientY + window.scrollY;
		  }
		  // Move drag element by the same amount the cursor has moved.
		  dragObj.elNode.style.left = (dragObj.elStartLeft + x - dragObj.cursorStartX) + "px";
		  dragObj.elNode.style.top  = (dragObj.elStartTop  + y - dragObj.cursorStartY) + "px";
		  if (browser.isIE) {
		    window.event.cancelBubble = true;
		    window.event.returnValue = false;
		  }
		  if (browser.isNS)
		    event.preventDefault();
		}
		function dragStop(event) {
		  // Stop capturing mousemove and mouseup events.
		  if (browser.isIE) {
		    document.detachEvent("onmousemove", dragGo);
		    document.detachEvent("onmouseup",   dragStop);
		  }
		  if (browser.isNS) {
		    document.removeEventListener("mousemove", dragGo,   true);
		    document.removeEventListener("mouseup",   dragStop, true);
		  }
		}
	
	</script>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.gcDefinition" default="">
	<cfset gcDefinition = attributes.gcDefinition>
	
	<cfparam name="attributes.gcModalTitle" default="">
	<cfset gcModalTitle = attributes.gcModalTitle>
	
	<cfparam name="attributes.gcModalLink" default="Link">
	<cfset gcModalLink = attributes.gcModalLink>
	
	<cfparam name="attributes.gcModalVerbiage" default="">
	<cfset gcModalVerbiage = attributes.gcModalVerbiage>
	
	<cfparam name="attributes.gcModalnumber" default="">
	<cfset gcModalnumber = attributes.gcModalnumber>
	
	<cfparam name="attributes.break" default="">
	<cfset break = attributes.break>
	
	<cfparam name="attributes.alt" default="Click here for Helpful notes">
	<cfset alt = attributes.alt>
	
	
	
<!------------------------------------------------------------------>
<!--- If gcDefinition is defined it means we should look in      --->
<!--- the database for the definition.                           --->
<!------------------------------------------------------------------>
	<cfif IsNumeric(gcDefinition)>
		
		<!------------------------------------------------------------------>
		<!--- Get the definition for the word that was passed in and     --->
		<!--- make sure you check the database first.                    --->
		<!------------------------------------------------------------------>	
			<cfset tempDefinition = CreateObject("component","com.common.db.DefinitionIO")>		
			<cfset getDefinition = tempDefinition.getDefinitionQuery(DefinitionID: trim(gcDefinition))>	
	
			<cfset gcModalTitle = trim(getDefinition.Title)>
			<cfset gcModalLink = trim(getDefinition.Title)>
			<cfset gcModalVerbiage = trim(getDefinition.Definition)>
				
	</cfif> 	
	
	

<!------------------------------------------------------------------>
<!--- Verify that the necessary fields have been passed          --->
<!------------------------------------------------------------------>	
	<cf_gcVerifyFields
		fields="gcModalVerbiage"
		fieldnames="Modal Verbiage">
		
		
		
<!------------------------------------------------------------------>
<!--- Select a random number because this script cannot have     --->
<!--- 2 elements with the same name so we append a number to     --->
<!--- them.                                                      --->
<!------------------------------------------------------------------>
	<cfset gcModalNumber = RandRange(1,5000)>		
		

	
<!------------------------------------------------------------------>
<!--- Start the display of this tag.                             --->
<!------------------------------------------------------------------>	
	<script type="text/javascript">
	
		
		// Determine browser and version.
		function Browser() {
		  var ua, s, i;
		  this.isIE    = false;
		  this.isNS    = false;
		  this.version = null;
		  ua = navigator.userAgent;
		  s = "MSIE";
		  if ((i = ua.indexOf(s)) >= 0) {
		    this.isIE = true;
		    this.version = parseFloat(ua.substr(i + s.length));
		    return;
		  }
		  s = "Netscape6/";
		  if ((i = ua.indexOf(s)) >= 0) {
		    this.isNS = true;
		    this.version = parseFloat(ua.substr(i + s.length));
		    return;
		  }
		  // Treat any other "Gecko" browser as NS 6.1.
		  s = "Gecko";
		  if ((i = ua.indexOf(s)) >= 0) {
		    this.isNS = true;
		    this.version = 6.1;
		    return;
		  }
		}
		var browser = new Browser();
		// Global object to hold drag information.
		var dragObj = new Object();
		dragObj.zIndex = 1000;
		function dragStart(event, id) {
		  var el;
		  var x, y;
		  // If an element id was given, find it. Otherwise use the element being
		  // clicked on.
		  if (id)
		    dragObj.elNode = document.getElementById(id);
		  else {
		    if (browser.isIE)
		      dragObj.elNode = window.event.srcElement;
		    if (browser.isNS)
		      dragObj.elNode = event.target;
		    // If this is a text node, use its parent element.
		    if (dragObj.elNode.nodeType == 3)
		      dragObj.elNode = dragObj.elNode.parentNode;
		  }
		  // Get cursor position with respect to the page.
		  if (browser.isIE) {
		    x = window.event.clientX + document.documentElement.scrollLeft
		      + document.body.scrollLeft;
		    y = window.event.clientY + document.documentElement.scrollTop
		      + document.body.scrollTop;
		  }
		  if (browser.isNS) {
		    x = event.clientX + window.scrollX;
		    y = event.clientY + window.scrollY;
		  }
		  // Save starting positions of cursor and element.
		  dragObj.cursorStartX = x;
		  dragObj.cursorStartY = y;
		  dragObj.elStartLeft  = parseInt(dragObj.elNode.style.left, 10);
		  dragObj.elStartTop   = parseInt(dragObj.elNode.style.top,  10);
		  if (isNaN(dragObj.elStartLeft)) dragObj.elStartLeft = 0;
		  if (isNaN(dragObj.elStartTop))  dragObj.elStartTop  = 0;
		  // Update element's z-index.
		  dragObj.elNode.style.zIndex = ++dragObj.zIndex;
		  // Capture mousemove and mouseup events on the page.
		  if (browser.isIE) {
		    document.attachEvent("onmousemove", dragGo);
		    document.attachEvent("onmouseup",   dragStop);
		    window.event.cancelBubble = true;
		    window.event.returnValue = false;
		  }
		  if (browser.isNS) {
		    document.addEventListener("mousemove", dragGo,   true);
		    document.addEventListener("mouseup",   dragStop, true);
		    event.preventDefault();
		  }
		}
		function dragGo(event) {
		  var x, y;
		  // Get cursor position with respect to the page.
		  if (browser.isIE) {
		    x = window.event.clientX + document.documentElement.scrollLeft
		      + document.body.scrollLeft;
		    y = window.event.clientY + document.documentElement.scrollTop
		      + document.body.scrollTop;
		  }
		  if (browser.isNS) {
		    x = event.clientX + window.scrollX;
		    y = event.clientY + window.scrollY;
		  }
		  // Move drag element by the same amount the cursor has moved.
		  dragObj.elNode.style.left = (dragObj.elStartLeft + x - dragObj.cursorStartX) + "px";
		  dragObj.elNode.style.top  = (dragObj.elStartTop  + y - dragObj.cursorStartY) + "px";
		  if (browser.isIE) {
		    window.event.cancelBubble = true;
		    window.event.returnValue = false;
		  }
		  if (browser.isNS)
		    event.preventDefault();
		}
		function dragStop(event) {
		  // Stop capturing mousemove and mouseup events.
		  if (browser.isIE) {
		    document.detachEvent("onmousemove", dragGo);
		    document.detachEvent("onmouseup",   dragStop);
		  }
		  if (browser.isNS) {
		    document.removeEventListener("mousemove", dragGo,   true);
		    document.removeEventListener("mouseup",   dragStop, true);
		  }
		}
		
		</script>
		
		<div id="over" style="display:none;"></div>  
		   
		 <cfoutput>		 
			 <!-- Draggable Layer -->
			 <div id="div#gcModalNumber#" class="sh" style="left:200px;top:150px; display: none;">
			  <div id="box2">
			   <div class="bar2" onMouseDown="dragStart(event, 'div#gcModalNumber#')"><a href="##" onClick="expandCollapse('div#gcModalNumber#','over')">Close</a></div>
			   <h2><cfif trim(gcModalTitle) EQ "">#trim(gcModalLink)#<cfelse>#trim(gcModalTitle)#</cfif></h2>
			   <p>#trim(gcModalVerbiage)#</p>    
			  </div>  
			 </div> 			 
			<a href="javascript: expandCollapse('div#gcModalNumber#','over');">#trim(gcModalLink)#</a>		
		</cfoutput>
	
		
	
	
	
	