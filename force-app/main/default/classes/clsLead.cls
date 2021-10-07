public class clsLead {
    
    public string Fname{get;set;}
    public string Lname{get;set;}
    public boolean IsShow {get;set;}
    public boolean IsShowWroning {get;set;}
    public boolean IsShowButton {get;set;}
    public clsLead()
    {
        IsShowButton=true;
    }
    public void fncLeadID() {
        list<lead> Updatelead=new list<lead>();
        IsShow=true;
        IsShowButton=false;
        string currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
         system.debug('Name of currentRecordId----->'+currentRecordId);
        list<lead> leadLst=[select id,Name,FirstName,LastName,Lead_Verified__c from lead where id=:currentRecordId AND Lead_Verified__c=False AND Status!='Rejected' AND RecordType.Name='GrabFood ID'];
        system.debug('Name of Lead----->'+leadLst);
        if(leadLst.size()>0){
            for(lead iLead: leadLst){
                Fname=iLead.FirstName;
                Lname=iLead.LastName;
                iLead.Lead_Verified__c=true;
                Updatelead.add(iLead);
            }
        }  
        else{
            IsShow=false; 
            IsShowWroning=true;
        }
        if(Updatelead.size()>0)
        {
            update Updatelead;
        }
    }
}