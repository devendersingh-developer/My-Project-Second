({
    createObjectData: function(component, event) {
        //get the AccountList from component and add(push) New Object to List  
        
        debugger;
        var RowItemList = component.get("v.AccountList");
        RowItemList.push({
            'sobjectType': 'Account',
            'Name': '',
            'AccountNumber': '',
            'Phone': ''
        });
        // set the updated list to attribute (AccountList) again    
        component.set("v.AccountList", RowItemList);
    },
    //helper function for check if Account Name is not null/blank on save  
    validate: function(component, event) {
        debugger;
        var isValid = true;
        var allAccountRows = component.get("v.AccountList");
        for (var indexVar = 0; indexVar < allAccountRows.length; indexVar++) {
            if (allAccountRows[indexVar].Name == '') {
                isValid = false;
                alert('Account Name Cannot be blank on row number ' + (indexVar + 1));
            }
        }
        return isValid;
    },
})