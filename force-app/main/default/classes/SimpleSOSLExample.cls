public class SimpleSOSLExample {
    
    public SimpleSOSLExample()
    {
        list<list<sobject>> listOflist=[find 'An' in All fields returning Employee__c(name,name__c),Department__c(name)];
        list<Employee__c> empSOSLlist= (list<Employee__c>)  listOflist[0];
        system.debug('List Size is='+empSOSLlist.size());
        for(Employee__c emp:empSOSLlist)
        {
            system.debug(''+emp.Name + ''+emp.Name__c);
        }
    }

}