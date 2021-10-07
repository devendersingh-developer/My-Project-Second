/**
* @Author      :Devender Singh
* @Date        :13th April 2020
* @Description :This is code for test the all sanerio for Trigger
* */



trigger TestTrigger on Account (before insert,before update,before delete, after insert,after update,after delete,after undelete) {
    if(RecursiveTriggerHandler.isFirstTime){
        RecursiveTriggerHandler.isFirstTime = false;
        if(Trigger.isBefore){
            system.debug(' Before Events ');
            system.debug(' Trigger New '+ Trigger.new);
            system.debug(' Trigger old '+ Trigger.old);
            system.debug(' Trigger newMap '+ Trigger.newMap);
            system.debug(' Trigger oldMap '+ Trigger.oldMap);
           
            if(Trigger.isDelete){
                for (Account a : [SELECT Id FROM Account
                                  WHERE Id IN (SELECT AccountId FROM Opportunity) AND
                                  Id IN :Trigger.old]) {
                                      Trigger.oldMap.get(a.Id).addError(
                                          'Cannot delete account with related opportunities.');
                                  }
            }
        }else if(Trigger.isAfter){
            
            system.debug(' After Events ');
            system.debug(' Trigger New '+ Trigger.new);
            system.debug(' Trigger old '+ Trigger.old);
            system.debug(' Trigger newMap '+ Trigger.newMap);
            system.debug(' Trigger oldMap '+ Trigger.oldMap);
            
            String status;
            String OppAccName;
            String OppOwnerName;
            
             List<Account> lstAccount=new List<Account>();
            
            for(Account Acc : Trigger.new) {
                Account obj=New Account();
                obj.Name=acc.Name;
                obj.Email__c=acc.Email__c;
                lstAccount.add(obj);
            }
            //if(lstAccount.size()>0)
               // insert lstAccount;
            
            List<FeedItem> fiList = new List<FeedItem>();
            for(Account Acc : Trigger.new) {
                FeedItem postxyz = new FeedItem();
                postxyz.Body = '@Test ';
                postxyz.Type='PollPost';
                postxyz.ParentId = Acc.Id;
                fiList.add(postxyz);
            }
            if(fiList.size() > 0){
                insert fiList;
            }
            
            // CalloutClass.makeCallout();
        }
        
        
        if(Trigger.isBefore){
            
        }
        
        map<string,string> MapValue=new map<string,string>();
        MapValue.put('1','Dev');
        MapValue.put('2','Anjali');
        MapValue.put('3','Adi');
        MapValue.put('4','Chibi');
        MapValue.put('5','Mehul Bhai');
        MapValue.put('6','Gaurav');
        
        /*system.debug('ContainsKey '+MapValue.containsKey('Adi'));
system.debug('keySet '+MapValue.keySet());*/
        
        /* List<FieldPermissions> fpList = [SELECT SobjectType, Field, PermissionsRead, PermissionsEdit, Parent.ProfileId FROM FieldPermissions 
WHERE SobjectType = 'Account' and Field='Account.Customer_Priority__c' AND 
Parent.ProfileId IN (SELECT Id FROM PermissionSet 
WHERE PermissionSet.Profile.Name = 'System Administrator')];
if(!fpList.isEmpty()){
Boolean hasReadPermission = fpList[0].PermissionsRead;
Boolean hasEditPermission = fpList[0].PermissionsEdit;
system.debug('Read Permission - ' + hasReadPermission);
system.debug('Edit Permission - ' + hasEditPermission);
}*/
        
    } 
    
}