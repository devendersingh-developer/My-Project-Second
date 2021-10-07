({
    getPicklistValues: function(component, event) {
        var action = component.get("c.getKYCVerificationAPI");
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log("state ---> "+state);
            //_____________ Checking if there is no error occured in Apex___________________
            if (state === "SUCCESS") {
                component.set('v.mapKYCverificationApi',response.getReturnValue());
                component.set("v.showKYCVerificationAPiType",true);
                var result = component.get('v.mapKYCverificationApi');
                //__________________  For fetching the questionaire type ___________________
                var listKYCcategory = [];
                for ( var key in result ) {
                    if(!$A.util.isEmpty(key)){
                        listKYCcategory.push(key);
                    }
                }
                component.set("v.listKYCverificationApi",listKYCcategory);
              //console.log('listKYCcategory --> '+listKYCcategory);  
            } else{
                this.showToast(component,event,"ERROR!",'Some unknown error occured.',"error");
                component.set("v.showSpinner",false);
            }
        });
        $A.enqueueAction(action);
    },
    showToast : function(component, event,title, message,type) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title" : title,
            "message": message,
            "type" : type
        });
        toastEvent.fire();
    }
})