({
     
    // function call on component Load
    doInit: function(component, event, helper) {
        helper.createObjectData(component, event);
    },
    // function for save the Records 
    Save: function(component, event, helper) {
        if (helper.validate(component, event)) { 
            var action = component.get("c.SaveAccounts");
            action.setParams({
                "accList": component.get("v.AccountList")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.AccountList", []);
                    helper.createObjectData(component, event);
                    alert('Account records saved successfully');
                }
            }); 
            $A.enqueueAction(action);
        }
    },
     
    // function for create new object Row in Contact List 
    addRow: function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);
    },
     
    // function for delete the row 
    removeDeletedRow: function(component, event, helper) {
        debugger;
        //get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        //get the all List (AccountList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.AccountList");
        AllRowsList.splice(index, 1);
        //set the AccountList after remove selected row element  
        component.set("v.AccountList", AllRowsList);
    },
})