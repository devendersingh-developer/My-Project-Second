({
    doInit: function(component, event, helper) {
         // alert('component is get initialize successfully.')
        component.set("v.carTypesFromInit",['Sports Car','Luxury Car','Van']);
    },
    onSearchClick : function(component, event, helper) {
        console.log(" ********************** IN Controller JS ***************");
        console.log("on search button ");
        helper.helperMethod(component, event, helper);
    },
    onToggleButton: function(component, event, helper) {
        console.log(" ********************** IN Controller JS ***************");
        console.log("on search button ");
        if(component.get("v.isNewAvailable"))
            component.set("v.isNewAvailable","false");
        else{
            component.set("v.isNewAvailable","true");
            component.set("v.newLable","New Button Change");   
        }
    },
    onSelectEvent:  function(component, event, helper) {
        console.log("on select change "+component.find("CarType").get("v.value"));
    },
    handelrender: function(component, event, helper) {
       // alert('component is render successfully.')
    },
    testChange: function(component, event, helper) {
        console.log("on select change "+component.find("CarType").get("v.value"));
    },
})