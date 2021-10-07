public class ClsApexLimitDublicate {
    
    
    public static void fnctest(){
        for(integer i=0;i<10;i++){
            List<ApiCredential__c> ListApiCredential=[SELECT Id, Name, Api_Key__c, Api_Credential__c, Phone_Number__c FROM ApiCredential__c];
            system.debug((i+1) + ' ListApiCredential --> '+ListApiCredential);
        }
        System.debug('cls ClsApexLimitDublicate 1.Number of Queries used in this apex code so far fncfirst: ' + Limits.getQueries());
    }
    
    
    
    public static void fncJson(){
        
        Wrapper obj=new Wrapper();
        obj.firstName='dev';
        obj.secondName='Singh';
        string JSONSerialize= JSON.serialize(obj);
        system.debug('JSON.serialize string  --> '+JSONSerialize);
        system.debug('JSON.serialize  --> '+JSON.serialize(obj));
        system.debug('JSON.deserialize  --> '+JSON.deserialize(JSONSerialize,Wrapper.class));
        
    }
    public class Wrapper{
        public string firstName{get;set;}
        public string secondName{get;set;}
    }
}