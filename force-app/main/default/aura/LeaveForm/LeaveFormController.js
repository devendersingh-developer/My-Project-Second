({
    doInit: function(component, event, helper) {
        var action = component.get("c.getLeaveType");
        var inputIndustry = component.find("InputLeaveType");
        var opts=[];
        action.setCallback(this, function(a) {
            
             alert("pick list "+JSON.stringify(a.getReturnValue()))
             
            opts.push({
                class: "optionClass",
                label: "--- Select ---",
                value: ""
            });
            for(var i=0;i< a.getReturnValue().length;i++){
                opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
            }
            
            inputIndustry.set("v.options", opts);
            
        });
        $A.enqueueAction(action); 
    },
    onPicklistChange: function(component, event, helper) {
        // debugger;
        var selectedIndustry = component.find("InputLeaveType");
        alert(selectedIndustry.get("v.value"));
    },
    SaveLeave : function(component, event, helper) {
        // helper.fncSaveLeave(component, event, helper);
        if(component.find("InputFromDate").get("v.value")!='' && component.find("InputToDate").get("v.value") && component.find("InputReason").get("v.value") && component.find("InputLeaveType").get("v.value"))
        {     
             system.debug("hello");
            if(Date.parse(component.find("InputFromDate").get("v.value")) < Date.parse(component.find("InputToDate").get("v.value"))){
                var action = component.get("c.FncSave");
                action.setParams({ 
                    "strFromDate" :component.find("InputFromDate").get("v.value"),
                    "strToDate" : component.find("InputToDate").get("v.value"),
                    "strReasionForLeav" : component.find("InputReason").get("v.value"),
                    "strLeaveType" : component.find("InputLeaveType").get("v.value")
                });
                action.setCallback(this, function(response){
                    var resString = response.getReturnValue();
                    if(response.getState() == "SUCCESS") {
                        $A.get("e.force:refreshView").fire();
                        $A.get("e.force:closeQuickAction").fire();
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Success!",
                            "message": "Leave are Successfully updated.",
                            "type":"success"
                        });
                        toastEvent.fire();
                    }else{
                        $A.get("e.force:closeQuickAction").fire();
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Error!",
                            "message": resString,
                            "type":"error"
                        });
                        toastEvent.fire();
                    }
                });  
                $A.enqueueAction(action);
            }else{
                alert('End date should be greater the start date.!');
            }
        }
        else
        {
            alert('All field is required field.!');
        }
        
    }
})