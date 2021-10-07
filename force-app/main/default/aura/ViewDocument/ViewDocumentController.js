({
    //To handle on load actions
    doInit : function(component, event, helper) {
        helper.doInitHelper(component);
    },
    //To Preview file
    previewFile : function(component, event, helper){
        var idFile = event.target.id;
        console.log("idFile --> $$ "+idFile);
        var openPreview = $A.get('e.lightning:openFiles');
        openPreview.fire({
            recordIds: [idFile]
        });
    },
    //TO Preview attachments
    previewAttachment : function(component, event, helper){
        var idFile = event.target.id;
        window.open("/servlet/servlet.FileDownload?file="+idFile);
    },
    deleteFile: function(component, event, helper) {
        var delConfirm = window.confirm("Are you sure?")
        if(delConfirm) {
             var idFile = event.getSource().get("v.name");
            var isAttachment = event.getSource().get("v.class");
            if(isAttachment) {
                idFile = event.getSource().get("v.value");
            }
            console.log("idFile --> $$ "+idFile);
            helper.deleteFileHelper(component,idFile,isAttachment);
        }    
    }
})