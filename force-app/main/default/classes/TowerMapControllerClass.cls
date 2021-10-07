public inherited sharing class TowerMapControllerClass {
     @AuraEnabled
     public static List<Tower__c> getAllTowers() {
          String theObject = 'Tower__c';
          List<String> theFields = new List<String>{'Id', 'Name','account__r.BillingState', 'Tower_Location__Latitude__s', 'Tower_Location__Longitude__s'};
          String theFilter = '';
          //String sortField = 'Name';
          String sortOrder = 'ASC';
          List<Tower__c> allTowers = TowerMapUtilClass.queryObjects(theObject, theFields, theFilter, sortOrder);
         system.debug('allTowers---'+allTowers);
          return allTowers;
     }
}