public class ClsSearchControl {
    public string selectCountry {get;set;}
    public string selectCity{get;set;}
    public List<Employee_Details__c> Emp {set;get;}
    
    public ClsSearchControl()
    {
        Emp=new List<Employee_Details__c>();
        fncSearch();
    }
    public void fncSearch(){
          //selectObject= selectObject==null || selectObject==''?'1=1':'like :Country__c like :''%'+selectObject +'%'';
         if(selectCountry==null || selectCountry=='')
         {
           selectCountry='a';
         }    
       Emp = [SELECT Area__c,City__c,Country__c,Email__c,Id FROM Employee_Details__c Where Country__c like :'%'+selectCountry +'%'] ;
      // system.debug('list-->'+Emp);
    }
    
    public pagereference fncAdd()
    {
         pagereference ref = new pagereference('/apex/frmAddEmployee');
         ref.setredirect(true);   
         return ref;
        
    }

}