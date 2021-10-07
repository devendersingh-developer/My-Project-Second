public class TriggerHelperOnLeaveLine {

    public static void shareLeaveLineRecord(List<LeaveLineShare> listLeaveLineShare){
        LeaveLineShare objLeaveLine=listLeaveLineShare.get(0);
        Leave_Line__Share objLeaveLineShare=New Leave_Line__Share();
        objLeaveLineShare.ParentId=objLeaveLine.LeaveLineId;
        objLeaveLineShare.UserOrGroupId=objLeaveLine.UserId;
        objLeaveLineShare.AccessLevel=objLeaveLine.AccessLevel;//Read, Edit
        objLeaveLineShare.RowCause='Manual';
        insert objLeaveLineShare;
    }
    
    public class LeaveLineShare{
        //@InvocableVariable(required=true)
        public String LeaveLineId;
       // @InvocableVariable(required=true)
        public String UserId;
       // @InvocableVariable
        public String AccessLevel;
    }
}