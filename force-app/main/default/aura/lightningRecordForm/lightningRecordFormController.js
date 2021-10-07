({
    handleSuccess : function(component, event, helper) {
        const fields = event.getParam('fields');
        console.log('fields --> '+JSON.stringify(fields));
        /*component.find('notifLib').showToast({
            "variant": "success",
            "title": "Account Created",
            "message": "Record ID: " + event.getParam("id")
        });*/
    }
})