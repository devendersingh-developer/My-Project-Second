public class ClsLeave {
    @AuraEnabled
    public static List<String> getLeaveType()
    {
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Leave_Form__c.Leave_Type__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        return options;
    }
    @AuraEnabled
    public static Void FncSave(string strFromDate,string strToDate,string strReasionForLeav,string strLeaveType )
    {
        
        Date D1=Date.valueOf(string.valueOf(strToDate));
        Date D2=Date.valueOf(string.valueOf(strFromDate));
        Integer noOfDays = D2.daysBetween(D1);      
        
        List<Holiday_Master__c> LstHoliday=[SELECT Holiday_Date__c,Holiday_Name__c,State__c FROM Holiday_Master__c];
        Map<Date,List<Holiday_Master__c>> MapHoliday=new Map<Date,List<Holiday_Master__c>>();
        List<Holiday_Master__c> LstHm;
        
        List<EmployeeDetaile__c> EmpDetails=[SELECT Id,First_Name__c,Last_Name__c,Name,State__c,User__c,Working_Days__c FROM EmployeeDetaile__c];
        Map<ID,String> MapEmpDetails=new Map<ID,String>();
        
        try	
        {
            ID iID;
            for(EmployeeDetaile__c EmpDetail:EmpDetails){
                MapEmpDetails.put(EmpDetail.ID,EmpDetail.Working_Days__c);
                iID=EmpDetail.ID;
            }
            
            List<Leave_Line__c> LestLeaveLine=[SELECT Employee__c,Id,Leave_Date__c,Leave_type__c,Reason_for_leave__c FROM Leave_Line__c WHERE Employee__c =:iID];
            Map<Date,List<Leave_Line__c>> MapLeaveLine=new Map<Date,List<Leave_Line__c>>();
            List<Leave_Line__c> storLeaveLine;
            
            for(Leave_Line__c LeaveLine:LestLeaveLine){
                storLeaveLine =new List<Leave_Line__c> ();
                storLeaveLine.add(LeaveLine);
                MapLeaveLine.put(LeaveLine.Leave_Date__c,storLeaveLine);
            }
            
            
            for(Holiday_Master__c Hm:LstHoliday){
                LstHm =new List<Holiday_Master__c> ();
                LstHm.add(Hm);
                MapHoliday.put(Hm.Holiday_Date__c,LstHm);
            }
            
            List<Leave_Line__c> lstLeaveLine=new List<Leave_Line__c> ();
            Leave_Line__c insetLeaveLine;
            Date dtdate;            
            for(Integer i=0;i<=noOfDays;i++){
                
                insetLeaveLine=new Leave_Line__c();
                if(i==0){
                    dtdate=D2.addDays(i);
                }
                else{
                    dtdate=D2.addDays(i);
                }
                
                 system.debug('Date Value is :'+dtdate);
                DateTime myDateTime =dtdate;
                string strDay=myDateTime.format('E');

                system.debug('Date Day is :'+strDay);
                if((!MapHoliday.containsKey(dtdate)) && MapEmpDetails.containsKey(iID) && MapEmpDetails.get(iID).contains(strDay) ){
                   if(!MapLeaveLine.containsKey(dtdate))
                   {
                        insetLeaveLine.Leave_Date__c=dtdate;
                        insetLeaveLine.Reason_for_leave__c=strReasionForLeav;
                        insetLeaveLine.Leave_type__c=strLeaveType;
                        insetLeaveLine.User__c=userInfo.getUserId();
                        insetLeaveLine.Employee__c=iID;
                        lstLeaveLine.add(insetLeaveLine);
                    }
                }
            }
            if(lstLeaveLine!=null)
            {
                insert lstLeaveLine;
            }  
        }
        catch(Exception Ex)
        {
            System.debug('The Error Is :-'+Ex.getMessage());
        }
    }
}