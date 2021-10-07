public class clsPopulatePicklist {
    
    public List<Account> accountlist {get;set;}
    
    public List<SelectOption> objectOptions {get;set;}
    public Id selectedObject{get;set;}
    public List<Account> acc { get;set; }
    
    public List<SelectOption> objectOptionsContact  {get;set;}
    public Id selectedObjectContact{get;set;}
    public List<Contact> Con { get;set; }
    
    
    public List<SelectOption> objectOptionsCases  {get;set;}
    public Id selectedObjectCases{get;set;}
    public List<Case> Cases { get;set; }
        
    public clsPopulatePicklist() {
        
        
        objectOptions = new List<SelectOption>();
        List<Account> objects = [SELECT Id, Name FROM Account];
        
        objectOptions.add(new SelectOption('---Select---', '---Select---'));
        for(Account acc:objects){
            objectOptions.add(new SelectOption(acc.Id, acc.Name));
        }
        checkAccount();
        //fncFillContact();
    } 
    public void fncFillContact()
    {
        objectOptionsContact= new List<SelectOption>();
        objectOptionsContact.add(new SelectOption('---Select---', '---Select---'));
        Con = [SELECT Id,Name FROM Contact Where AccountId=:selectedObject];
        //system.debug(selectedObject+' This is record='+Con);  
        for(Contact Contct:Con){
            objectOptionsContact.add(new SelectOption(Contct.Id, Contct.Name));
        } 
    }
    public void fncFillCases()
    {
        objectOptionsCases= new List<SelectOption>();
        objectOptionsCases.add(new SelectOption('---Select---', '---Select---'));
        Cases = [SELECT AccountId,ContactId,SuppliedName,Type FROM Case Where ContactId=:selectedObjectContact];
        system.debug(selectedObjectContact+' This is record='+Cases);  
        for(Case Cs:Cases){
            objectOptionsCases.add(new SelectOption(Cs.ContactId, Cs.Type));
        } 
     }
    public void checkValue()
    {
        system.debug('This is selected value ='+selectedObject);
          acc=[SELECT Id,Name,No_Of_Contact__c,No_of_female__c,No_of_Male__c FROM Account Where Id=:selectedObject];
        system.debug('This is first index='+acc[0]);
    }

     public void checkAccount()
    {
        //account =new List<Account>();
        accountlist=[SELECT Id,Name,Phone,Type FROM Account];
        system.debug('This is first index='+accountlist[0]);
    }
}