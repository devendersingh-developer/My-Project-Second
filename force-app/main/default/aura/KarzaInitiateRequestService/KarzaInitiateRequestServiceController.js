({
    doInit : function(component, event, helper) {
        helper.getPicklistValues(component, event);
    },
    onKYCVerificationAPiSelect : function(component, event, helper) {
        debugger;
        var industry = component.get("v.selectedKYCVerificationAPiType");
        console.log(industry);
        component.set("v.showKYCVerificationAPiType",false);
        var result =component.get("v.mapKYCverificationApi");
        console.log("result 15 ---> "+result[industry]);
        component.set("v.listKYCverificationLabel",result[industry]);
    },
    //__________________________________________________________________________
    doCancel : function(component,event,helper){
        $A.get("e.force:closeQuickAction").fire();
    },//do cancel
    //__________________________________________________________________________
    goBack : function(component,event,helper){
        component.set("v.showKYCVerificationAPiType",true);
        component.set("v.listKYCverificationLabel",[]);
    }//goBack
    
})