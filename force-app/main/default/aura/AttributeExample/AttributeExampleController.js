({
    
     doInit:function(component,event,helper){
        var action=component.get('c.getContactList');
        action.setParams({
            accountId:component.get('v.recordId')
        });
        action.setCallback(this,function(response){
            var responseValue=response.getReturnValue();
            console.log('Response Value IS ',responseValue);
            component.set('v.contactList',responseValue);
        });
         $A.enqueueAction(action,false);
    },
    doclick : function(component, event, helper) {
        
        alert(component.isValid());
        alert(component.getName());
        alert(component.get("v.Fname"));
        //  component.set('v.Fname',"Chibi Singh");
        
        var agecomp=component.find('testInput');
        alert(agecomp.get('v.value'));
        agecomp.set('v.value',67)
        component.set('v.iSTruey','false');
    },
    
    fncgetdetails:function(component, event, helper) {
        
        var eventSource=event.getSource();
        var id=eventSource.get('v.name');
        
       // alert("This is buttob event ID:"+id);
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": id,
            "slideDevName": "detail"
        });
        navEvt.fire();
    },
    
    doCreateMap :function(component, event, helper){
        var map=[];
        for(var i=0;i<10;i++){
            map.push({
                key:i,value:'Test'+i
            });
        }
        component.set("v.mapVal",map);
    }
    
   
})