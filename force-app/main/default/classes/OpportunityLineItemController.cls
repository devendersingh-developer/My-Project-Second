public class OpportunityLineItemController {
    
    @AuraEnabled
    public static List <OpportunityLineItem> getOpportLineunity() {
        return [SELECT Id,ListPrice,Name,OpportunityId,PricebookEntryId,Product2Id,ProductCode,Quantity,ServiceDate,TotalPrice,UnitPrice FROM OpportunityLineItem ORDER BY createdDate ASC];
    }
    @AuraEnabled
    public static list<Product2> getProduct(){
        return [Select Id, Name, ProductCode,Description from Product2 Limit 5];
    }
    
     @AuraEnabled
    public static list<Product2> SearchProduct(string strKeyword,List<string> selectedProduct){
         set<string> setSelectedProduct=new set<string>();
        setSelectedProduct.addAll(selectedProduct ); 
        return [Select Id, Name, ProductCode,Description from Product2 where ProductCode not IN:setSelectedProduct Limit 5];
    }
   /* @AuraEnabled
    public static List <OpportunityLineItem> SearchProduct(string strKeyword,List<string> selectedProduct) {
        set<string> setSelectedProduct=new set<string>();
        setSelectedProduct.addAll(selectedProduct ); 
        return [SELECT Id,ListPrice,Name,OpportunityId,PricebookEntryId,Product2Id,ProductCode,Quantity,ServiceDate,TotalPrice,UnitPrice FROM OpportunityLineItem where ProductCode not in:setSelectedProduct];
    }*/
    
    @AuraEnabled
    public static List <OpportunityLineItem> AddProduct(string OppId,List<string> selectedProduct) {
        
        Map<string,PricebookEntry> MapPriceBookEntry=new Map<string,PricebookEntry>();
        list<Opportunity> LstOpp=[Select Id,Pricebook2Id from Opportunity where Id=:OppId];
        string strPricebook2Id;
        if(LstOpp.size()>0){
            strPricebook2Id=LstOpp[0].Pricebook2Id;
        }
        //Pricebook2Id
       //Map<string,PricebookEntry> MapProduct=new Map<string,PricebookEntry>();
        
        for(PricebookEntry PBE:[SELECT Id,Pricebook2Id,Name,Product2Id,ProductCode FROM PricebookEntry where Pricebook2Id=:strPricebook2Id] ){
            MapPriceBookEntry.put(PBE.Product2Id,PBE);
            //MapProduct.put(PBE.Product2Id, PBE);
        }
                
        set<string> setSelectedProductAdd=new set<string>();
        setSelectedProductAdd.addAll(selectedProduct );
        list<OpportunityLineItem> lstOpportunityLineItem=new list<OpportunityLineItem>();
        for(string  strProductId:setSelectedProductAdd){
            OpportunityLineItem NewOppLine=new OpportunityLineItem();
            NewOppLine.Product2Id=strProductId;
            NewOppLine.OpportunityId=OppId;
            NewOppLine.Quantity=1;
            NewOppLine.Product_Code__c=MapPriceBookEntry.get(strProductId).ProductCode;
            NewOppLine.Product_Name__c=MapPriceBookEntry.get(strProductId).Name;
            NewOppLine.UnitPrice=100;
            if(MapPriceBookEntry.containsKey(strProductId))
            newOppLine.PricebookEntryId=MapPriceBookEntry.get(strProductId).Id;
            lstOpportunityLineItem.add(NewOppLine);
        }
        return lstOpportunityLineItem;
        //return [SELECT Id,ListPrice,Name,OpportunityId,PricebookEntryId,Product2Id,ProductCode,Quantity,ServiceDate,TotalPrice,UnitPrice FROM OpportunityLineItem where ProductCode in:setSelectedProductAdd];
    }
    
    @AuraEnabled
    public static string SaveOpportunityLine(string OpportunityLine) { 
        string response='';
        try{
            List<OpportunityLineItem> ListOpportunityLineItem = (List<OpportunityLineItem>)JSON.deserialize(OpportunityLine, List<OpportunityLineItem>.class);
            system.debug('Save Data Now:='+ListOpportunityLineItem);
            insert ListOpportunityLineItem;
            response='Success';
            return response;
        }catch(Exception ex){
            response=ex.getMessage();
            return response;
        }
        
        
    }
}