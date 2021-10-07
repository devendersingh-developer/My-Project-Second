public with sharing class AuraSampleController{
   @AuraEnabled
    public static void SaveAccounts(List<Account> accList){
        Insert accList;
    }
}