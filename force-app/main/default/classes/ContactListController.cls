public class ContactListController {
    
    @AuraEnabled
    public static List<Contact> getContactList(string accountId){
        system.debug('accountId --> '+accountId);
        List<Contact> contactList=New List<contact>([Select Id,FirstName,LastName,Name,Email,phone
                                                    from Contact where Email!=null and AccountId=:accountId ]);
        
        return contactList;
    }
    @AuraEnabled
    public static contact createContact(Contact con,Id AccountId){
        con.AccountId=AccountId;
        insert con;
        return con;
    }

}