public class AccountHandler {
    public static void insertAccount(Integer value){
        Integer counter = 1;
        
        List<Account> addAccounts = new List<Account>();
        
        
        while(counter <= value){
            Account store = new Account();
            store.Name = ' Acme Inc ' + counter;
            store.AccountNumber = 'A000' + counter;
            addAccounts.add(store);
            
            counter = counter + 1;
        } 
            System.debug('Size of Account List: ' + addAccounts.size() );
            System.debug('Elements in Account List: ' + addAccounts);
            
            //insert all of the accounts in the list
            insert addAccounts;
            
        }
    }