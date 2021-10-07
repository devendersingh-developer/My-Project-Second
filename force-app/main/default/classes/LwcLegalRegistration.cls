public class LwcLegalRegistration {
    
    @AuraEnabled
    public static List<Wrapper> fmcGetUserDetails(){
        List<Legal_Registration__c> lstRecord=[SELECT Id, Name, First_Name__c, Last_Name__c, Address__c, Email__c, Mobile_Number__c, Pan_card_Number__c, Bank__c, ISFC_Code__c, State__c, City__c FROM Legal_Registration__c];
        List<Wrapper> listWrapper=new List<Wrapper>();
        for(Legal_Registration__c objLg:lstRecord){
            Wrapper obj=new Wrapper();
            obj.Id=objLg.Id;
            obj.Name=objLg.First_Name__c+''+objLg.Last_Name__c;
            obj.Email=objLg.Email__c;
            obj.MobileNumber=string.valueOf(objLg.Mobile_Number__c);
            obj.PanCardNumber=string.valueOf(objLg.Pan_card_Number__c);
            obj.Bank=objLg.Bank__c;
            obj.State=objLg.State__c;
            obj.City=objLg.City__c;
            listWrapper.add(obj);
        }
        system.debug('listWrapper ***** >>>> '+listWrapper);
        return listWrapper;
        
    }
    public class Wrapper{
         @AuraEnabled public string  Id{get;set;}
        @AuraEnabled public string  Name{get;set;}
        @AuraEnabled public string  Email{get;set;}
        @AuraEnabled public string  MobileNumber{get;set;}
        @AuraEnabled public string PanCardNumber{get;set;} 
        @AuraEnabled public string Bank{get;set;}
        @AuraEnabled public string State{get;set;}
        @AuraEnabled public string City{get;set;}
    }
}