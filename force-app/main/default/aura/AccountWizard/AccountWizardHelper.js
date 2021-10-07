({
    HelperSaveWizard : function(component) {
        var action = component.get("c.SaveWizard");
        action.setParams({
            "AccountName" :component.find("AccountName").get("v.value"),
            "Accountsite" : component.find("Accountsite").get("v.value"),
            "ContactFirstName" : component.find("ContactFirstName").get("v.value"),
            "ContacLastName" : component.find("ContacLastName").get("v.value"),
            "OpportunityName" :component.find("OpportunityName").get("v.value"),
            "oppClosedate" : component.find("oppClosedate").get("v.value")
        }); 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('Data save sucessfully '+response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
    }
})