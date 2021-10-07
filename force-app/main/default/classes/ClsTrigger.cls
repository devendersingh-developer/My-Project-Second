public class ClsTrigger {
    
    public string CityName{get;set;}
      public Integer count{get;set;}
    
    public ClsTrigger()
    {
     count = [ SELECT count() FROM MyWork__c ];
    }
    public void fncSaveData(){
         try
         {
           MyWork__c objMyWork=new MyWork__c(); 
           objMyWork.City__c=CityName;
           insert objMyWork;    
         }
        catch(Exception e)
        {
            String error = e.getMessage();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,error));
        }
        

    }
}