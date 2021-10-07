public class MixedDMLFuture {
    
    public static void useFutureMethod(){
        Account a=New Account(name='Test future ');
        insert a;
        Util.insertUserWithRole('ddd.cf.com', 'Devfur', 'devenders843@gmail.com', 'Singh');
    }
    
    public static void useNoFutureMethod(){
        Account a=New Account(name='Test future ');
        insert a;
        Util.insertUserWithNoRole('devenders845553@gmail.com', 'Devfur', 'devenders843@gmail.com', 'Singh');
    }
}