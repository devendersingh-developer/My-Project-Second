public class ClsSOSLExample {

    public void fncSosl()
    {
       List<List<SObject>> invoiceAndSearchList =[FIND 'ABES OR Finance' IN ALL FIELDS 
                   RETURNING Account(Name),Contact(FirstName,LastName,Department)];
                Account[] searchAccounts = (Account[])invoiceAndSearchList[0];
		        Contact[] searchContacts = (Contact[])invoiceAndSearchList[1];
               System.debug('The total element in the list is .'+invoiceAndSearchList.size());
        
					System.debug('Found the following accounts.');
				for (Account a : searchAccounts) {
  					  System.debug(a.Name);
					}
					System.debug('Found the following contacts.');
				for (Contact c : searchContacts) {
 				    System.debug(c.LastName + ', ' + c.FirstName+','+c.Department);
					}
    }
}