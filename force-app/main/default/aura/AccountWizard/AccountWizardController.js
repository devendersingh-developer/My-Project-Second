({
	doinit : function(component, event, helper) {
      
        var opts=[];
        /*for(var i=0;i< a.getReturnValue().length;i++){
            opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
        }*/
        
        opts.push({class: "optionClass",label: "Closed lost",value: "Closed lost"});
        
             component.set("v.pageList",opts);
        
        
    },
     NextAccount : function(component, event, helper) {
         component.set("v.next",false);
             
    },
    SaveWizard:function(component, event, helper)
    {
        helper.HelperSaveWizard(component);
    }
     
    
})