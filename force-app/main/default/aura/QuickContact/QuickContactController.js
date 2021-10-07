({
	doSave : function(component, event, helper) {
        
        /*var validContact=component.find('createForm').reduce(function(validSoFar,inputCmp){
            inputCmp.set('v.value',{valid:false, badInput:true});
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        });*/
        var cont=component.get('v.createContact');
        if($A.util.isEmpty(cont.FirstName)){
            alert('Please input FName');
            return;
        }else{
            console.log('AccountId ---> '+component.get('v.AccountId'));
            console.log('createContact --> '+ JSON.stringify(component.get('v.createContact')));
            var action=component.get('c.createContact');
            action.setParams({
                con:component.get('v.createContact'),
                AccountId:component.get('v.AccountId')
            });
            action.setCallback(this, function(response){
                console.log('getState ---> '+response.getState() );
                if(response.getState() === "SUCCESS") {
                    var responseValue=response.getReturnValue();
                    //////////////////////////////////////////////////
                    ///// below for Component Event ////////START/////
                    var componentEvent=component.getEvent('quickContact');
                    componentEvent.setParams({
                        ContactRecord:response.getReturnValue()
                    });
                    componentEvent.fire();
                    ///// below for Component Event ////////END///////
                    alert('record are insert successfully in child Component ...');
                    //$A.get('e.force:refreshView').fire();
                }
                else if(response.getState() === "INCOMPLETE"){
                    
                }
                    else if (response.getState() === "ERROR") {
                        var errors = response.getError();
                        if (errors) {
                            if (errors[0] && errors[0].message) {
                                console.log("Error message: " + errors[0].message);
                            }
                        }else {
                            console.log("Unknown error");
                        }
                    }
                
            });
            $A.enqueueAction(action);
        }
	}
})