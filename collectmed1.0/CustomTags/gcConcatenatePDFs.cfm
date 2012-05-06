
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.listofPDFs" default="">
	<cfset listofPDFs = attributes.listofPDFs>

	<cfparam name="attributes.finalOutPutFile" default="">
	<cfset finalOutPutFile = attributes.finalOutPutFile>



<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="listofPDFs,finalOutPutFile"
		fieldnames="listofPDFs with Path,Final OutPut File and Path">


		
<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this tag.                                              --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		listOfPDFs="#trim(listOfPDFs)#"; // list of PDFs to concatenate
		finalOutPutFile="#trim(finalOutPutFile)#"; // new output file
		// setup needed objects
		pdfCopy=createObject("java", "com.lowagie.text.pdf.PdfCopy");
		pdfReader=createObject("java","com.lowagie.text.pdf.PdfReader");
		pageSize=createObject("java", "com.lowagie.text.PageSize").init();
		bookMark=createObject("java","com.lowagie.text.pdf.SimpleBookmark");
		pdfDocument=createObject("java","com.lowagie.text.Document");
		// setup new PDF
		newPDF=createObject("java","java.io.FileOutputStream").init(finalOutPutFile);
		// grab existing PDFs	
		pageOffset=0;
		PDFs=listToArray(listOfPDFs); //pdfs to copy
		master=arrayNew(1); //master list
		for (i=1; i LTE arrayLen(PDFs); i=i+1) {
			reader=""; // clobber reader
			pdfFile=PDFs[i];
			reader=pdfReader.init(pdfFile);
			reader.consolidateNamedDestinations();
			pages=reader.getNumberOfPages(); // number of pages in this PDF
			bookmarks=bookMark.getBookmark(reader);
			if (isDefined("bookmarks")) {
				if (pageOffset NEQ 0)
					bookMark.shiftPageNumbers(bookmarks, pageOffset, javacast("null",""));
				arrayAppend(master,bookmarks);	
			} // if has bookmarks
			pageOffset=pageOffset+pages;
			if (i EQ 1) {
				pdfDocument.init(reader.getPageSizeWithRotation(1));
				pdfCopy.init(pdfDocument, newPDF);
				pdfDocument.open();		
			}  // first file in list?
			// now add pages to new PDF
			for (p=1; p LTE pages; p=p+1){
				page=pdfCopy.getImportedPage(reader,javacast("int",p));
				pdfCopy.addPage(page);
			}// loop pages in this PDF
			// special case: does this thing have any forms?
			acroForm=reader.getAcroForm();
			if (isDefined("acroForm"))
				pdfCopy.copyAcroForm(reader);
		} //loop PDFs	
		if (arraylen(master) GT 0)
			pdfCopy.setOutlines(master);
		pdfDocument.close(); //done & done	
	</cfscript>



