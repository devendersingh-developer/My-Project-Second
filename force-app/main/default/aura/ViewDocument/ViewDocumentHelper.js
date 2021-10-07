({
    doInitHelper : function(component) {
        console.log('recordId '+component.get("v.recordId"));
        var action = component.get("c.loadInitialData");
        action.setParams({
            "recordId" : component.get("v.recordId"),
            "applicantId"  : "",
            "sourceCmp" : "NoteAndAttchment"
        });
        action.setCallback(this,function(response){
            if(response.getState()=== 'SUCCESS'){
                if(response.getReturnValue() != null){
                    var result = response.getReturnValue();
                    component.set('v.files', result);
                }
            }
        });
        $A.enqueueAction(action);
    },
    deleteFileHelper: function(component,docId,isAttachment) {
        var action = component.get("c.deleteDocuments");
        action.setParams({
            "docIds" : docId,
            "isAttachment" : isAttachment
        });
        action.setCallback(this,function(response){
            if(response.getState()=== 'SUCCESS'){
                if(response.getReturnValue() != null && response.getReturnValue() == 'SUCCESS'){
      				this.doInitHelper(component);
                    this.showToast(component,event,"SUCCESS","Selected document is deleted successfully!","success");
                }
            }else if(response.getState()=== 'ERROR') {
                this.showToast(component,event,"ERROR",response.getError()[0].message,"error");
            }
        });
        $A.enqueueAction(action);
    },
    showToast : function(component, event, title, message, type) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": title,
            "message": message,
            "type" : type
        });
        toastEvent.fire();
    }
})