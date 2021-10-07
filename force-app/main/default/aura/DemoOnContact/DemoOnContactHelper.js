({
    getContactList: function(component,page, recordToDisply) {
        var action = component.get('c.getContact');
        action.setParams({
            "pageNumber": page,
            "recordToDisply": recordToDisply
        });
        action.setCallback(this, function(actionResult) {
            var result = actionResult.getReturnValue();
            component.set('v.LstContact', result.contacts);
            component.set("v.page", result.page);
            component.set("v.total", result.total);
            component.set("v.pages", Math.ceil(result.total / recordToDisply));
        });
        $A.enqueueAction(action);
        
       /* var rg= component.get("v.recordGroup");
                
                var len=component.get("v.total")%rg==0?component.get("v.total")/rg:Math.trunc(component.get("v.total")/rg)+1;
                for(var i=1;i<=len;i++)
                    {
                        console.log('inside for'+i);
                        pageList.push(i);
                        //break;
                    }
                component.set("v.pageList",pageList);*/
    },
    getSearchText:function(component,page, recordToDisply)
    {
        var action=component.get('c.getContactSearch');
       var SearchText=component.find('InputSearchDate').get("v.value");
        
        //alert(SearchText);
        
        action.setParams({
            'strSearchText': SearchText,
            "pageNumber": page,
            "recordToDisply": recordToDisply
        });
        action.setCallback(this, function(actionResult) {
            var result = actionResult.getReturnValue();
            component.set('v.LstContact', result.contacts);
            component.set("v.page", result.page);
            component.set("v.total", result.total);
            component.set("v.pages", Math.ceil(result.total / recordToDisply));
        });
        $A.enqueueAction(action);
    }
})