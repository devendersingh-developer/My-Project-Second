@RestResource(urlMapping='/ContactAPI/')
Global with sharing class ContactResource {
    @HttpGet
    Global static List<contact> getContact(){
        RestRequest contactRequest=RestContext.request;
        map<string,string> contactRequestParameter=contactRequest.params;
        system.debug('contactRequestParameter --> '+contactRequestParameter);
        system.debug('contactRequestParameter with jSon Stringfy --> '+JSON.serialize(contactRequestParameter));
        system.debug('limit --> '+contactRequestParameter.get('limit'));
        system.debug('leadSource --> '+contactRequestParameter.get('leadSource'));
        integer contactLimit=Integer.valueOf(contactRequestParameter.get('limit'));
        string leadSource=contactRequestParameter.get('leadSource');
        List<contact> contactList=[SELECT LastName, Id, AccountId, FirstName, Salutation, Name, MailingCountry, MailingCity, 
                                   MailingState, Phone FROM Contact limit:contactLimit];
        return contactList;
    }
    
    /*@HttpPost
    Global static contact createContact(string firstName, string lastName, string birthDate){
        contact objcontact=New contact();
        objcontact.FirstName=firstName;
        objcontact.LastName=lastName;
        objcontact.Birthdate=date.parse(birthDate);
        insert objcontact;
        return objcontact;
    }*/
    
    @HttpPost
    Global static contact createContact(){
        RestRequest contactRequest=RestContext.request;
        string requestBody=contactRequest.requestBody.toString();
        Contact contact=(Contact) JSON.deserialize(requestBody, Contact.class);
        
        insert contact;
        return contact;
    }
    
    @HTTPDeLete
    Global static Map<string,string> deleteContact(){
        Map<string,string> responseMap=New Map<string,string>();
        
        RestRequest ContactRequest=RestContext.request;
        string contactRequestUrl=ContactRequest.requestURI;
        system.debug('contactRequestUrl --> '+contactRequestUrl);
        Id contactId=id.valueof(contactRequestUrl.substring(contactRequestUrl.lastIndexOf('/')+1));
        Contact contact=New Contact(id=contactId);
        try{
            delete contact;
            responseMap.put('Success','1');
            responseMap.put('Message','Record Deleted Successfully');
        }
        catch(exception e){
            
        }
        return responseMap;
    }
}