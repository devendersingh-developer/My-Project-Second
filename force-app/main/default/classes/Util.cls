public class Util {
    @future
    public static void insertUserWithRole(string uname,string al,string em, string lname){
        profile p=[select id from profile where Name='Standard User'];
        UserRole r=[select id from UserRole where Name='COO'];
        
        User u=New User(
            alias=al,email=em,
            emailencodingkey='UTF-8',lastname=lname,
            languagelocalekey='en_US',
            localesidkey='en_US',Profileid=p.Id,userroleid=r.Id,
            TimeZoneSidKey='Asia/Kuala_Lumpur',
            username=uname
        );
        insert u;
    }

    public static void insertUserWithNoRole(string uname,string al,string em, string lname){
        profile p=[select id from profile where Name='Standard User'];
        //UserRole r=[select id from UserRole where Name='COO'];
        
        User u=New User(
            alias=al,email=em,
            emailencodingkey='UTF-8',lastname=lname,
            languagelocalekey='en_US',
            localesidkey='en_US',Profileid=p.Id,
             TimeZoneSidKey='Asia/Kuala_Lumpur',
            username=uname
        );
        insert u;
    }
}