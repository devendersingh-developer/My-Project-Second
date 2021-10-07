public class AddDynamicRecords {
    
    @AuraEnabled
    public static void SaveRecords( List<Wraper> listWraper){
        
        system.debug('listWraper --> '+listWraper);
        
    }
    
    public Class Wraper{
        @AuraEnabled
        public string MID{get;set;}
        @AuraEnabled
        public string CardType{get;set;}
        @AuraEnabled
        public String Product{get;set;}
    }
}