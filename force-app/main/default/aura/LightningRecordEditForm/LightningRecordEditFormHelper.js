({
    ShowToastEvent: function(component, event,Message,title,type){
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : title,
            message: Message,
            duration:' 50000',
            // key: 'info_alt',
            type: type,
            // mode: 'pester'
        });
        toastEvent.fire();
    },
    showConfirmationToast : function(component, event) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been created successfully."
        });
        toastEvent.fire();
    }
})