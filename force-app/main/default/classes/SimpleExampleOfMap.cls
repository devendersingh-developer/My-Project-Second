public class SimpleExampleOfMap {

     public SimpleExampleOfMap()
     {
        /* Map<string,string>MapList=new Map<String,string>();
         MapList.put('India','1');
         MapList.put('USA','2');
         MapList.put('Australia','3');
        
             Map<string,string>MapList2=new Map<String,string>{'India'=>'1','USA'=>'2','Australia'=>'3'};  
             
             system.debug('map size is='+MapList2.size());
             system.debug('map value is='+MapList2);
         	 system.debug('map Key is='+MapList2.keyset());
         	 system.debug('map value is='+MapList2.values());
             system.debug('map ContainsKey value is='+MapList2.containsKey('Usa'));*/
         //if the requirement is storing is as key and  corresponding  record  as value by quering by the
         //database we should create map like below
         
          map<Id,Employee__c> empIDRecrdMap=new map<Id,Employee__c>([select id,name,name__c from Employee__c]);
        /* for(map<Id,Employee__c> empIDRecrdMapResc:empIDRecrdMap){
             system.debug('Key='+ empIDRecrdMapResc.Keyset()+' Value Is='+empIDRecrdMapResc.values());
         }*/
         
         // System.debug('the list is='+empIDRecrdMap);
         //Below approach is also work  but consume lot of time
         /*map<Id,Employee__c> empIDRecrdMap=new map<Id,Employee__c>();
         for(Employee__c Emp:[select id,name,name__c from Employee__c])
         {
             empIDRecrdMap.put(Emp.Id,Emp);
         }
         System.debug('the list is='+empIDRecrdMap);*/
         
         // for()
     }
}