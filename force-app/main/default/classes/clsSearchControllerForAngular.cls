public class clsSearchControllerForAngular {
     public string selectObject {get;set;}
    public List<Employee_Details__c> Emp {set;get;}
    
    public clsSearchControllerForAngular()
    {
        Emp=new List<Employee_Details__c>();
       fncSearch();
    }
    public string fncSearch(){
       //selectObject= selectObject==null || selectObject==''?'1=1':'like :Country__c like :''%'+selectObject +'%'';
         if(selectObject==null || selectObject=='')
         {
           selectObject='a';
         }     
       Emp = [SELECT Area__c,City__c,Country__c,Email__c,Id FROM Employee_Details__c Where Country__c like :'%'+selectObject +'%'];
       //system.debug('list-->'+Emp);
        
        return JSON.serialize(Emp);
    }
}