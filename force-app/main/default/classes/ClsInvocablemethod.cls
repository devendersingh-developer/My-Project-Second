public class ClsInvocablemethod {
    
    @Invocablemethod
    public static void tyestprocess(list<ID> ids){
       system.debug('call from process builder '+ids); 
        
        List<lead> lstLead=[select Name From Lead where Id in:ids];
        
        for(Lead le:lstLead){
            le.firstname='Advik Singh ji';
            le.MobilePhone='9873108440';
        }
        update lstLead;
    }

}