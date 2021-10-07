public class UseofRepeatOnAccountController {
    public List<Account> accountList{get;set;}
   
    public UseofRepeatOnAccountController() {
        accountList = new List<Account>();
        accountList = [SELECT id, Name,(SELECT LastName ,FirstName From Contacts)From Account limit 5] ;
    }
}