({
    // Fetch the accounts from the Apex controller
    getProductList: function(component) {
        var action = component.get('c.getProduct');
        var self = this;
        action.setCallback(this, function(actionResult) {
         
            component.set('v.ProductLine', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})