public class ClsContact {
    @AuraEnabled(cacheable=true)
    public static Map<string,string> mapDemo(){
        Map<string,string> TestMap=New Map<string,string>();
        TestMap.Put('1','Devender Singh');
        TestMap.Put('2','Anjali Singh');
        TestMap.Put('3','Ghanika Singh');
        TestMap.Put('4','Advik Singh');
        TestMap.Put('5','Vijender Singh');
        TestMap.Put('6','Bhagwati Devi');
        return TestMap;
    }
    @AuraEnabled
    public static List<Contact> getContactList1(){
        List<Contact>contactList=new List<Contact>([select id,FirstName,Lastname,name,phone,Email from contact 
                                                    where Email !=null ]); 
        return contactList;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(string FirstName){
        system.debug('FirstName------> '+FirstName);
        List<Contact>contactList=new List<Contact>([select id,FirstName,Lastname,Name,phone,Email from contact 
                                                    where phone !=null limit 2]); 
        
        return contactList;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactListButton(string FirstName){
        system.debug('FirstName------> '+FirstName);
        List<Contact>contactList=new List<Contact>([select id,FirstName,Lastname,Name,phone,Email from contact 
                                                    where phone !=null limit 2]); 
        
        return contactList;
    }
    
    @AuraEnabled
    public static ContactPagerWrapper getContact(Decimal pageNumber ,Integer recordToDisply) {
        
        system.debug('page Number :'+pageNumber);
        system.debug('record To Disply :'+recordToDisply);
        
        Integer pageSize = recordToDisply;
        Integer offset = ((Integer)pageNumber - 1) * pageSize;  
        ContactPagerWrapper obj =  new ContactPagerWrapper(); 
        obj.pageSize = pageSize;
        obj.page = (Integer) pageNumber;
        obj.total = [SELECT count() FROM Contact];
        obj.contacts = [SELECT Id,Description,Email,FirstName FROM Contact  ORDER BY createdDate ASC LIMIT :recordToDisply OFFSET :offset];
        return obj;
    }
    
    @AuraEnabled
    public static ContactPagerWrapper getContactSearch(string strSearchText,Decimal pageNumber ,Integer recordToDisply) {
        
        Integer pageSize = recordToDisply;
        Integer offset = ((Integer)pageNumber - 1) * pageSize;
        ContactPagerWrapper obj =  new ContactPagerWrapper(); 
        obj.pageSize = pageSize;
        obj.page = (Integer) pageNumber;
        obj.total = [SELECT count() FROM Contact];
        obj.contacts = [SELECT Id,AccountId,Description,Email,FirstName,Name FROM Contact Where FirstName  LIKE :('%' + strSearchText + '%')  ORDER BY createdDate ASC LIMIT :recordToDisply OFFSET :offset];
        return obj;
    }
    
    public class ContactPagerWrapper {
        @AuraEnabled public Integer pageSize {get;set;}
        @AuraEnabled public Integer page {get;set;}
        @AuraEnabled public Integer total  {get;set;}
        @AuraEnabled public List<Contact> contacts {get;set;}
    }
    
}