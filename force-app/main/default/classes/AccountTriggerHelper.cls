public class AccountTriggerHelper {
    
    public void onBeforeInsert(List<Account> accountList,Map<Id,Account> oldAccountMap){
        List<String> lstPhone = new List<String>();
        Map<string,Account> mapExistingAccountOnMobileNumber=new Map<string,Account>();
        for(Account acc :accountList){
            if(!checkRecursive.setOfIDs.contains(acc.id)){
                lstPhone.add(acc.Phone);
                checkRecursive.SetOfIDs.add(acc.Id);
            }
        }
        List<Account> accountRecordList =[SELECT Id, Phone,Email__c FROM Account 
                                          where Phone !=null  
                                          AND Phone IN : lstPhone];
        if(accountRecordList.size()>0){
            for(Account Acc:accountRecordList){
                mapExistingAccountOnMobileNumber.put(Acc.Phone,Acc);
            }
        }
        for(Account acc :accountList){
            if(mapExistingAccountOnMobileNumber.containsKey(acc.Phone))
                acc.Preferred_Mode_of_Communication__c='dublicate';
        }
    }
    public void onBeforeUpdate(List<Account> accountList,Map<Id,Account> oldAccountMap){
    }
    public void onAfterInsert(List<Account> accountList,Map<Id,Account> oldAccountMap){
        List<opportunity> lstOpporty=new List<opportunity>();
        integer icount=1;
        for(Account acc :accountList){
            if(!checkRecursive.setOfIDs.contains(acc.id)){
                opportunity opp=new opportunity();
                opp.Name='Test '+icount;
                opp.AccountId=acc.id;
                opp.StageName='Closed Lost';
                opp.CloseDate=system.today();
                opp.Reason_for_Lost__c='No Money';
                lstOpporty.add(opp);
                icount=icount+1;
            }
        }
        
        if(lstOpporty.size()>0){
            insert lstOpporty;
        }
        
        
    }
    
}