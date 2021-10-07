public class AccountCreationController {
    
    @AuraEnabled
    public static Account CreateAccount(Account AccountObject){
        system.debug(' 5 AccountObject ==> '+AccountObject);
        try{
            insert AccountObject;
            return AccountObject;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
    @AuraEnabled(Cacheable = true)
    public static List<Contact> getContacts(){
        return [SELECT Id, Name, FirstName,LastName, Phone, Email FROM Contact limit 10];
    }
    
    @AuraEnabled
    public static List<Account> CreateAccounts(List<Account> AccountList){
        system.debug(' 17 AccountList ==> '+AccountList);
        insert AccountList;
        return AccountList;
    }
}