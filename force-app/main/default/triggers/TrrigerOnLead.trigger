trigger TrrigerOnLead on Lead (After update) {
   
    set<id> setID = new set<id>();
    for(lead Ld : trigger.new){
        if( Ld.status=='Closed - Converted' && trigger.oldMap.get(Ld.Id).status!=Ld.status ){
            setID.add(Ld.id);
        }
    }
    
    list<task> tasklist = [select WhoId,status from task where WhoId in : setID and status!='completed'] ;
    list<task> Lsttaskstoupdate = new list<task>();    

    for(task tsk : tasklist){               
        tsk.status='completed';
        Lsttaskstoupdate.add(tsk);
    }              
        
    if(Lsttaskstoupdate.size()>0)
        update Lsttaskstoupdate;
}