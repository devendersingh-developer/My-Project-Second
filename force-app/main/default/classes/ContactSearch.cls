public class ContactSearch {

    public static List<Contact> searchForContacts(string name,string MailingPostalCode)
    {
        List<Contact> lstContact=new List<Contact>();
        lstContact=[select ID,Name from Contact  WHERE Name like :'%'+name+'%' AND MailingPostalCode like:'%'+MailingPostalCode+'%' ];  
        return lstContact; 
    }
}