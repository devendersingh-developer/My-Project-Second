public class ClsApexLimit {
    public static void fncfirst(){
        for(integer i=0;i<40;i++){
            List<ApiCredential__c> ListApiCredential=[SELECT Id, Name, Api_Key__c, Api_Credential__c, Phone_Number__c FROM ApiCredential__c];
            system.debug((i+1) + ' ListApiCredential --> '+ListApiCredential);
        }
        System.debug('1.Number of Queries used in this apex code so far fncfirst: ' + Limits.getQueries());
    }
    public static void fncsecond(){
        
        for(integer i=0;i<30;i++){
            List<ApiCredential__c> ListApiCredential=[SELECT Id, Name, Api_Key__c, Api_Credential__c, Phone_Number__c FROM ApiCredential__c];
            system.debug((i+1) + ' ListApiCredential --> '+ListApiCredential);
        }
        System.debug('1.Number of Queries used in this apex code so far fncsecond: ' + Limits.getQueries());
        ClsApexLimitHelper.fncthird();
        ClsApexLimitHelper.fncUpdateMoreThen10KRecord();
        
    }
    public static void fncThird(){
        for(integer i=0;i<10;i++){
            List<ApiCredential__c> ListApiCredential=[SELECT Id, Name, Api_Key__c, Api_Credential__c, Phone_Number__c FROM ApiCredential__c];
            system.debug((i+1) + ' ListApiCredential --> '+ListApiCredential);
        }
        System.debug('24.Number of Queries used in this apex code so far fncsecond: ' + Limits.getQueries());
        
    }
    
    public static void fncInsertfirst(){
        list<Leave_Line__c> lstLeave=New List<Leave_Line__c>();
        for(integer i=0;i<10000;i++){
            Leave_Line__c obj=New Leave_Line__c();
            obj.City__c='Delhi';
            obj.Leave_type__c='AL '+(i+11);
            //obj.Employee__c='Test  '+(i+1);
            obj.Reason_for_leave__c='going to home town for Diwali occasion '+(i+11);
            lstLeave.add(obj);
            //insert obj;
        }
        //insert lstLeave;
        System.debug('ClsApexLimit 37 Number of DML used in this apex code so far fncfirst: ' + Limits.getDmlRows());
        System.debug('ClsApexLimit 38 Number of DML used in this apex code so far fncfirst: ' + Limits.getDmlStatements());
        //insert lstLeave;
    }
    
    public static void test(){
        
         
    }
    
}