public class CreatingWizard{
    
    Account account;
    Contact contact;
    Opportunity opportunity;
    OpportunityContactRole role;
    
    public Account getAccount() {
        if(account == null) account = new Account();
        return account;
    }
    
    public Contact getContact() {
        if(contact == null) contact = new Contact();
        return contact;
    }
    
    public Opportunity getOpportunity() {
        if(opportunity == null) opportunity = new Opportunity();
        return opportunity;
    }
    
    public OpportunityContactRole getRole() {
        if(role == null) role = new OpportunityContactRole();
        return role;
    }
    
    public PageReference step1() {
        return Page.Wizard1;
        
    }
    
    public PageReference step2() {
        return Page.Wizard2;
        
    }
    
    public PageReference step3() {
        return Page.Wizard3;
    }
    public PageReference save() {
        account.phone = contact.phone;
        insert account;
        contact.accountId = account.id;
        insert contact;
        opportunity.accountId = account.id;
        insert opportunity;
        role.opportunityId = opportunity.id;
        role.contactId = contact.id;
        insert role;
        PageReference opptyPage = new PageReference('/' +opportunity.id);
        opptyPage.setRedirect(true);
        
        return opptyPage;
    }
    
}