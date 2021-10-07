public class ClsTaxForm {
    @AuraEnabled
    public static list<Tax_Form__c> getTax() {
        return[select id,Name__c,Email__c,Address__c from Tax_Form__c];
    }
    
    @AuraEnabled
    public static String SaveTax(Tax_Form__c lstTax) {
        try
        {
            insert lstTax;
            return 'Success';
        }
        catch(exception ex)
        {
            return ''+ex.getMessage();
        }
    }
}