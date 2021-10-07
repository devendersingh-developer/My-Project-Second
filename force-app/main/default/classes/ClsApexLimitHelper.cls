public class ClsApexLimitHelper {
    public static void fncthird(){
        
        for(integer i=0;i<20;i++){
            List<ApiCredential__c> ListApiCredential=[SELECT Id, Name, Api_Key__c, Api_Credential__c, Phone_Number__c FROM ApiCredential__c];
            system.debug((i+1) + ' ListApiCredential --> '+ListApiCredential);
        }
        System.debug('1.Number of Queries used in this apex code so far fncfirst: ' + Limits.getQueries());
        
        list<Leave_Line__c> lstLeave=New List<Leave_Line__c>();
        for(integer i=0;i<51;i++){
            Leave_Line__c obj=New Leave_Line__c();
            obj.City__c='Delhi';
            obj.Leave_type__c='CL '+(i+11);
            obj.Reason_for_leave__c='going to home town for Diwali occasion '+(i+1);
            //lstLeave.add(obj);
            //insert obj;
        }
        System.debug('ClsApexLimitHelper 19 Number of DML used in this apex code so far fncfirst: ' + Limits.getDmlRows());
        System.debug('ClsApexLimitHelper 20 Number of DML used in this apex code so far fncfirst: ' + Limits.getDmlStatements());
        System.debug('ClsApexLimitHelper 21 Number of DML used in this apex code so far fncfirst: ' + Limits.getLimitDmlStatements());
        System.debug('ClsApexLimitHelper the total number of getLimitHeapSize is                : ' + Limits.getLimitHeapSize());
    }
    public static void fncUpdateMoreThen10KRecord(){
        List<Leave_Line__c> updateLeaveLine=New List<Leave_Line__c>();
        for(Leave_Line__c lin : [select id,City__c,Leave_type__c,Reason_for_leave__c from Leave_Line__c]){
            lin.City__c='New Delhi';
            updateLeaveLine.add(lin); 
        }
        if(updateLeaveLine.size()>0)
            update updateLeaveLine;
        System.debug('ClsApexLimitHelper 32 Number of DML used in this apex code so far fncfirst: ' + Limits.getDmlRows());
        System.debug('ClsApexLimitHelper 33 Number of DML used in this apex code so far fncfirst: ' + Limits.getDmlStatements());
        System.debug('ClsApexLimitHelper 34 Number of DML used in this apex code so far fncfirst: ' + Limits.getLimitDmlStatements());
        System.debug('ClsApexLimitHelper 35 the total number of getLimitHeapSize is             : ' + Limits.getLimitHeapSize());
    }
}