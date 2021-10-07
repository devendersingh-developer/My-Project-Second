public class SampleController{
    public List<Account> accList {get; set;}
     
    public SampleController(){
    accList = [SELECT Name, AccountNumber, Phone FROM Account LIMIT 10000];
    }
 
}