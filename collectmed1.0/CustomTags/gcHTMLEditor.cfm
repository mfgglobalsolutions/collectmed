
<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>		
	<cfparam name="attributes.form_Name" default="">	
	
	<cfif IsDefined("form.form_Name") AND form.form_Name NEQ "">
		<cfset attributes.form_Name = form.form_Name>
	<cfelseif IsDefined("url.form_Name") AND url.form_Name NEQ "">
		<cfset attributes.form_Name = url.form_Name>	
	</cfif>
	
	<cfparam name="attributes.field_Name" default="">
	
	<cfif IsDefined("form.field_Name") AND form.field_Name NEQ "">
		<cfset attributes.field_Name = form.field_Name>
	<cfelseif IsDefined("url.field_Name") AND url.field_Name NEQ "">
		<cfset attributes.field_Name = url.field_Name>	
	</cfif>
	
	<cfparam name="attributes.verbage" default="">
	
	<cfif IsDefined("form.verbage") AND form.verbage NEQ "">
		<cfset attributes.verbage = form.verbage>
	<cfelseif IsDefined("url.verbage") AND url.verbage NEQ "">
		<cfset attributes.verbage = url.verbage>	
	</cfif>
	
	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="attributes.form_Name,attributes.field_Name"
		fieldnames="Form Name, Field Name">	
		
		
		
