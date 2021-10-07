public class clsApexSharing {

    
	public Id oppid{get;set;}

	public List<SelectOption> getUsers()
    {
        oppid=apexpages.currentpage().getparameters().get('aId');
        System.debug(oppid);
        List<User> userList=[select Id,Name from User];
        List<SelectOption> userSelectOpt=new List<SelectOption>();
        for(User us:userList)
        {
            SelectOption so=new SelectOption(us.Id,us.Name);
            userSelectOpt.add(so);
            
        }
        return userSelectOpt;
    }
    public string selectedvalue{get;set;}
    public PageReference submit()
    {
        System.debug('acc'+oppid);
        System.debug('selected'+selectedvalue);
        AccountShare ass=new AccountShare();
        ass.AccountId=oppid;
        ass.UserOrGroupId=selectedvalue;
        ass.AccountAccessLevel='Read';
        ass.OpportunityAccessLevel='None';
        insert ass;
        PageReference pr=new PageReference('/lightning/o/Account/list?filterName=Recent');
        return pr;
    }

}