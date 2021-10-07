public class AccountTriggerHandler extends TriggerHandler{
    
    public override void afterInsert() {
        
       
        String conName='%'+UserInfo.getFirstName()+'%';
        Contact con=[select Id,Name from Contact where Name like :conName];
        
        List<Account_Team__c>  lstAccountTeam=new List<Account_Team__c>();
        if(Trigger.isInsert){			         		
            for(Account Acc:(List<Account>)Trigger.New){    
                Account_Team__c objAccTeam=new Account_Team__c();
                objAccTeam.Name=Acc.Name;
                objAccTeam.Account__c=Acc.Id;
                objAccTeam.Contact__c=con.Id;    
                objAccTeam.IsPrimary__c=true;
                //objAccTeam.AccountOwner__c=Acc.OwnerId;
                lstAccountTeam.add(objAccTeam);
            }
            if(lstAccountTeam!=null){
                insert lstAccountTeam;
            }
        }
    }
    
    public override void AfterUpdate(){    
        
        String conName='%'+UserInfo.getFirstName()+'%';
        Contact con=[select Id,Name from Contact where Name like :conName];
        
        boolean  IsOwnerChange=false;
        
        Set<ID> AccID=new Set<ID>();
        for(Account Acc:(List<Account>)Trigger.New){ 
            AccID.add(Acc.Id);
        }
        
        List<Account_Team__c> lstAccountTeam=[SELECT Name,Account__c,AccountOwner__c,Contact__c,CreatedById,Id,
                                              IsPrimary__c FROM Account_Team__c Where Account__c in:AccID];
      
        List<Account_Team__c> lstTokUpAccTeam=new List<Account_Team__c> ();
        
        Account_Team__c objAccTeam;
        
        Map<id,Account> oldMapId=(Map<id,Account>)Trigger.oldMap;
        for(Account Acc:(List<Account>)Trigger.new){ 
    
            if(oldMapId.get(Acc.id).OwnerId  != Acc.OwnerId ){
                objAccTeam=new Account_Team__c();
                objAccTeam.Name=Acc.Name;
                objAccTeam.Account__c=Acc.Id;
                objAccTeam.Contact__c=con.Id;    
                objAccTeam.IsPrimary__c=true;
                lstTokUpAccTeam.add(objAccTeam);
                IsOwnerChange=true;
            }
        }
        List<Account_Team__c> lstToOldUpAccTeam=new List<Account_Team__c> ();
        if(IsOwnerChange==true)
        {
            Account_Team__c objAccTeamOld;
            for(Account_Team__c AccTeamOld:lstAccountTeam){
                objAccTeamOld=new Account_Team__c();  
                objAccTeamOld.Id=AccTeamOld.Id;
                objAccTeamOld.Name=AccTeamOld.Name;
                objAccTeamOld.Contact__c=AccTeamOld.Contact__c;    
                objAccTeamOld.IsPrimary__c=false;
                lstToOldUpAccTeam.add(objAccTeamOld);   
            }
        }

       if(lstTokUpAccTeam!=null && lstTokUpAccTeam.size()>0){
            insert lstTokUpAccTeam;
        }
        if(lstToOldUpAccTeam!=null && lstToOldUpAccTeam.size()>0){
            update lstToOldUpAccTeam ;
        }
    }
    
   /* public override void beforeUpdate() 
    {
        System.debug('hi inside AccountTeamTriggerHandler beforeUpdate');
        
        String userName=UserInfo.getFirstName();
        List<Account> accList=(List<Account>) Trigger.old;
        List<Account_Team__c> accTeam=new List<Account_Team__c>([select Id,Name,Contact__c,Contact__r.FirstName,Account__c from Account_Team__c atc where Contact__r.FirstName =:userName and atc.Account__c =:accList[0].Id ]);
        if(accTeam.size()==0)
        {
            Trigger.newMap.get(Trigger.old[0].Id).addError('Yor are not authorized to update record '); 
        }
        else
        {
            
        }
    }*/

}