<!------------------------------------------------------------------>
<!--- Include the code that will show the editor on this page.   --->
<!------------------------------------------------------------------>	
<cfif ThisTag.executionMode EQ "End" OR (NOT ThisTag.HasEndTag)>
	
	<cfscript>		
		thisEditor = 1;
		if (NOT IsDefined("Attributes.width")) Attributes.width = "100%";
		if (NOT IsDefined("Attributes.height")) Attributes.height = "100";
		if (NOT IsDefined("Attributes.editor_path")) Attributes.editor_path = "";
		if (NOT IsDefined("Attributes.field_name")) Attributes.field_name = "editor";
		if (NOT IsDefined("Attributes.form_name")) Attributes.form_name = "forms[0]";
		if (NOT IsDefined("Attributes.default_value")) Attributes.default_value = ThisTag.GeneratedContent;
		if (NOT IsDefined("Attributes.image_file_root")) Attributes.image_file_root = ExpandPath('.');
		if (NOT IsDefined("Attributes.image_url_root")) Attributes.image_url_root = "/";
		Browser = IIF(FindNoCase("MSIE",cgi.HTTP_USER_AGENT),DE("IE"),DE("NS"));		
		if (IsDefined("Attributes.verbage")){verbage = Attributes.verbage;}				
	</cfscript>

	
	<cfif IsDefined("verbage")>
		<cfset verbage = ReplaceNoCase(trim(verbage), CHR(34), "", "ALL")><!--- double quotes --->
		<cfset verbage = ReplaceNoCase(trim(verbage), CHR(10), "", "ALL")><!--- carriage return --->
		<cfset verbage = ReplaceNoCase(trim(verbage), CHR(13), "", "ALL")><!--- line feed --->
	</cfif>		
	
	
	<script language="JavaScript">
		var isIE6 = (navigator.userAgent.indexOf('MSIE 6') != -1);

		function doLoad(ed,frmName) {
			var DHTMLEditor = document.frames("DHTMLEditor"+ed);		
			DHTMLEditor.document.designMode = 'On';
			setValue(ed);		
			DHTMLEditorURL = DHTMLEditor.location.href;		
			initEditor(ed);		
		}
	
		function initEditor(ed) {
			var DHTMLEditor = document.frames("DHTMLEditor"+ed);
	
			DHTMLEditor.document.oncontextmenu = function () {
				if (!DHTMLEditor.event.ctrlKey){					
					return false;
				}
			}	
			DHTMLEditor.document.onerror = function () {
				return true;
			}	
			DHTMLEditor.document.body.style.fontFamily="Verdana, Arial, Helvetica, sans-serif";
			DHTMLEditor.document.body.style.fontSize="11px";
			DHTMLEditor.document.body.topMargin = 2;
			DHTMLEditor.document.body.leftMargin = 2;
		}				
		
		function setValue(ed) {
			var DHTMLEditor = document.frames("DHTMLEditor"+ed);
			DHTMLEditorTextArea = document.getElementById("DHTMLEditorTextArea"+ed);
			DHTMLEditor.document.write(DHTMLEditorTextArea.value);
			DHTMLEditor.document.close();		
			DHTMLEditor.document.write("<cfoutput>#verbage#</cfoutput>")
			DHTMLEditor.document.close();
			DHTMLEditor.focus();		
		}
			
		function InsCmd(ed,cmd,def,val) {		
			var DHTMLEditor = document.frames("DHTMLEditor"+ed);		
			DHTMLEditor.focus();
			if (!def) var def = true;
			if (!val) var val = null;		
			if (val == null) {			
				document.execCommand(cmd);
			} else {
				
				document.execCommand(cmd,def,val);
				
			}
		}
					
		function colorPicker(ed,type) {
			var DHTMLEditor = document.frames("DHTMLEditor"+ed);
			DHTMLEditor.focus();
			if (isIE6 && document.getElementById("dlgHelper")) {
				var dlgHelper = document.getElementById("dlgHelper");
				thisColor = dlgHelper.ChooseColorDlg();
				thisColor = thisColor.toString(16);
				if (thisColor.length < 6) {
					tempColor = '000000'.substring(0,6 - thisColor.length);
					thisColor = tempColor.concat(thisColor);
				}
				document.execCommand(type,false,thisColor);
			} else {
				var arr = showModalDialog(editor_root+"selcolor.htm","","font-family:Verdana; font-size:12; dialogWidth:30em; dialogHeight:34em" );
				if (arr != null) {
					InsCmd(ed,type,false,arr);					
				}
			}
			DHTMLEditor.focus();
		}	
		
		function editorToggle(mode,ed) {
			var DHTMLEditor = document.getElementById("DHTMLEditor"+ed);;
			DHTMLEditorTextArea = document.getElementById("DHTMLEditorTextArea"+ed);
			DHTMLEditorToolbar = document.getElementById("DHTMLEditorToolbar"+ed);		
			
			if (mode == 'html') {
				DHTMLEditor.style.display = 'none';
				DHTMLEditor.style.visibility = 'hidden';
				DHTMLEditorTextArea.style.display = 'block';
				DHTMLEditorTextArea.style.visibility = 'visible';
				DHTMLEditorToolbar.style.display = 'none';
				DHTMLEditorTextArea.focus();	
				
			} else {
				DHTMLEditorToolbar.style.display = 'block';
				DHTMLEditorTextArea.style.display = 'none';
				DHTMLEditorTextArea.style.visibility = 'hidden';
				DHTMLEditor.style.display = 'block';
				DHTMLEditor.style.visibility = 'visible';
													
			}
		}
			
	</script>


	<OBJECT id=dlgHelper CLASSID="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px"></OBJECT>
	<cfhtmlhead text="
	<style>
		.xpeSelect {border:1px solid; font-size:10px;} 
	</style>
	">
	

	<cfoutput>
	
	
		<div id="DHTMLEditorToolbar#thisEditor#" style="background-color:buttonface;width:100%;height:18px;">					
			<img src="../images/WebAuthorImages/button_cut.gif" style="cursor: 'hand';" alt="Cut" onclick="InsCmd(#thisEditor#, 'Cut');" border="0">
			<img src="../images/WebAuthorImages/button_copy.gif" style="cursor: 'hand';" alt="Copy" onclick="InsCmd(#thisEditor#, 'Copy');" border="0">
			<img src="../images/WebAuthorImages/button_paste.gif" style="cursor: 'hand';" alt="Paste" onclick="InsCmd(#thisEditor#, 'Paste');" border="0">
			<img src="../images/WebAuthorImages/separator.gif" alt="" border="0">	
			<img src="../images/WebAuthorImages/button_undo.gif" style="cursor: 'hand';" alt="Undo" onclick="InsCmd(#thisEditor#, 'Undo');" border="0">
			<img src="../images/WebAuthorImages/button_redo.gif" style="cursor: 'hand';" alt="Redo" onclick="InsCmd(#thisEditor#, 'Redo');" border="0">
			<img src="../images/WebAuthorImages/separator.gif" style="cursor: 'hand';" alt="" border="0">		
			<img src="../images/WebAuthorImages/button_bold.gif" style="cursor: 'hand';" alt="Bold" onclick="InsCmd(#thisEditor#, 'Bold');" border="0">
			<img src="../images/WebAuthorImages/button_italic.gif" style="cursor: 'hand';" alt="Italic" onclick="InsCmd(#thisEditor#, 'Italic');" border="0">
			<img src="../images/WebAuthorImages/button_underline.gif" style="cursor: 'hand';" alt="Underline" onclick="InsCmd(#thisEditor#, 'Underline');" border="0">
			<img src="../images/WebAuthorImages/separator.gif" alt="" border="0">		
			<img src="../images/WebAuthorImages/button_decrease_indent.gif" style="cursor: 'hand';" alt="Decrease Indent" onclick="InsCmd(#thisEditor#, 'Outdent');" border="0">
			<img src="../images/WebAuthorImages/button_increase_indent.gif" style="cursor: 'hand';" alt="Indent" onclick="InsCmd(#thisEditor#, 'Indent');" border="0">
			<img src="../images/WebAuthorImages/button_hr.gif" style="cursor: 'hand';" alt="Horizontal Rule" onclick="InsCmd(#thisEditor#, 'InsertHorizontalRule');" border="0">
			<img src="../images/WebAuthorImages/separator.gif" alt="" border="0">	
			<img src="../images/WebAuthorImages/button_align_left.gif" style="cursor: 'hand';" alt="Align Left" onclick="InsCmd(#thisEditor#, 'JustifyLeft');" border="0">
			<img src="../images/WebAuthorImages/button_align_center.gif" style="cursor: 'hand';" alt="Center" onclick="InsCmd(#thisEditor#, 'JustifyCenter');" border="0">
			<img src="../images/WebAuthorImages/button_align_right.gif" style="cursor: 'hand';" alt="Align Right" onclick="InsCmd(#thisEditor#, 'JustifyRight');" border="0">
			<img src="../images/WebAuthorImages/separator.gif" alt="" border="0">	
			<img src="../images/WebAuthorImages/button_bullets.gif" style="cursor: 'hand';" alt="Bullets" onclick="InsCmd(#thisEditor#, 'InsertUnorderedList');" border="0">
			<img src="../images/WebAuthorImages/button_numbers.gif" style="cursor: 'hand';" alt="Numbering" onclick="InsCmd(#thisEditor#, 'InsertOrderedList');" border="0">
			<img src="../images/WebAuthorImages/separator.gif" alt="" border="0">
			<img src="../images/WebAuthorImages/button_anchor.gif" style="cursor: 'hand';" alt="Insert Anchor" onclick="InsCmd(#thisEditor#, 'CreateBookmark',true,window.prompt('Enter Anchor Name:',''));" border="0">
			<img src="../images/WebAuthorImages/button_link.gif" style="cursor: 'hand';" alt="Insert Hyperlink" onclick="InsCmd(#thisEditor#, 'CreateLink');" border="0">
			<img src="../images/WebAuthorImages/separator.gif" alt="" border="0">		
			<img src="../images/WebAuthorImages/button_font_color.gif" style="cursor: 'hand';" alt="Font Color" onclick="colorPicker(#thisEditor#,'ForeColor');" border="0">
			<img src="../images/WebAuthorImages/button_bgcolor.gif" style="cursor: 'hand';" alt="Background Color" onclick="colorPicker(#thisEditor#,'BackColor');" border="0">
		</div>

		<div id="Wrapper">			
			<iFrame frameborder="1" contenteditable HEIGHT=90% id="DHTMLEditor#thisEditor#" style="border:0;width:#Attributes.width#;height:#Attributes.height#;"></iFrame>
			<textarea name="#Attributes.field_name#" style="font-Family:'Verdana';font-Size:'8pt';visibility:hidden;display:none;border:0;width:#Attributes.width#;height:#Attributes.height#;" id="DHTMLEditorTextArea#thisEditor#">#Attributes.default_value#</textarea>
		</div>
		
		
		
		<cfif CGI.REMOTE_ADDR EQ "192.168.13.1">
			
			<div style="background-color:buttonface;width:100%;">				
				<table width="100" border="0" cellspacing="0" cellpadding="1">
				<TR>
					<td id="normalmode" bgcolor="33ffff"><font face="Verdana" size="1">
					<a class="qk1-link-dynamic-searchbox" href="JavaScript:void(0);" onclick="editorToggle('wysiwyg',#thisEditor#);" title="View Text as WYSIWYG"><B>Normal</B></a>
					</TD>
					<TD>
					/
					</TD>
					<td id="htmlmode" bgcolor="ffffff"><font face="Verdana" size="1">
					<a class="qk1-link-dynamic-searchbox" href="JavaScript:void(0);" onclick="beforeSubmit(); editorToggle('html',#thisEditor#);" title="View Text in HTML Mode"><B>HTML</B></a>
					</TD>
				</TR>
				</table>
			</div>
		
		</cfif>
		
		
		
		<script language="JavaScript">
			if (document.all)
				window.attachEvent("onload",function() {doLoad(#thisEditor#,'#Attributes.form_name#');});
			else
				window.addEventListener("load",function(e) {doLoad(#thisEditor#,'#Attributes.form_name#');},true);
				
			function beforeSubmit(){			
				document.all.#attributes.field_Name#.value = document.frames('DHTMLEditor#thisEditor#').document.body.innerHTML;			
			}	
		</script>
	
	</cfoutput>
	
	<cfset thisTag.GeneratedContent = "">
	
</cfif>	

	