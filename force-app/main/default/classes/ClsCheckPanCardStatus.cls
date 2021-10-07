public class ClsCheckPanCardStatus {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(string sPanCardNumber){
        system.debug('FirstName------> '+sPanCardNumber);
        List<Account>AccountList=new List<Account>([SELECT Id,Name, Pan_card_Number__c
                                                    FROM Account  Limit 4]); 
        system.debug('AccountList------> '+AccountList);
        return AccountList;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList1(){
        return [select id, Name , Phone,industry from Account where Phone!=null and industry !=null limit 2000];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Tax_Form__c> getTaxFormList(string RecordId){
        system.debug('RecordId ---> '+RecordId);
        return [SELECT Id, Name__c, Email__c, Address__c, City__c FROM Tax_Form__c where Id =:RecordId];
    }
    
    @AuraEnabled
    public static void SaveTaxForm(Tax_Form__c objTaxForm){
        system.debug(' 13 objTaxForm ==> '+objTaxForm);
        try{
           insert objTaxForm;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
    
    
    public class Wrapper{
        @AuraEnabled
        public string sAddress{get;set;}
        @AuraEnabled
        public string sEmail{get;set;}
        @AuraEnabled
        public string sName{get;set;}
    }
}