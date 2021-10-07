public class attachPDFToCustom {
    
   /* public attachPDFToCustom(ApexPages.StandardController standardPageController) {
    }*/

    public void attachPDF() { //Letter_V2
        PageReference pdfPage = Page.Letter_V2;
        Attachment attach = new Attachment();
        Blob pdfBlob;
        try {
            pdfBlob = pdfPage.getContent();
        }
        catch (VisualforceException e) {
            pdfBlob = Blob.valueOf('Some Text');
        }
        
        attach.parentId ='0017F00002cvFegQAE';// ApexPages.currentPage().getParameters().get('id');
        attach.Name = 'Letter Test - '+ system.Now() + ' .pdf';
        attach.body = pdfBlob;
        insert attach;
    }
}