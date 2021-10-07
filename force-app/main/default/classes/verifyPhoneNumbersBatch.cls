public class verifyPhoneNumbersBatch implements DataBase.Batchable<sobject> {
    public DataBase.QueryLocator start(DataBase.BatchableContext bc){
        
        return  Database.getQueryLocator('');
    }
    public void execute(DataBase.BatchableContext bc, List<sObject> lstObj){
        
    }
    public void finish(DataBase.BatchableContext bc){
                   
    }

}