({
    doinit : function(component, event, helper) {
        helper.helpergetTax(component, event, helper);  
    },
    createRecord:function(component, event, helper){
        
        
        var action=component.get('c.SaveTax');
        action.setParams({
            "lstTax": component.get("v.NewTaxFrom")
        });
        action.setCallback(this, function(response){
            var resString = response.getReturnValue();
            
            if(response.getState() == "SUCCESS") {
                $A.get("e.force:refreshView").fire();
                $A.get("e.force:closeQuickAction").fire();
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": " Invoice line item are Successfully updated.",
                    "type":"success"
                });
                toastEvent.fire();
                // alert('Data Save successfully');
            }else{
                $A.get("e.force:closeQuickAction").fire();
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": resString,
                    "type":"error"
                });
                toastEvent.fire();
                //alert('error');
            }
        });
        $A.enqueueAction(action);
    }
        
    })