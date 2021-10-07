trigger CallingMethodFromClassByTrigger on Contact (before insert) {
    if(Trigger.isInsert)
    {
        system.debug('The size of list is ==>'+Trigger.New.size());  
        ClsTriggerOnMethod obj=new ClsTriggerOnMethod();    
        obj.fncMes(10,11);     
    }
}