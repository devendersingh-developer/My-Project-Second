trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    List<BatchLeadConvertErrors__c> insertLogs = new List<BatchLeadConvertErrors__c>();
    
    for(BatchApexErrorEvent event : Trigger.new){
        BatchLeadConvertErrors__c logRec = new BatchLeadConvertErrors__c();
        logRec.AsyncApexJobId__c = event.AsyncApexJobId;
        logRec.Records__c = event.JobScope;
        logRec.StackTrace__c = event.StackTrace;
        
        insertLogs.add(logRec);
    }
    
    if(insertLogs.size()>0){
        insert insertLogs;
    }
}