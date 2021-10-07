({
	handleCompEvent : function(component, event, helper) {
        var searchParam=event.getParam('searchText');
        alert('searchParam --> '+searchParam)
    
        var action= component.get('c.searchSpeaker')
        action.setParams({
            searchParam1:searchParam
        });
        action.setCallback(this,function(response){
            alert(response.getState());
            if(response.getState()==='SUCCESS'){
                var responseValue=response.getReturnValue();
                component.set('v.ContactList',response.getReturnValue());
                console.log('responseValue -->  '+responseValue);
            }else{
                console.log('responseValue -->  '+response.getError()); 
            }
        });
        $A.enqueueAction(action);
	}
})