trigger TriggerOnEmployeeInfo on Employee_info__c (After insert,After update,After delete,After undelete) {
    
    Set<string> Idp=New Set<string>();
    list<Employee_info__c> lstEmp;
    if((trigger.isAfter) && (trigger.isInsert || trigger.isUndelete || trigger.isdelete || trigger.isUpdate)){
        if(!trigger.isdelete){
            lstEmp = trigger.new;
        }
        else{
            lstEmp = trigger.old;
        }
        if(lstEmp.size()>0){
            for(Employee_info__c Emp:lstEmp){
                Idp.add(Emp.Department_info__c); 
            }
        }
    }
    List<Department_info__c> LstUpdate=new List<Department_info__c>();
    Map<Id,AggregateResult> results;
    if(Idp.size()>0){
        results = new Map<id,AggregateResult>([SELECT Department_info__r.ID,count(id) TotalNumberOfEmp ,Department_info__r.Name 
                                               from Employee_info__c
                                               /*WHERE Department_info__r.ID in:Idp*/
                                               group by Department_info__r.ID,Department_info__r.Name]);    
    }
    
    system.debug('results set of map :'+results);
    if(results.size()>0){
        List<Department_info__c>lstDepart=[Select id,Number_Of_Employee__c from Department_info__c ]; /*WHERE ID in:Idp*/
        system.debug('lstDepart set of map :'+lstDepart);
        for(Department_info__c de:lstDepart){
            if(results.containsKey(de.Id)){
                if(results.get(de.Id)!=null){
                    de.Number_Of_Employee__c=(decimal) results.get(de.Id).get('TotalNumberOfEmp');
                    LstUpdate.add(de);
                }
            }
        }
    }
    system.debug('LstUpdate set of map :'+LstUpdate);
    if(LstUpdate.size()>0){
        update LstUpdate;   
    }
}