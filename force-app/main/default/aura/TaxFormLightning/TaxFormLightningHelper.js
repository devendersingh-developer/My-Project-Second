({
    helpergetTax : function(component,event,helper) {
        var action=component.get('c.getTax');
        action.setCallback(this, function(response) {
            if(response.getReturnValue() != null){
                alert(response.getReturnValue());
                component.set("v.lstTaxFrom",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    helperSaveTax:function(component,event,helper)
    {
    }
})