@RestResource(urlMapping='/LeaveManagement/*')
global class ClsLeaveLine {
    @HttpGet
    global static list<ClsWrap> dogetLeave(){
        list<ClsWrap> lstWrap= new list<ClsWrap>();
        ClsWrap objWrap=new ClsWrap();
        list<integer> agenum=new list<integer>();
        agenum.add(2);
        agenum.add(12);
        agenum.add(22);
        agenum.add(32);
        agenum.add(42);
        
        for(Leave_Line__c obj: [select id,Name,User__c,Reason_for_leave__c,Leave_Date__c from Leave_Line__c]){
            objWrap.id=obj.id;
            objWrap.Name=obj.Name;
            objWrap.strUser=obj.User__c;
            objWrap.Reasonforleave=obj.Reason_for_leave__c;
            objWrap.LeaveDate=obj.Leave_Date__c;
            objWrap.Age=agenum;
            lstWrap.add(objWrap);
        }
        return lstWrap;
    }
    global class ClsWrap{
        global string id {get;set;}
        global string Name {get;set;}
        global string strUser {get;set;}
        global string Reasonforleave {get;set;}
        global date LeaveDate {get;set;}
        global  list<integer> Age {get;set;}
    }
    
}