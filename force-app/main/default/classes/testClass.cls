public class testClass {

    public testClass()
    {
        List<Account> accUpdate = new List<Account>();
        Map<Id,List<Contact>> mapAccountContact = new Map<Id,List<Contact>>();
        List<Account> accounts=new List<Account> ();
        
        accounts = [Select Id, No_Of_Contact__c, (Select Id,Gender__c from Contacts) from Account];
        
        for(Account acc: accounts){
            List<Contact> contacts = acc.getSObjects('Contacts');
            mapAccountContact.put(acc.Id,contacts);    
        }
        for(Account a: accounts){  
            Map<String,Integer> elCount = new Map<String,Integer>();
            if(mapAccountContact.containsKey(a.Id)){
                if(mapAccountContact.get(a.Id)!=null){
                   /* Integer NoOfFeMale=0;
                    Integer NoOfMale=0;*/
                    
                    for(Contact con : mapAccountContact.get(a.Id)){
                        if(con.gender__c!=null){
                            
                            if(!elCount.containsKey(con.gender__c)){
                                elCount.put(con.gender__c,0);
                            }
                            Integer currentInt=elCount.get(con.gender__c)+1;
                            elCount.put(con.gender__c,currentInt); 
                            
                           /* if(con.Gender__c !=null)
                            {
                                if(con.Gender__c=='Female')
                                {
                                    NoOfFeMale=NoOfFeMale+1;
                                }
                                else
                                {
                                    if(con.Gender__c=='Male')
                                    {
                                        NoOfMale=NoOfMale+1;
                                    } 
                                }
                            }
                            else
                            {
                                NoOfFeMale=0;
                                NoOfMale=0;
                            }*/
                        }
                    }
                       
                    //system.debug('The list is='+elCount.get(a.Id).Gender__c);
                }
            }
            system.debug('The No of Fenale ='+mapAccountContact.get(a.Id)); 
            system.debug('The No of Fenale ='+elCount.get('Male')); 
            system.debug('The No of Male   ='+elCount.get('Female'));
        }
    }
}