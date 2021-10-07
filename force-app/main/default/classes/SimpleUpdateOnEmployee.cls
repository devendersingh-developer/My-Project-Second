public class SimpleUpdateOnEmployee {

    public SimpleUpdateOnEmployee()
    {
    	list<Employee__c> EmpLst=[SELECT City__c FROM Employee__c Where City__c='Old Delhi'];
    	list<Employee__c>EmpLstUpdate=new list<Employee__c>();
    
   	 		for(integer i=0;i<EmpLst.size();i++)
    		{
        		EmpLst[i].City__c='New Delhi';
        		EmpLstUpdate.add(EmpLst[i]);
    		}        
     		if(EmpLstUpdate.size()>0)
            { /*try
                {
         		  update EmpLstUpdate;
                }
                Catch(Exception e)
               {
                 system.debug('Update Employee Exception'+e.getMessage());
               }*/
             Database.SaveResult[] updRest= Database.update(EmpLstUpdate,false);
                system.debug('This is output'+updRest);
                for(Database.SaveResult sr:updRest)
                {
                    if(sr.isSuccess())
                    {
                       System.debug('Successfully insert record with id='+sr.getId()); 
                    }
                    else
                    {
                        for(Database.Error Der:sr.getErrors())
                        {
                            System.debug('The Error is');
                            system.debug(Der.getStatusCode() +'_'+Der.getMessage());
                            System.debug('Account field that affected this error'+Der.getFields());
                        }
                    }
                }
                
     		}
	}
}