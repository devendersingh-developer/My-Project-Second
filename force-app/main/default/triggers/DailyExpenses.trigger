trigger DailyExpenses on Daily_expenses__c (After insert,after update) {
    
     System.enqueueJob(new SendNotification(Trigger.New));
}