trigger TriggerOnLeaveLine on Leave_Line__c (before insert,After insert) {
    
    if(trigger.isAfter && Trigger.isinsert){
        
    }
}