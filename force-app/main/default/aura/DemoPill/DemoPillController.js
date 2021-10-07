({
    doInit: function(component, event, helper) {
        helper.getProductList(component);
      
        var toggleText = component.find("NextProduct");
        $A.util.toggleClass(toggleText, "toggle");
    },
    BtnAddToPill: function(component, event, helper) {
        event.preventDefault();
        var StrValue = component.get("v.items");
        var ProductName = event.target.getElementsByClassName('ProductLine-name')[0].value;
        var ProductCode = event.target.getElementsByClassName('ProductLine-Code')[0].value;
        var ProductID = event.target.getElementsByClassName('ProductLine-ID')[0].value;
        StrValue.push(
            {
                ID:ProductID,
                type: 'avatar',
                href: '',
                label: ProductName,
                prodcode: ProductCode,
                src: '/docs/component-library/app/images/examples/avatar2.jpg',
                fallbackIconName: 'standard:user',
                variant: 'circle',
                alternativeText: 'User avatar',
            }
        );   
        component.set("v.items", StrValue);
        var a = component.get('c.handleClick');
        $A.enqueueAction(a);
        
    },
    handleItemRemove: function (component, event, helper) {
       
        var index = event.getParam("index");
        var items = component.get('v.items');
        
        items.splice(index, 1);
        component.set("v.items", items);
        var a = component.get('c.handleClick');
        $A.enqueueAction(a);
    },
    handleClick:function(component,event)
    {
        var searchKeyWord = component.get("v.SearchKeyWord"); 	
        var AllAddedProductList=component.get('v.items');
        var ArrayProductCode = new Array();
        
        for (var i = 0; i < AllAddedProductList.length; i++) { 
            var ProdCode=AllAddedProductList[i].prodcode;
            ArrayProductCode.push(ProdCode);
        }
        
        var action = component.get("c.SearchProduct");
        
        action.setParams({
            'strKeyword': searchKeyWord,
            'selectedProduct' :ArrayProductCode
        });
        action.setCallback(this, function(response) {            
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();                
                component.set('v.ProductLine', response.getReturnValue());
            }
        });
        $A.enqueueAction(action); 
    },
    ClickNext:function(component,event){
        
        var toggleTextDis = component.find("SearchProduct");
        $A.util.toggleClass(toggleTextDis, "toggle");
        
        var toggleText = component.find("NextProduct");
        $A.util.toggleClass(toggleText, "toggleDis");
        

        var searchKeyWord = component.get("v.SearchKeyWord"); 
        var AllAddedProductList=component.get('v.items');
        var ArrayProductID = new Array();
        var oppid=component.get("v.recordId");
        
        for (var i = 0; i < AllAddedProductList.length; i++) { 
            var ProdCode=AllAddedProductList[i].ID;
            ArrayProductID.push(ProdCode);
        }
        
        var action = component.get("c.AddProduct");
        action.setParams({
            'OppId': oppid,
            'selectedProduct' :ArrayProductID
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.EditOpportunityLine', response.getReturnValue());
            }
        });
        component.set('v.currentStage', 'step2');
        $A.enqueueAction(action);
    },
    OnQuantityChange:function(component,event){
        var EditOpportunityLineData=component.get('v.EditOpportunityLine');
        var UpdateOpportunityLineData = new Array();
         var oppid=component.get("v.recordId");
        alert(oppid);
        for(var iCount=0;iCount<EditOpportunityLineData.length;iCount++)
        {
            UpdateOpportunityLineData.push(
                {
                    Id: EditOpportunityLineData[iCount].Id,
                    OpportunityId : oppid,
                    Product_Name__c: EditOpportunityLineData[iCount].Product_Name__c,
                    Product_Code__c:  EditOpportunityLineData[iCount].Product_Code__c,
                    Quantity: EditOpportunityLineData[iCount].Quantity,
                    UnitPrice: EditOpportunityLineData[iCount].UnitPrice,
                    PricebookEntryId: EditOpportunityLineData[iCount].PricebookEntryId,
                    TotalPrice: (EditOpportunityLineData[iCount].Quantity*EditOpportunityLineData[iCount].UnitPrice)
                }
            );
        }
        component.set('v.EditOpportunityLine',UpdateOpportunityLineData);
    },
    SaveRecords:function(component,event){

        var action = component.get("c.SaveOpportunityLine");
        action.setParams({
            'OpportunityLine' :JSON.stringify(component.get('v.EditOpportunityLine'))
        }); 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('Data save sucessfully'+response.getReturnValue());
            }
        });
         component.set('v.currentStage', 'step3');
        $A.enqueueAction(action); 
    }
})