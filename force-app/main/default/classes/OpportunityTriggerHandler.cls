public class OpportunityTriggerHandler extends TriggerHandler{
    Set<ID> sID;
    Set<ID> sOldID;
    public override void afterInsert() {
        sID=new Set<ID>();
        if(Trigger.isInsert){						         		
            for(Opportunity opp:(list<Opportunity>)Trigger.New){
                system.debug('This is opps record :'+opp );
                if(opp.AccountID!=null)
                {
                    sID.add(opp.AccountID);
                }
            }
        }
        if(sID.size()>0)
        {
             system.debug('This is id of :'+sID );
             system.debug('This Size of Set :'+sID.size());
            fncGeneratedata('new');
        }
    }
    public override void afterUpdate() {
        sID=new Set<ID>();
        sOldID=new Set<ID>();
        
        if(Trigger.isUpdate){		
            Map<id,Opportunity> oldMapId=(Map<id,Opportunity>)Trigger.oldMap;
            for(Opportunity opp:(list<Opportunity>)Trigger.new){
              if(opp.AccountID!=null)
                {
                    sID.add(opp.AccountID);
                }
                
                /*if(oldMapId.get(opp.Id).AccountID != opp.AccountID ){
                    sOldID.add(oldMapId.get(opp.Id).AccountID);
                } */
            }
        }     
        /*if(sOldID!=null)
        {
            fncGeneratedata('old');   
        }*/
         if(sID.size()>0)
        {
            fncGeneratedata('new');
        }
    }
    public override void afterDelete() {
        sID=new Set<ID>();
        if(Trigger.isDelete){						         		
            for(Opportunity opp:(list<Opportunity>)Trigger.old){
              if(opp.AccountID!=null)
                {
                    sID.add(opp.AccountID);
                }
            }
        }
         if(sID.size()>0)
        {
            fncGeneratedata('new');
        }
    }
    
    public override void afterUndelete() {
        sID=new Set<ID>();
        for(Opportunity opp:(List<Opportunity>)Trigger.new){
           if(opp.AccountID!=null)
                {
                    sID.add(opp.AccountID);
                }
        }
          if(sID.size()>0)
        {
            fncGeneratedata('new');
        }
    }
    
    public void fncGeneratedata( string sOption)
    {
        List<Account> accounts=new  List<Account>();
        if(sOption=='old')
        {
           accounts.add([Select Id, No_of_Opportunity__c,No_of_open_Opportunity__c,No_of_Close_Opportunity__c,Open_Opportunity_Amount__c,Close_Opportunity_Amount__c, 
                                      (SELECT id,Amount,IsClosed FROM opportunities) from Account where Id IN: sOldID]);
            
        }else
        {
            accounts.add([Select Id, No_of_Opportunity__c,No_of_open_Opportunity__c,No_of_Close_Opportunity__c,Open_Opportunity_Amount__c,Close_Opportunity_Amount__c, 
                                      (SELECT id,Amount,IsClosed FROM opportunities) from Account where Id IN: sID]);
        }
        sOption='';
        List<Account> LstaccUpdate = new List<Account>();      
       
        
        for(Account AccFatch:accounts) {
            Integer iNoofOpenOpp=0;
            Integer iNoofOpenAmountOpp=0;
            Integer iNoofCloseOpp=0;
            Integer iNoofCloseAmountOpp=0;
            
            for(Opportunity opp : AccFatch.opportunities){
                
                if(opp.IsClosed==true){
                    iNoofOpenOpp=iNoofOpenOpp+1;
                    iNoofOpenAmountOpp+=integer.valueOf(opp.Amount)==null?0:integer.valueOf(opp.Amount);
                }
                else{
                    iNoofCloseOpp=iNoofCloseOpp+1;
                    iNoofCloseAmountOpp+=integer.valueOf(opp.Amount)==null?0:integer.valueOf(opp.Amount);
                }   
            }
            
            AccFatch.No_of_open_Opportunity__c=iNoofCloseOpp;
            AccFatch.Open_Opportunity_Amount__c=iNoofCloseAmountOpp;
            AccFatch.No_of_Close_Opportunity__c=iNoofOpenOpp;
            AccFatch.Close_Opportunity_Amount__c=iNoofOpenAmountOpp;
            AccFatch.No_of_Opportunity__c=(iNoofCloseOpp+iNoofOpenOpp);
            LstaccUpdate.add(AccFatch);
        }
        if(!LstaccUpdate.isEmpty())
            update LstaccUpdate;
    } 
}