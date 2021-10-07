global  class ClsSendEmailToContactBirthday implements Database.Batchable<Sobject> {
    
	global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select Id,Birthdate,Email,LastName from Contact where BirthdayIsToday__c=\'true\''); 
    }
    global static void execute(Database.BatchableContext bc, List<Contact> con)
    {
        List<String> address=new List<String>();
        List<String> subject=new List<String>();
        List<String> message=new List<String>();
        
        for(Contact c:con)
        {
            System.debug(c.Email);
            address.add(c.Email);
            subject.add('Happy Birthday');
			message.add('Hello '+c.LastName+' Many many happy returns of the day');            
           
        }
        UtilSendEmail em=new UtilSendEmail();
        em.sendMail(address, subject, message);
    }
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}