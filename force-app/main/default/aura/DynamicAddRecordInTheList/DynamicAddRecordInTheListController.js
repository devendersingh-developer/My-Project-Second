({
    handleProduct : function(cmp, evt) {
        let isAllValid = cmp.find('field').reduce(function(isValidSoFar, inputCmp){
            inputCmp.reportValidity();
            return isValidSoFar && inputCmp.checkValidity();
        },true);
        if(isAllValid){
            console.log('line number 8 isAllValid ---> '+isAllValid)
            var PL = cmp.get("v.productList");
            var product = {
                MID:  cmp.get("v.sMID"),
                CardType:  cmp.get("v.sCardType"),
                Product:  cmp.get("v.sProduct")
            }; 
            PL.push(product);
            cmp.set("v.productList", PL);
        }
        /*cmp.find('field').forEach(function(f) {
            f.value='';
        });*/
    },
    handleProduct1 : function(cmp, evt) {
        let isAllValid = cmp.find('field').reduce(function(isValidSoFar, inputCmp){
            //display the error messages
            inputCmp.reportValidity();
            //check if the validity condition are met or not.
            return isValidSoFar && inputCmp.checkValidity();
        },true);
        
        console.log('line number 20 isAllValid ---> '+isAllValid)
    },
    doInit: function(cmp, evt){
        /* var PL = cmp.get("v.productList");
        for(var i=0;i<=2;i++){
            var product = {
                MID: 'Mid '+i,
                CardType: 'cardType '+ i,
                Product: 'ProductName '+i
            }; 
            PL.push(product);
        }
        cmp.set("v.productList", PL); */
    },
    Submit: function(cmp, evt){
        console.log('List on submit button --> '+cmp.get("v.productList"));
        console.log('List on JSON.stringify --> '+JSON.stringify(cmp.get("v.productList")));
        var action = cmp.get("c.SaveRecords");
        action.setParams({
            "listWraper": JSON.stringify(cmp.get("v.productList"))
        });
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                console.log(' 35 List on JSON.stringify --> '+response.getState());
            }
        });
        $A.enqueueAction(action);
    }
})