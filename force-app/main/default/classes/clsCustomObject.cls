public class clsCustomObject {
    public List<Employee_Details__c> Emp {set;get;}
    
    public clsCustomObject()
    {
      access();
    }
    public void access(){
       Emp = [SELECT Area__c,City__c,Country__c,Email__c,Id FROM Employee_Details__c limit 2];
       // system.debug('list-->'+emp);
    }
}