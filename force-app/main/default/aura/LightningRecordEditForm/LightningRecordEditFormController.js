({
    handleLoad : function(component, event, helper) {
        console.log('handle handleLoad');
        component.set("v.showSpinner", false);
    },
    handleSubmit : function(component, event, helper) {
        event.preventDefault(); // Prevent default submit
        var fields = event.getParam("fields");
        fields["Website"]='Devenders843@gmail.com';
        
        console.log('fields ---> '+ JSON.stringify(fields));
        console.log('fields Name ---> '+ JSON.stringify(fields.Name));
        var PL = component.get("v.productList");
        var product = {
            Name:  fields.Name,
            AccountNumber: fields.AccountNumber,
            Type:  fields.Type,
            BillingStreet:fields.BillingStreet,
            BillingCity: fields.BillingCity,
            BillingState: fields.BillingState,
            Website: fields.Website
        }; 
        PL.push(product);
        component.set("v.productList", PL);
        component.find('createAccountForm').submit(fields); // Submit form
        console.log('handle handleSubmit');
        
        
    },
    handleSave:function(component, event, helper) {
        var getCourseRun = component.get('c.save');
        getCourseRun.setParams({});
        getCourseRun.setCallback(this, function(response) { 
            alert("getState --> "+response.getState())            
            if(response.getState() === "SUCCESS") {               
                if($A.util.isEmpty(response.getReturnValue())){
                    
                }
            }
            else if(response.getState() == "ERROR"){
                var errors = response.getError();    
                //alert(errors[0].message);
                helper.ShowToastEvent(component, event,"Error occured! Please contact the system admin.",'Error','error');
            }
        });
        $A.enqueueAction(getCourseRun);
    },
    handleSuccess : function(component, event, helper) {
        console.log('record updated successfully');
        
        
        component.set("v.showSpinner", false);
    },
})