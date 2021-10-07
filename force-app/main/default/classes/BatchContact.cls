global class BatchContact implements Database.Batchable<sObject>,Database.Stateful {
    
    global integer total_size=0;
    global integer fail_size=0;
    global integer success_size=0;
    global Map<string,string> mapOfRecords=New Map<string,string>();
    global  Database.QueryLocator Start(Database.BatchableContext BC){
        string sQuery='Select id,FirstName,LastName ,name,Fax,Email,MobilePhone,Account.Name,Account.Phone,Account.Fax from Contact ';
        return Database.getQueryLocator(sQuery);
    }
    global void fncCustom(Database.BatchableContext bc, List<Contact> ListContact){
        
    }
    global void execute(Database.BatchableContext bc, List<Contact> ListContact){
        
        total_size=total_size+ListContact.size();
        List<Contact> updateContact=New List<Contact>();
        for(Contact con:ListContact){
            //if(!string.isEmpty(con.FirstName) && !string.isEmpty(con.LastName))
                //mapOfRecords.put(con.id,con.FirstName+' '+con.LastName);
             mapOfRecords.put(con.id,con.Name);
            Contact objContact=New Contact();
            objContact.id=con.id;
            //if(string.isEmpty(con.Fax)){
                objContact.Fax='1234568';//con.Account.Fax;
           // }
            //if(string.isEmpty(con.MobilePhone)){
                objContact.MobilePhone='9971602210';//con.Account.Phone;
            //}
            objContact.Email='Devender.s@techmatrixconsulting.com';
            objContact.Description=con.Account.Name+' '+con.Account.Fax+' '+con.Email;
             updateContact.add(objContact);
        // update  objContact;
            system.debug('mapOfRecords --> '+mapOfRecords);
        }
        if(updateContact.size()>0){
            //update updateContact;
            DataBase.SaveResult[] result= DataBase.update(updateContact,false);
            integer size_Result=result.size();
            for(integer i=0;i<size_Result;i++){
                DataBase.SaveResult sr=result.get(i);
                if(sr.isSuccess()){
                    success_size+=1; 
                }else{
                    fail_size+=1;
                }
            }
        }
    }
    
    global void finish(Database.BatchableContext bc){
        
        Messaging.SingleEmailMessage email= New Messaging.SingleEmailMessage ();
        email.setSubject('Status of Batch class');
        email.setSenderDisplayName('Batch Demo');
        email.setHtmlBody('Dear User,<br/> batch Proccessed'+
                         '<br/> Total Records :'+total_size+
                         '<br/> Success Records :'+success_size+
                         '<br/> Fail Records :'+fail_size+
                         '<br/> total records :'+mapOfRecords);
        List<string> emailto=New List<string>();
        emailTo.add('Devender.s@techmatrixconsulting.com');
        email.setToAddresses(emailto);
        
        Messaging.SingleEmailMessage[] EmailList=New List<Messaging.SingleEmailMessage>();
        EmailList.add(email);
        
        Messaging.sendEmail(EmailList ,false);  
    }
    
}