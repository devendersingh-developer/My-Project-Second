({
    doInt : function(component, event, helper) {
        var opts=[];
        
        //   var pickValue=new Array("Closed Won","Closed lost","Prospect");
        
        var inputIndustry = component.find("InputLeaveType");
        opts.push({class: "optionClass",label: "--- Select ---",value: ""});
        
        opts.push({class: "optionClass",label: "Closed Won",value: "Closed Won"});
        
        opts.push({class: "optionClass",label: "Closed lost",value: "Closed lost"});
        
        inputIndustry.set("v.options", opts);
        
    }
})