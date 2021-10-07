public class SpeakerExplorer {
    @AuraEnabled
    public static List<Speaker__c> searchSpeaker1(string searchParam){
        string likeParam='%'+searchParam+'%';
        string Query='SELECT Picture__c, Picture_Path__c, Bio__c, Email__c, Last_Name__c, First_Name__c, Id, Name FROM Speaker__c limit 10';
        List<Speaker__c> sObjectList=Database.query(Query);
        return sObjectList;
    }
    @AuraEnabled
    public static List<Contact> searchSpeaker(String searchParam1)
    {
        String searchString = '%' + searchParam1 + '%';
        List<Contact> contactList = [SELECT id, FirstName, LastName, Phone, Email, Title, Account.Name FROM Contact where FirstName like :searchString];
        return contactList;
    }
}