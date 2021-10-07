({
    doInit : function(component, event, helper) {
        console.log('recordId --> '+component.get('v.recordId'))
        var action=component.get('c.getContactList');
        action.setParams({
            accountId:component.get('v.recordId')
        });
        action.setCallback(this, function(response){
            var responseValue=response.getReturnValue();
             if(response.getState() == "SUCCESS") {
                 component.set('v.ContactList',response.getReturnValue());
             }
        });
        $A.enqueueAction(action);
    },
    doRedirect: function(component, event, helper) {
        var eventSource=event.getSource();
        var id=eventSource.get('v.name');
        //alert('id -->  '+id)
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": eventSource.get('v.name'),
            "slideDevName": "detail"
        });
        navEvt.fire();
    },
    handelCompEvent: function(component, event, helper) {
        alert('Test ');
        var availableContact=component.get('v.ContactList');
        var ContactRecord=event.getParam('ContactRecord');
        availableContact.push(ContactRecord);
        component.set('v.ContactList',availableContact);
    }
})