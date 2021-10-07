trigger CountNoOfContactOnAccount on Account (before insert,after insert) {  
   Account a=new Account();
    if(Trigger.isInsert)
    {
        if (Trigger.isAfter) {
           a.No_Of_Contact__c=[SELECT count() FROM Contact WHERE AccountID IN :Trigger.New]; 
        }   
    }
     if(trigger.isBefore)
     {
       a.No_Of_Contact__c=[SELECT count() FROM Contact WHERE AccountID IN :Trigger.New];   
     }
}