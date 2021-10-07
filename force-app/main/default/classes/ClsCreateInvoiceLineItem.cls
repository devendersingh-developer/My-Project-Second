public class ClsCreateInvoiceLineItem {

    @InvocableMethod(label='Get a invoice Id and opportunity id' description='Returns the list of account names corresponding to the specified account IDs.')
    public static list<Account> CreateInvoiceLienItem(list<string> strID) {
        /*List<String> accountNames = new List<String>(); 
        List<Account> accounts = [SELECT Name FROM Account WHERE Id in :ids];
        for (Account account : accounts) {   
            accountNames.add(account.Name);    
        }  */
         List<Account> accounts = [SELECT Name FROM Account ];
        return accounts; 
    }
}