trigger CountNoOfContactOnContact on Contact (after insert,after update, after delete) {
    
    Set<ID> aID = new Set<ID>();     		//This is list.which will cantain the id of inserted record
    if(Trigger.isInsert)             		//if the new record will insert then this trigger.new will be fired
    {						         		//This below loop will be run  to set AccountID in Set list from Trigger.New Event
        for(Contact con:Trigger.New)
        {
            aID.add(con.AccountID);
        }
    }
    
    if(Trigger.isDelete) 					//if record is delete then this Trigger.isDelete will be fired
    {
        for(Contact con:Trigger.old)		//This below loop will be run  to set AccountID in Set list from Trigger.old Event
        {
            aID.add(con.AccountID);
        }
    }
    
    if(Trigger.isUpdate)  					//if record is delete then this Trigger.isUpdate will be fired
    {
        for(Contact con:Trigger.old)  		//This below loop will be run to set AccountID in Set list from Trigger.old Event
        {
            aID.add(con.AccountID);
        }
    }
    
  //   if((trigger.isAfter) && (trigger.isInsert || trigger.isUndelete || trigger.isdelete || trigger.isUpdate)){
   //  }
    
     List<Account> accUpdate = new List<Account>();
     Map<Id,List<Contact>> mapActContact = new Map<Id,List<Contact>>();

     List<Account> accounts = [Select Id, No_Of_Contact__c,No_of_Male__c,No_of_female__c, 
                              (Select Id,Gender__c from Contacts) from Account where Id IN: aID];
    
     for(Account acc: accounts){
        List<Contact> contacts = acc.getSObjects('Contacts');
        mapActContact.put(acc.Id,contacts);
     }
    
    for(Account a: accounts){  
         Map<String,Integer> elCount = new Map<String,Integer>();
        if(mapActContact.containsKey(a.Id)){
                if(mapActContact.get(a.Id)!=null){
                for(Contact con : mapActContact.get(a.Id)){
                        if(con.Gender__c !=null){
                            if(!elCount.containsKey(con.gender__c)){
                                elCount.put(con.gender__c,0);
                            }
                            Integer currentInt=elCount.get(con.gender__c)+1;
                            elCount.put(con.gender__c,currentInt); 
                        }  
                }   
            }
        }
        if(!elCount.isEmpty())
        {
            a.No_of_Male__c=elCount.get('Male');
            a.No_of_female__c=elCount.get('Female');
        }
        a.No_Of_Contact__c = mapActContact.get(a.Id).size();
        accUpdate.add(a);
    }
    
     if(!accUpdate.isEmpty())
        update accUpdate;
}