({
    handleClick : function(component, event, helper) {
        var sum=parseInt(component.get('v.firstNumber')) +parseInt(component.get('v.SecondNumber'));
        var appEvent= $A.get("e.c:CalculatorApplicationEvent");
        appEvent.setParams({"sunresult":sum});
        appEvent.fire();
    }
})