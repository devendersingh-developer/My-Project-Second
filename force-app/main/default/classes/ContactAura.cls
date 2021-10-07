public class ContactAura {
    @AuraEnabled
    public static List<Contact>get10Contact(){
        return [SELECT Id, NAME FROM Contact Limit 10] ;
    }
}